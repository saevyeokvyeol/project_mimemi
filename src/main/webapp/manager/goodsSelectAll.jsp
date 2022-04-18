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

    <title>미미미</title>

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
    	$(function()) {
    		function goodsSellectAll(){
    			$.ajax({
    				url: "${path}/mimemi/ajax",
    				type: "post"
    				dataType: "json",
    				data: {key: "goods", methodName: "getGoodsList"},
    				success: function(result) {
    					let text = "";
    					$.each(result, function(index, item){
    						text+="<tr>"
    						text+='<td>\${item.goodsId}</td>';
    						text+='<td>\${item.goodsThumbnail}</td>';
    						text+='<td>\${item.goodsName}</td>';
    						text+='<td>\${item.goodsPrice}</td>';
    						text+='<td>\${item.goodsSale}</td>';
    						text+='<td>\${item.goodsDetail}</td>';
    						text+='</tr>';
    					});
    						$("#goodsTable tr:gt(0)").remove();
    						$("#goodsTable tbody").append(str);
    						
    					}
    				})
    			
    		}
    		goodsSellectAll();
    	}
    				
    					
    							
    		
    	
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

                    <select class="selectpicker">
                        <option>전제조회</option>
                        <option>판매중</option>
                        <option>가격순</option>
                    </select>
                </div>
                <div>
                    <input type="text" class="spiner-text" id="quantity" value="상품이름 검색">
                    <button type="button" class="btn btn-default">검색</button>
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
                        <tr>
                            <td>JUNG01</td>
                            <td>
                                <img src="/Users/egg/kosta/Project2/img/Goods_1.png">
                            </td>
                            <td>정성한상</td>
                            <td>10000</td>
                            <td>Y</td>
                            <td>1일 1식/정성가득한 영양만점 식단</td>
                            <td><button type="button" class="btn btn-default" data-dismiss="modal">수정</button></td>
                        </tr>
                        <tr>
                            <td>VEGAN01</td>
                            <td>
                                <img src="/Users/egg/kosta/Project2/img/Goods_2.png">
                            </td>
                            <td>비건 식단</td>
                            <td>8500</td>
                            <td>Y</td>
                            <td>1일 1식/신선하고 바른 비건 맞춤 식단</td>
                            <td><button type="button" class="btn btn-default" data-dismiss="modal">수정</button></td>
                        </tr>
                        <!-- <tr>
                            <td>H</td>
                            <td>맛있는 한식</td>
                            <td>2022.04.20</td>
                            <td>H01</td>
                            <td>김치볶음밥</td>
                            <td>3000원</td>
                            <td><button type="button" class="btn btn-default" data-dismiss="modal">수정</button></td>
                        </tr> -->
                        <!-- <tr>
                            <td>H</td>
                            <td>맛있는 한식</td>
                            <td>2022.04.20</td>
                            <td>H01</td>
                            <td>김치볶음밥</td>
                            <td>3000원</td>
                            <td><button type="button" class="btn btn-default" data-dismiss="modal">수정</button></td>
                        </tr> -->
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
                            <p>상품이름</p>
                        </div>
                        <div class="col-8">
                            <!-- select box -->

                            <select class="selectpicker">
                                <option>정성한상</option>
                                <option>비건 식단</option>
                                <option>300 시리즈</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <p>상품 가격</p>
                        </div>
                        <div class="col-8">
                            <input type="text" class="spiner-text" id="quantity" value="1">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <p>상품 상세설명</p>
                        </div>
                        <div class="col-8">
                            <input type="text" class="spiner-text" id="quantity" value="1">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <p>상품 썸네일 등록</p>
                        </div>
                        <div class="col-8">

                            <button type="button" class="btn btn-default">이미지 선택하기</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <p>상품 판매여부</p>
                        </div>
                        <div class="col-8">
                            <select class="selectpicker">
                                <option>Y</option>
                                <option>N</option>
                            </select>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">등록</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        </div>
                    </div>

                </div>
            </div>
</body>

</html>