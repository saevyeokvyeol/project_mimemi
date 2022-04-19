<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
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

    <title>상품관리 페이지</title>

    <style>
        .wrap {
            width: 900px;
            margin: 10px auto;
        }

        img {
            width: 70px;
            height: 70px;
        }
    </style>
    
    <script type = "text/javascript">
		
    	function fillUpdateModal(goodsId, goodsName, goodsThumbnail, goodsPrice, goodsSale, goodsDetail) {
    		$('#updateGoodsId').text(goodsId)
    		$('#updateGoodsIdHidden').val(goodsId)
    		$('#updateGoodsNameHidden').val(goodsName)
    		$('#updateGoodsThumbnail').val(goodsThumbnail)
    		$('#updateGoodsPrice').val(goodsPrice)
    		$('#updateGoodsSale').val(goodsSale)
    		$('#updateGoodsDetail').val(goodsDetail)
    	}
    	
    	function fillTable(result) {
    		let text = "";
			$.each(result, function(index, item){
				text+="<tr>"
				text+='<td>' + item.goodsId + '</td>';
				text+='<td>' + item.goodsThumbnail + '</td>';
				text+='<td>' + item.goodsName + '</td>';
				text+='<td>' + item.goodsPrice + '</td>';
				text+='<td>' + item.goodsSale + '</td>';
				text+='<td>' + item.goodsDetail + '</td>';
				text+="<td><button type=\"button\" class=\"btn btn-info\" data-toggle=\"modal\" data-target=\"#updateGoodsModal\" onclick=\"fillUpdateModal(\'" + item.goodsId + "\', \'" + item.goodsName + "\', \'" + item.goodsThumbnail + "\', " + item.goodsPrice + ", \'" + item.goodsSale + "\', \'" + item.goodsDetail + "\')\">수정</button><td>";
				text+='<td>';
				text+='</tr>';
			});
			$("#goodsTable tr:gt(0)").remove();
			$("#goodsTable tbody").append(text);    	
    	}
    
		function goodsSelectAll(){
			$.ajax({
				url: "${path}/ajax",
				type: "get",
				dataType: "json",
				data: {key: "goods", methodName: "getGoodsList"},
				success: function(result) {
					fillTable(result)  						
				}
			})
		}
    	/* 상품추가 */
    	function goodsInsert() {
    		let goodsId = $("#goodsId").val()
    			goodsName = $("#goodsName").val()
    			goodsPrice = $("#goodsPrice").val()
    			goodsDetail = $("#goodsDetail").val()
    			goodsThumbnail = $("#goodsThumbnail").val()
    			goodsSale = $("#goodsSale").val()
    		
   			$.ajax({
   				url: "${path}/ajax",
   				type: "post",
   				data: {
   					key: "goods",
   					methodName: "getGoodsInsert",
   					goodsId: goodsId,
   					goodsName: goodsName,
   					goodsPrice: goodsPrice,
   					goodsDetail: goodsDetail,
   					goodsThumbnail: goodsThumbnail,
   					goodsSale: goodsSale
   					},
   				success: function(result) {
   					//console.log('들어오냐')
   					location.reload()
   										
  				}
			})
   		}
    	/*상품 추가하기*/
    	function goodsUpdate() {
    		let goodsId = $("#updateGoodsIdHidden").val()
				goodsName = $("#updateGoodsNameHidden").val()
				goodsPrice = $("#updateGoodsPrice").val()
				goodsDetail = $("#updateGoodsDetail").val()
				goodsThumbnail = $("#updateGoodsThumbnail").val()
				goodsSale = $("#updateGoodsSale").val()
		
			$.ajax({
				url: "${path}/ajax",
				type: "post",
				data: {
					key: "goods",
					methodName: "getGoodsUpdate",
					goodsId: goodsId,
					goodsName: goodsName,
					goodsPrice: goodsPrice,
					goodsDetail: goodsDetail,
					goodsThumbnail: goodsThumbnail,
					goodsSale: goodsSale
					},
				success: function(result) {
					//console.log('들어오냐')
					location.reload()
				}
			})
    		   
    		 
    		
    		
    	}
    	

    		
    	
   		/*판매중인것들만 조회*/
    	function goodsSelectByForSale() {
    		
   			let sale = $("#goodsSelectByForSale").val()
   			let methodName = ''
   			if (sale === '전체조회') {
   				methodName = 'getGoodsList'
   				
   			} else {
   				methodName = 'getGoodsSelectForSale'
   			}
   			
    		$.ajax({
				url: "${path}/ajax",
				type: "get",
				dataType: "json",
				data: {key: "goods", methodName: methodName},
				success: function(result) {
					fillTable(result)						
				}
			})
 
    	}
    	/*상품이름으로 검색하기*/
    	function goodsSelectByKeyword() {
    		let keyword = $("#searchkeyword").val()
    	
    		$.ajax({
				url: "${path}/ajax",
				type: "get",
				dataType: "json",
				data: {key: "goods", methodName: "getGoodsSelectByKeyword", keyword: keyword},
				
				success: function(result) {
					fillTable(result)
				}
			})
 
    	}
    	$(function() {
    		if (window.location.href.endsWith('.jsp')) {
    			window.location.href='${path}/front?key=goods&methodName=goodsSelectAll';	
    		}
    		goodsSelectAll();
    	})
    	
    	
    </script>
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <div class="row container-fluid">
                <div class="col-9 text-center">
                    <h2>상품관리 페이지</h2>
                </div>
                <div class="col-3">
                    <!-- select box -->

                    <select class="selectpicker" id="goodsSelectByForSale">
                        <option>전체조회</option>
                        <option>판매중</option>
                    </select>
                    <button type="button" class="btn btn-default"onclick="goodsSelectByForSale()">조회</button>
                </div>
                <div>
                    <input type="text" class="spiner-text" id="searchkeyword" value="상품이름 검색">
                    <button type="button" class="btn btn-default" id="goodsSelectByKeyword" onclick="goodsSelectByKeyword()">검색</button>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-sm" id="goodsTable">
                    <thead>
                        <tr>
                            <th scope="col">상품번호</th>
                            <th scope="col">상품썸네일</th>
                            <th scope="col">상품이름</th>
                            <th scope="col">상품가격</th>
                            <th scope="col">상품 판매여부</th>
                            <th scope="col">상품 상세</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-2">

            </div>
            <!-- 검색 조건 -->
            <div class="col-5"></div>
            <!-- 검색 input box -->
            <div class="col-3"></div>
            <!-- 페이지네이션 -->
            <div class="col-2">

                <button type="button" class="btn btn-info btn-lg" data-toggle="modal"
                    data-target="#addGoodsModal">+</button>
            </div>
            <!-- 추가 모달 -->

            <!-- selectbox -->


            <!-- inputbox -->



        </div>
    </div>


    <div id="addGoodsModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">상품 추가하기</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                    
                        <div class="col-4">
                            <p>상품ID 입력</p>
                        </div>
                        <div class="col-8">
                            <input type="text" class="spiner-text" id="goodsId" value="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <p>상품이름</p>
                        </div>
                        <div class="col-8">
                            <!-- select box -->
							<div>
	                            <select class="selectpicker" id="goodsName">
	                                <option>정성한상</option>
	                                <option>비건 식단</option>
	                                <option>시그니처</option>
	                                <option>직장인 식단</option>
	                                <option>고기 식단</option>
	                                <option>300덮밥</option>
	                            </select>
	                        </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-4">
                            <p>상품 가격</p>
                        </div>
                        <div class="col-8">
                            <input type="text" class="spiner-text" id="goodsPrice" value="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <p>상품 상세설명</p>
                        </div>
                        <div class="col-8">
                            <input type="text" class="spiner-text" id="goodsDetail" value="1일/1식">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <p>상품 썸네일 등록</p>
                        </div>
                        <div class="col-8">

                            <button type="button" class="btn btn-default" id="goodsThumbnail">이미지 선택하기</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <p>상품 판매여부</p>
                        </div>
                        <div class="col-8">
                            <select class="selectpicker" id="goodsSale">
                                <option>Y</option>
                                <option>N</option>
                            </select>
                        </div>
      			</div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" id="goodsInsert" onclick="goodsInsert()">등록</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        </div>
                    </div>

                </div>
            </div>
    </div>        
    <div id="updateGoodsModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">상품 수정하기</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                    
                        <div class="col-4">
                            <p>상품ID</p>
                        </div>
                        <div class="col-8">
                        	<p id="updateGoodsId"></p>
                            <input type="hidden" class="spiner-text" id="updateGoodsIdHidden" value="">
                        </div>
                    </div>
                    <input type="hidden" class="spiner-text" id="updateGoodsNameHidden" value="">
                    <div class="row">
                        <div class="col-4">
                            <p>상품 가격</p>
                        </div>
                        <div class="col-8">
                            <input type="text" class="spiner-text" id="updateGoodsPrice" value="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <p>상품 상세설명</p>
                        </div>
                        <div class="col-8">
                            <input type="text" class="spiner-text" id="updateGoodsDetail" value="1일/1식">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <p>상품 썸네일 수정</p>
                        </div>
                        <div class="col-8">
                            <button type="button" class="btn btn-default" id="updateGoodsThumbnail">이미지 선택하기</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <p>상품 판매여부</p>
                        </div>
                        <div class="col-8">
                            <select class="selectpicker" id="updateGoodsSale">
                                <option>Y</option>
                                <option>N</option>
                            </select>
                        </div>
      			</div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="goodsUpdate()">등록</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        </div>
                    </div>

                </div>
            </div>            
</div>
</body>

</html>