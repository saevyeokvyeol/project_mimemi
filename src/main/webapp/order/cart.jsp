<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
		
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		
	</head>
	<body>
		<section>
			<form action="">
        <input type="hidden" name="" id="">
				<h1>장바구니</h1>
				<table class="table">
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
							<td colspan="6">총 가격 \60,000</td>
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