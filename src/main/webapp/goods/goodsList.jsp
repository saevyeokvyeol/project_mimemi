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

    <title>미미미</title>

    <style>
        .wrap {
            width: 900px;
            margin: 10px auto;
        }
    </style>
    
    <script>
    	function selectGoodsList() {
    		$.ajax({
    			url: "${path}/ajax",
    			data: {
    				"key": "GoodsController",
    				"method": "getGoodsList"
    			}
    			type: "get"
    			dataType: "json"
    			success: function(res) {
    				return res
    			}
    		})
    		/* return [
    			{
    				"name": "정성한상",
    				"price": 3000,
    			},
    			{
    				"name": "비건 식당",
    				"price": 4000,
    			}
    		 */]s
    	}
    	
    	function fillCards() {
    		data = selectGoodsList()
    		let text = "";
    		for goods in data {
    			text += "<div class=\"card\">"
    			text += "<img class=\"card-img-top\""
    			text += "src=\"" + goods.goods_thumbnail + "\""
    			text += "alt=\"Card image cap\">"
    			text += "<div class=\"card-body\">"
    			text += "<h5 class=\"card-title\">" + goods.goods_name + "</h5>"
    			text += "<p class=\"card-text\">1일 1식/ 1주 (월~금, 총 5회)</p>"
    			text += "<span>" + goods.good_price + "</span> 원"
    			text += "</div>"
    			text += "</div>"
    		}
    		$("goodsTable").remove()
    		$("#goodsTable").append(text)
    	}
    	
    	function initialize() {
    		fillCards()
    	}
    	
    	$(function()) {
    		initialize()
    	}
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

        <div class="card-columns">
            <div class="card">
                <img class="card-img-top"
                    src="/Users/egg/kosta/Project2/img/1.png"
                    alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">정성한상</h5>
                    <p class="card-text">1일 1식/ 1주 (월~금, 총 5회)</p>
                    <span>75,000</span> 원
                </div>
            </div>
            <div class="card">
                <img class="card-img-top"
                    src="/Users/egg/kosta/Project2/img/2.png"
                    alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">300 샐러드</h5>
                    <p class="card-text">1일 1식/ 1주 (월~금, 총 5회)</p>
                    <span>60,000</span> 원
                </div>
            </div>
            <div class="card">
                <img class="card-img-top"
                    src="/Users/egg/kosta/Project2/img/3.png"
                    alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">비건 식단</h5>
                    <p class="card-text">1일 1식/ 1주 (월~금, 총 5회)</p>
                    <span>48,000</span> 원
                </div>
            </div>
            <div class="card">
                <img class="card-img-top"
                    src="/Users/egg/kosta/Project2/img/4.png"
                    alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">300 덮밥</h5>
                    <p class="card-text">1일 1식/ 1주 (월~금, 총 5회)</p>
                    <span>70,000</span> 원
                </div>
            </div>
            <div class="card">
                <img class="card-img-top"
                    src="/Users/egg/kosta/Project2/img/5.png"
                    alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">스무스 한끼밀</h5>
                    <p class="card-text">1일 1식/ 1주 (월~금, 총 5회)</p>
                    <span>39,000</span> 원
                </div>
            </div>
            <div class="card">
                <img class="card-img-top"
                    src="/Users/egg/kosta/Project2/img/6.png"
                    alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">시그니처</h5>
                    <p class="card-text">1일 1식/ 1주 (월~금, 총 5회)</p>
                    <span>65,000</span> 원
                </div>
            </div>
        </div>
    </div>

</body>
</html>