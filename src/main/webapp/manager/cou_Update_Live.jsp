<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 수정 - 미미미</title>
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
  .update-liveCp{width: 500px;
                margin: auto; padding: 50px 0;}
</style>


<script type="text/javascript">
$(function() {
	
	//아이디박스 비활성화(입력불가능) - atrr()이용
	$("#id").attr("readonly", "readonly"); //읽기전용
	
	$("#btn").click(function() {
		//location.href = '${path}/manager/cou_Main_Mg.jsp';
		location.href ='${path}/front?key=coupon&methodName=updateLiveCp';
	})
	
	
	
});
   
	
</script>

</head>
<body>
<div class="update-liveCp">
<form name="inForm" method="post" id="inForm" >
   
<h2> 실시간쿠폰수정 Form</h2>
<table>
   
  <tr>
	<td>쿠폰번호</td>
	<td><input type="text" class="form-control" name="id" id="id" value="${liveCoupon.livecouId}"/></td>
  </tr>
  <tr>
	<td>쿠폰명</td>
	<td><input type="text" class="form-control" name="name" id="name" value="${liveCoupon.livecouName}"/></td>
  </tr>
  <tr>
	<td>쿠폰금액</td>
	<td><input type="text" class="form-control" name="price" id="price" value="${liveCoupon.livecouPrice}"/></td>
  </tr>
  <tr>
	<td>쿠폰발행일</td>
	<td><input type="text" class="form-control" name="pubDate" id="pubDate" value="${liveCoupon.livecouPubdate}"/></td>
  </tr>
  <tr>
	<td>쿠폰만료일</td>
	<td><input type="text" class="form-control" name="endDate" id="endDate" value="${liveCoupon.livecouUseperiod}"/></td>
  </tr>
  <tr>
	<td colspan="2" >
	<input type="hidden" name="key" value="coupon">
	<input type="hidden" name="methodName" value="updateLiveCp">
	<input type="submit" class="btn btn-outline-dark" value="수정" id="btn"/>
	<input type="reset" class="btn btn-outline-dark" value="취소" />
	</td>
	
  </tr>
  </table> 
</form>

<p>
<div>
	<a href="cou_Main_Mg.jsp" class="btn btn-outline-dark shadow-none">리스트로 돌아가기</a>
</div>
</div>

</body>
</html>