<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find_pwd</title>
<style type="text/css">

</style>
<script type="text/javascript">
// 	$(function(){
// 		$("#updatePwdBtn").click(function(){
// 			$.ajax({
// 				url: "${path}/ajax",
// 				type: "post",
// 				datatype: "text",
// 				data: {key:"user", methodName:"selectPwd", userId: $("#insertId"), userName:$("#insertName"), userPhone:$("#insertPhone")},
// 				success: function(result) {
// 					alert("비밀번호 찾기");
// 				},
// 				error: function(err) {
// 					alert(err);
// 				}
// 			})
// 		})		
// 	})
</script>
</head>
<body>
<h1>비밀번호 찾기</h1>
 <form action="${path}/front?key=user&methodName=selectPwd" method="post">
   <input type="text" class="insertId" name="userId" id="insertId" placeholder="아이디를 입력해주세요"><br>
   <input type="text" class="insertName" name="userName" id="insertName" placeholder="가입 시 작성한 이름을 입력해주세요"><br>
   <input type="text" class="insertPhone" name="userPhone" id="insertPhone" placeholder="가입 시 작성한 휴대폰 번호를 입력해주세요">
   
   <div class="btnGroup">
     <input type="submit" class="Btn" id="updatePwdBtn">비밀번호 재설정하기</button>
   </div>

 </form>
</body>
</html>