<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userEdit</title>
<style type="text/css">

</style>
</head>
<body>
<h1> 회원정보 수정하기 </h1>
  <form>
    <table>
      <tr>
        <th>아이디</th>
        <td>${User.userId}</td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td><input type="password" name="pwd" size="50" placeholder="영문 대소문자, 숫자를 조합해서 8자리 이상 입력해주세요"></td>
      </tr>
      <tr>
        <th>비밀번호 확인</th>
        <td><input type="password" name="pwd2" size="50" placeholder="한번 더 입력해주세요"></td>
      </tr>
    </table>
    <div><button class="updatePwd">비밀번호 재설정하기</button></div>
  </form>
  
  <form>
    <table>
       <tr>
        <th>이름</th>
        <td>${User.userName}</td>
       </tr>
       <tr>
         <th>휴대폰 번호</th>
         <td><input type="text" name="phoneNo" size="50" placeholder="-를 제외하고 입력해주세요"></td>
         <td><button class="checkSame">중복확인</button></td>
       </tr>
	   <tr>
		 <th>이메일 주소</th>
			<td><input type="text" name="E-MAIL" size="30">@
				<select name="domain" size="1">
					<option value="0">선택하세요</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="daum.net">daum.net</option>
				</select>
			</td>
		</tr>
		<tr>
		  <th>생년월일</th>
		  <td>${YYYY}</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td colspan="3"><input type="text" name="zip-code" size="10">-
				<input type="text" name="zip-code" size="10"> <input
				type="submit" value="우편번호검색"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" size="50">
			</td>
		</tr>
    </table>
    	<div><input type="submit" value="취소"><input type="submit" value="회원정보 수정"></div>
  </form>
     


</body>
</html>