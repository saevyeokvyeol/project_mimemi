<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <title>상품 상세보기</title>
		<jsp:include page="../common/header.jsp"/>
    	<link rel="stylesheet" href="${path}/css/datepicker.css">
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<!-- jQuery -->
		<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	    <link rel="stylesheet" href="${path}/css/header.css">
	    <!-- jQuery ui -->
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<!-- jQuery ui -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<style type="text/css" src=""></style>
    	<link rel="stylesheet" href="${path}/css/datepicker.css">


    <style>

        .wrap {
            margin: auto;
            width: 900px;
        }

        .comment {
            font-weight: bold;
            color: blue;
        }

        .posting-box {
            margin: 10px auto 100px auto;
 
            border-radius: 5px;

            padding: 25px;
        }

        .card-title {
            font-size: 4em;
        }

        .top-img {
            margin-top: 50px;

        }


        img {
            width: 500px;
            height: 500px;
        }
        
        .goodsname {
        	font-size:4em;
        }
        
        .goodDetail {
        	font-size:1.5em;
        }
    </style>
    
    <script type = "text/javascript">
    	function calcTotalPrice() {
    		price = $("#quantity").val();
    		quantity = $("#goodsprice").text();
			$("#goodstotalprice").text(price * quantity);
    	}
    
    	$(function() {
    		if (window.location.href.endsWith('.jsp')){
    			window.location.href='${path}/front?key=goods&methodName=goodsView';
    		}
    		function selectByGoodsId(){
    			$.ajax({
    				url: "${path}/ajax",
    				type: "get",
    				dataType: "json",
    				data: {key: "goods", methodName: "getSelectByGoodsId", goodsId: '${goodsId}'},
    				success: function(result) {
    					let text ="";
    					item = result[0]
   						$("#goodsname").text(item.goodsName);
   						$("#goodsdetail").text(item.goodsDetail);
   						$("#goodsprice").text(item.goodsPrice);
   						$("input[name=goodsPrice]").val(item.goodsPrice);
   						calcTotalPrice();
    				}
    				
    			})
    		}
    		
    		// datepicker 설정
			$.datepicker.setDefaults({
				dateFormat: 'yy-mm-dd',
				prevText: '이전 달',
				nextText: '다음 달',
				monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				dayNames: ['일', '월', '화', '수', '목', '금', '토'],
				dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
				dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
				showMonthAfterYear: true,
				yearSuffix: '년'
			});
			
    		$("#datePicker").datepicker();
			
    		selectByGoodsId();
    	})
    </script>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="goodsthumbnail">
                    <img src="/Users/egg/kosta/Project2/img/1.png">
                </div>
            </div>
            <div class="col">
                <div class="goodsinformation">
                    <a class="goodsname" id="goodsname"></a>
                    <p class="goodsdetail" id="goodsdetail"></p>

                </div>
                <div class="order-box">
                    <div class="form-group">
                        <label for="exampleInputEmail1">배송요일</label>
                        <select class="selectpicker" name="cartWeekDay">
                            <option value="F">주 5회 (월~금)</option>
                            <option value="T">주 3회 (월/수/금)</option>
                        </select>
                    </div>
                    <div class="order-box">
                        <label for="exampleInputPassword1">배송기간</label>
                        <select class="selectpicker" name="cartPeriod">
                            <option value="1W">1주</option>
                            <option value="2W">2주</option>
                            <option value="4W">4주</option>
                            <option value="8W">8주</option>
                        </select>
                    </div>
                    <div class="order-box">
                        <label for="exampleInputPassword1">수량</label>

                        <div class="spiner-form-container clearfix">
                            <button class="spiner-minus"><i class="material-icons" id="minus">remove</i></button>
                            <input type="text" class="spiner-text" name="cartQty" id="quantity" value="1" onchange="calcTotalPrice()">
                            <button class="spiner-plus"><i class="material-icons" id="plus">add</i></button>
                        </div>
                    </div>
                    <div class="order-box">
                        <label for="exampleInputPassword1">첫 배송일</label>
                        <input type="text" id="datePicker" name="cartStart" class="form-control" placeholder="" readonly="readonly">
                    </div>
                    <div>
                    	<input type="hidden" name="goodsPrice" value="">
                    	<label for="exampleInputPassword1">금액</label>
                    	<a class="goodsprice" id="goodsprice"></a>
                    	<label for="exampleInputPassword1">원</label><br>
						<label for="exampleInputPassword1">총 주문금액</label>
						<a class="goodstotalprice" id="goodstotalprice"></a>
						<label for="exampleInputPassword1">원</label>
                    </div>
                    <button type="submit" class="btn btn-primary">장바구니 담기</button>
                    <button type="submit" class="btn btn-primary">주문하기</button>
                </div>
            </div>
        </div>
        <div class="row">
            
        </div>
    </div>
</body>

</html>
