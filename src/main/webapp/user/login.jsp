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
	.login-view {width: 900px; margin: auto; padding: 50px 0;}
	.login-form { border: 1px solid #dddddd; padding: 50px 100px; margin: 30px 0;}
	input {margin: 0 0 10px;}
	#btn_box {padding: 20px 0 0; text-align: center;}
</style>
<script type="text/javascript">
	$(function() {
		$("#login").click(function() {
			
			var id = $("#userId").val();
		
			if($()useruserId.substr(0,5) == "admin"){
				alert()
				$("form").attr("action", "${path}/front?key=manager&methodName=loginManager");
			}
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
					<input type="text" class="form-control" id="userId" name="userId"
						placeholder="아이디를 입력해주세요" autocomplete="off">
				</div>
				<div>
					<input type="password" class="form-control" id="userPwd" name="userPwd"
						placeholder="비밀번호를 입력해주세요" autocomplete="off">
				</div>
			</div>
			<div id="btn_box">
				<button type="button" class="loginBtn btn btn-outline-dark shadow-none btn-lg" id="login">회원가입</button>
				<button type="submit" class="loginBtn btn btn-outline-dark shadow-none btn-lg" id="login">로그인</button>
			</div>
		</form>
	</div>
</section>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>