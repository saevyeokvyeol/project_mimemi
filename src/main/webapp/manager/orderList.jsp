<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Document</title>
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<!-- jQuery -->
		<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <!-- jQuery ui -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<!-- jQuery ui -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<style type="text/css" src=""></style>
		<style>
			.orderList-main {width: 1200px; margin: auto;}
			table {width: 100%;}
			.order_sort{text-align: right;}
		</style>
		<script type="text/javascript">
			$(function(){
				$("select").change(function() {
					if($(this).val() != "0"){
						location.href = "${path}/front?key=order&methodName=selectAll&field=" + $(this).val();
					}
				})
			})
		</script>
	</head>
	<body>
		<section class="orderList-main">
			<h1><a href="${path}/front?key=order&methodName=selectAll">구매 내역</a></h1>
			<section class="order_sort">
				<select name="order_sort" id="">
					<option value="0">--정렬방식--</option>
					<option value="order_id">등록순</option>
					<option value="user_id">아이디순</option>
					<option value="highprice">구매 가격 높은 순</option>
					<option value="rowprice">구매 가격 낮은 순</option>
				</select>
			</section>
			<table class="table-secondary table-hover" id="orderList">
				<thead>
					<tr>
						<th>주문 번호</th>
						<th>구매자 아이디</th>
						<th>구매 상품</th>
						<th>결제 방법</th>
						<th>총 가격</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty orderList}">
							<tr>
								<td colspan="5">구매 내역이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${orderList}" var="order">
							<tr>
								<td>${order.orderId}</td>
								<td>${order.userId}</td>
								<td>${order.orderMemo}</td>
								<td>${order.payMethod}</td>
								<td>${order.totalPrice}</td>
							</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<nav aria-label="Page navigation example">
				<jsp:useBean class="mimemi.mvc.paging.OrderListPageCnt" id="p"/> 
				<c:set var="isLoop" value="false"/>
				<c:set var="temp" value="${(pageNum - 1) % p.blockcount}"/>
				<c:set var="startPage" value="${pageNum - temp}"/>
				<ul class="pagination justify-content-center">
					<c:if test="${(startPage - p.blockcount) > 0}">
						<li class="page-item"><a class="page-link" href="${path}/front?key=order&methodName=selectAll&pageNum=${startPage-1}">이전</a></li>
					</c:if>
					<c:forEach var='i' begin='${startPage}' end='${(startPage-1) + p.blockcount}'> 
						<c:if test="${(i-1) >= p.pageCnt}">
							<c:set var="isLoop" value="true"/>
						</c:if> 
						<c:if test="${not isLoop}" >
							<li class="page-item ${i == pageNum ? ' active' : ''}"><a class="page-link page_num" href="${path}/front?key=order&methodName=selectAll&pageNum=${i}">${i}</a></li> 
						</c:if>
					</c:forEach>
					<c:if test="${(startPage + p.blockcount) <= p.pageCnt}">
						<li class="page-item"><a class="page-link" href="${path}/front?key=order&methodName=selectAll&pageNum=${startPage+p.blockcount}">이후</a></li>
					</c:if>
				</ul>
			</nav>
		</section>
	</body>
</html>