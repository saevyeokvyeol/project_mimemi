<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../common/header.jsp"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성 :: 미미미</title>
</head>
<style type="text/css">
	.notice-writeform{
		width: 900px;
		margin: auto; padding: 50px 0;
	}
	.notice-writeform h2 {padding-bottom: 10px; margin-bottom: 10px; border: }
	
	.notice-table th {width: 120px; padding: 15px 30px;}
	.notice-table td {vertical-align: middle;}

	div.notice-image-preview{
        box-sizing: border-box;
        width: 450px;
        text-align: left;
        margin: 0px;
    }
    
    #notice-image-output{
        width: 100px;
        height: auto;
    }
    
    div.notice-submit-button{
        text-align: center;
    }

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!--JQgrid CDN-->
<script src="../util/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

</script>
<body>
<div class = "notice-writeform">
 <form name="writeNotice" method="post" action="${path}/front?key=notice&methodName=insertNotice"
       onsubmit='return checkValid()' enctype="multipart/form-data">
		<h2>공지사항 등록</h2>
			<table class="table table-borderless notice-table">
				<tr>
				  <th>제목</th>
				  <td>
				    <span><input type="text" class="form-control" name="notice_title" placeholder="제목" maxlength='16'></span>
				  </td>
				</tr>
				<tr>
				  <th>내용</th>
				    <td>
				      <textarea class="form-control" name="notice_content" cols="50" rows="10" maxlength='333' placeholder="내용을 입력해주세요."></textarea>
				    </td>
				</tr>
				<tr>
				  <th>첨부파일</th>
				  <td>
				    <div class="notice-image-insert-area">
                     	<input type="file" class="form-control"  id="notice-image-selector" name="notice_image" accept=".jpg, .jpeg, .png">
                     	<p id="file-status"></p>
                         <div class="notice-image-preview">
                             <img id="notice-image-output">
                         </div>
                         <script>
                             const status = document.getElementById('file-status')
                             //const fileSelector =document.getElementById('review-image-selector')
                             const output = document.getElementById('notice-image-output')
                             
                             if(window.FileList && window.File && window.FileReader){
                                 document.getElementById('notice-image-selector').addEventListener('change', event =>{
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
				 <div class="notice-submit-button">
					<a class="back-notice-list btn btn-outline-dark" href="${path}/front?key=notice&methodName=selectAllNotice">목록으로 돌아가기</a>
               		<input type="submit" class="btn btn-outline-dark"  value="공지 등록하기">
            	 </div>	
</form>
</div>
</body>
</html>