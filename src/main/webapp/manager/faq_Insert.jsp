<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 작성</title>
<jsp:include page="../common/sidebar.jsp"/>
</head>
<style type="text/css">

  .faq-insertform {
                width: 900px;
                margin: auto; padding: 50px 0;
            }
            
            .faq-insertform h1 {padding-bottom: 10px; margin-bottom: 10px; border: }
            
            .faq-table th {width: 120px; padding: 15px 30px;}
            .faq-table td {vertical-align: middle;}
                       
                    
            div.faq-image-preview{
                box-sizing: border-box;
                width: 450px;
                text-align: left;
                margin: 0px;
            }
            
            #faq-image-output{
                width: 100px;
                height: auto;
            }
            
            div.faq-submit-button{
                text-align: center;
            }




</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!--JQgrid CDN-->
<script src="../util/js/jquery-3.6.0.min.js"></script>
<script >
  function checkValid() {
      var form = window.document.insertFaq;
      var selectCheck=$('#faq_select_category > option:selected').val();
	
      if(form.faq_title.value==""){
          alert("FAQ 제목을 입력해 주십시오.")
          form.faq_title.focus();
          return false;
     }
     if(!selectCheck){
      	alert("FAQ카테고리를 선택해주세요")
      	return false;
     }
        return true;
}
    
  
  
</script>
<body>
<input type="hidden" name="faqNo" value="${faq.faqNo}">
 <div class="faq-insertform">
      <div class="faq-title">
          <h1>FAQ 게시판 등록</h1>
      </div>
      <div class="faq-writeForm">
  		 <form name="writeFaq" method="post" action="${path}/front?key=faq&methodName=insertFaq"
	        onsubmit='return checkValid()' enctype="multipart/form-data">
		        <table class="table table-borderless faq-table">
		      
		              <tr>
                          <th>제목</th>
                          <td>
                          	<span><input type="text" class="form-control" name="faq_title" placeholder="제목을 입력해 주세요" maxlength='16'></span>
                          </td>
                      </tr>
					    <tr>
					    
                            <th>카테고리</th>
                            <td>
                             
					         <select class="form-select" name = "faq_category" id="faq_select_category"> 
						          <option name="faq_category" value="">FAQ카테고리</option>
						          <option name="faq_category" value="CR">교환/환불</option>
						          <option name="faq_category" value="US">회원관련</option>
						          <option name="faq_category" value="OP">주문/결제</option>
						          <option name="faq_category" value="DE">배송관련</option>
						          <option name="faq_category" value="EC">기타</option>
					         </select>
					        </td>
					     </tr> 
                         <tr>
                            <th>내용</th>
                            <td>
                                <textarea class="form-control" name="faq_content" cols="50" rows="10" maxlength='333' placeholder="내용을 입력해 주세요."></textarea>
                            </td>
                         </tr>
                         <tr>
                            <th>첨부파일</th>
	                            <td>
	                               <div class="faq-image-insert-area">
					             	<input type="file" class="form-control"  id="faq-image-selector" name="faqAttach" accept=".jpg, .jpeg, .png">
	                                	<p id="file-status"></p>
	                                    <div class="faq-image-preview">
	                                        <img id="faq-image-output">
	                                    </div>
	                                    <script>
	                                        const status = document.getElementById('file-status')
	                                        //const fileSelector =document.getElementById('review-image-selector')
	                                        const output = document.getElementById('faq-image-output')
	                                        
	                                        if(window.FileList && window.File && window.FileReader){
	                                            document.getElementById('faq-image-selector').addEventListener('change', event =>{
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
			    </table>
				<div class="faq-submit-button">
					<input type="submit" class="btn btn-outline-dark"  value="FAQ 등록하기">
				    <input type="button" class="btn btn-outline-dark" value="목록보기" onclick="location.href='faq_Main_Mg.jsp'"/>
				</div>			
		 </form>
		</div>
	  </div>
  </div>
</body>
</html>
