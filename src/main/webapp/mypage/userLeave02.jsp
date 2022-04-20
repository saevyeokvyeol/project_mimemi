<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userLeave</title>
<style type="text/css">
	textarea { width: 500px; height:100px; resize:none;}
</style>
</head>
<body>
<h1> 회원탈퇴 </h1>
	<div>
	  불편하셨던 점이나 불만사항을 알려주시면 적극적으로 반영하도록 하겠습니다.<p>
	  탈퇴 시, 서버에 저장된 고객님의 정보는 복구가 불가능하도록 삭제됩니다.
	</div><br>
	
<h3>무엇이 불편하셨나요?</h3>
	<div>
		<input type="radio"	class="" name="inconvenient" value="상품 불만족"/>상품 불만족
		<input type="radio"	class="" name="inconvenient" value="혜택 부족"/>혜택 부족
		<input type="radio"	class="" name="inconvenient" value="배송 불만족"/>배송 불만족
		<input type="radio"	class="" name="inconvenient" value="불친절"/>불친절
	</div><p>
	<div>
	  <textarea placeholder="기타"></textarea>
	</div><br>
	<div>
	  <button class="" id="deleteUser">회원탈퇴</button>
	</div>
</body>
</html>