<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>이벤트 상세보기 - 미미미</title>
		<style type="text/css">
			section {width: 1200px; margin: auto;}
			table {width: 1200px;}
			th, td {border: 1px solid black;}
			.eventList{text-align:center;}
			
		</style>
		
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
		
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		
	</head>
	<body>
		<section>
			<form action="">
				<h1>진행중인 이벤트</h1>
				<p>
				<table class="table">
					<thead>
						<tr>
							<td>
								<div>미미미 신규회원 이벤트 #최대30000원할인</div>
								<div>이벤트기간 : 2022.04.11 ~ 2022.04.30</div>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><img  class="poster" src="${path}/front_img/progressEvent1.jpg" alt="진행중인이벤트"/></td>	
						</tr>
						
					</tbody>
					<tfoot>
						<tr>
							
						</tr>
					</tfoot>
				</table>
				<div class="eventList">
					<input type="button" onclick="location.href='eventList.jsp'" value="이벤트목록" >
				</div>
			</form>
		</section>
	</body>
</html>