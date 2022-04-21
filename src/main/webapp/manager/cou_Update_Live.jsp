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
<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
$(function() {
	
	//아이디박스 비활성화(입력불가능) - atrr()이용
	$("#id").attr("readonly", "readonly"); //읽기전용
		
	
});
   
	
</script>

</head>
<body>

<form name="inForm" method="post" id="inForm" action="${path}/front?key=coupon&methodName=updateLiveCp">
<input type="hidden" name="key" value="coupon" >
    <input type="hidden" name="methodName" value="updateLiveCp" >
    <input type='hidden' name='id' value="${liveCoupon.livecouId}">
<table>
   <caption><h2> 실시간쿠폰수정 Form</h2></caption>
  <tr>
	<td>쿠폰번호</td>
	<td><input type="text" name="id" id="id" value="${liveCoupon.livecouId}"/></td>
  </tr>
  <tr>
	<td>쿠폰명</td>
	<td><input type="text" name="name" id="name" value="${liveCoupon.livecouName}"/></td>
  </tr>
  <tr>
	<td>쿠폰금액</td>
	<td><input type="text" name="price" id="price" value="${liveCoupon.livecouPrice}"/></td>
  </tr>
  <tr>
	<td>쿠폰발행일</td>
	<td><input type="text" name="pubDate" id="pubDate" value="${liveCoupon.livecouPubdate}"/></td>
  </tr>
  <tr>
	<td>쿠폰만료일</td>
	<td><input type="text" name="endDate" id="endDate" value="${liveCoupon.livecouUseperiod}"/></td>
  </tr>
  <tr>
	<td colspan="2" >
	<input type="hidden" name="key" value="coupon">
	<input type="hidden" name="methodName" value="updateLiveCp">
	<input type="submit" value="수정" id="btn"/>
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