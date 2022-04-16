<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>    
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
<body>
 <form method="post" action="">
	<article>
		<div class="container" role="main">
			<h2>공지사항 등록</h2>
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="notice_ntitle" id="title" placeholder="제목을 입력해 주세요">
				</div>
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="notice_content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
				<div class="mb-3">
					<label for="tag">첨부파일</label>
				 <input type="file" name="notice_attach" maxlength="" size="40">
				</div>
     			<div >
					<input type="submit" value="작성" />
				    <button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='selectNoticeAll.jsp'">목록</button>
			</div>
		</div>
	</article>
</form>
</body>
</html>