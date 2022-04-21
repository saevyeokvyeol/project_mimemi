<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<jsp:include page="../common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>

<script type="text/javascript">
 $(function(){
	 alert("${loginName}");
	alert("${loginUser}");
	alert("${loginUser.userId.userCouId}");
});

</script>
</head>
<body>
<div class="topBox">
	<div class="firstBox">
	  <div class="txt1"><strong>${loginName}</strong>님 반갑습니다.</div>
	  <div class="txt2">미미미와 함께하신지 ${loginUser.Regdate}일 되었습니다.</div>
	</div>
	<div class="secondBox">
      <div class="point">가용 적립금</div>
      <a href="orderList.jsp">${loginUser.userPoint}</a>원
    </div>
    <div class="thirdBox">
      <div class="coupon">사용 가능한 쿠폰</div>
      <a href="couponList.jsp">${loginUser.userId.userCouId}</a>장
    </div>
</div>
<div class="middleBox">
  <iframe src="calendar.jsp"></iframe>
</div>
<div class="bottomBox">
  <div class="noticeTitle">공지사항</div>
  <div class="noticeList">
    <!-- 아작스 -->
  </div>
</div>

</body>
</html>