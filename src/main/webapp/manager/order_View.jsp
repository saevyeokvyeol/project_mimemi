<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문/배송 조회 :: 관리자 페이지</title>
		<jsp:include page="../common/sidebar.jsp"/>
		<style type="text/css">
			.view  {width: 100%; padding: 100px 50px 50px 275px;}
			#order-line-table {width: 100%; caption-side: top; text-align: center;}
			.order_no {padding: 50px 80px; margin: 50px 0; border: 1px solid black; display: flex; justify-content: space-between; vertical-align: middle;}
			.view td {padding: 10px;}
			.view tfoot {text-align: right;}
			.orderlist-sideview {width: 200px; margin-right: 50px; z-index: 0;}
			.orderlist-sideview h3 {margin: 0 0 20px 10px;}
			.payment-table, .addr-table {text-align: left;  caption-side: top;}
			.payment-table td:first-child, .addr-table td:first-child {padding: 10px 40px; width: 200px;}
			#btn-box {margin-top: 50px; text-align: center;}
		</style>
		<script type="text/javascript">
			$(function() {
				
				// 주문 취소 버튼 클릭
				$(document).on("click", "#ordercancel", function() {
					if(confirm("해당 주문이 전체 취소됩니다.\n정말 취소하시겠습니까?")){
						$.ajax({
							url: "${path}/ajax",
							type: "post",
							dataType: "text",
							data: {key: "order", methodName: "deleteOrder", orderId: order.orderId},
							success: function(result) {
		                        location.reload();
							}, // 성공 메소드
							error : function(err) {
								alert(err);
							} // 에러 메소드
						}) // ajax 종료
					}
				}) // 주문 취소 버튼 클릭 종료
				
				// 상품 취소 버튼 클릭
				$(document).on("click", "#orderLinecancel", function() {
					
					if(confirm("해당 상품을 취소하시겠습니까?")) {
						$.ajax({
							url: "${path}/ajax",
							type: "post",
							dataType: "text",
							data: {key: "order", methodName: "deleteOrderLine", orderLineId: $(this).parent().parent().attr("id")},
							success: function(result) {
		                        location.reload();
							}, // 성공 메소드
							error : function(err) {
								alert(err);
							} // 에러 메소드
						}) // ajax 종료
					}
				}) // 상품 취소 버튼 클릭 종료
				
				// 주문 캘린더 이동 메소드
				$(document).on("click", "#order-line-table > tbody > tr > td:not(:last-child)", function() {
					location.href = "${path}/front?key=order&methodName=selectByOrderLineId&orderLineId=" + $(this).parent().attr("id");
				})
				
				// 돌아가기 버튼
				$("#goBack").on("click", function() {
					location.href = "${path}/mypage/orderList.jsp";
				})
			})
		</script>
	</head>
	<body>
		<section class="view">
			<div class="orderview-mainview">
				<h1 id="order">주문/배송 조회</h1>
					<h5>
						<div class="order_no">
							<span>주문 번호 ${order.orderId}</span>
							<span>주문 일자 ${fn:substring(order.orderDate,0,10)}</span>
							<span id="orderCancelState">
								<c:choose>
									<c:when test="${order.orderCancel == 'F'}">
										<button class="btn btn-outline-dark shadow-none" id="ordercancel">주문 취소</button>
									</c:when>
									<c:otherwise>
										취소된 주문입니다
									</c:otherwise>
								</c:choose>
							</span>
						</div>
					</h5>
					<table class="table table-hover" id="order-line-table">
						<thead class="table-secondary">
							<tr>
								<th>상품명</th>
								<th>첫 배송일</th>
								<th>수량</th>
								<th>가격</th>
								<th>총 가격</th>
								<th>취소</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${orderLineList}" var="ol">
								<tr id="${ol.orderLineId}">
									<td>${ol.goods.goodsName}</td>
									<td>${fn:substring(ol.deliStart,0,10)}</td>
									<td>${ol.orderQty}</td>
									<td><fmt:formatNumber type="number" pattern="###" value="${ol.priceQty / ol.orderQty}" /></td>
									<td>${ol.priceQty}</td>
									<td class="orderLineCancelState">
										<c:choose>
											<c:when test="${ol.lineCancel == 'T'}">
												취소된 상품입니다
											</c:when>
											<c:otherwise>
												<button type="button" class="btn btn-outline-danger btn-sm shadow-none" id="orderLinecancel">주문 취소</button>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="7">총 결제 금액 ${order.totalPrice}</td>
							</tr>
						</tfoot>
					</table>
					<table class="table payment-table">
						<caption>결제 정보</caption>
						<tbody>
							<tr>
								<td>결제 구분</td>
								<td>
									<c:choose>
										<c:when test="${order.payMethod == 'C'}">
										카드
										</c:when>
										<c:when test="${order.payMethod == 'S'}">
										실시간 계좌 이체
										</c:when>
										<c:when test="${order.payMethod == 'M'}">
										무통장 입금
										</c:when>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td>쿠폰 할인</td>
								<td>${order.usercouId}</td>
							</tr>
							<tr>
								<td>적립금 사용액</td>
								<td>${order.payPoint}</td>
							</tr>
							<tr>
								<td>총 결제 금액</td>
								<td>${order.totalPrice}</td>
							</tr>
						</tbody>
					</table>
					<table class="table addr-table">
						<caption>배송지 정보</caption>
						<tbody>
							<tr>
								<td>받으시는 분</td>
								<td>${addr.receiverName}</td>
							</tr>
							<tr>
								<td>연락처</td>
								<td>${addr.receiverPhone}</td>
							</tr>
							<tr>
								<td>배송지 주소</td>
								<td>${addr.addrAddr} ${addr.addrDetailAddr} (우편번호 : ${addr.zipcode})</td>
							</tr>
							<tr>
								<td>수령 방법</td>
								<td>${order.takeMethod}</td>
							</tr>
							<tr>
								<td>출입 비밀번호</td>
								<td>${order.enterPwd}</td>
							</tr>
							<tr>
								<td>배송 요청 사항</td>
								<td>${order.orderMemo}</td>
							</tr>
						</tbody>
					</table>
					<div id="btn-box">
						<button class="btn btn-secondary btn-lg shadow-none" id="goBack">돌아가기</button>
					</div>
				</div>
		</section>
	</body>
</html>