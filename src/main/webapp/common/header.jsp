<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>header</title>
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<!-- jQuery -->
		<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/header.css">
    <!-- jQuery ui -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<!-- jQuery ui -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<style type="text/css" src=""></style>
    <link rel="stylesheet" href="../css/datepicker.css">
	</head>
	<body>
		<header class="main-header">
			<div class="main-header-top-right">
					<ul>
							<li><a href="#">회원가입</a></li>
							<li><a href="#">로그인</a></li>
					</ul>
			</div>
			<h1><a href="${path}/index.jsp"><img src="${path}/img/ui/main_logo.png" alt="미미미 로고"></a></h1>
		</header>
		<nav class="main-header-menubar">
			<div>
				<ul>
						<li><a href="#">전체 카테고리</a></li>
						<li><a href="#">도시락 정기배송</a></li>
						<li><a href="#l">이달의 식단</a></li>
						<li><a href="#">이벤트</a></li>
				</ul>
				<ul>
						<li><a href="#">검색</a></li>
						<li><a href="#">배달가능지역</a></li>
						<li><a href="#">카트</a></li>
				</ul>
		</div>
	</nav>
	</body>
</html>