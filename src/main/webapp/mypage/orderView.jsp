<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		
		<style type="text/css">
			section {width: 1200px; margin: auto;}
			table {width: 100%; caption-side: top;}
			.order_no {padding: 30px; border: 1px solid black; text-align: center;}
			.order_no > span {padding-right: 350px;}
			td {padding: 10px;}
			tfoot {text-align: right;}
			.aa td:nth-child(1) {width: 180px;}
			.aa td {padding: 10px 0 10px 30px;}
		</style>
	</head>
	<body>
		<section>
			<h1>주문/배송 조회</h1>
			<div class="order_no">
				주문 번호 <span>00000001</span>
				주문 일자 <span>00000001</span>
				<button class="btn btn-secondary btn-sm shadow-none">주문 취소</button>
			</div>
			<table class="table aa">
				<thead class="table-secondary">
					<tr>
						<th></th>
						<th>상품명</th>
						<th>배송일 변경</th>
						<th>첫 배송일</th>
						<th>수량</th>
						<th>금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>맛있는 한식</td>
						<td><button class="btn btn-secondary btn-sm shadow-none">배송일 변경</button></td>
						<td>2022.04.16</td>
						<td>1</td>
						<td>6,000</td>
					</tr>
					<tr>
						<td>2</td>
						<td>맛있는 한식</td>
						<td><button class="btn btn-secondary btn-sm shadow-none">배송일 변경</button></td>
						<td>2022.04.16</td>
						<td>1</td>
						<td>6,000</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="6">총 결제 금액 12,000</td>
					</tr>
				</tfoot>
			</table>
			<table class="table aa">
				<caption>결제 정보</caption>
				<tbody>
					<tr>
						<td>결제 구분</td>
						<td>카드 결제</td>
					</tr>
					<tr>
						<td>쿠폰 할인</td>
						<td>0</td>
					</tr>
					<tr>
						<td>적립금 사용액</td>
						<td>0</td>
					</tr>
					<tr>
						<td>결제 금액</td>
						<td>114,000원</td>
					</tr>
				</tbody>
			</table>
			<table class="table aa">
				<caption>배송지 정보</caption>
				<tbody>
					<tr>
						<td>받으시는 분</td>
						<td>김유다</td>
					</tr>
					<tr>
						<td>연락처</td>
						<td>01044445555</td>
					</tr>
					<tr>
						<td>배송지 주소</td>
						<td>어디 주소를 적지</td>
					</tr>
					<tr>
						<td>수령 방법</td>
						<td>현관 앞에 놔주세요</td>
					</tr>
					<tr>
						<td>출입 비밀번호</td>
						<td>없음</td>
					</tr>
					<tr>
						<td>배송 요청 사항</td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<button class="btn btn-secondary btn-lg shadow-none">돌아가기</button>
		</section>
	</body>
</html>