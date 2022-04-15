<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세페이지</title>
</head>
<style type="text/css">
 .left side {width : 300px;
             margin:auto;}
 .body {width : 900px;
        margin:auto;}
 .search{background-color:#eeeeee; 
         height : 50px; 
         text-align:center;
         vertical-align:middle;}
  
 
 table {width:1200px;}
 th, td {border : 1px solid white;}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<body>
<table>
<tr>	
<td>
<!-- left side -->
<div class="left side"> 
	<div class="title">고객센터</div><hr width="100px">
	<ul class="menu">
		<li><a href="notice.jsp">공지사항</a></li>
		<li class="">
			<a href="faq.jsp">FAQ</a>
			<ul>
				<li class=""><a href="">교환/환불</a></li>
				<li class=""><a href="">회원관련</a></li>
				<li class=""><a href="">주문/결제</a></li>
				<li class=""><a href="">배송관련</a></li>
				<li class=""><a href="">기타</a></li>
			</ul>
		</li>
		<li><a href="ask.jsp">1:1문의</a></li>
	</ul>
</div>
</td>
<td>

<div> 
<div class="body"> 
	<div><h1>공지사항</h1></div><hr>
	<div>
		<div>
			<div>{tile}</div>
			<div>{date}</div>
		</div>
<hr>
 <div> 
    <h3> 공지사항내용입니다</h3>
 </div><hr>
     
			<div>
				<div>
					<button type="button" onclick="location.href='notice.jsp';">목록보기</button>
				</div>
			</div>
		</div>
	</div>

</div>
</td>
</tr>
</table>
</body>
</html>