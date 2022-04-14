<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문/결제 :: 미미미</title>
		<style type="text/css">
			section {width: 1200px; margin: auto;}
			table {width: 100%; caption-side: top;}
			form > table td:nth-child(1) {width: 200px; padding: 30px;}
		</style>
	</head>
	<body>
		<jsp:include page="../common/header.jsp"/>
		<section>
			<h1>주문/결제</h1>
			<div>
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
							<td>주3회</td>
							<td>1</td>
							<td>날짜</td>
							<td>가격</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>상품명</td>
							<td>주3회</td>
							<td>1</td>
							<td>날짜</td>
							<td>가격</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="6">총 가격 \60,000</td>
						</tr>
					</tfoot>
				</table>
				<form action="">
					<table class="table">
						<caption>배송 정보 입력</caption>
						<tr>
							<td>배송지 선택</td>
							<td>
								<input type="radio" name="take" id=""> 주문 고객 정보와 동일<br>
								<input type="radio" name="take" id="">
								<select name="address" id="">
									<option value="">배송지 목록</option>
									<option value="">회사</option>
								</select><br>
								<input type="radio" name="take" id=""> 새 배송지 입력
							</td>
						</tr>
						<tr>
							<td>받으시는 분</td>
							<td><input type="text" name="" id=""></td>
						</tr>
						<tr>
							<td>연락처</td>
							<td><input type="text" name="" id=""></td>
						</tr>
						<tr>
							<td>배송지 주소</td>
							<td>
								<input type="text" name="" id=""><input type="button" value="우편번호"><p>
								<input type="text" name="" id=""><input type="text" name="" id="">
							</td>
						</tr>
						<tr>
							<td>배송장소</td>
							<td><input type="text" name="" id=""></td>
						</tr>
						<tr>
							<td>수령 방법</td>
							<td>
								<input type="radio" name="take" id=""> 현관 앞에 놔주세요<br>
								<input type="radio" name="take" id=""> 경비실에 맡겨주세요<br>
								<input type="radio" name="take" id=""> 배송 메세지에 쓸게요
							</td>
						</tr>
						<tr>
							<td>출입 비밀번호</td>
							<td><input type="text" name="" id=""></td>
						</tr>
						<tr>
							<td>배송 요청 사항</td>
							<td><textarea name="" id="" cols="100" rows="10"></textarea></td>
						</tr>
					</table>
					<table class="table">
						<caption>쿠폰 및 적립금 사용</caption>
						<tr>
							<td>쿠폰</td>
							<td>
								<select name="coupon" id="">
									<option value="">쿠폰 목록</option>
									<option value="">사용 가능한 쿠폰이 없습니다.</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>적립금</td>
							<td><input type="text" name="" id=""></td>
						</tr>
					</table>
					<table class="table">
						<caption>결제 수단</caption>
						<tr>
							<td>쿠폰</td>
							<td></td>
						</tr>
						<tr>
							<td>적립금</td>
							<td></td>
						</tr>
					</table>
					<input type="button" value="주문 취소">
					<input type="submit" value="주문하기">
				</form>
			</div>
		</div>
	</body>
</html>