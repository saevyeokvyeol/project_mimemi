<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>장바구니 :: 미미미</title>
		<jsp:include page="../common/header.jsp"/>
		<style type="text/css">
			.cart-main {width: 1200px; margin: auto; padding: 50px 0; position: relative;}
			.cart-main h1 {padding-bottom: 20px;}
			#cartTable th, #cartTable tbody td {text-align: center; vertical-align: middle;}
			#cartTable td:nth-child(2) {width: 300px; text-align: left;}
			#cartTable td:nth-child(3),
			#cartTable td:nth-child(4),
			#cartTable td:nth-child(6) {width: 130px;}
			#cartTable td img {width: 100px; border-radius: 5px; margin-right: 20px;}
			#cartTable .num {display: inline; width: 50px; text-align: center; padding: 6px 0 0 10px;}
			.cartStart {text-align: center;}
			tfoot {text-align: right;}
			.cart-main-bottom {display: flex; justify-content: space-between;}
			#cartToast {position: absolute; top: 10px; right: -15px;}
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
						data: {key: "cart", methodName: "selectCartByUserId"},
						success: function(result) {
							let text = "";
							$("#cartTable > tbody").children().remove();
							if(JSON.stringify(result) == "[]"){
								text += `<tr>`;
								text += `<td class="cart-main-empty" colspan="8">장바구니에 담긴 상품이 없습니다.</td>`;
								text += "</tr>";
								$("#cartTable > tbody").append(text);
							} else {
								$.each(result, function(index, item) {
									text = "";
									text += `<tr name="\${item.cartId}">`;
									text += `<td><input class="form-check-input shadow-none" type="checkbox" name="cartSelect" value="\${item.cartId}"></td>`;
									text += `<td name="goodsId"><img alt="" src="\${item.goods.goodsThumbnail}">\${item.goods.goodsName}</td>`;
									text += `<td><select class="form-select" name="cartWeekday" id="\${index}Weekday"><option value="T">주 3회</option><option value="F">주 5회</option></select></td>`;
									text += `<td><select class="form-select" name="cartPeriod" id="\${index}Period"><option value="1W">1주</option><option value="2W">2주</option><option value="4W">4주</option><option value="8W">8주</option></select></td>`;
									text += `<td><button type="button" class="btn btn-outline-dark shadow-none btn-sm" name="minus"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash" viewBox="0 0 16 16"><path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/></svg></button><input type="number" class="form-control-plaintext num" name="cartQty" min="1" max="9999" step="1" value="\${item.cartQty}" readonly="readonly"><button type="button" name="plus" class="btn btn-outline-dark shadow-none btn-sm"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16"><path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/></svg></button></td>`;
									
									text += "<td><input type='text' name='cartStart' class='form-control cartStart' value='" + item.cartStart.substr(0, 10) + "' readonly='readonly'>"
									
									text += `<td name="goodsPrice">\${item.goodsPrice}</td>`;
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
								cartCount();
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
					$("#totalPrice > h5").text("₩" + totalPrice);
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
					let check = false;
					$("[name=cartSelect]:checked").each(function() {
						arr.push($(this).parent().parent().attr("name"));
						check = true;
					})
					if(!check){
						alert("삭제할 상품을 선택해주세요");
						return;
					}
					
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						traditional : true,
						dataType : "text",
						data: {key: "cart", methodName: "deleteSelectedCart", cartId: arr},
						success: function(result) {
							selectCartByUserId();
							var toast = new bootstrap.Toast($("#cartToast"));
							cartCount();
							toast.show();
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
						data: {key: "cart", methodName: "deleteAllCart"},
						success: function(result) {
							selectCartByUserId();
							var toast = new bootstrap.Toast($("#cartToast"));
							cartCount();
							toast.show();
						},
						error: function(err) {
							alert(err + "\n장바구니를 불러올 수 없습니다.");
						}
					}) // ajax 종료
				}) // 전체 삭제
				
				// 선택 구매 시 체크박스 체크
				$("form[name=cartForm]").submit(function() {
					let check = false;
					

					$("[name=cartSelect]:checked").each(function() {
						check = true;
					})
					
					if(!check){
						alert("상품을 하나 이상 선택해주세요.");
						return check;
					}
					
					return check;
				})
				
				// 전체 선택
				$("#checkAll").click(function() {
					if($(this).is(":checked")) {
						$("[name=cartSelect]").prop("checked", true);
					} else {
						$("[name=cartSelect]").prop("checked", false);
					}
				})
				
				// 장바구니 전체 상품 가지고 주문창으로 이동
				$("#orderAll").click(function() {
					
					location.href = "${path}/front?key=cart&methodName=viewOrderForm&mode=C";
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
				
				selectCartByUserId();
			}) // Jquery 종료
		</script>
	</head>
	<body>
		<section class="cart-main"><div class="toast align-items-center" role="alert" aria-live="assertive" aria-atomic="true" id="cartToast">
			  <div class="d-flex">
			    <div class="toast-body">
			    장바구니가 삭제되었습니다.
			   </div>
			    <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
			  </div>
			</div>
			<form action="${path}/front?key=cart&methodName=viewOrderForm&mode=S" name="cartForm" method="post">
        		<input type="hidden" name="" id="">
				<h1>장바구니</h1>
				<table class="table" id="cartTable">
					<thead>
						<tr>
							<th><input type="checkbox" class="form-check-input shadow-none" id="checkAll"></th>
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
							<td colspan="8" id="totalPrice"><h5>₩0</h5></td>
						</tr>
					</tfoot>
				</table>
				<section class="cart-main-bottom">
					<span>
						<button type="button" class="btn btn-outline-dark shadow-none" id="deleteSelected">선택 삭제</button>
						<button type="button" class="btn btn-outline-dark shadow-none" id="deleteAll">전체 삭제</button>
					</span>
					<span>
					<button type="submit" class="btn btn-outline-dark btn-lg shadow-none" id="orderSelected">선택 주문</button>
					<button type="button" class="btn btn-outline-dark btn-lg shadow-none" id="orderAll">전체 주문</button>
					</span>
				</section>
			</form>
		</section>
	</body>
	<jsp:include page="../common/footer.jsp"/>
</html>