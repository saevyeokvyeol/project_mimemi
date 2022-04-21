<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<jsp:include page="../common/sidebar.jsp"/>	
<style type="text/css">

	.review-writeForm {
                width: 1000px;
                margin: auto; padding: 50px 0;
            }
            
            .review-writeForm h1 {padding-bottom: 10px; margin-bottom: 10px; border: }
            
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
            
            div.abc{ text-align: right;}

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

<div class="review-writeForm">
	<div class="review-title">
		<h1>상세보기</h1>
	</div>
	<form name="writeNotice" method="post" action="${path}/front?key=ask&methodName=updateState">
		<table class="table table-borderless review-table">
   			 <tr>
        		<th>글 번호</th>
        		<td>
        			<div>${askDto.askNo}</div>
        		</td>
            
    		</tr>
    
    		<tr>
        		<th>회원 ID</th>
 				<td>
 					<span ><b>${askDto.userId}</b></span>
 				</td>       
            </tr>
    
    		<tr>
				<th>제목</th>
				<td>
					<span ><b>${askDto.askTitle}</b></span>
				</td>
		    </tr>
    
      
       		<tr>
       			<th>내용</th>
       			<td>
       				<span><b>${askDto.askContent}</b></span>
       			</td>        
    		</tr>
    		<tr>
    			<th>첨부파일</th>
    			<td>
    				<span>${askDto.askAttach}</span>
    			</td>
   			 </tr>
    
     		<h3>댓글 정보</h3>
				<div>
					<div>
						<div id="askReplyOutPut">
				
						</div>
					</div>
				</div>
	
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
			         <div class="review-submit-button">
			         	<input type="submit" class="btn btn-outline-dark" value="답변변경하기" />
			        </div>
			        <div>
			       		<input type=hidden name="askNo" value="${askDto.askNo}">
						<input type=hidden name="key" value="ask">
				
						<a href="${path}/manager/ask_Answer.jsp?key=answer&methodName=updateAnswerReply&askNo=${askDto.askNo}">답글달기</a>
				
		 
			        </div>
			      </td>
			  </tr>
			</table>
		       
	</div>


	</form>
						<div class="abc">
				
							<a href="${path}/front?key=answer&methodName=deleteAnswerReply&askNo=${askDto.askNo}">답글 삭제하기</a>
							<a href="${path}/front?key=ask&methodName=selectAllManager">리스트로 돌아가기</a>
						</div>
</div>
</body>

</html>