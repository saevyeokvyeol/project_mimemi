<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트등록 - 미미미</title>
<jsp:include page="../common/sidebar.jsp"/>
<style>
  	
  	.review-writeForm {
                width: 1000px;
                margin: 50px auto; padding: 50px 0;
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
<script type="text/javascript">
	function checkValid(){
		
	}
</script>
</head>
<body>

<!-- 
     아래 문장으로 전송하면 post방식으로 전송이되고 현재 파일업로드때문에 enctype="multipart/form-data" 설정되어 있기때문에 
     request로 값을 받을수가 없다. ( MulitpartRequest로 받아야한다.) 그런데 Controller로 가기전에 Controller를 찾기위해서 
     DispatherServlet에서 request로 두개의 값을 받고 있기때문에 key, methodName은 get방식으로 별도로 전송해야한다.
     
	<input type="hidden" name="key" value = "event" />
	<input type="hidden" name="methodName" value = "insert" />  

 -->
 
	<div class="review-writeForm">
		<div class="review-title">
                <h1>이벤트 등록</h1>
        </div>
			<form name="writeReview" method="post" action="${path}/front?key=event&methodName=insert"
     		onSubmit='return checkValid()' enctype="multipart/form-data">
		<table class="table table-borderless review-table">
		
		    
		    <tr>
		        <th>제목</th>
		        <td>
		        	<span>
					<input type=text name="eventTitle" size="50">
					</span>
				</td>
		    </tr>
		    <tr>
		    	<th>내용</th>
		        <td>
		        	<span>
						<textarea name="eventContent" cols="50" rows="10"></textarea>
		    		</span>
		    	</td>	
		    </tr>
		    <tr>
		        <th>
		        	<span>*첨부파일</span>
		        <td>
		        	<div class="event-attach-insert-area">
                                	<input type="file" id="event-attach-selector" name="eventAttach" accept=".jpg, .jpeg, .png">
                                	<p id="file-status-attach">${event.eventAttach}</p>
                                    <div class="event-attach-preview">
                                        <img id="event-attach-output" src="${path}/img/save/${event.eventAttach}">
                                    </div>
                                    <script>
                                        const status = document.getElementById('file-status-attach')
                                        //const fileSelector =document.getElementById('review-image-selector')
                                        const output = document.getElementById('event-attach-output')
                                        
                                        if(window.FileList && window.File && window.FileReader){
                                            document.getElementById('event-attach-selector').addEventListener('change', event =>{
                                                output.src='';
                                                status.textContent='';
                                                const file = event.target.files[0];
                                                if(!file.type){
                                                    status.textContent = "첨부한 파일 타입이 현재 브라우저에서 지원하지 않습니다."
                                                    return;
                                                }
                                                const reader = new FileReader();
                                                reader.addEventListener('load', event =>{
                                                    output.src = event.target.result;
                                                })
                                                reader.readAsDataURL(file);
                                            })
                                        }
                                    </script>
                      </div>
				</td>
		    </tr>
		    <tr>
		    	<th>썸네일 이미지</th>
		        
		        <td>
		        <div class="event-image-insert-area">
                                	<input type="file" id="event-image-selector" name="eventImg" accept=".jpg, .jpeg, .png">
                                	<p id="file-status">${event.eventImg}</p>
                                    <div class="event-image-preview">
                                        <img id="event-image-output" src="${path}/img/save/${event.eventImg}">
                                    </div>
                                    <script>
                                        const status2 = document.getElementById('file-status')
                                        //const fileSelector =document.getElementById('review-image-selector')
                                        const output2 = document.getElementById('event-image-output')
                                        
                                        if(window.FileList && window.File && window.FileReader){
                                            document.getElementById('event-image-selector').addEventListener('change', event =>{
                                                output2.src='';
                                                status2.textContent='';
                                                const file2 = event.target.files[0];
                                                if(!file2.type){
                                                    status2.textContent = "첨부한 파일 타입이 현재 브라우저에서 지원하지 않습니다."
                                                    return;
                                                }
                                                const reader2 = new FileReader();
                                                reader2.addEventListener('load', event =>{
                                                    output2.src = event.target.result;
                                                })
                                                reader2.readAsDataURL(file2);
                                            })
                                        }
                                    </script>
                                </div>
				
				</td>
		    </tr>
		    <tr>
		    	<th>이벤트 시작일</th>
		        <td>
		        	<span>
						<input type=text name="eventStartdate" size="50">
					</span>
				</td>
		    </tr>
		    
		     <tr>
		        <th>이벤트 종료일</th>
		        <td>
		        	<span>
		        		 <input type=text name="eventEnddate" size="50">
		        	</span>
		        </td>
		    </tr>
		</table>
		    <div class="review-submit-button">
		 
		       <input type=submit class="btn btn-outline-dark" value=등록하기> 
		        <input type=reset class="btn btn-outline-dark" value=취소하기>
		    </div>
		
	</form>
</div>
<p>
<div>
	<a href="${path}/front?key=event&methodName=selectAll">&lt;리스트로 돌아가기&gt;</a>
</div>


</body>
</html>