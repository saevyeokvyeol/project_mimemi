<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>장바구니 :: 미미미</title>
		<style type="text/css">
			section {width: 1200px; margin: auto;}
			table {width: 1200px;}
			th, td {border: 1px solid black;}
			tfoot {text-align: right;}
		</style>
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
							$("#cartTable > tbody").children().remove();
							let text = "";
							$.each(result, function(index, item) {
								text += "<tr>";
								text += `<td><input type="checkbox" name='\${item.goodsId}'></td>`;
								text += `<td>\${item.goodsId}</td>`;
								text += `<td><select name="weekday" id=""><option value="T">주 3회</option><option value="F">주 5회</option></select></td>`;
								text += `<td><select name="cartPeriod" id="weekday"><option value="1W">1주</option><option value="2W">2주</option><option value="4W">4주</option><option value="8W">8주</option></select></td>`;
								text += `<td><button type="button"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash" viewBox="0 0 16 16"><path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/></svg></button><input type="number" name="cartQty" id="cartQty" min="1" max="9999" step="1" value="\${item.cartQty}" readonly="readonly"><button type="button"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16"><path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/></svg></button></td>`;
								text += `<td><input type="date" name="" id="" value="\${item.cartStart}">
								<input type="text" name="" id="" value="\${item.cartStart}"></td>`;
								text += `<td>\${item.cartQty}</td>`;
								text += "</tr>";
								$("#cartTable > tbody").append(text);

								// 배송 간격, 배송 기간 설정
								$("tbody").last().children().each(function() {
									if(this.val() == item.cartWeekday){
										$(this).attr("autofocus", "autofocus");
									}
								})
							})
						}, // 성공 메소드
						error : function(result) {
							alert(err + " 에러 발생!");
						} // 에러 메소드
					}) // ajax 종료
				} // selectCartByUserId() 메소드 종료
				selectCartByUserId();
			}) // Jquery 종료
		</script>
	</head>
	<body>
		<section>
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
						</tr>
					</thead>
					<tbody>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="7">총 가격 ₩60,000</td>
						</tr>
					</tfoot>
				</table>
				<a href="#">전체 삭제</a>
				<a href="#">선택 삭제</a>
				<a href="${path}/order/order.jsp">선택 상품 주문</a>
				<a href="${path}/order/order.jsp">전체 주문</a>
			</form>
		</section>
	</body>
</html>