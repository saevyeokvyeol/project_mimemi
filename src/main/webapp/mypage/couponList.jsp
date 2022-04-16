<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지 쿠폰조회  - 미미미</title>
		<jsp:include page="../common/header.jsp"/>
		<style type="text/css">
			section {width: 1200px; margin: auto;}
			table {width: 1200px;}
			th, td {border: 1px solid black;}
		</style>
		
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
		
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		
		<script type="text/javascript">
			$(function() {
				//alert(1);
				// USERCOUPON id로 전체 검색
				function selectCpByUserId(){
					//alert(1);
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType: "json",
						data: {key: "coupon", methodName: "selectCpByUserId", userId: "happy01"},
						success: function(result) {
							//alert(result);
								let text = "";
								$.each(result, function(index, item) {
									
									if(item.livecouId==null || item.livecouId==""){
										text += "<tr>";
										text += `<td>\${item.userCouId}</td>`;
										text += `<td>\${item.rgcouId}</td>`;
										text += `<td>\${item.usercouUsable}</td>`;
										text += `<td>\${item.usercouPubdate.substr(0,10)}</td>`;
										text += `<td>\${item.usercouEnddate.substr(0,10)}</td>`;
										text += "</tr>"; 
									}else if(item.rgcouId==null || item.rgcouId==""){
										text += "<tr>";
										text += `<td>\${item.userCouId}</td>`;
										text += `<td>\${item.livecouId}</td>`;
										text += `<td>\${item.usercouUsable}</td>`;
										text += `<td>\${item.usercouPubdate.substr(0,10)}</td>`;
										text += `<td>\${item.usercouEnddate.substr(0,10)}</td>`;
										text += "</tr>"; 
									}
									
								});
								$("#couponTalbe thead tr:eq(0)").after(text);
							
							
							//$("#couponTalbe thead tr:gt(0)").remove(); //0번지 보다 큰거는 지우고 뿌려주기
							//$("#couponTalbe thead tr:eq(0)").after(text);
							
						}, // 성공 메소드
						error : function(result) {
							alert(err + " 에러 발생!");
						} // 에러 메소드
					}); // ajax 종료
				} // selectCpByUserId() 메소드 종료
				selectCpByUserId();
				
				
				
			}); //ready 끝
				
		</script>
		
	</head>
	<body>
		<section>
			<form action="">
        <input type="hidden" name="" id="">
				<h1>쿠폰조회 </h1>
				
				<table class="table" id="couponTalbe">
					<thead>
						<tr>
							<th>쿠폰번호</th>
							<th>쿠폰명</th>
							<th>쿠폰사용여부</th>
							<th>쿠폰발행일</th>
							<th>쿠폰만료일</th>
	
						</tr>
					</thead>
					<tbody>
						
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