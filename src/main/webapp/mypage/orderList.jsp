<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문/배송 조회 :: 미미미</title>
		<jsp:include page="../common/header.jsp"/>
		<style type="text/css">
			.orderlist-view {width: 1212px; margin: 50px auto;}
			.orderlist-sideview {width: 200px; margin-right: 50px; z-index: 0;}
			.orderlist-sideview h3 {margin: 0 0 20px 10px;}
			.orderlist-mainview {width: 950px;}
			table {width: 100%;}
			td {padding: 30px;}
			.accordion-body {padding: 0;}
			
		</style>
		<script type="text/javascript">
			$(function(){
				// 아이디로 주문 내역 조회
				function selectOrderByUserId(){
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType: "json",
						data: {key: "order", methodName: "selectByUserId", userId: "happy01"},
						success: function(result) {
							let text = "";
							$("#orderTable > tbody").children().remove();
							if(JSON.stringify(result) == "[]"){
								text += `<tr>`;
								text += `<td class="cart-main-empty" style='text-align: center; padding: 40px;' colspan="8">아직 주문한 상품이 없습니다.`;
								text += `<br><button type="button" id="home" style='text-align: center; margin: 30px 0 0;' class="btn btn-outline-dark btn-lg shadow-none">미미미가 준비한 맛있는 도시락 주문하러 가기</button></td>`;
								text += "</tr>";
								$("#orderTable > tbody").append(text);
							} else {
								$.each(result, function(index, item) {
									if(item.orderCancel == "F"){
										text = "";
										text += `<tr id="\${item.orderId}">`;
										text += "<td>" + item.orderId + "</td>";
										text += "<td>" + item.orderDate.substr(0, 10) + "</td>"
										text += '<td id="orderList"></td>';
										text += '<td name="goodsTotalPrice">' + item.totalPrice + '</td>';
										text += '<td><button type="button" class="btn btn-outline-danger btn-sm shadow-none" id="cancel">주문 취소</button></td>';
										text += "</tr>";
										$("#orderTable > tbody").append(text);
										viewGoodsList(item.orderId);
									}
								})
							} 
						}, // 성공 메소드
						error : function(err) {
							alert(err + "\n구매 내역을 불러올 수 없습니다.");
						} // 에러 메소드
					}) // ajax 종료
				} // selectOrderByUserId() 메소드 종료
				
				// 상품명 메소드
				function viewGoodsList(orderId){
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType: "json",
						data: {key: "order", methodName: "selectLineByOrderId", orderId: orderId},
						success: function(result) {
							let text = "";
							$("#" + orderId).children("#orderList").children().remove();
							$.each(result, function(index, item) {
								text += "<div>" + item.goodsId + " X" + item.orderQty + "</div>";
							})
							$("#" + orderId).children("#orderList").append(text);
						}, // 성공 메소드
						error : function(err) {
							alert(err + "\n구매 내역을 불러올 수 없습니다.");
						} // 에러 메소드
					}) // ajax 종료
				} // 구매 상품명 메소드 종료
				
				$(document).on("click", "#cancel", function() {
					confirm("해당 주문이 전체 취소됩니다.\n정말 취소하시겠습니까?");
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType: "text",
						data: {key: "order", methodName: "deleteOrder", orderId: $(this).parent().parent().attr("id")},
						success: function(result) {
							alert("취소가 완료되었습니다.");
							selectOrderByUserId();
						}, // 성공 메소드
						error : function(err) {
							alert(err);
						} // 에러 메소드
					}) // ajax 종료
				})
				
				// 주문 상세 이동 메소드
				$(document).on("click", "tbody > tr > td:not(:last-child)", function() {
					location.href = "${path}/front?key=order&methodName=selectByOrderId&orderId=" + $(this).parent().attr("id");
				})
				
				$(".accordion-button").click(function() {
					if($(this).attr("aria-expanded") == true){
						$(this).attr("aria-expanded", false);
					} else {
						$(this).attr("aria-expanded", true);
					}
					
				})
				
				$(document).on("click", "#home", function() {
					location.href = "${path}/index.jsp";
				})
				
				selectOrderByUserId();
			})
		</script>
	</head>
	<body>
		<section class="orderlist-view d-flex p-2 bd-highlight">
			<aside class="orderlist-sideview">
				<h3>마이페이지</h3>
				<div class="list-group">
					<a href="${path}/mypage/orderList.jsp" class="list-group-item list-group-item-action active" aria-current="true">
						나의 주문 내역
					</a>
					<a href="${path}/mypage/calendar.jsp" class="list-group-item list-group-item-action">나의 배송 캘린더</a>
					<a href="#" class="list-group-item list-group-item-action">쿠폰 조회</a>
					<a href="#" class="list-group-item list-group-item-action">1:1 문의 내역</a>
					<a href="${path}/mypage/userEdit01.jsp" class="list-group-item list-group-item-action">회원 정보 수정</a>
					<a href="${path}/mypage/userLeave01.jsp" class="list-group-item list-group-item-action">회원 탈퇴</a>
				</div>
			</aside>
			<div class="orderlist-mainview">
				<h1>주문/배송 조회</h1>
				<table class="table table-hover" id="orderTable">
					<thead>
						<tr>
							<td>주문번호</td>
							<td>주문일자</td>
							<td>상품명</td>
							<td>결제금액</td>
							<td>주문 취소</td>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</section>
	</body>
	<jsp:include page="../common/footer.jsp"/>
</html>