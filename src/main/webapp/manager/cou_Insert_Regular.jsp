<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 등록 - 미미미</title>
    	<link rel="stylesheet" href="${path}/css/datepicker.css">
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<!-- jQuery -->
		<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	    <link rel="stylesheet" href="${path}/css/header.css">
	    <!-- jQuery ui -->
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<!-- jQuery ui -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<style type="text/css" src=""></style>
    	<link rel="stylesheet" href="${path}/css/datepicker.css">


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
//datepicker 설정

$(function() {

	$("#pubDate").datepicker();
	$("#endDate").datepicker();
	$.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear: true,
		yearSuffix: '년'
	});

})
</script>

</head>
<body>

<form name="inForm" method="post" id="inForm" action="${path}/front?key=coupon&methodName=insertRgCp">
<caption><h2> 정기쿠폰등록 Form</h2></caption>
<table>
   
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
	<td><input type="text" name="pubDate" readonly="readonly" id="pubDate"/></td>
  </tr>
  <tr>
	<td>쿠폰만료일</td>
	<td><input type="text" name="endDate" readonly="readonly" id="endDate"/></td>
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