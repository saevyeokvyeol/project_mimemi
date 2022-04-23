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
			.order-view {width: 1200px; margin: auto; padding: 50px 0;}
			.order-view .orderForm-cartTable {margin: 30px 0 70px;}
			.order-view .orderForm-cartTable th,
			.order-view .orderForm-cartTable td {text-align: center;}
			.order-view .orderForm-cartTable td:first-child {text-align: left;}
			.order-view .orderForm-cartTable h5 {text-align: right;}
			.order-view .orderForm-cartTable img {width: 100px; border-radius: 5px; margin: 0 20px;}
			.order-view .order-table {width: 900px; caption-side: top; margin: auto;}
			form > table td:nth-child(1) {width: 170px; padding: 30px;}
			#oldAddrBox {padding: 5px 0;}
			#oldAddrBox > * {vertical-align: middle;}
			#oldAddrBox > select {display:inline; width: 50%;}
			td {vertical-align: middle;}
			.card-pay {width: 75px; margin-top: 7px; display: inline;}
			.btn-box {padding: 30px 0 0; text-align: center;}
			#point {margin-bottom: 10px;}
			#sample6_postcode {display: inline; width: 83%;}
			#sample6_detailAddress, #sample6_extraAddress {display: inline; width: 49.7%; margin-top: 7px;}
			#zipcode-btn {margin: 0 0 7px 7px;}
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
		<!-- 주소 관련 함수 -->
		<script type="text/javascript">
			$(function() {
				// 배송지 라디오 박스를 확인해 주소 뿌려주기
				function addrRadioCheck() {
					if($("input[name=addrNum]:checked").val() == 'oldAddr'){
						$.ajax({
							url: "${path}/ajax",
							type: "post",
							dataType: "json",
							data: {key: "addr", methodName: "selectByUserId"},
							success: function(result) {
								let text = "";
								$("select[name=oldAddrList] option:gt(0)").remove();
								if(JSON.stringify(result) == "[]"){
									text = `<option value="0">최근 배송지가 없습니다</option>`;
								} else {
									$.each(result, function(index, item) {
										text += `<option value="\${item.addrId}">\${item.addrAddr}</option>`;
									})
								}
								$("input[name=zipcode]").val("");
								$("input[name=addrAddr]").val("");
								$("input[name=addrDetailAddr]").val("");
								$("input[name=addrRefAddr]").val("");
								$("input[name=receiverName]").val("");
								$("input[name=receiverPhone]").val("");
								$("input[name=addrId]").val("0");
								$("select[name=oldAddrList]").append(text);
								$("select[name=oldAddrList]").removeAttr("disabled");
							}, // 성공 메소드
							error : function(err) {
								alert(err + "\n배송지 정보를 불러올 수 없습니다.");
							} // 에러 메소드
						}) // ajax 종료
					} else if($("input[name=addrNum]:checked").val() == 'newAddr'){
						$("input[name=zipcode]").val("");
						$("input[name=addrAddr]").val("");
						$("input[name=addrDetailAddr]").val("");
						$("input[name=addrRefAddr]").val("");
						$("input[name=receiverName]").val("");
						$("input[name=receiverPhone]").val("");
						$("input[name=addrId]").val("0");
					} else {
						$.ajax({
							url: "${path}/ajax",
							type: "post",
							dataType: "json",
							data: {key: "addr", methodName: "selectByAddrName"},
							success: function(result) {
								$.each(result, function(index, item) {
									$("input[name=zipcode]").val(`\${item.zipcode}`);
									$("input[name=addrAddr]").val(`\${item.addrAddr}`);
									$("input[name=addrDetailAddr]").val(`\${item.addrDetailAddr}`);
									$("input[name=addrRefAddr]").val(`\${item.addrRefAddr}`);
									$("input[name=receiverName]").val(`\${item.receiverName}`);
									$("input[name=receiverPhone]").val(`\${item.receiverPhone}`);
									$("input[name=addrId]").val(`\${item.addrId}`);
								})
							}, // 성공 메소드
							error : function(err) {
								alert(err + "\n주소를 불러올 수 없습니다.");
							} // 에러 메소드
						}) // ajax 종료
					}
				} // 배송지 라디오 박스 확인 종료
				
				// 셀렉트 박스로 주소 선택
				$("select[name=oldAddrList]").change(function() {
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType: "json",
						data: {key: "addr", methodName: "selectByAddrId", addrId: $(this).val()},
						success: function(result) {
							$.each(result, function(index, item) {
								$("input[name=zipcode]").val(`\${item.zipcode}`);
								$("input[name=addrAddr]").val(`\${item.addrAddr}`);
								$("input[name=addrDetailAddr]").val(`\${item.addrDetailAddr}`);
								$("input[name=addrRefAddr]").val(`\${item.addrRefAddr}`);
								$("input[name=receiverName]").val(`\${item.receiverName}`);
								$("input[name=receiverPhone]").val(`\${item.receiverPhone}`);
								$("input[name=addrId]").val(`\${item.addrId}`);
							})
						}, // 성공 메소드
						error : function(err) {
							alert(err + "\n주소를 불러올 수 없습니다.");
						} // 에러 메소드
					}) // ajax 종료
				})
				
				// 배송지 라디오 버튼 누르면 메소드 자동 호출
				$("input[name=addrNum]").click(function() {
					addrRadioCheck();
				})
				
				// 주소 부분을 누르면 자동으로 우편번호 작성
				$("input[readonly=readonly]").click(function() {
					sample6_execDaumPostcode();
				})
				
				addrRadioCheck();
			})
		</script>
		<!-- 쿠폰 및 적립금 관련 함수 -->
		<script type="text/javascript">
			$(function() {
				// 사용자별 쿠폰 조회
				function selectCpByUserId() {
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType: "json",
						data: {key: "coupon", methodName: "selectCpByUserId"},
						success: function(result) {
							let text = "";
							let count = 0;
							if (JSON.stringify(result) == "[]") {
								text = `<option>사용가능한 쿠폰이 없습니다</option>`;
								$("#couponList").append(text);
							} else {
								$.each(result, function(index, item) {
									if(item.usercouUsable == "N"){
										if(item.livecouId == ""){
											text = `<option value="\${item.userCouId}" price="" class="\${item.rgcouId}"></option>`;
										} else {
											text = `<option value="\${item.userCouId}" price="" class="\${item.livecouId}"></option>`;
										}
										
										count++;
										
										$("#couponList").append(text);
										
										if(item.livecouId == ""){
											selectCouByCouId(item.rgcouId);
										} else {
											selectCouByCouId(item.livecouId);
										}
									}
								})
							}
							if(count == 0){
								text += '<option value="0">사용 가능한 쿠폰이 없습니다.</option>';
							}
						}, // 성공 메소드
						error : function(err) {
							alert(err + "\n쿠폰을 불러올 수 없습니다.");
						} // 에러 메소드
					}) // ajax 종료
				}
				
				// 쿠폰 아이디로 쿠폰 정보 가져오기
				function selectCouByCouId(CouId) {
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType: "json",
						data: {key: "coupon", methodName: "selectCouByCouId", CouId: CouId},
						success: function(result) {
							$.each(result, function(index, item) {
								if(item.rgcouName == undefined) {
									$("." + CouId).text(`\${item.livecouName}`);
									$("." + CouId).attr("price", item.livecouPrice)
								} else {
									$("." + CouId).text(`\${item.rgcouName}`);
									$("." + CouId).attr("price", item.rgcouPrice)
								}
							})
						}, // 성공 메소드
						error : function(err) {
							alert(err + "\n쿠폰 상세 정보를 불러올 수 없습니다.");
						} // 에러 메소드
					})
				}
				
				$("#couponList").change(function() {
					calDiscount();
				})
				
				$("input[name=payPoint]").keyup(function() {
					if($(this).val() > ${loginUser.userPoint}){
						alert("소지한 적립금 금액을 초과했습니다.");
						$(this).val(${loginUser.userPoint});
					}
					calDiscount();
				})
				
				function calDiscount() {
					couVal = $("#couponList").val();
					
					let couponPrice = 0
					if(couVal != 0){
						couponPrice = parseInt($("#couponList option[value=" + couVal + "]").attr("price"));
					}
					let pointPrice = 0;
					if($("input[name=payPoint]").val() != ""){
						pointPrice = $("input[name=payPoint]").val();
					}
					console.log(couponPrice)
					
					console.log(pointPrice)
					let discountPrice = parseInt(couponPrice) + parseInt(pointPrice);

					$("#discount").text(discountPrice)
				}
				
				selectCpByUserId();
			})
		</script>
		<!-- 주문/결제 관련 함수 -->
		<script type="text/javascript">
			$(function() {
				
				// 금액 합계
				function calTotalPrice() {
					let totalPrice = 0;
					$(".orderForm-cartTable > tbody").children().each(function() {
						totalPrice += parseInt($(this).children(".goodsPrice").text());
					})
					$("#totalPrice > h5").text("₩" + totalPrice);
					$("input[name=totalPrice]").val(totalPrice);
				} // calTotalPrice() 종료
				
				// 결제 방법 선택
				$(".selectPayMethod").click(function() {
					let methodCode = "";
					if($(this).attr("id") == "C"){
						methodCode = "C";
					} else if ($(this).attr("id") == "S"){
						methodCode = "S";
					} else {
						methodCode = "M";
					}
					$("input[name=payMethod]").val(methodCode);
				}) // 결제 방법 선택 종료
				
				calTotalPrice();
			}) // jQuery 종료
		</script>
		<!-- 유효성 검사 관련 함수 -->
		<script type="text/javascript">
			$(function() {
				$("#orderForm").submit(function() {
					if($("input[name=addrId]").val() == 0){
						if($("input[name=receiverName]").val() == ""){
							alert("상품 수령자 이름을 입력해주세요.");
							$("input[name=receiverName]").focus();
							return false;
						}
						if($("input[name=receiverPhone]").val() == ""){
							alert("상품 수령자 연락처를 입력해주세요.");
							$("input[name=receiverPhone]").focus();
							return false;
						}
						if($("input[name=zipcode]").val() == ""){
							alert("상품을 받으실 주소를 입력해주세요.");
							return false;
						}
					} // 주소 확인 종료
					
					if($("input[name=payMethod]").val() == ""){
						alert("결제 방법을 선택해주세요");
						return false;
					} else {
						if($("input[name=payMethod]").val() == "C"){
							if($("input[id=cardNum1]").val() == ""){
								alert("카드 번호를 입력해주세요");
								return false;
							} else if($("input[id=cardNum2]").val() == ""){
								alert("카드 번호를 입력해주세요");
								return false;
							} else if($("input[id=cardNum3]").val() == ""){
								alert("카드 번호를 입력해주세요");
								return false;
							} else if($("input[id=cardNum4]").val() == ""){
								alert("카드 번호를 입력해주세요");
								return false;
							}
						} else if ($("input[name=payMethod]").val() == "S"){
							if($("input[id=bankName]").val() == ""){
								alert("입금하실 은행명을 입력해주세요");
								return false;
							} else if($("input[id=bankNum]").val() == ""){
								alert("계좌 번호를 입력해주세요");
								return false;
							}
						}
					}
					
					return true;
				})
			})
		</script>
	</head>
	<body>
		<section class="order-view">
			<h1>주문/결제</h1>
			<div>
				<table class="table table-border orderForm-cartTable">
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
									<td><img alt="" src="${cart.goods.goodsThumbnail}">${cart.goods.goodsName}</td>
									<td>
										<c:choose>
											<c:when test="${cart.cartWeekday == 'T'}">
												<c:set var="days" value="3"/>
												주 3회
											</c:when>
											<c:otherwise>
												<c:set var="days" value="5"/>
												주 5회
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${cart.cartPeriod == '1W'}">
												<c:set var="period" value="1"/>
												1주
											</c:when>
											<c:when test="${cart.cartPeriod == '2W'}">
												<c:set var="period" value="2"/>
												2주
											</c:when>
											<c:when test="${cart.cartPeriod == '4W'}">
												<c:set var="period" value="4"/>
												4주
											</c:when>
											<c:otherwise>
												<c:set var="period" value="8"/>
												8주
											</c:otherwise>
										</c:choose>
									</td>
									<td>${cart.cartQty}</td>
									<td><c:out value="${fn:substring(cart.cartStart, 0, 10)}" /></td>
									<td>${cart.goodsPrice}</td>
									<td class="goodsPrice">${cart.cartQty * cart.goodsPrice * days * period}</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="7" id="totalPrice"><h5>₩</h5></td>
						</tr>
					</tfoot>
				</table>
				<form action="${path}/front?key=order&methodName=insertOrder" id="orderForm" method="post">
				<input type="hidden" name="totalPrice" value="">
					<table class="table order-table" >
						<caption><h4>배송 정보 입력</h4></caption>
						<tr>
							<td>배송지 선택</td>
							<td>
								<input class="form-check-input" type="radio" name="addrNum" checked="checked" value="happy01"> 주문 고객 정보와 동일
								
								<div id="oldAddrBox">
								<input class="form-check-input" type="radio" name="addrNum" id="oldAddr" value="oldAddr">
									<select name="oldAddrList" disabled="disabled" class="form-select">
										<option value="0">배송지 선택</option>
									</select>
								</div>
								<input class="form-check-input" type="radio" name="addrNum" id="newAddr" value="newAddr"> 새 배송지 입력
							</td>
						</tr>
						<tr>
							<td>받으시는 분</td>
							<td><input type="text" class="form-control" name="receiverName" id=""></td>
						</tr>
						<tr>
							<td>연락처</td>
							<td><input type="text" class="form-control" name="receiverPhone" id=""></td>
						</tr>
						<tr>
							<td>배송지 주소</td>
							<td>
								<input type="text" class="form-control" id="sample6_postcode" name="zipcode" readonly="readonly"><input type="button" value="우편번호" id="zipcode-btn" onclick="sample6_execDaumPostcode()" class="btn btn-outline-dark shadow-none">
								<input type="text" class="form-control" id="sample6_address" name="addrAddr" readonly="readonly">
								<input type="text" class="form-control" id="sample6_detailAddress" name="addrDetailAddr">
								<input type="text" class="form-control" id="sample6_extraAddress" name="addrRefAddr" readonly="readonly">
								<input type="hidden" name="addrId" value="">
							</td>
						</tr>
						<tr>
							<td>수령 방법</td>
							<td>
								<input class="form-check-input" type="radio" name="takeMethod" checked="checked" value="현관 앞에 놔주세요"> 현관 앞에 놔주세요<br>
								<input class="form-check-input" type="radio" name="takeMethod" value="경비실에 맡겨주세요"> 경비실에 맡겨주세요<br>
								<input class="form-check-input" type="radio" name="takeMethod" value=""> 배송 메세지에 쓸게요
							</td>
						</tr>
						<tr>
							<td>출입 비밀번호</td>
							<td><input type="text" class="form-control" name="enterPwd" id=""></td>
						</tr>
						<tr>
							<td>배송 요청 사항</td>
							<td><textarea name="orderMemo" class="form-control" id=""></textarea></td>
						</tr>
					</table>
					<table class="table order-table">
						<caption><h4>쿠폰 및 적립금 사용</h4></caption>
						<tr>
							<td>쿠폰</td>
							<td>
								<select name="usercouId" class="form-select" id="couponList">
									<option value="0">쿠폰 목록</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>적립금</td>
							<td>
								<div id="point">현재 적립금: ${loginUser.userPoint}원</div>
								<input type="number" class="form-control" name="payPoint" id="">
							</td>
						</tr>
						<tr>
							<td>총 할인 금액</td>
							<td>
								<span id="discount">0</span>원
							</td>
						</tr>
					</table>
					<table class="table order-table">
						<caption><h4>결제 수단</h4></caption>
						<tr>
							<td>
								<div class="accordion" id="accordionExample">
									<div class="accordion-item">
										<h2 class="accordion-header">
											<button class="accordion-button collapsed shadow-none selectPayMethod" id="C" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
												카드 결제
											</button>
										</h2>
										<div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
											<div class="accordion-body">
												<select class="form-select">
													<option>국민카드</option>
													<option>현대카드</option>
													<option>삼성카드</option>
													<option>롯데카드</option>
													<option>비씨카드</option>
													<option>신한카드</option>
													<option>우리카드</option>
													<option>하나카드</option>
													<option>NH농협카드</option>
													<option>한국씨티은행</option>
													<input type="text" class="card-pay form-control" id="cardNum1"> - <input type="text" class="card-pay form-control" id="cardNum2"> - <input type="text" class="card-pay form-control" id="cardNum3"> - <input type="text" class="card-pay form-control" id="cardNum4">
												</select>
											</div>
										</div>
									</div>
									<div class="accordion-item">
										<h2 class="accordion-header">
											<button class="accordion-button collapsed shadow-none selectPayMethod" id="S" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
												실시간 계좌이체
											</button>
										</h2>
										<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
											<div class="accordion-body">
												<input type="text" class="transfer form-control" id="bankName">
												<input type="text" class="transfer form-control" id="bankNum">
											</div>
										</div>
									</div>
									<div class="accordion-item">
										<h2 class="accordion-header">
											<button class="accordion-button collapsed shadow-none selectPayMethod" id="M" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
												가상계좌
											</button>
										</h2>
										<div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
											<div class="accordion-body">
												<select class="form-select">
													<option value="1">신한은행 986-156-361865</option>
													<option value="2">우리은행 5641-185-123456</option>
													<option value="3">국민은행 836-202204-1808</option>
												</select>
											</div>
										</div>
									</div>
								</div>
							</td>
							<input type="hidden" name="payMethod" value="">
							<input type="hidden" name="mode" value="">
						</tr>
					</table>
					<div class="btn-box">
						<input type="button" class="btn btn-lg btn-outline-dark" value="주문 취소">
						<input type="submit" class="btn btn-lg btn-outline-dark" value="주문하기">
					</div>
				</form>
			</div>
		</section>
	</body>
<jsp:include page="../common/footer.jsp"/>
</html>