<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문/배송 조회 :: 관리자 페이지</title>
		<jsp:include page="../common/sidebar.jsp"/>
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
			.orderList-main {width: 100%; padding: 100px 50px 50px 275px;}
			#orderList {text-align: center; vertical-align: middle;}
			.order_sort{text-align: right; margin: 20px 0;}
			#order-sort-select {width: 200px; margin: 0; display: inline;}
		</style>
		<script type="text/javascript">
			$(function(){
				$("select").change(function() {
					if($(this).val() != "0"){
						location.href = "${path}/front?key=order&methodName=selectAll&field=" + $(this).val();
					}
				})
				
				
				// 주문 취소
				$(document).on("click", "#cancel", function() {
					confirm("해당 주문이 전체 취소됩니다.\n정말 취소하시겠습니까?");
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType: "text",
						data: {key: "order", methodName: "deleteOrder", orderId: $(this).parent().parent().attr("id")},
						success: function(result) {
							alert("취소가 완료되었습니다.");
	                        location.reload();
						}, // 성공 메소드
						error : function(err) {
							alert(err);
						} // 에러 메소드
					}) // ajax 종료
				})
				
				// 주문 상세 이동 메소드
				$(document).on("click", "tbody > tr > td:not(:last-child)", function() {
					location.href = "${path}/front?key=order&methodName=selectByOrderIdMg&orderId=" + $(this).parent().attr("id");
				})
			})
		</script>
	</head>
	<body>
		<section class="orderList-main">
			<h1>구매 내역</h1>
			<section class="order_sort">
				<select name="order_sort"  class="form-select" id="order-sort-select">
					<option value="0">--정렬방식--</option>
					<option value="order_id">등록순</option>
					<option value="user_id">아이디순</option>
					<option value="highprice">구매 가격 높은 순</option>
					<option value="rowprice">구매 가격 낮은 순</option>
				</select>
			</section>
			<table class="table table-hover" id="orderList">
				<thead class="table-secondary">
					<tr>
						<th>주문 번호</th>
						<th>구매자 아이디</th>
						<th>구매 상품</th>
						<th>결제 방법</th>
						<th>총 가격</th>
						<th>주문 취소</th>
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
							<tr id="${order.orderId}">
								<td>${order.orderId}</td>
								<td>${order.userId}</td>
								<td>
									<c:forEach items="${order.orderLineList}" var="list">
										<div>${list.goods.goodsName} X${list.orderQty}</div>
									</c:forEach>
								</td>
								<c:choose>
									<c:when test="${order.payMethod == 'C'}">
										<td>카드</td>
									</c:when>
									<c:when test="${order.payMethod == 'M'}">
										<td>무통장 입금</td>
									</c:when>
									<c:otherwise>
										<td>실시간 계좌이체</td>
									</c:otherwise>
								</c:choose>
								<td>${order.totalPrice}</td>
								<td>
									<c:choose>
										<c:when test="${order.orderCancel == 'F'}">
											<button type="button" class="btn btn-outline-danger btn-sm shadow-none" id="cancel">주문 취소</button>
										</c:when>
										<c:otherwise>
											취소된 주문입니다
										</c:otherwise>
									</c:choose>
								</td>
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