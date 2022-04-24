<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>배송 스케줄 조회 :: 관리자 페이지</title>
		<jsp:include page="../common/sidebar.jsp"/>
		<style type="text/css">
			.view  {width: 100%; padding: 100px 50px 50px 275px;}
			#order-deli-table {width: 100%; caption-side: top; text-align: center;}
			.view td {padding: 10px;}
			.date {text-align: center; width: 200px; display: inline;}
			#btn-box {margin-top: 50px; text-align: center;}
		</style>
		<script type="text/javascript">
			$(function() {
				
				// 주문 취소 버튼 클릭
				$("select").change(function() {
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType: "text",
						data: {key: "order", methodName: "updateStateId", orderDeliId: $(this).attr("id"), orderStateId: $(this).val()},
						success: function(result) {
	                        location.reload();
						}, // 성공 메소드
						error : function(err) {
							alert(err);
						} // 에러 메소드
					}) // ajax 종료
				}) // 주문 취소 버튼 클릭 종료
				
				// 주문 취소 버튼 클릭
				$(".date").change(function() {
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType: "text",
						data: {key: "order", methodName: "updateDeliDate", orderDeliId: $(this).parent().attr("id"), orderDeliDate: $(this).val()},
						success: function(result) {
	                        location.reload();
						}, // 성공 메소드
						error : function(err) {
							alert(err);
						} // 에러 메소드
					}) // ajax 종료
				}) // 주문 취소 버튼 클릭 종료
				
				$(".date").datepicker();
				
				// 돌아가기 버튼
				$("#goBack").on("click", function() {
					location.href = "${path}/mypage/orderList.jsp";
				})

				
				// datepicker 설정
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
		<section class="view">
			<div class="orderview-mainview">
				<h1 id="order">배송 스케줄 조회</h1>
					<table class="table" id="order-deli-table">
						<thead class="table-secondary">
							<tr>
								<th>주문 상세 번호</th>
								<th>배송 번호</th>
								<th>상품명</th>
								<th>수량</th>
								<th>배송 일자</th>
								<th>배송 상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="list">
								<tr id="${list.orderDeliId}">
									<td>${list.orderLineId}</td>
									<td>${list.orderDeliId}</td>
									<td>${list.orderLine.goods.goodsName}</td>
									<td>${list.orderLine.orderQty}</td>
									<td id="${list.orderDeliId}"><input type="text" class="form-control-plaintext date" value="${fn:substring(list.orderDeliDate,0,10)}"></td>
									<td>
										<select class="form-select" id="${list.orderDeliId}">
										<c:forEach items="${osList}" var="os">
											<option value="${os.orderStateId}" <c:if test ="${os.orderStateId == list.orderStateId}">selected = "selected"</c:if>>${os.orderStateDetail}</option>
										</c:forEach>
										</select>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div id="btn-box">
						<button class="btn btn-secondary btn-lg shadow-none" id="goBack">돌아가기</button>
					</div>
				</div>
		</section>
	</body>
</html>