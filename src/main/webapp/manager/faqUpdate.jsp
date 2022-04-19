<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
body {
  padding-top: 70px;
  padding-bottom: 30px;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!--JQgrid CDN-->
<script src="../util/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
  function checkValid() {
      var form = window.document.insertFaq;
      var selectCheck=$('#faq_category > option:selected').val();
	
}
    
</script>
<body>
   <form name="updateFaq" method="post" action="${path}/front?key=faq&methodName=update"
        onsubmit='return checkValid()' enctype="multipart/form-data">
		<div class="container" role="main">
			<h2>FAQ 수정</h2>
			    <div class="mb-3">
			         <label for="title">FAQ카테고리</label>
			          <input type="hidden" name="faqNo" value="${faq.faqNo}">
			          <input type="hidden" name="faq_Category" value="${faq.faqCategory}">
			         <select name="faq_category" id = "faq_select_category"> 
			          <option name="faq_category" value="">FAQ카테고리</option>
			          <option name="faq_category" value="CR">교환/환불</option>
			          <option name="faq_category" value="US">회원관련</option>
			          <option name="faq_category" value="OP">주문/결제</option>
			          <option name="faq_category" value="DE">배송관련</option>
			          <option name="faq_category" value="EC">기타</option>
			         </select>
			    </div>
				<div class="mb-3">
					<label for="title">제목</label>
					<textarea class="form-control" rows="1" name="faq_title" id="title" >${faq.faqTitle}</textarea>
				</div>
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="faq_content" id="content" >${faq.faqContent}</textarea>
				</div>
				<div class="mb-3">
					<label for="attach">첨부파일</label>
				 <input type="file" name="file" maxlength="" size="40">
				  <p id="file-status">${faq.faqAttach}</p>
				</div>
			<div >
				<input type="submit" value="작성" />
			    <span class="back-faq-list"><a href="${path}/front?key=faq&methodName=selectAllFaq">목록</a></span>
			    <span class="delete-faq"><a href="${path}/front?key=faq&methodName=delete&faqNo=${faq.faqNo}">삭제</a></span>
			</div>
		</div>
	</form>
</body>
</html>