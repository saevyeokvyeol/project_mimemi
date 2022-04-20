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
	 a{}

</style>
	<!--부트스트랩 CSS CDN-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
                
        <!--부트스트랩 JS CDN-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        
        
        <script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
 
<script type="text/javascript">


	
	$(function(){
		

		var target = '${askDto.askNo}'
		
		function selectReply(){
            $.ajax({
				url: "${path}/ajax" , //서버요청주소
				type: "post" , //요청방식 (get,post...)
				dataType: "json" , //서버가 보내온 데이터(응답)type(text | html | xml | json)
				data: {key:"answer", methodName:"selectAnswerReplyManager", askNo: target} , //서버에게 보낼 데이터정보(parameter정보)
				
				success: function(result){
					
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
<h1>상세보기 페이지입니다.</h1>

<table align="center" cellpadding="5" cellspacing="2" width="600" border='1'>
    <tr>
        <td width="1220" height="20" colspan="4" >
            <size="3"><b>
             상세 보기</b></font>
        </td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <b><span>글번호</span></b>
        </td>
        <td width="450" height="20" colspan="3">
        	<div><b>${askDto.askNo}</b></div>
        </td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <b><span>회원 ID</span></b>
        </td>
        <td width="300" height="20">
        	<span ><b>${askDto.userId}</b></span>
        </td>
        
    </tr>
    
    <tr>
		<td width="100" height="20" valign="top">
            <b><span>제목</span></b>
        </td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="300" height="20">
        	<span ><b>${askDto.askTitle}</b></span>
        </td>
   	
    </tr>
    
      
       <tr>
        <td width="100" height="20">
            <b><span>내용</span></b>
        </td>
        <td width="450" height="200" colspan="3">
        <span><b>${askDto.askContent}</b></span>
        </td>
        
        
    </tr>
    <tr>
    	<td><span>첨부파일</span></td>
    	<td><span>${askDto.askAttach}</span></td>
    
    </tr>
    
     <h3>댓글 정보</h3>
	<div>
		<div>
			<div id="askReplyOutPut">
				
			</div>
		</div>
	</div>
	<div>
	<hr>
				<a href="${path}/front?key=answer&methodName=deleteAnswerReply&askNo=${askDto.askNo}">삭제하기</a>
				<a href="${path}/front?key=ask&methodName=selectAllManager">돌아가기</a>
	</div>
	<form name="writeNotice" method="post" action="${path}/front?key=ask&methodName=updateState">
	<div class="mb-3">
		<table>
			<tr>
				<td>
					<input type=hidden name="askNo" value="${askDto.askNo}">
				
			      
			        	<div class="mb-3">
			        		 <select name="ask_complete" id = "ask_select_category"> 
			          			<option name="ask_complete" value="">답변유무</option>
			          			<option name="ask_complete" value="T">True</option>
			           			<option name="ask_complete" value="F">False</option>
			        
			         		</select>
			            </div>
			         <div>
			         	<input type="submit" value="답변변경하기" />
			        </div>
			      </td>
			  </tr>
		</table>	        
	</div>
	</form>
	      
   
   
    <form name="requestForm" method=post action="${path}/front">
 
    
    <tr>
        <td height="20" colspan="4" align="center" valign="middle">
			<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
				<input type=hidden name="askNo" value="${askDto.askNo}">
				<input type=hidden name="key" value="ask">
			
				<a href="${path}/manager/askAnswer2.jsp?key=answer&methodName=updateAnswerReply&askNo=${askDto.askNo}">답글달기</a>
				
				<a href="${path}/front?key=ask&methodName=deleteAsk&askNo=${askDto.askNo}">삭제하기</a>
		</td>
	 </tr>	
	
    </form>
    <hr>
    <!-- 댓글창 조회 -->
    
			
		
   
</table>
</body>
</html>