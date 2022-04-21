<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/sidebar.jsp"/>
<style>
	.review-writeForm {
                width: 900px;
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

</style>

</head>
	<body>
		<div class="review-writeForm">
			<div class="review-title">
                <h1>관리자 답글 페이지</h1>
            </div>
		

 				<form name="writeNotice" method="post" action="${path}/front?key=answer&methodName=insertAnswerReply"
      			 onsubmit='return checkValid()' enctype="multipart/form-data">
		
						<table>
							<tr>
								<th>댓글 내용</th>
								<td>
									<div class="mb-3">${param.askNo}
										<input type="hidden" value="${param.askNo}" name="askNo">
										<textarea class="form-control" rows="5" name="answer_content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
									</div>
								</td>
							</tr>
				
						</table>
     						<div class="review-submit-button">
     							<input type="submit" class="btn btn-outline-dark" value="댓글달기" />
				  	  			<a class="back-review-list btn btn-outline-dark" href="${path}/front?key=ask&methodName=selectAllManager">목록으로 돌아가기</a>
							</div>
			</div>
				</form>
	</body>
</html>