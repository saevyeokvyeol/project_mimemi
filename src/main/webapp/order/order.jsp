<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문/결제 :: 미미미</title>
		<jsp:include page="../common/header.jsp"/>
		<style type="text/css">
			section {width: 1200px; margin: auto;}
			table {width: 100%; caption-side: top;}
			form > table td:nth-child(1) {width: 200px; padding: 30px;}
		</style>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			// 우편번호 API
		    function sample6_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수
		
		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    document.getElementById("sample6_extraAddress").value = extraAddr;
		                
		                } else {
		                    document.getElementById("sample6_extraAddress").value = '';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('sample6_postcode').value = data.zonecode;
		                document.getElementById("sample6_address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("sample6_detailAddress").focus();
		            }
		        }).open();
		    }
		</script>
		<script type="text/javascript">
			$(function() {
				function calTotalPrice() {
					let totalPrice = 0;
					$(".orderForm-cartTable > tbody").children().each(function() {
						totalPrice += parseInt($(this).children(".goodsPrice").text());
					})
					$("#totalPrice").text("₩" + totalPrice);
				} // calTotalPrice() 종료
				calTotalPrice();
			})
		</script>
	</head>
	<body>
		<section>
			<h1>주문/결제</h1>
			<div>
				<table class="orderForm-cartTable">
					<thead>
						<tr>
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
						<c:if test="${!empty cartList}">
							<c:forEach items="${cartList}" var="cart">
								<tr>
									<td>${cart.goodsId}</td>
									<td>
										<c:choose>
											<c:when test="${cart.cartWeekday == 'T'}">
												주 3회
											</c:when>
											<c:otherwise>
												주 5회
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${cart.cartPeriod == '1W'}">
												1주
											</c:when>
											<c:when test="${cart.cartPeriod == '2W'}">
												2주
											</c:when>
											<c:when test="${cart.cartPeriod == '4W'}">
												4주
											</c:when>
											<c:otherwise>
												8주
											</c:otherwise>
										</c:choose>
									</td>
									<td>${cart.cartQty}</td>
									<td><c:out value="${fn:substring(cart.cartStart, 0, 10)}" /></td>
									<td>${cart.cartQty}</td>
									<td class="goodsPrice">${cart.cartQty * cart.cartQty}</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="7" id="totalPrice"></td>
						</tr>
					</tfoot>
				</table>
				<form action="${path}/front?key=order&methodName=insertOrder" method="post">
					<table class="table">
						<caption>배송 정보 입력</caption>
						<tr>
							<td>배송지 선택</td>
							<td>
								<input class="form-check-input" type="radio" name="addrName" checked="checked" value="happy01"> 주문 고객 정보와 동일<br>
								<input class="form-check-input" type="radio" name="addrNum" id="oldAddr" value="oldAddr">
								<select name="addrId" class="form-select" id="">
									<option value="0">배송지 목록</option>
								</select><br>
								<input class="form-check-input" type="radio" name="addrNum" id="newAddr" value="newAddr"> 새 배송지 입력
							</td>
						</tr>
						<tr>
							<td>받으시는 분</td>
							<td><input type="text" class="form-control" class="form-control" class="form-control" name="receiverName" id=""></td>
						</tr>
						<tr>
							<td>연락처</td>
							<td><input type="text" class="form-control" class="form-control" class="form-control" name="receiverPhone" id=""></td>
						</tr>
						<tr>
							<td>배송지 주소</td>
							<td>
								<input type="text" class="form-control" class="form-control" class="form-control" id="sample6_postcode" name="zipcode"><input type="button" value="우편번호" onclick="sample6_execDaumPostcode()" class="btn btn-outline-dark"><p>
								<input type="text" class="form-control" class="form-control" class="form-control" id="sample6_address" name="addrAddr"><br>
								<input type="text" class="form-control" class="form-control" class="form-control" id="sample6_detailAddress" name="addrDetailAddr">
								<input type="text" class="form-control" class="form-control" class="form-control" id="sample6_extraAddress" name="addrName">
							</td>
						</tr>
						<tr>
							<td>수령 방법</td>
							<td>
								<input class="form-check-input" type="radio" name="takeMethod" id=""> 현관 앞에 놔주세요<br>
								<input class="form-check-input" type="radio" name="takeMethod" id=""> 경비실에 맡겨주세요<br>
								<input class="form-check-input" type="radio" name="takeMethod" id=""> 배송 메세지에 쓸게요
							</td>
						</tr>
						<tr>
							<td>출입 비밀번호</td>
							<td><input type="text" class="form-control" class="form-control" class="form-control" name="enterPwd" id=""></td>
						</tr>
						<tr>
							<td>배송 요청 사항</td>
							<td><textarea name="orderMemo" id="" cols="100" rows="10"></textarea></td>
						</tr>
					</table>
					<table class="table">
						<caption>쿠폰 및 적립금 사용</caption>
						<tr>
							<td>쿠폰</td>
							<td>
								<select name="usercouId" class="form-select" id="">
									<option value="0">쿠폰 목록</option>
									<option value="0">사용 가능한 쿠폰이 없습니다.</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>적립금</td>
							<td><input type="text" class="form-control" class="form-control" class="form-control" name="payPoint" id=""></td>
						</tr>
					</table>
					<table class="table">
						<caption>결제 수단</caption>
						<tr>
							<td>
								<div class="accordion" id="accordionExample">
									<div class="accordion-item">
										<h2 class="accordion-header" id="headingOne">
											<button class="accordion-button shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
												카드 결제
											</button>
										</h2>
										<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
											<div class="accordion-body">
												<strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
											</div>
										</div>
									</div>
									<div class="accordion-item">
										<h2 class="accordion-header" id="headingTwo">
											<button class="accordion-button collapsed shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
												실시간 계좌이체
											</button>
										</h2>
										<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
											<div class="accordion-body">
												<strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
											</div>
										</div>
									</div>
									<div class="accordion-item">
										<h2 class="accordion-header" id="headingThree">
											<button class="accordion-button collapsed shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
												가상계좌
											</button>
										</h2>
										<div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
											<div class="accordion-body">
												<strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
											</div>
										</div>
									</div>
								</div>
							</td>
							<input type="hidden" name="payMethod" value="">
						</tr>
					</table>
					<input type="button" value="주문 취소">
					<input type="submit" value="주문하기">
				</form>
			</div>
		</section>
	</body>
</html>