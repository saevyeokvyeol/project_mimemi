<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userEdit</title>
<jsp:include page="../common/header.jsp" />
<style type="text/css">

</style>
<script type="text/javascript">
	$(function(){
		$("#leaveBtn").click(function(){
			if("#inputPwd".val() != ${userPwd}){
				alert("비밀번호가 다릅니다.")
				return false;
			}
		})
	})
</script>
</head>
<body>
<h1> 회원정보 수정하기 </h1>
<form action="${path}/front?key=user&methodName=pwdCheckForEdit" method="post">
	<input type="password" name="inputPwd" id="inputPwd" placeholder="본인확인을 위해 비밀번호를 입력해주세요"><p>
	<button type="submit" id="leaveBtn">확인</button>
	
</form>
	
</body>
</html>