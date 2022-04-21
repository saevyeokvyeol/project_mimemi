<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">

		<title>Document</title>

		<title>관리자 쿠폰조회  - 미미미</title>
		
		
	 <!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
		integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        
        <!-- jQuery -->        
        <script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
		
		<style>
           div{
                width: 1000px;
                margin: auto;
            }
            table th,td{
                text-align: center;
            }
            nav{
            	text-align: right;
            }
            
       </style>
		
		
		
		
		
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
								text += `<tr id="\${item.livecouId}">`;
								text += `<td>\${item.livecouId}</a></td>`;
								text += `<td>\${item.livecouName}</td>`;
								text += `<td>\${item.livecouPrice}</td>`;
								text += `<td>\${item.livecouPubdate.substr(0,10)}</td>`;
								//text += `<td>\${item.livecouUseperiod}</td>`;
								text += `<td>\${item.livecouPubdate.substr(0,8)}\${parseInt(item.livecouPubdate.substr(8,2)) + item.livecouUseperiod}</td>`;
								text +=
									`<td>
										<input type='button' value='수정LC' name='\${item.livecouId}' onclick="${path}/front?key=coupon&methodName=updateLiveCpForm&id=livecouId&name=livecouName&price=livecouPrice&pubDate=livecouPubdate&endDate=livecouUseperiod" />
									</td>`;
								text += "</tr>";
								
							});//each함수 끝
							
							//$("#couponTalbe thead tr:gt(0)").remove(); //0번지 보다 큰거는 지우고 뿌려주기
							$("#couponTalbe thead tr:eq(0)").after(text);
							
						}, // 성공 메소드
						error : function(err) {
							alert(err + " 에러 발생!");
						} // 에러 메소드
					}); // ajax 종료
				} // selectAllLiveCp() 메소드 종료
				//selectAllLiveCp();
				
				//수정하기 버튼 클릭시 그값을 가지고 폼으로 이동
				$(document).on("click", "input[value=수정LC]", function() {
					location.href = "${path}/front?key=coupon&methodName=updateLiveCpForm&id=" + $(this).parent().parent().attr('id');
					
				});
				
				
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
								text += `<tr id="\${item.rgcouId}">`;
								text += `<td>\${item.rgcouId}</a></td>`;
								text += `<td>\${item.rgcouName}</td>`;
								text += `<td>\${item.rgcouPrice}</td>`;
								text += `<td>\${item.rgcouPubdate.substr(0,10)}</td>`;
								text += `<td>\${item.rgcouEnddate.substr(0,10)}</td>`;
								text +=`<td><input type='button' value='수정RC' name='\${item.rgcouId}' /></td>`;
								text += "</tr>";
								
							});//each함수 끝
							
							//$("#couponTalbe thead tr:gt(0)").remove(); //0번지 보다 큰거는 지우고 뿌려주기
							$("#couponTalbe thead tr:eq(0)").after(text);
							
						}, // 성공 메소드
						error : function(err) {
							alert(err + " 에러 발생!");
						} // 에러 메소드
					}); // ajax 종료
				} // selectAllRgCp() 메소드 종료
				//selectAllRgCp();
				
				//수정하기 버튼 클릭시 그값을 가지고 폼으로 이동
				$(document).on("click", "input[value=수정RC]", function() {
					location.href = "${path}/front?key=coupon&methodName=updateRgCpForm&id=" + $(this).parent().parent().attr('id');
					
				});
				
				$("#live_btn").click(function() {
					location.href = '${path}/manager/cou_Insert_Live.jsp';
				})
				
				$("#rg_btn").click(function() {
					location.href = '${path}/manager/cou_Insert_Regular.jsp';
				})
				
			}); //ready 끝
			
			
			
		</script>
		
	</head>
	<body>
		
		<div class="container">
        	<div class="">
				<h3>쿠폰조회 </h3>
			</div>
				
				<p>
				
				<table class="table" id="couponTalbe">
					<thead class="thead-dark">
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
				<hr>
			</div>
			
			
			<div style="text-align: right;">
					<a href="#" id="live_btn" class="btn btn-outline-dark shadow-none">실시간쿠폰등록</a>
					<a href="#" id="rg_btn" class="btn btn-outline-dark shadow-none">정기쿠폰등록</a>
			</div>
				<p>
				
			
		
	</body>
	<jsp:include page="../common/footer.jsp"/>
</html>