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

        .goods-view {
        	position: relative;
            margin: auto;
            width: 1200px;
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

        .goods-thumbnail-image {
            width: 500px;
            height: 500px;
            border-radius: 10px;
        }
        
        #goodsdetail {
        	color: #666666;
        	padding: 10px 0;
        	border-bottom: 1px solid #cccccc;
        }
        
        .option-table td {vertical-align: middle;}
        .option-table td:first-child {width: 120px;}
        .option-table .num {display: inline; width: 50px; text-align: center; padding: 6px 0 0 10px;}
        .btn-box {text-align: center; display: flex; justify-content: space-between;}
        .btn-box > * {display: inline; width: 49%;}
        
        #cartToast {position: absolute; top: 10px; right: -15px;}
    </style>
    
    <script type = "text/javascript">
    	function calcTotalPrice() {
    		price = $("#goodsprice").text();
    		quantity = $("input[name=cartQty]").val();
			cartPeriod = parseInt($("select[name=cartPeriod]").val());
			cartWeekday = 0;
			if($("select[name=cartWeekDay]").val() == "T"){
				cartWeekday = 3/5;
			} else {
				cartWeekday = 1;
			}
			
			$("#goodstotalprice").text(price * quantity * cartWeekday * cartPeriod);
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
   						$("input[name=goodsId]").val(item.goodsId);
   						$("#goodsname").text(item.goodsName);
   						$("input[name=goodsName]").val(item.goodsName);
   						$("#goodsdetail").text(item.goodsDetail);
   						$("#goodsprice").text(item.goodsPrice);
   						$("input[name=goodsPrice]").val(item.goodsPrice);
   						$("#goodsThumbnailImage").attr("src", item.goodsThumbnail);
   						$("input[name=goodsThumbnailImage]").val(item.goodsThumbnail);
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
    		
    		// 수량 감소 시 DB 업데이트
			$(document).on("click", "button[name=minus]", function() {
				let updateNum = parseInt($(this).next().val()) - 1;
				if(updateNum <= 0){
					alert("수량을 하나 이상 입력해주세요.");
					updateNum = 1;
				}
				$(this).next().val(updateNum);
				calcTotalPrice();
			}); // 수량 감소 업데이트 종료
			
			// 수량 증가 시 DB 업데이트
			$(document).on("click", "button[name=plus]", function() {
				let updateNum = parseInt($(this).prev().val()) + 1;
				$(this).prev().val(updateNum);
				calcTotalPrice();
			}); // 수량 증가 업데이트 종료
    		
			// 장바구니에 담기
			$("#cart").click(function() {
				if($("#datePicker").val() == ""){
					alert("배송 시작일을 선택해주세요.");
					return;
				}
				$.ajax({
					url: "${path}/ajax",
					type: "post",
					dataType : "text",
					data: {key: "cart", methodName: "insertCart", goodsId: $("input[name=goodsId]").val(),
						cartQty: $("input[name=cartQty]").val(), cartWeekDay: $("select[name=cartWeekDay]").val(),
						cartPeriod: $("select[name=cartPeriod]").val(), cartStart: $("input[name=cartStart]").val(),
						goodsPrice:$("input[name=goodsPrice]").val()},
					success: function(result) {
						var toast = new bootstrap.Toast($("#cartToast"));
						cartCount();
						toast.show();
					},
					error: function(err) {
						alert(err + "\n장바구니를 불러올 수 없습니다.");
					}
				}) // ajax 종료
			}) // 장바구니에 담기 종료
			
			$(".selectpicker").click(function() {
				calcTotalPrice();
			})
			
    		selectByGoodsId();
    	})
    </script>
</head>

<body>
    <div class="goods-view">
    	<div class="toast align-items-center" role="alert" aria-live="assertive" aria-atomic="true" id="cartToast">
			  <div class="d-flex">
			    <div class="toast-body">
			    장바구니에 상품이 담겼습니다.
			   </div>
			    <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
			  </div>
			</div>
        	<div class="row" style="padding: 30px">
    	<div class="col-sm-6">
                <div class="goodsthumbnail">
                    <img id="goodsThumbnailImage" class="goods-thumbnail-image top-image">
                </div>
            </div>
            <div class="col-sm-6">
                <div class="goodsinformation">
                    <h1 class="goodsname" id="goodsname"></h1>
                    <p class="goodsdetail" id="goodsdetail"></p>
                </div>
                <form action="${path}/front?key=cart&methodName=viewOrderForm&mode=D" method="post">
                <input type="hidden" name="goodsThumbnailImage">
                <input type="hidden" name="goodsName">
                <input type="hidden" name="goodsPrice">
                <input type="hidden" name="goodsId">
	                <table class="table option-table table-borderless">
		                <tbody>
		                	<tr>
		                		<td>
		                			배송요일
		                		</td>
		                		<td>
			                        <select class="selectpicker form-select" name="cartWeekDay">
			                            <option value="F">주 5회 (월~금)</option>
			                            <option value="T">주 3회 (월/수/금)</option>
			                        </select>
		                		</td>
		                	</tr>
		                	<tr>
		                		<td>
		                			배송기간	
		                		</td>
		                		<td>
			                        <select class="selectpicker form-select" name="cartPeriod">
			                            <option value="1W">1주</option>
			                            <option value="2W">2주</option>
			                            <option value="4W">4주</option>
			                            <option value="8W">8주</option>
			                        </select>
		                		</td>
		                	</tr>
		                	<tr>
		                		<td>
		                			수량
		                		</td>
	                            <td>
	                            	<button type="button" class="btn btn-outline-dark shadow-none btn-sm" name="minus"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash" viewBox="0 0 16 16"><path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/></svg></button>
	                            	<input type="number" class="form-control-plaintext num" name="cartQty" min="1" max="9999" step="1" value="1" readonly="readonly">
	                            	<button type="button" class="btn btn-outline-dark shadow-none btn-sm" name="plus"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16"><path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/></svg></button>
	                            </td>
		                	</tr>
		                	<tr>
		                		<td>
		                			배송 요일
		                		</td>
		                		<td>
									<input type="text" id="datePicker" name="cartStart" class="form-control" placeholder="" readonly="readonly" required>
		                		</td>
		                	</tr>
		                	</tbody>
	                	<tfoot>
		                	<tr>
		                		<td>
			                		금액 
		                		</td>
		                		<td>
			                    	<span class="goodsprice" id="goodsprice"></span>
		                		</td>
		                	</tr>
		                	<tr>
		                		<td>
									<h5>총 주문 금액</h5>
		                		</td>
		                		<td>
									<h5><span class="goodstotalprice" id="goodstotalprice"></span></h5>
		                		</td>
		                	</tr>
	                	</tfoot>
	                </table>
	                <div class="btn-box">
	                    <button type="button" class="form-control btn btn-outline-dark shadow-none btn-lg" id="cart">장바구니 담기</button>
	                    <button type="submit" class="form-control btn btn-dark shadow-none btn-lg" id="order">주문하기</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="row">
            
        </div>
    </div>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>
