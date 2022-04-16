<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>장바구니 :: 미미미</title>
		<jsp:include page="../common/header.jsp"/>
		<style type="text/css">
			.cart-main {width: 1200px; margin: auto;}
			table {width: 1200px;}
			th, td {border: 1px solid black;}
			tfoot {text-align: right;}
			.cart-main-bottom {display: flex; justify-content: space-between;}
		</style>
    	<link rel="stylesheet" href="../css/datepicker.css">
		<script type="text/javascript">
			$(function() {
				// 전체 검색
				function selectCartByUserId(){
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType: "json",
						data: {key: "cart", methodName: "selectCartByUserId", userId: "happy01"},
						success: function(result) {
							let text = "";
							$("#cartTable > tbody").children().remove();
							console.log(JSON.stringify(result));
							if(JSON.stringify(result) == "[]"){
								text += `<tr>`;
								text += `<td class="cart-main-empty" colspan="8">장바구니에 담긴 상품이 없습니다.</td>`;
								text += "</tr>";
								$("#cartTable > tbody").append(text);
							} else {
								$.each(result, function(index, item) {
									text = "";
									text += `<tr name="\${item.cartId}">`;
									text += `<td><input type="checkbox" name="cartSelect"></td>`;
									text += `<td name="goodsId">\${item.goodsId}</td>`;
									text += `<td><select name="cartWeekday" id="\${index}Weekday"><option value="T">주 3회</option><option value="F">주 5회</option></select></td>`;
									text += `<td><select name="cartPeriod" id="\${index}Period"><option value="1W">1주</option><option value="2W">2주</option><option value="4W">4주</option><option value="8W">8주</option></select></td>`;
									text += `<td><button type="button" name="minus"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash" viewBox="0 0 16 16"><path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/></svg></button><input type="number" name="cartQty" min="1" max="9999" step="1" value="\${item.cartQty}" readonly="readonly"><button type="button" name="plus"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16"><path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/></svg></button></td>`;
									
									text += "<td><input type='text' name='cartStart' value='" + item.cartStart.substr(0, 10) + "' readonly='readonly'>"
									
									text += `<td name="goodsPrice">\${item.cartQty}</td>`;
									text += `<td name="goodsTotalPrice"></td>`;
									text += "</tr>";
									$("#cartTable > tbody").append(text);
									// 배송 간격, 배송 기간 설정
									$(`#\${index}Weekday`).val(item.cartWeekday);
									$(`#\${index}Period`).val(item.cartPeriod);
									$("input[name=cartStart]").datepicker();
								})
								calGoodsTotalPrice();
								calTotalPrice();
							}
						}, // 성공 메소드
						error : function(err) {
							alert(err + "\n장바구니를 불러올 수 없습니다.");
						} // 에러 메소드
					}) // ajax 종료
					
				} // selectCartByUserId() 메소드 종료
				
				// 상품별 총 가격 계산
				function calGoodsTotalPrice(){
					$("#cartTable > tbody").children().each(function() {
						let cartWeekday;
						let cartPeriod = parseInt($(this).find("select[name=cartPeriod]").val());
						let cartQty = $(this).find("input[name=cartQty]").val();
						let goodsPrice = $(this).find("td[name=goodsPrice]").text();
						
						if($(this).find("select[name=cartWeekday]").val() == "T"){
							cartWeekday = 3;
						} else {
							cartWeekday = 5;
						}
						
						let goodsTotalPrice = cartWeekday * cartPeriod * cartQty * goodsPrice;
						
						$(this).find("td[name=goodsTotalPrice]").text(goodsTotalPrice);
					})
				} // goodsTotalPrice() 메소드 종료
				
				// 장바구니 총 가격 계산
				function calTotalPrice(){
					let totalPrice = 0;
					$("#cartTable > tbody").children().each(function() {
						totalPrice += parseInt($(this).find("td[name=goodsTotalPrice]").text());
					})
					$("#totalPrice").text("₩" + totalPrice);
				} // calTotalPrice() 메소드 종료
				
				// 배송 요일 변경 시 DB 업데이트
				$(document).on("change", "select[name=cartWeekday]", function() {
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType : "text",
						data: {key: "cart", methodName: "updateCartWeekday", cartId: $(this).parent().parent().attr("name"), cartWeekday: $(this).val()},
						success: function(result) {
							calGoodsTotalPrice();
							calTotalPrice();
						},
						error: function(err) {
							alert(err + "\n장바구니를 불러올 수 없습니다.");
						}
					}) // ajax 종료
				}) // 배송 요일 업데이트 종료
				
				// 배송 기간 변경 시 DB 업데이트
				$(document).on("change", "select[name=cartPeriod]", function() {
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType : "text",
						data: {key: "cart", methodName: "updateCartPeriod", cartId: $(this).parent().parent().attr("name"), cartPeriod: $(this).val()},
						success: function(result) {
							calGoodsTotalPrice();
							calTotalPrice();
						},
						error: function(err) {
							alert(err + "\n장바구니를 불러올 수 없습니다.");
						}
					}) // ajax 종료
				}) // 배송 기간 업데이트 종료
				
				// 수량 감소 시 DB 업데이트
				$(document).on("click", "button[name=minus]", function() {
					let updateNum = parseInt($(this).next().val()) - 1;
					if(updateNum <= 0){
						alert("수량을 하나 이상 입력해주세요.");
						updateNum = 1;
					}
					$(this).next().val(updateNum);
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType : "text",
						data: {key: "cart", methodName: "updateCartQty", cartId: $(this).parent().parent().attr("name"), cartQty: $(this).next().val()},
						success: function(result) {
							calGoodsTotalPrice();
							calTotalPrice();
						},
						error: function(err) {
							alert(err + "\n장바구니를 불러올 수 없습니다.");
						}
					}) // ajax 종료
				}); // 수량 감소 업데이트 종료
				
				// 수량 증가 시 DB 업데이트
				$(document).on("click", "button[name=plus]", function() {
					let updateNum = parseInt($(this).prev().val()) + 1;
					$(this).prev().val(updateNum);
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType : "text",
						data: {key: "cart", methodName: "updateCartQty", cartId: $(this).parent().parent().attr("name"), cartQty: $(this).prev().val()},
						success: function(result) {
							calGoodsTotalPrice();
							calTotalPrice();
						},
						error: function(err) {
							alert(err + "\n장바구니를 불러올 수 없습니다.");
						}
					}) // ajax 종료
				}); // 수량 증가 업데이트 종료
				
				// 첫 배송일 업데이트
				$(document).on("change", "input[name=cartStart]", function() {
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType : "text",
						data: {key: "cart", methodName: "updateCartStart", cartId: $(this).parent().parent().attr("name"), cartStart: $(this).val()},
						success: function(result) {
							calGoodsTotalPrice();
							calTotalPrice();
						},
						error: function(err) {
							alert(err + "\n장바구니를 불러올 수 없습니다.");
						}
					}) // ajax 종료
				}); // 첫 배송일 업데이트 종료
				
				// 부분 삭제
				$("#deleteSelected").click(function() {
					let arr = [];
					$("[name=cartSelect]:checked").each(function() {
						arr.push($(this).parent().parent().attr("name"));
					})
					
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						traditional : true,
						dataType : "text",
						data: {key: "cart", methodName: "deleteSelectedCart", cartId: arr},
						success: function(result) {
							selectCartByUserId();
						},
						error: function(err) {
							alert(err + "\n장바구니를 불러올 수 없습니다.");
						}
					}) // ajax 종료
				}) // 부분 삭제 종료
				
				// 전체 삭제
				$("#deleteAll").click(function() {
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType : "text",
						data: {key: "cart", methodName: "deleteAllCart", userId: 'happy01'},
						success: function(result) {
							selectCartByUserId();
						},
						error: function(err) {
							alert(err + "\n장바구니를 불러올 수 없습니다.");
						}
					}) // ajax 종료
				}) // 전체 삭제
				
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
				
				selectCartByUserId();
			}) // Jquery 종료
		</script>
	</head>
	<body>
		<section class="cart-main">
			<form action="">
        <input type="hidden" name="" id="">
				<h1>장바구니</h1>
				<table class="table" id="cartTable">
					<thead>
						<tr>
							<th><input type="checkbox"></th>
							<th>상품명</th>
							<th>배송요일</th>
							<th>배송기간</th>
							<th>수량</th>
							<th>첫배송일</th>
							<th>가격</th>
							<th>상품 총 가격</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="8" id="totalPrice">₩0</td>
						</tr>
					</tfoot>
				</table>
				<section class="cart-main-bottom">
					<span>
						<button type="button" class="btn btn-outline-dark shadow-none" id="deleteSelected">선택 삭제</button>
						<button type="button" class="btn btn-outline-dark shadow-none" id="deleteAll">전체 삭제</button>
					</span>
					<span>
					<button type="button" class="btn btn-outline-dark btn-lg shadow-none" id="orderSelected">선택 주문</button>
					<button type="button" class="btn btn-outline-dark btn-lg shadow-none" id="orderAll">전체 주문</button>
					</span>
				</section>
			</form>
		</section>
	</body>
</html>