<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>장바구니 :: 미미미</title>
		<style type="text/css" src="../util/css/bootstrap.min.css"></style>
		<style type="text/css">
			div {width: 1200px; margin: auto;}
			table {width: 1200px;}
			th, td {border: 1px solid black;}
		</style>
		
		<script type="text/javascript" src="../util/js/jquery-3.6.0.min.js"></script>
		
		<script type="text/javascript" src="../util/js/bootstrap.min.js"></script>
		
		<script type="text/javascript" src="../util/jqGrid-4.7/js/jquery.jqGrid.js"></script>
		
		<script type="text/javascript">
		$(function () {
	        "use strict";
	        $("#grid").jqGrid({
	            colModel: [
	                { name: "firstName" },
	                { name: "lastName" }
	            ],
	            data: [
	                { id: 10, firstName: "Angela", lastName: "Merkel" },
	                { id: 20, firstName: "Vladimir", lastName: "Putin" },
	                { id: 30, firstName: "David", lastName: "Cameron" },
	                { id: 40, firstName: "Barack", lastName: "Obama" },
	                { id: 50, firstName: "François", lastName: "Hollande" }
	            ]
	        });
	    });
		</script>
	</head>
	<body>
		<div>
			<form action="">
				<h1>장바구니</h1>
				<table>
					<thead>
						<tr>
							<th><input type="checkbox"></th>
							<th>상품명</th>
							<th>배송기간</th>
							<th>수량</th>
							<th>첫배송일</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox"></td>
							<td>상품명</td>
							<td>
								<select name="" id="">
									<option value="3">주3회</option>
									<option value="5">주5회</option>
								</select> 
							</td>
							<td>
								<a href="#">-</a>
								<input type="text" name="amount" class="tb_amount" value="1" id="pro_amount">
								<a href="#">+</a>
							</td>
							<td><input type="date" name="" id=""></td>
							<td>가격</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="6">총 가격</td>
						</tr>
					</tfoot>
				</table>
				<a href="#">전체 삭제</a>
				<a href="#">선택 삭제</a>
				<a href="${path}/order/order.jsp">선택 상품 주문</a>
				<a href="${path}/order/order.jsp">전체 주문</a>
			</form>
		</div>
	</body>
</html>