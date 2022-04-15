<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_eventList</title>
<style type="text/css">
	table{width: 1000px; height:300px; border: double 3px gray; border-collapse: collapse;}
	th,td{border: 1px solid gray;}
	td{text-align: center;}
	tr th{width: 1000px; height:50px;}
	img{width: 500px; height:200px;}
</style>
</head>
<body>
<h2>이벤트</h2>
<table>
	<thead>
		<tr>
			<th><a href="eventList.jsp">진행중인 이벤트</a></th>
			<th><a href="eventList.jsp?st=end">종료된 이벤트</a></th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>
				<a href="eventView.jsp" target="_blank">
				<img alt="신규회원 이벤트 #최대30000원할인" src="../front_img/board_eventList.jpg" title="신규회원 이벤트 #최대30000원할인">
				</a>
			</td>
			<td>
				<a href="eventView.jsp" target="_blank">
				<img alt="4월궁중요리이벤트" src="../front_img/board_eventList.jpg" title="4월궁중요리이벤트">
				</a>
			</td>				
		</tr>
		<tr>
			<td>
				<div>미미미 신규회원 이벤트 #최대30000원할인</div>
				<div>이벤트기간 : 2022.04.11 ~ 2022.04.30</div>
			</td>
			<td>
				<div>4월 집에서 즐기는 궁중요리 이벤트 </div>
				<div>이벤트기간 : 2022.04.01 ~ 2022.04.30</div>
			</td>
		</tr>
	</tbody>
					
</table>


</body>
</html>