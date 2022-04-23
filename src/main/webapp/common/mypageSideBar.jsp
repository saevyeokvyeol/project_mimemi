<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
		
		</script>
	</head>
	<body>
			<aside class="orderlist-sideview">
				<h3>마이페이지</h3>
				<div class="list-group">
					<a href="${path}/mypage/orderList.jsp" class="list-group-item list-group-item-action active" aria-current="true">
						나의 주문 내역
					</a>
					<a href="${path}/mypage/calendar.jsp" class="list-group-item list-group-item-action">나의 배송 캘린더</a>
					<a href="${path}/mypage/couponList.jsp" class="list-group-item list-group-item-action">쿠폰 조회</a>
					<a href="#" class="list-group-item list-group-item-action">1:1 문의 내역</a>
					<a href="${path}/mypage/userEdit01.jsp" class="list-group-item list-group-item-action">회원 정보 수정</a>
					<a href="${path}/mypage/userLeave01.jsp" class="list-group-item list-group-item-action">회원 탈퇴</a>
				</div>
			</aside>
	</body>
</html>