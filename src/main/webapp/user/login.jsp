<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<style type="text/css">
	section{width: 1200px; margin: auto;}
</style>
<script type="text/javascript">
	$(function() {
		$("#login").on("click", function() {
			$.ajax({
				url:"${path}/ajax",
				type: "post",
				datatype: "text",
				data: {key:"user", methodName:"loginUser", userId: $("#userId"), userPwd:$("#userPwd")},
				success: function(result) {
					alert(1);
				},
				error: function(err) {
					alert(err);
				}
			})
		})
	})
</script>
</head>
<body>
<section>
	<h1 >로그인</h1>
<c:choose>
	<c:when test="${empty loginUser}">
	<form class="inner" method="post" action="${pageContext.request.contextPath}/front?key=user&methodName=loginUser">
		<input type="hidden" name="key" value = "user"/>
		<input type="hidden" name="methodName" value="loginUser"/><!-- dispatcherservlet -->
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
		<button type="submit" class="loginBtn" id="login">로그인</button>
		<div class="loginOpt">
			<table>
				<tr>
					<td><a href="">아이디 찾기</a></td>
					<td><a href="">비밀번호 찾기</a></td>
					<td><a href="">회원가입</a></td>
				</tr>
			</table>
		</div>

		<fieldset>
			<div class="snsLogin">
				SNS 로그인
				<tr>
					<td><a href="" id="naverLogin"><img src="">
						<p>네이버로 로그인하기</p></a></td>
					<td><a href="" id="kakaoLogin"><img src="">
						<p>카카오로 로그인하기</p></a></td>
				</tr>
			</div>
		</fieldset>

	</form>
	</c:when>
</c:choose>
</section>
<!-- section 으로 감싸서 css에서 section값으로 width 1200px margin auto로 -->

</body>
</html>