<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 사용자쿠폰전체조회  - 미미미</title>
		<jsp:include page="../common/header.jsp"/>
		<style type="text/css">
			section {width: 1200px; margin: auto;}
			table {width: 1200px;}
			th, td {border: 1px solid black;}
			table tr:first-child {border: 1px solid black;}
		</style>
		
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
		
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		
		<script type="text/javascript">
			$(function() {
				
				$(document).on("change", "#select_usercouUsable", function() {
					//var idValue = $(this).parent().siblings().eq(0).text();
					//var idValue = $(this).val();
					//alert(idValue);
					
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType : "text",
						data: {key: "coupon", methodName: "updateCpState", userCouId: $(this).parent().siblings().eq(0).text(), usercouUsable: $(this).val()},
						success: function(result) {
							alert("수정되었습니다.");
						},
						error: function(err) {
							alert(err + "\n에러발생");
						}
					}) // ajax 종료	
					
				})//onchang 끝
					
				
			}); //ready 끝
			
			
			
		</script>
		
	</head>
	<body>
		<section>
			<form action="">
        <input type="hidden" name="" id="">
				<h1>사용자쿠폰 전체조회 </h1>
				<div style="text-align: right;">
					<form name="sort">
						<select name="userCoupon_sort" id="userCoupon_sort">
							<option value="0">--정렬순--</option>
							<option value="UserID">아이디</option>
							<option value="PubDate">발행순</option>
							<option value="EndDate">만료순</option>
						</select> 
					</form>
				</div>
				
				<p>
				
				<table class="table" id="couponTalbe">
					<thead>
						<tr>
							<th>사용자쿠폰ID</th>
							<th>사용자ID</th>
							<th>쿠폰번호</th>
							<th>쿠폰사용여부</th>
							<th>쿠폰발행일</th>
							<th>쿠폰만료일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userCouponList}" var="uc" varStatus="state">
							<tr id="${uc.userCouId}">
								<td>${uc.userCouId}</td>
								<td>${uc.userId}</td>
								<td class="couponTpye">
									<c:choose>
										<c:when test="${not empty uc.livecouId}">
											${uc.livecouId}
										</c:when>
										<c:otherwise>
											${uc.rgcouId}
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<select name="select_usercouUsable" id="select_usercouUsable">
										<c:choose>
										<c:when test="${uc.usercouUsable == 'U'}">
											<option name="usercouUsable" value="U">${uc.usercouUsable}</option>
											<option name="usercouUsable" value="N">N</option>
										</c:when>
										<c:otherwise>
											<option name="usercouUsable" value="N">${uc.usercouUsable}</option>
											<option name="usercouUsable" value="U">U</option> 
										</c:otherwise>
										</c:choose>	        
        							</select>
        						</td>
								<td>${uc.usercouPubdate}</td>
								<td>${uc.usercouEnddate}</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							
						</tr>
					</tfoot>
					
				</table>
				
			</form>
		</section>
	</body>
</html>