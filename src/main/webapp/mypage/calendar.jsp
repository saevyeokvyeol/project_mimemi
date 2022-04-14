<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지 :: 미미미</title>
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		
		<style type="text/css">
			section {width: 1200px; margin: auto;}
			table {width: 100%; table-layout: fixed;}
			th {text-align: center;}
			
			li {list-style: none; max-width: 240px;}
			ul > li:first-child {text-align: right;}
			tfoot {text-align: right;}
		</style>
	</head>
	<body>
		<section>
			<h1>나의 배송 캘린더</h1>
			<select name="" id="">
				<option value="">최근 구매하신 내역이 없습니다.</option>
			</select>
			<table class="table table-bordered">
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
					<tr>
						<td>
							<ul>
								<li></li>
							</ul>
						</td>
						<td>
							<ul>
								<li></li>
							</ul>
						</td>
						<td>
							<ul>
								<li></li>
							</ul>
						</td>
						<td>
							<ul>
								<li></li>
							</ul>
						</td>
						<td>
							<ul>
								<li>1</li>
							</ul>
						</td>
					</tr>
					<tr>
						<td>
							<ul>
								<li>4</li>
								<li><a href="#">유부초밥</a></li>
							</ul>
						</td>
						<td>
							<ul>
								<li>5</li>
								<li><a href="#">유부초밥</a></li>
							</ul>
						</td>
						<td>
							<ul>
								<li>6</li>
							</ul>
						</td>
						<td>
							<ul>
								<li>7</li>
								<li><a href="#">유부초밥</a></li>
							</ul>
						</td>
						<td>
							<ul>
								<li>8</li>
								<li><a href="#">유부초밥</a></li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
		</section>
	</body>
</html>