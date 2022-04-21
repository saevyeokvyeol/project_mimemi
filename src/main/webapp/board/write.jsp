<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/header.jsp"/>
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

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!--JQgrid CDN-->
<script src="../util/js/jquery-3.6.0.min.js"></script>


<script type="text/javascript">


	

$(function(){
	//var loginUser='${sessionScope.loginUser.userId}' //세션으로 확인한 현재 로그인한 유저
    /*
	 $(document).on("click","#write-btn",function(){
          // var reivewId = $(this).attr("name")
           //alert(reivewId)
           if(!loginUser){
               alert("로그인 후 이용가능합니다!!")
           }else{
               let url = `${path}/front?key=ask&methodName=insertAsk`
   			location.replace(url);
           }
       })
   
    
       
            $("#write-btn").click(function(){
                //let status =true;
                //alert(loginUser)
                //댓글 유효성체크
                if(!loginUser){
                    alert("댓글 기능은 회원만 가능합니다.")
                  //  status=false;
                    return;
                }
    */
    	
    $("form[name=writeNotice]").submit(function(){
  			  
    	
        	
        	if ( $("#title").val()=="" ) {
        	    alert( "제목을 입력해주세요." );
        	    f.model_num.focus();
        		return false;
            }
        	
        	if ( $("#content").val()=="") {
        	    alert( "내용을 입력해주세요." );
        	    f.description.focus();
        		return false;
            }
        	
        	
            return true;

        
    
    })
    

    
    
    
    
    
})
   
  	
    	

    


</script>
</head>
<body>
		<div class="review-writeForm">
   			<div class="review-title">
                <h1>문의하기</h1>
            </div>
            
		 		<form name="writeNotice" method="post" action="${path}/front?key=ask&methodName=insertAsk"
        		enctype="multipart/form-data">
		
			<table class="table table-borderless review-table">	
				<div class="mb-3">
				<tr>
					<th>회원 ID</th>
					<th>${ask.userId}</th>
				</tr>
				</div>
				<tr>
					<th>제목</th>
					<td>
			        	 <select name="ask_title" id = "ask_select_category"> 
			          		<option name="ask_title" value="">제목 카테고리</option>
			          		<option name="ask_title" value="로그인문의">로그인문의</option>
			           		<option name="ask_title" value="배송문의">상품교체문의</option>
			       		    <option name="ask_title" value="쿠폰문의">쿠폰문의</option>
			          		<option name="ask_title" value="탈퇴문의">탈퇴문의</option>
			          		<option name="ask_title" value="상품문의">상품문의</option>
			   		  		<option name="ask_title" value="회원문의">회원문의</option>
			         	 </select>
			         </td>
				</tr>	
					
				<tr>
					<th>문의내용</th>
					<td>
				 			<textarea class="form-control" rows="5" name="ask_content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
						<td>
						 	<div class="review-image-insert-area">
						 		<input type="file" name="notice_attach" maxlength="" size="40">
						 	</div>
						</td>
				</tr>
				<tr>
			        <th>카테고리</th>
			        <td>
			         	<select name="ask_category" id = "ask_select_category"> 
			          		<option name="ask_category" value="">문의 카테고리</option>
			         	    <option name="ask_category" value="회원관련문의">회원관련문의</option>
			           		<option name="ask_category" value="배송문의">배송문의</option>
			                <option name="ask_category" value="쿠폰문의">쿠폰문의</option>
			          		<option name="ask_category" value="상품문의">상품문의</option>
			          		<option name="ask_category" value="회원문의">회원문의</option>
			         	</select>
			         </td>
			    </tr>
		</table>
			    
     			<div class="review-submit-button">
     				<a class="back-review-list btn btn-outline-dark" href="${path}/front?key=ask&methodName=selectAll">목록으로 돌아가기</a>
     				<input type="submit" class="btn btn-outline-dark"  value="문의하기">
     		
				  
				</div>
			
		
	</form>
</div>
<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${path}/board/ask2.jsp">리스트로 돌아가기</a>&gt;</span></div>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>