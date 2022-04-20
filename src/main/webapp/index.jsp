<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>미미미</title>
		<jsp:include page="common/header.jsp"/>
		<script type="text/javascript">
			$(function() {
				$('.carousel').carousel()
			})
		</script>
		<style type="text/css">
			.index-view {width: 100%;}
			.carousel, .carousel-inner {height: 512px;}
			
			.vertical-center {
			  margin: 0;
			  position: absolute;
			  top: 50%;
			  -ms-transform: translateY(-50%);
			  transform: translateY(-50%);
			}
			
			.center-button{
		        width:300px;
		        margin:auto !important;
		        display:block !important;
		        border:20px;
		    }
		</style>
	</head>
	<body>
	<section class="index-view">
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="img/ui/b.png" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="img/ui/p.png" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="img/ui/g.png" class="d-block w-100" alt="...">
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
    </section>
	<jsp:include page="goods/goodsList.jsp"/>
	<div class="container-fluid">
		<button class="btn btn-success center-button" onclick="location.href='${path}/front?key=daymeal&methodName=getDayMenuCalendar'">이달의 식단으로 이동하기
			<span class="position-absolute top-0 start-100 translate-middle badge border border-light rounded-circle bg-danger p-2"><span class="visually-hidden">unread messages</span></span>
		</button>
	</div>
	</body>
	<jsp:include page="common/footer.jsp"/>
</html>