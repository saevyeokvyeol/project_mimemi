<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join02</title>
</head>
<body>
<form>
	<h1>회원가입</h1>
	<table cellspacing="0" align="center">
		<tr>
			<th>아이디</th>
			<td colspan="3"><input type="text" name="ID" size="50" placeholder="영문자 숫자를 조합하여 최소 6자리 이상 입력해주세요"/><input type="submit" value="중복확인"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pwd" size="50" placeholder="영문 대소문자, 숫자를 조합해서 8자리 이상 입력해주세요"></td>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" name="pwd" size="50" placeholder="한번 더 입력해주세요"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td colspan="3"><input type="text" name="name" size="50" placeholder="한글 5자, 혹은 영문 20자 이내로 입력해주세요"></td>
		</tr>
		<tr>
			<th>휴대폰 번호</th>
			<td colspan="3"><input type="text" name="phone" size="50" placeholder="-를 제외하고 입력해주세요"><input type="submit" value="중복확인"></td>
		</tr>
		<tr>
			<th>이메일 주소</th>
			<td colspan="3"><input type="text" name="E-MAIL" size="30">@
				<select name="domain" size="1">
					<option value="0">선택하세요</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="daum.net">daum.net</option>
			</select></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td colspan="3"><input type="text" name="birthday" size="10">년
				<select name="month" size="1">
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
			</select>월 <select name="day" size="1">
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
			</select>일</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td colspan="3"><input type="text" name="zip-code" size="10">-
				<input type="text" name="zip-code" size="10"> <input
				type="submit" value="우편번호검색"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td colspan="3"><input type="text" name="address" size="50">
			</td>
		</tr>	
		<tr>
			<td colspan="4" style="text-align: center"><input type="submit" value="취소"> <input type="submit" value="회원가입"></td>
		</tr>

	</table>
</form>
</body>
</html>