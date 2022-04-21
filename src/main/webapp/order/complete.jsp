<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문 완료 :: 미미미</title>
		<jsp:include page="../common/header.jsp"/>
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		
		<style type="text/css">
			.complete {width: 1200px; margin: auto; padding: 50px 0;}
			.complete h1 {margin-bottom: 30px; text-align: center;}
			.box{border: 2px solid #dddddd; margin: auto; padding: 30px; width: 900px;}
			.text, .head, .bottom {text-align: center;}
			
			.bottom {padding: 20px;}
		</style>
	</head>
	<body>
		<section class="complete">
			<h1>주문 완료</h1>
			<div class="box">
				<div class="head">
					<h2>미미미를 이용해주셔서 감사합니다.</h2>
					<h4>맛있는 도시락으로 방문하겠습니다.</h4>
				</div>
				<div class="text">
					주문 배송 확인은 마이페이지에서 확인하실 수 있습니다.
				</div>
				<div class="bottom">
					<a href="${path}/mypage/orderList.jsp" class="btn btn-dark shadow-none">마이페이지</a>
					<a href="${path}/index.jsp" class="btn btn-dark shadow-none">홈</a>
				</div>
			</div>
		</section>
	</body>
	<jsp:include page="../common/footer.jsp"/>
</html>