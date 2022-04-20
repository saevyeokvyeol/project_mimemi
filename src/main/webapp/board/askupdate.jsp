<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	span{font-size:9pt;}

</style>
 		<!--부트스트랩 CSS CDN-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
                
        <!--부트스트랩 JS CDN-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        
        
        <script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

function checkValid() {
	var f = window.document.updateForm;
	if ( f.askTitle.value == "" ) {
		alert( "제목을 입력해 주세요." );
		f.askTitle.focus();
		return false;
	}
	
	if ( f.askContent.value == "" ) {
        alert( "내용을 입력해 주세요." );
        f.askContent.focus();
        return false;
    }

	    
}

	$(function(){
		var target = '${askDto.askNo}'
		//alert(target);
		function selectReply(){
            $.ajax({
				url: "${path}/ajax" , //서버요청주소
				type: "post" , //요청방식 (get,post...)
				dataType: "json" , //서버가 보내온 데이터(응답)type(text | html | xml | json)
				data: {key:"answer", methodName:"selectAnswerReply", askNo: target} , //서버에게 보낼 데이터정보(parameter정보)
				
				success: function(result){
					//alert("검색성공~")
					let str="";														
					$.each(result,function(index,reply){					
                        str+=`<div class="reply-user-info">`;
                            str+=`<span class="badge rounded-pill bg-light text-dark">\${reply.answerNo}</span>&nbsp;`
                            str+=`<span class="badge rounded-pill bg-light text-dark">\${reply.answerRegdate}</span>`
                            
                        str+=`</div>`;
                        str+=`<div class="reply-content">`;
                            str+=`<span class="reply-content-text">\${reply.answerContent}</span>`
               
                        str+=`</div>`;
                    })
                   	$("#askReplyOutPut").html(askReplyOutPut)
                   	$("#askReplyOutPut").append(str)
				},

				error: function(err){//실패했을 때 콜백함수
				  alert(err+"오류가 발생했습니다.")
				} 

			    })//ajax끝
            }	//selectReply끝
				
			selectReply();
		})//function끝
		
	



</script>
</head>
<body>
<h1>게시물 상세보기 및 수정하기 페이지입니다.</h1>

<form name=updateForm method=post action="${path}/front?key=ask&methodName=updateAsk"  
onSubmit='return checkValid()' enctype="multipart/form-data">
    <input type="hidden" name="askNo" value="${askDto.askNo}" >
   <div>
   <table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
    <tr>
        <td width="1220" height="20" colspan="2">
            <p align="center"><font size="3"><b>  게시물 수정하기</b></font></p>
        </td>
    </tr>
    <tr>
        <td width="150" height="20">
            <span >제목</span>
           
        </td>
        <td>
         <textarea class="form-control" rows="1" name="askTitle" id="title" >${askDto.askTitle}</textarea>
        </td>
       
    </tr>
    
    <tr>
        <td width="150" height="20" >
            <b><span >내 용</span></b>
        </td>
        <td>
        <textarea class="form-control" rows="5" name="askContent" id="content" >${askDto.askContent}</textarea>
    	</td>
    </tr>
    <tr>
    	<td width="150" height="20" >
    		<span>
    			첨부파일
    		</span>
    	</td>
    	<td>	
    		<input type="file" name="askAttach" size="30">
			<p id="file-status">${askDto.askAttach}</p>
    	</td>
    
    </tr>
    
    
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span>
		<input type="submit" value="수정하기"> <input type="reset" value="다시쓰기"></span></b></td>
    </tr>
</table>
</div>
	
</form>
	<h3>댓글 정보</h3>
	
<!-- 댓글창 조회 -->
<div>
	<div>
		<div id="askReplyOutPut">
			
		</div>
	</div>
</div>
<hr>
<div align=right><span >&lt;<a href="${path}/board/ask2.jsp">리스트로 돌아가기</a>&gt;</span></div>
</body>
</html>