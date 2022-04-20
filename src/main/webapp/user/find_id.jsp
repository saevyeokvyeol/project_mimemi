<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find_id</title>
<style type="text/css">

</style>
</head>
<body>
<h1>아이디 찾기</h1>
 <form>
   <div><input type="text" class="insertName" name="insertName" id="insertName" placeholder="가입 시 작성한 이름을 입력해주세요"></div><br>
   <div><input type="text" class="insertPhone" name="insertPhone" id="insertPhone" placeholder="가입 시 작성한 휴대폰 번호를 입력해주세요"></div>
   
   <div class="btnGroup">
     <a href="find_pwd.jsp" class="findPwdBtn" id="selectPwd">비밀번호 찾기</a>
     <a href="" class="findIdBtn" id="selectId">아이디 찾기</a>
   </div>
   <div class="cmt">SNS 계정으로 간편가입을 하신 경우, 해당 웹사이트에서 ID 및 비밀번호 찾기를 진행해주세요.</div>
 </form>

</body>
</html>