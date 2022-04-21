<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트수정 - 미미미</title>
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
                <h1>이벤트 수정</h1>
        </div>
			<form name="writeForm" method="post" action="${path}/front?key=event&methodName=insert" 
 			 onSubmit='return checkValid()' enctype="multipart/form-data">
				<input type="hidden" name="key" value="event" >
   			    <input type="hidden" name="methodName" value="update" >
    			<input type='hidden' name="eventNo" value="${event.eventNo}">
<!-- 
     아래 문장으로 전송하면 post방식으로 전송이되고 현재 파일업로드때문에 enctype="multipart/form-data" 설정되어 있기때문에 
     request로 값을 받을수가 없다. ( MulitpartRequest로 받아야한다.) 그런데 Controller로 가기전에 Controller를 찾기위해서 
     DispatherServlet에서 request로 두개의 값을 받고 있기때문에 key, methodName은 get방식으로 별도로 전송해야한다.
     
	<input type="hidden" name="key" value = "event" />
	<input type="hidden" name="methodName" value = "insert" />  

 -->
			<table class="table table-borderless review-table">
				<div="mb-3">
					<tr>
  				  	<th>제목</th>       
        				<td>
        					<span>
								<input type="text" name="event_title" size="50" value="${event.eventTitle}">
							</span>
						</td>
    			  </tr>
				</div>
    
  				  
  				  <tr>
  				  	<th>내용</th>
   					<td>
   						<span>
   							<textarea name="event_content" cols="50" rows="10">${event.eventContent}</textarea>
   						</span>
   					</td>     
   				 </tr>
  				  <tr>
  				  	<th>*첨부파일</th>
        			<td>
        				<div class="review-image-insert-area">
							<input type="file" name="file" maxlength="60" size="40" value="${event.eventAttach}">
						</div>
					</td>
    			</tr>
   				 <tr>
   				 	<th>썸네일 이미지</th>
       
       				 <td>
       				 	<div class="review-image-insert-area">
							<input type="file" name="file" maxlength="60" size="40" value="${event.eventImg}">
						</div>
					</td>
			    </tr>
    			<tr>
    				<th>이벤트 시작일</th>
			        <td>
			        	<span>
							<input type="text" name="event_startdate" size="50" value="${event.eventStartdate}">
						</span>
					</td>
			    </tr>
    
     			<tr>
     				<th>이벤트 종료일</th>
        			<td>
        				<span>
        		 			<input type="text" name="event_enddate" size="50" value="${event.eventEnddate}">
        	   			</span>
       				</td>
    			</tr>
    
    </table>
    
    <div class="review-submit-button">
        <input type="submit" class="btn btn-outline-dark" value="글쓰기"> 
        <input type="reset" class="btn btn-outline-dark" value="다시쓰기">
    </div>


</form>

<p>
<div>
	<a href="selectEventAll.jsp">&lt;리스트로 돌아가기&gt;</a>
</div>

	</div>
</body>
</html>