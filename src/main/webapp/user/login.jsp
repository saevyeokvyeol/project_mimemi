<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<jsp:include page="../common/header.jsp" />
<style type="text/css">
	.login-view {width: 1200px; margin: auto;}
	.login-form {}
</style>
<script type="text/javascript">
	$(function() {
		$("#login").click(function() {
			
			var id = $("#userId").val();
		
			if(id.substr(0,5) == "admin"){
				$("form").attr("action", "${path}/front?key=manager&methodName=loginManager");
		})
	})
</script>
</head>
<body>
<section class="login-view">
	<h1>로그인</h1>
	<div class="login-form">
		<form class="inner" method="post" action="${path}/front?key=user&methodName=loginUser">
			<input type="hidden" name="key" value = "user"/>
			<input type="hidden" name="methodName" value="loginUser"/>
			<div class="loginForm">
				<input style="display: none" aria-hidden="true">
				<div>
					<input type="text" class="" id="userId" name="userId"
						placeholder="아이디를 입력해주세요" autocomplete="off">
				</div>
				<div>
					<input type="password" class="" id="userPwd" name="userPwd"
						placeholder="비밀번호를 입력해주세요" autocomplete="off">
				</div>
			</div>
			<button type="submit" class="loginBtn btn btn-outline-dark shadow-none btn-lg" id="login">로그인</button>
		</form>
	</div>
</section>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>