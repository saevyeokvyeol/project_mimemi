<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 수정 - 미미미</title>

<style>
  table {border: double 5px gray; width:500px}
  td,th{border:1px black solid ;  padding:10px}

  input{border:solid 1px gray;}
  tr td:first-child{width:100px; text-align: center;}
  div{text-align:left;}
  a{text-decoration: none}
  
</style>

</head>
<body>

<form method="post" action="insert">
<table>
   <caption><h2> 쿠폰수정 Form</h2></caption>
  <tr>
	<td>쿠폰번호</td>
	<td><input type="text" name="id" /></td>
  </tr>
  <tr>
	<td>쿠폰명</td>
	<td><input type="text" name="name" /></td>
  </tr>
  <tr>
	<td>쿠폰금액</td>
	<td><input type="text" name="price" /></td>
  </tr>
  <tr>
	<td>쿠폰발행일</td>
	<td><input type="text" name="pubDate" /></td>
  </tr>
  <tr>
	<td>쿠폰만료일</td>
	<td><input type="text" name="endDate" /></td>
  </tr>
  <tr>
	<td colspan="2" >
	<input type="submit" value="수정" />
	<input type="reset" value="취소" />
	</td>
	
  </tr>
  </table> 
</form>

<pr>
<div>
	<a href="selectCouponAll.jsp">&lt;리스트로 돌아가기&gt;</a>
</div>


</body>
</html>