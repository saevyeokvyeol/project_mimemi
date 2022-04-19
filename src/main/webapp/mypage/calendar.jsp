<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>배송 달력 :: 미미미</title>
		<jsp:include page="../common/header.jsp"/>
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		
		<style type="text/css">
			section {width: 1200px; margin: auto;}
			#deliCalendar {width: 100%; table-layout: fixed;}
			#deliCalendar th {text-align: center;}
			#deliCalendar td {width: 190px; height: 145px; padding: 10px 15px;}
			.null-date {background-color: #f5f5f5;}
			#deliCalendar > caption {text-align: center; margin: 0 0 30px;}
			h3 {display: inline;}
			#prevMonth, #nextMonth{margin: 0 0 20px;}
			
			#selectBox-div {text-align: right;}
			
			li {list-style: none; max-width: 240px;}
			ul > li:first-child {text-align: right;}
			tfoot {text-align: right;}
		</style>
		<!-- 캘린더 만들기 -->
		<script type="text/javascript">
			$(function() {
				// 날짜, 연도, 월 구하기
				let today = new Date();
				let year = today.getFullYear();
				let month = today.getMonth();
				
				function printCalendar() {
					// 월 시작요일 구하기
					startDay = new Date(year, month, 1).getDay();
					
					// 월 종료일 구하기
					endDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
					endDay = endDays[month];
					
					week = 5;
					
					date = 1; // 1일부터 종료일까지 출력할 변수
					start = 0; // 첫 행 시작점 변수

					// 연월 찍기
					let caption = '<button type="button" class="btn btn-link btn-lg shadow-none" id="prevMonth"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/></svg></button>';
					caption += `<h3>\${year}년 \${month + 1}월</h3>`;
					caption += '<button type="button" class="btn btn-link btn-lg shadow-none" id="nextMonth"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/></svg></button>';
					$("#deliCalendar > caption").text("");
					$("#deliCalendar > caption").append(caption);
					
					let calendar = "";
					// 날짜 찍기
					for(i = 0; i < week; i++) { // tr
						if(i > 4) break;
						calendar += "<tr>";
						for(j = 0; j < 7; j++) { // td
							if(start < startDay) { // 시작일 이전
								if(j == 0 || j == 6){
									start++;
								} else {
									calendar += "<td class='null-date'></td>"
									start++;
								}
							} else if(date > endDay) { // 종료일 이후
								if(j == 0 || j == 6){
								} else {
									calendar += "<td class='null-date'></td>"
								}
							} else {
								if(j == 0 || j == 6){
									date++;
								} else {
									paramDay = date;
									if (paramDay < 10) paramDay = paramDay.toString().padStart(2, '0') + ""
									calendar += `<td id=\${paramDay}><div class='deliCalendar-date'>` + date + "</div></td>";
									date++;
								}
							}
						}
						calendar += "</tr>";
					}
					$("#deliCalendar > tbody").children().remove();
					$("#deliCalendar > tbody").append(calendar);
				}
				
				// 이전 달로 이동
				$(document).on("click", "#prevMonth", function() {
					if(month == 0){
						year -= 1;
						month = 11;
					} else {
						month -= 1;
					}
					printCalendar();
					printDeli();
				})
				
				// 다음 달로 이동
				$(document).on("click", "#nextMonth", function() {
					if(month == 11){
						year += 1;
						month = 0;
					} else {
						month += 1;
					}
					printCalendar();
					printDeli();
				})
				
				// 배송일 가져오기
				function printDeli() {
					let paramMonth = month + 1;
					if (paramMonth < 10) paramMonth = paramMonth.toString().padStart(2, '0') + ""
					let paramDay;
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType: "json",
						data: {key: "order", methodName: "selectMlyDeli", goodsId: "${param.goodsId}", date: "" + year + paramMonth},
						success: function(result) {
							$.each(result, function(index, item) {
								delidate = item.orderDeliDate.substr(8, 2);
								text = "<div class='deliMenu'>식단 준비 중</div>"
								
								$("#" + delidate).append(text);
								
							})
						}, // 성공 메소드
						error : function(err) {
							alert(err + "\n구매 내역을 불러올 수 없습니다.");
						} // 에러 메소드
					}) // ajax 종료
				}
				
				// 개인이 주문한 상품 내역 셀렉트 박스 안에 넣기
				function selectOrderGoods() {
					$.ajax({
						url: "${path}/ajax",
						type: "post",
						dataType: "json",
						data: {key: "goods", methodName: "selectOrderGoods"},
						success: function(result) {
							let text = "";
							$("#selectCalendar").children().remove();
							if(JSON.stringify(result) == "[]"){
								text = `<option value="0">구매하신 내역이 없습니다.</option>`;
							} else {
								$.each(result, function(index, item) {
									text += `<option value="\${item.goodsId}">\${item.goodsName}</option>`;
								})
							}
							$("#selectCalendar").append(text);
							$("#selectCalendar").val("${param.goodsId}");
						}, // 성공 메소드
						error : function(err) {
							alert(err + "\n구매 내역을 불러올 수 없습니다.");
						} // 에러 메소드
					}) // ajax 종료
				} // 개인이 주문한 상품 내역 종료
				
				// 캘린더 이동
				$("#selectCalendar").on("change", function() {
					location.href = "${path}/mypage/calendar.jsp?goodsId=" + $(this).val();
				})
				
				
				printCalendar();
				printDeli();
				selectOrderGoods();
			})
		</script>
	</head>
	<body>
		<section>
			<h1>나의 배송 캘린더</h1>
			<div id="selectBox-div">
				<select name="selectBox" id="selectCalendar">
				</select>
			</div>
			<table class="table table-bordered caption-top" id="deliCalendar">
				<caption> <img alt="" src=""> </caption>
				<thead>
					<tr>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</section>
	</body>
</html>