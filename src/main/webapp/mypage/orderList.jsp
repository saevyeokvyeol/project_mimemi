<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문/배송 조회 :: 미미미</title>
		<jsp:include page="../common/header.jsp"/>
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
		<style type="text/css">
			section {width: 1200px; margin: auto;}
			table {width: 100%;}
			td {padding: 30px;}
			a {color: black;}
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
								text += `<td class="cart-main-empty" colspan="8">아직 주문한 상품이 없습니다.`;
								text += `<br><button type="button" id="" class="btn btn-outline-dark btn-lg shadow-none">미미미가 준비한 맛있는 도시락 주문하러 가기</button></td>`;
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
					// alert();
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType: "text",
						data: {key: "order", methodName: "deleteOrder", orderId: $(this).parent().parent().attr("id")},
						success: function(result) {
							selectOrderByUserId();
						}, // 성공 메소드
						error : function(err) {
							alert(err);
						} // 에러 메소드
					}) // ajax 종료
				})
				
				$(document).on("click", "tbody > tr", function() {
					location.href = "${path}/front?key=order&methodName=selectOrderByOrderId&orderId=" + $(this).attr("id");
				})
				
				selectOrderByUserId();
			})
		</script>
	</head>
	<body></a>
		<section>
			<h1>주문/배송 조회</h1>
			<table class="table table-hover" id="orderTable">
				<thead>
					<tr>
						<td>주문번호</td>
						<td>주문일자</td>
						<td>상품명</td>
						<td>결제금액</td>
						<td>상품 취소</td>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</section>
	</body>
</html>