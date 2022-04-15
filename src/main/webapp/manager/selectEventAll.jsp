<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 이벤트조회  - 미미미</title>
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
		
	</head>
	<body>
		<section>
			<form action="">
        <input type="hidden" name="" id="">
				<h1>이벤트조회 </h1>
				<div style="text-align: right;">
					<form name="sort" action="" method="post">
						<select name="keyField">
							<option value="0">--정렬선택--</option>
							<option value="eventTitle">제목</option>
							<option value="eventContent">내용</option>
							<option value="eventRegdate">작성날짜</option>
						</select> 
					</form>
				</div>
				
				<p>
				
				<table class="table">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>내용</th>
							<th>첨부파일명</th>
							<th>작성날짜</th>
							<th>이벤트시작일</th>
							<th>이벤트종료일</th>
							
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>신규가입이벤트</td>
							<td>신규가입시 할인쿠폰 즉시 지급!</td>
							<td>첨부파일</td>
							<td>2022-04-13</td>
							<td>2022-04-14</td>
							<td>2022-05-14</td>
							<td></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							
						</tr>
					</tfoot>
					
				</table>
				
				<p>
				
				<div style="text-align: left;">
					<form name="search" action="" method="post">
						<select name="keyField">
							<option value="0">--검색조건--</option>
							<option value="eventTitle">제목</option>
							<option value="eventContent">내용</option>
							<option value="eventRegdate">작성날짜</option>
						</select>
						 
						<input type="text" name="keyWord"/>
						<input type="button" value="검색" />  
					
					</form>
				</div>
			</form>
		</section>
	</body>
</html>