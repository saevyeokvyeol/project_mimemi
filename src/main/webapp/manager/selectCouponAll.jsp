<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쿠폰조회 - 미미미</title>
		
		<style type="text/css">
			div {width: 1200px; margin: auto;}
			table {width: 1200px;}
			th, td {border: 1px solid black;}
		</style>
		
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
			
		
	</head>
	<body>
		<div>
			<form action="">
				<h1>쿠폰조회</h1>
				
				<div style="text-align: right;">
					<form name="search" action="" method="post">
						<select name="keyField">
							<option value="0">--정렬선택--</option>
							<option value="couponId">쿠폰번호</option>
							<option value="couponName">쿠폰명</option>
						</select> 
					</form>
				</div>
				
				<p>
				
				<table >
					<thead>
						<tr>
							<th>쿠폰번호</th>
							<th>쿠폰명</th>
							<th>쿠폰발행일</th>
							<th>쿠폰만료일</th>
							<th>쿠폰금액</th>
							<th>수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>쿠폰번호</td>
							<td>쿠폰명</td>
							<td>쿠폰발행일</td>
							<td>쿠폰만료일</td>
							<td>쿠폰금액</td>
							<td>수정</td>
						</tr>
					</tbody>
					
				</table>
				
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
		</div>
	</body>
</html>