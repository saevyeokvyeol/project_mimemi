<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/header.jsp"/>
<style type="text/css">
	span{font-size: 9pt; }
	body { padding-top: 70px;padding-bottom: 30px;}

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
<h1>문의하기페이지입니다.</h1>
   
 <form name="writeNotice" method="post" action="${path}/front?key=ask&methodName=insertAsk"
        enctype="multipart/form-data">
		<div class="container" role="main">
			
				<div class="mb-3">
					<label for="title">회원 ID</label>
					
				</div>
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="ask_title" id="title" placeholder="제목을 입력해 주세요">
				</div>
				<div class="mb-3">
					<label for="content">문의 내용</label>
					<textarea class="form-control" rows="5" name="ask_content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
				<div class="mb-3">
					<label for="attach">첨부파일</label>
				 <input type="file" name="notice_attach" maxlength="" size="40">
				</div>
				<div class="mb-3">
			         <label for="title">카테고리</label>
			        
			         <select name="ask_category" id = "ask_select_category"> 
			          <option name="ask_category" value="">FAQ카테고리</option>
			          <option name="ask_category" value="구매관련">구매관련</option>
			           <option name="ask_category" value="구독관련">구독관련</option>
			          <option name="ask_category" value="기타">기타</option>
			        
			         </select>
			    </div>
			    
     			<div>
     				<input type="submit" id="wirte-btn" value="문의하기" />
				    <input type="button" value="목록보기" onclick="location.href='ask2.jsp'"/>
				</div>
			
		</div>
</form>
<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${path}/board/ask2.jsp">리스트로 돌아가기</a>&gt;</span></div>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>