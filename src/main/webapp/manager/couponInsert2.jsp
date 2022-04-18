<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 등록 - 미미미</title>


<style>
  table {border: double 5px gray; width:500px}
  td,th{border:1px black solid ;  padding:10px}

  input{border:solid 1px gray;}
  tr td:first-child{width:100px; text-align: center;}
  div{text-align:left;}
  a{text-decoration: none}
  
</style>
<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
function checkValid() {
   
}
	
</script>

</head>
<body>

<form name="inForm" method="post" id="inForm" action="${path}/front?key=coupon&methodName=insertRgCp">
<table>
   <caption><h2> 정기쿠폰등록 Form</h2></caption>
  <tr>
	<td>쿠폰번호</td>
	<td><input type="text" name="id" id="id"/></td>
  </tr>
  <tr>
	<td>쿠폰명</td>
	<td><input type="text" name="name" id="name"/></td>
  </tr>
  <tr>
	<td>쿠폰금액</td>
	<td><input type="text" name="price" id="price"/></td>
  </tr>
  <tr>
	<td>쿠폰발행일</td>
	<td><input type="text" name="pubDate" id="pubDate"/></td>
  </tr>
  <tr>
	<td>쿠폰만료일</td>
	<td><input type="text" name="endDate" id="endDate"/></td>
  </tr>
  <tr>
	<td colspan="2" >
	<input type="hidden" name="key" value="coupon">
	<input type="hidden" name="methodName" value="insertRgCp">
	<input type="submit" value="등록" id="btn"/>
	<input type="reset" value="취소" />
	</td>
	
  </tr>
  </table> 
</form>

<p>
<div>
	<a href="selectCouponAll.jsp">&lt;리스트로 돌아가기&gt;</a>
</div>


</body>
</html>