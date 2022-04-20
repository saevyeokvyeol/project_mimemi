<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goodsList</title>
<jsp:include page="../common/header.jsp"/>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- 부트스트랩 CSS CDN -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		
	<!-- 부트스트랩 JS CDN -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
    <title>미미미</title>

    <style>
        .wrap {
            width: 900px;
            margin: 10px auto;
        }
        .card {
        	width: 18rem;
        	margin: 10px auto;
        }
    </style>
    
    
    <script>

	function showDetail(goodsId) {
		window.location.href='${path}/front?key=goods&methodName=goodsView&goodsId=' + goodsId;
	}
    $(function() {
    /* 	function showDetail(goodsId) {
    		window.location.href='${path}/front?key=goods&methodName=goodsView&goodsId=' + goodsId;
    	} */
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
    	    			text += "<h5 class=\"card-title\">" + item.goodsName + "</h5>"
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
    	}
    	
    	function initialize() {
    		selectGoodsList()
    	}

		if (window.location.href.endsWith('.jsp')) {
			window.location.href='${path}/front?key=goods&methodName=goodsList';	
		}
    	initialize()
    	
    })
    </script>	
    
</head>
<body>
<div class="wrap">
        <div class="jumbotron">
            <h1 class="display-4">미미미 입니다!</h1>
            <p class="lead">미미미 정기 배송 서비스를 이용해 주셔서 감사합니다.</p>
            <!-- <hr class="my-4">
            <p>It uses utility classes for typography and spacing to space content out within the larger container.</p> -->
            <p class="lead">
                <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
            </p>
        </div>

        <div class="row row-cols-1 row-cols-md-3 g-4" id="goodsCard">
        </div>
    </div>

</body>
</html>