<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>header</title>
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
    	<!-- 전체 카테고리 이벤트 -->
    	<script type="text/javascript">
    		$(function() {
				$("#allCategory").hover(function() {
					$(".all-nav").css("display", "block");
				}, function() {
					$(".all-nav").css("display", "none");
				})
				
				$(".all-nav > div").hover(function() {
					$(".all-nav").css("display", "block");
				}, function() {
					$(".all-nav").css("display", "none");
				})
			})
    	</script>
	</head>
	<body>
		<header class="main-header">
			<div class="main-header-top-right">
				<ul>
					<c:choose>
						<c:when test="${sessionScope.loginUser == null}">
							<li><a href="${path}/user/join03.jsp">회원가입</a></li>
							<li><a href="${path}/user/login.jsp">로그인</a></li>
						</c:when>
						<c:when test="${sessionScope.manager == null}">
							<li><a href="${path}/mypage/orderList.jsp">마이페이지</a></li>
							<li><a href="${path}/front?key=user&methodName=logoutUser">로그아웃</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${path}/mypage/mypageMain.jsp">마이페이지</a></li>
							<li><a href="${path}/front?key=user&methodName=logoutUser">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<h1><a href="${path}/index.jsp"><img src="${path}/img/ui/main_logo.png" alt="미미미 로고"></a></h1>
		</header>
		<nav class="main-header-menubar">
			<div>
				<ul>
					<li><a href="#" id="allCategory">전체 카테고리</a></li>
					<li><a href="${path}/goods/goodsList.jsp">도시락 정기배송</a></li>
					<li><a href="${path}/goods/dayMenuCalendar.jsp">이달의 식단</a></li>
					<li><a href="${path}/front?key=event&methodName=selectAll&field=Eventing">이벤트</a></li>
				</ul>
				<ul>
					<li><a href="#">배달가능지역</a></li>
					<li><a href="${path}/order/cart.jsp">카트</a></li>
				</ul>
			</div>
		</nav>
		<nav class="all-nav">
			<div>
				<div class="all-nav-inner">
					<ul class="all-nav-item">
						<li>
							<h5>미미미 정기배송</h5>
							<ul>
								<li><a href="${path}/front?key=goods&methodName=goodsView&goodsId=JUNG01">정성한상</a></li>
								<li><a href="${path}/front?key=goods&methodName=goodsView&goodsId=LUNCH01">런치박스</a></li>
								<li><a href="${path}/front?key=goods&methodName=goodsView&goodsId=DEN01">든든한상</a></li>
								<li><a href="${path}/front?key=goods&methodName=goodsView&goodsId=KAL01">칼로리식단</a></li>
								<li><a href="${path}/front?key=goods&methodName=goodsView&goodsId=DANG01">당뇨식단</a></li>
							</ul>
						</li>
						<li>
							<h5>마이페이지</h5>
							<ul>
								<li><a href="${path}/mypage/orderList.jsp">나의 주문 내역</a></li>
								<li><a href="${path}/mypage/calendar.jsp">나의 배송 캘린더</a></li>
								<li><a href="${path}/board/ask2.jsp">1:1 문의 내역</a></li>
							</ul>
						</li>
						<li>
							<h5><a href="${path}/front?key=notice&methodName=selectAll">공지사항</a></h5>
						</li>
						<li>
							<h5><a href="${path}/front?key=event&methodName=selectAll&field=Eventing">이벤트</a></h5>
						</li>
						<li>
							<h5><a href="${path}//board/faq.jsp">FAQ</a></h5>
						</li>
						<li>
							<h5><a href="${path}/front?key=review&methodName=selectAll">후기 게시판</a></h5>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</body>
</html>