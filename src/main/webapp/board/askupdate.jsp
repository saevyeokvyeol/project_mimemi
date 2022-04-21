<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<jsp:include page="../common/header.jsp"/>
<style type="text/css">
	 .review-insertform {
                width: 900px;
                margin: auto; padding: 50px 0;
            }
            
            .review-insertform h1 {padding-bottom: 10px; margin-bottom: 10px; border: }
            
            .review-table th {width: 120px; padding: 15px 30px;}
            .review-table td {vertical-align: middle;}
            
            .stars {margin-right: 15px;}
            
            img.starRateImg{
                width: 90px; padding-bottom: 7px;    
            }
            
            div.review-image-preview{
                box-sizing: border-box;
                width: 450px;
                text-align: left;
                margin: 0px;
            }
            
            #review-image-output{
                width: 100px;
                height: auto;
            }
            
            div.review-submit-button{
                text-align: center;
            }
            

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
            
		     var loginUser='${sessionScope.loginUser.userId}' //세션으로 확인한 현재 로그인한 유저
            
			 $(document).on("click","#update-btn",function(){
	                var reivewId = $(this).attr("name")
	                //alert(reivewId)
	                if(loginUser!=reivewId || !loginUser){
	                    alert("게시물은 자신이 작성한 게시물만 수정 가능합니다.")
	                }else{
	                    let url = `${path}/front?key=ask&methodName=updateAsk&askNo=`+$(this).attr("askno")
	        			location.replace(url);
	                }
	            })
            
            
            
            
            
            
            
            
            
            
		})//function끝
		
	



</script>
</head>
<body>
	<div class="review-insertform">
		<div class="review-title">
			<h1>게시물 상세보기 및 수정하기 페이지입니다.</h1>
		</div>
		<div class="review-writeForm">
			<form name=updateForm method=post action="${path}/front?key=ask&methodName=updateAsk"  
			onSubmit='return checkValid()' enctype="multipart/form-data">
  				<table class="table table-borderless review-table">
    				<input type="hidden" name="askNo" value="${askDto.askNo}" >
   
   						 <tr>
							<th>제목</th>	        
        					<td>
        						<span><input type="text" class="form-control" name="askTitle" id="title" maxlength='16'></span>
        					</td>
        
    					</tr>
  						<tr>
  							<th>내용</th>
  							<td>
  								<textarea class="form-control" rows="5" name="askContent" id="content" >${askDto.askContent}</textarea>
  							</td>
  						</tr>
    					<tr>
    						<th>첨부파일</th>
    						<td>
    							<input type="file" name="askAttach" size="30">
							 	<p id="file-status">${askDto.askAttach}</p>
    						</td>
    					</tr>
    				</table>
   					<div class="review-submit-button">
   							<input type="submit" id="update-btn" name="${askDto.userId}" value="수정하기" askno="${askDto.askNo}">
   							<input type="reset" value="다시쓰기">
   						
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
				<div class="review-submit-button">
						<a class="back-review-list btn btn-outline-dark" href="${path}/board/ask2.jsp">리스트로 돌아가기</a>
                		
            	</div>
			
	
		</div>
	</div>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>