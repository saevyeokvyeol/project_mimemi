<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>미미미</title>
		<jsp:include page="common/header.jsp"/>
		<script type="text/javascript">
			function showDetail(goodsId) {
				window.location.href='${path}/front?key=goods&methodName=goodsView&goodsId=' + goodsId;
			}
			function selectGoodsList() {
	    		$.ajax({
	    			url: "${path}/ajax",
	    			data: {
	    				"key": "goods",
	    				"methodName": "getGoodsSelectForSale"
	    			},
	    			type: "get",
	    			dataType: "json",
	    			success: function(result) {
	    	    		let text = "";
	    	    		console.log(result)
	    	    		$.each(result, function(index, item){
	    	    			console.log(item)
	    	    			/* text += "<div class=\"card\" onclick=\"location=\'goodsView.jsp\'\">" */
	    	    			text += "<div class=\"col\">"
	   	    				text += "<div class=\"card h-100\" onclick=\"showDetail(\'" + item.goodsId +  "\')\">"
	    	    			text += "<img class=\"card-img-top\""
	    	    			text += "src=\"" + item.goodsThumbnail + "\""
	    	    			text += "alt=\"Card image cap\">"
	    	    			text += "<div class=\"card-body\">"
	    	    			text += "<h4 class=\"card-title\">" + item.goodsName + "</h4>"
	    	    			text += "<p class=\"card-text\">1일 1식/ 1주 (월~금, 총 5회)</p>"
	    	    			text += "<span>" + item.goodsPrice + "</span> 원"
	    	    			text += "</div>"
	    	    			text += "</div>"
	    	    			text += "</div>"
	    	    		});
	    	    		$("#goodsCard").empty();
	    	    		$("#goodsCard").append(text);
	    			}
	    		})
	    		src ="${path}/img/goodsthumbnail/"
	    	}
			$(function() {
				selectGoodsList()
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
		        margin:10px auto !important;
		        display:block !important;
		        border:20px;
		    }
		    
	        .wrap {
	            width: 900px;
	            margin: 10px auto;
	        }
	        
	        .card {
	        	width: 18rem;
	        	margin: 10px auto;
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
		      <img src="img/ui/main-banner1.png" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="img/ui/main-banner2.png" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="img/ui/main-banner3.png" class="d-block w-100" alt="...">
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
		
		<div class="wrap">
			<div class="row row-cols-1 row-cols-md-3 g-4" id="goodsCard">
			</div>
		</div>
    </section>
	<div class="container-fluid">
		<button class="btn btn-success center-button" onclick="location.href='${path}/front?key=daymeal&methodName=getDayMenuCalendar'">이달의 식단으로 이동하기
		</button>
	</div>
	</body>
	<jsp:include page="common/footer.jsp"/>
</html>