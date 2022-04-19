<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<jsp:include page="../common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	iframe{border-style:none; width:100%; height:100%; }
</style>

<script type="text/javascript">
 $(function(){
	alert("${loginUser.userId}");
})
</script>
<script type="text/javascript">
  $(function(){
	  //사용가능한 쿠폰
	  $("#usableCp").ready(function selectCpByUserId(){
		  $.ajax({
			 url: "${path}/ajax",
			 type: "post",
			 dataType: "json",
			 data: {key:"coupon", methodName: "selectCpByUserId", userId: "${loginUser.userId}"}, //userId는 때에 따라 바뀌는것?
			 success: function(result){
				 //alert();
				 let text = 0;
				 $.each(result, function(index, item){
					 if(item.usercouUsable=="N"){
						 text += 1;
					 }
				 })
				 //alert(text);
				 $("#usableCp").text(text) //선택자.text()
			 },
			 error : function(result) {
					alert(err + " 에러 발생!");
			}
		  })//ajax 종료
	  })
	  selectCpByUserId();
  })
</script>


</head>
<body>
<div class="topBox">
	<div class="firstBox">
	  <div class="txt1"><strong>${loginName}</strong>님 반갑습니다.</div>
	  <div class="txt2">미미미와 함께하신지 일 되었습니다.</div>
	</div>
	<div class="secondBox">
      <div class="point">가용 적립금</div>
      <a href="orderList.jsp"></a>원
    </div>
    <div class="thirdBox">
      <div class="coupon">사용 가능한 쿠폰</div>
      <a href="couponList.jsp" id="usableCp"></a>장
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