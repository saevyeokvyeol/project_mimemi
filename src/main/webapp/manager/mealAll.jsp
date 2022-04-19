<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    
    <!-- 부트스트랩 CSS CDN -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		
	<!-- 부트스트랩 JS CDN -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>



    <title>도시락관리 페이지</title>

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
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="row container-fluid">
                <div class="col-9 text-center">
                    <h2>도시락관리 페이지</h2>
                </div>
                <div class="col-3">
                    <!-- select box -->

                    <select class="selectpicker">
                        <option>전체조회</option>
                        <option>판매중</option>
                        <option>칼로리 적은순</option>
                    </select>
                </div>
                <div>
                    <input type="text" class="spiner-text" id="quantity" value="도시락 검색">
                    <button type="button" class="btn btn-default">검색</button>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-sm" id="mealTable">
                    <thead>
                        <tr>
                            <th scope="col">도시락번호</th>
                            <th scope="col">상품번호</th>
                            <th scope="col">도시락이름</th>
                            <th scope="col">도시락_무게</th>
                            <th scope="col">도시락_칼로리</th>
                            <th scope="col">도시락_단백질</th>
                            <th scope="col">도시락_지방</th>
                            <th scope="col">도시락_사진</th>
                            <th scope="col">도시락_판매여부</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                    <tr>
                    		<td>J01</td>
                            <td>JUNG01</td>
                            <td>비빔밥</td>
                            <td>360</td>
                            <td>515</td>
                            <td>15</td>
                            <td>14</td>
                            <td>
                                <img src="/Users/egg/kosta/Project2/img/Goods_1.png">
                            </td>
                            <td>Y</td>
                        </tr>
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
                            <p>도시락 번호</p>
                        </div>
                        <div class="col-8">
                            <input type="text" class="spiner-text" id="quantity" value="1">
                        </div>
                    </div>
                    <div class="row">
                   		<div class="col-4">
                           <p>상품 카테고리</p>
                       </div>
                       <div class="col-8">
                            <!-- select box -->

                            <select class="selectpicker">
                                <option>정성한상</option>
                                <option>비건 식단</option>
                                <option>시그니처</option>
                                <option>300 덮밥</option>
                            </select>
                        </div>
                        <div class="col-4">
                            <p>도시락이름</p>
                        </div>
                        <div class="col-8">
                            <input type="text" class="spiner-text" id="quantity" value="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <p>도시락 무게</p>
                        </div>
                        <div class="col-8">
                            <input type="text" class="spiner-text" id="quantity" value="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <p>도시락 탄수화물</p>
                        </div>
                        <div class="col-8">
                            <input type="text" class="spiner-text" id="quantity" value="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <p>도시락 단백질</p>
                        </div>
                        <div class="col-8">
                            <input type="text" class="spiner-text" id="quantity" value="">
                        </div>
                    </div>
                     <div class="row">
                        <div class="col-4">
                            <p>도시락 지방</p>
                        </div>
                        <div class="col-8">
                            <input type="text" class="spiner-text" id="quantity" value="">
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
</div>            
</body>

</html>