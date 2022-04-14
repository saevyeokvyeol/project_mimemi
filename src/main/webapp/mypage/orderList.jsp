<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>orderList</title>
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		
		<style type="text/css">
			section {width: 1200px; margin: auto;}
			table {width: 100%;}
			td {padding: 30px;}
			a {color: black;}
		</style>
	</head>
	<body>
		<section>
			<h1>주문/배송 조회</h1>
			<table class="table">
				<thead class="table-secondary">
					<tr>
						<td>주문번호</td>
						<td>주문일자</td>
						<td>상품명</td>
						<td>결제금액</td>
						<td>상품 취소</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><a href="#">00000001</a></td>
						<td>2022.04.14</td>
						<td>맛있는 한식 외 1개</td>
						<td>11,212</td>
						<td><button type="button" class="btn btn-outline-danger btn-sm shadow-none">주문 취소</button></td>
					</tr>
					<tr>
						<td><a href="#">00000001</a></td>
						<td>2022.04.14</td>
						<td>맛있는 한식 외 1개</td>
						<td>11,212</td>
						<td><button type="button" class="btn btn-outline-danger btn-sm shadow-none">주문 취소</button></td>
					</tr>
				</tbody>
			</table>
		</section>
	</body>
</html>