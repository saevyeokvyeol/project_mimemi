<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>회원가입 :: 미미미</title>
	<jsp:include page="../common/header.jsp"/>
	<style>
		div.topBox {width: 800px; margin: 100px auto; padding: 50px 0; text-align: center; border: 2px solid #dddddd; }
		.topBox h5 {color: #777777; margin:40px;}
	</style>
</head>
<body>
	<div class="topBox">
		<h1>회원가입 완료!</h1>
		<h5>
			미미미에 가입하신 것을 진심으로 환영합니다<br>
			앞으로 많은 관심과 이용 부탁드려요
		</h5>
		<div class="btmBox">
			<a href="${path}/index.jsp" class="btn btn-outline-dark shadow-none">확인</a>
			<a href="${path}/user/login.jsp" class="btn btn-outline-dark shadow-none">로그인하기</a>
		</div>
	</div>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>