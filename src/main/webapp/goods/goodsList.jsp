<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goodsList</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    <!-- Optional JavaScript -->
    <!-- jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>

	<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
    <title>미미미</title>

    <style>
        .wrap {
            width: 900px;
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
   	    				text += "<div class=\"card\" onclick=\"showDetail(\'" + item.goodsId +  "\')\">"
    	    			text += "<img class=\"card-img-top\""
    	    			text += "src=\"" + item.goodsThumbnail + "\""
    	    			text += "alt=\"Card image cap\">"
    	    			text += "<div class=\"card-body\">"
    	    			text += "<h5 class=\"card-title\">" + item.goodsName + "</h5>"
    	    			text += "<p class=\"card-text\">1일 1식/ 1주 (월~금, 총 5회)</p>"
    	    			text += "<span>" + item.goodsPrice + "</span> 원"
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

        <div class="card-columns" id="goodsCard">
        </div>
    </div>

</body>
</html>