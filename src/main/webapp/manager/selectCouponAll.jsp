<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 쿠폰조회  - 미미미</title>
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
				
				selectAllLiveCp();
				selectAllRgCp();
				
				// LIVECOUPON 전체 검색
				function selectAllLiveCp(){
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType: "json",
						data: {key: "coupon", methodName: "selectAllLiveCp"},
						success: function(result) {
							
							let text = "";
							$.each(result, function(index, item) {
								text += "<tr>";
								text += `<td><a href='#'>\${item.livecouId}</a></td>`;
								text += `<td>\${item.livecouName}</td>`;
								text += `<td>\${item.livecouPrice}</td>`;
								text += `<td>\${item.livecouPubdate.substr(0,10)}</td>`;
								//text += `<td>\${item.livecouUseperiod}</td>`;
								text += `<td>\${item.livecouPubdate.substr(0,8)}\${parseInt(item.livecouPubdate.substr(8,2)) + item.livecouUseperiod}</td>`;
								text +=`<td><input type='button' value='수정하기' name='\${item.livecouId}'/></td>`;
								text += "</tr>";
								
							});//each함수 끝
							
							//$("#couponTalbe thead tr:gt(0)").remove(); //0번지 보다 큰거는 지우고 뿌려주기
							$("#couponTalbe thead tr:eq(0)").after(text);
							
						}, // 성공 메소드
						error : function(result) {
							alert(err + " 에러 발생!");
						} // 에러 메소드
					}); // ajax 종료
				} // selectAllLiveCp() 메소드 종료
				//selectAllLiveCp();
				
				// RGCOUPON 전체 검색
				function selectAllRgCp(){
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType: "json",
						data: {key: "coupon", methodName: "selectAllRgCp"},
						success: function(result) {
							
							let text = "";
							$.each(result, function(index, item) {
								text += "<tr>";
								text += `<td><a href='#'>\${item.rgcouId}</a></td>`;
								text += `<td>\${item.rgcouName}</td>`;
								text += `<td>\${item.rgcouPrice}</td>`;
								text += `<td>\${item.rgcouPubdate.substr(0,10)}</td>`;
								text += `<td>\${item.rgcouEnddate.substr(0,10)}</td>`;
								text +=`<td><input type='button' value='수정하기' name='\${item.rgcouId}'/></td>`;
								text += "</tr>";
								
							});//each함수 끝
							
							//$("#couponTalbe thead tr:gt(0)").remove(); //0번지 보다 큰거는 지우고 뿌려주기
							$("#couponTalbe thead tr:eq(0)").after(text);
							
						}, // 성공 메소드
						error : function(result) {
							alert(err + " 에러 발생!");
						} // 에러 메소드
					}); // ajax 종료
				} // selectAllRgCp() 메소드 종료
				//selectAllRgCp();
				
			}); //ready 끝
			
			
			
		</script>
		
	</head>
	<body>
		<section>
			<form action="">
        <input type="hidden" name="" id="">
				<h1>쿠폰조회 </h1>
				<div style="text-align: right;">
					<form name="sort" action="" method="post">
						<select name="keyField">
							<option value="0">--정렬선택--</option>
							<option value="couponId">쿠폰번호</option>
							<option value="couponName">쿠폰명</option>
						</select> 
					</form>
				</div>
				
				<p>
				
				<table class="table" id="couponTalbe">
					<thead>
						<tr>
							<th>쿠폰번호</th>
							<th>쿠폰명</th>
							<th>쿠폰금액</th>
							<th>쿠폰발행일</th>
							<th>쿠폰만료일</th>
							<th>수정하기</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>
					<tfoot>
						<tr>
							
						</tr>
					</tfoot>
					
				</table>
				
				<div style="text-align: right;">
					<input type="submit" onclick="location.href='couponInsert.jsp'" value="쿠폰등록">
				</div>
				
				<p>
				
				<div style="text-align: left;">
					<form name="search" action="" method="post">
						<select name="keyField">
							<option value="0">--검색조건--</option>
							<option value="couponId">쿠폰번호</option>
							<option value="couponName">쿠폰명</option>
						</select>
						 
						<input type="text" name="keyWord"/>
						<input type="button" value="검색" />  
					
					</form>
				</div>
				
			</form>
		</section>
	</body>
</html>