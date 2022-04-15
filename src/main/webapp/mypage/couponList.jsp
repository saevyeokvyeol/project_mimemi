<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지 쿠폰조회  - 미미미</title>
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
				
				// USERCOUPON 전체 검색
				function selectAllLiveCp(){
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType: "json",
						data: {key: "coupon", methodName: "selectAllLiveCp", userId: "happy01"},
						success: function(result) {
							
							let text = "";
							$.each(result, function(index, item) {
								text += "<tr>";
								text += `<td><a href='#'>\${item.livecouId}</a></td>`;
								text += `<td>\${item.livecouName}</td>`;
								text += `<td>\${item.livecouPrice}</td>`;
								text += `<td>\${item.livecouPubdate}</td>`;
								text += `<td>\${item.livecouUseperiod}</td>`;
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
				
				
				
			}); //ready 끝
				
		</script>
		
	</head>
	<body>
		<section>
			<form action="">
        <input type="hidden" name="" id="">
				<h1>\${userId}쿠폰조회 </h1>
				
				<table class="table">
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
						<tr>
							<td>A01</td>
							<td>생일쿠폰</td>
							<td>사용X</td>
							<td>2022-04-14</td>
							<td>2022-05-14</td>
						</tr>
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