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
    <title>미미미</title>

    <style>
        .wrap {
            width: 900px;
            margin: 10px auto;
        }
    </style>
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <div class="row container-fluid">
                <div class="col-9 text-center">
                    <h2>2022.04</h2>
                </div>
                <div class="col-3">
                    <!-- select box -->

                    <select class="selectpicker">
                        <option>상품명순</option>
                        <option>날짜순</option>
                    </select>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                        <tr>
                            <th scope="col">식단번호</th>
                            <th scope="col">상품카테고리</th>
                            <th scope="col">도시락ID</th>
                            <th scope="col">도시락명</th>
                            <th scope="col">날짜</th>       
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>맛있는 한식</td>
                            <td>2022.04.20</td>
                            <td>H01</td>
                            <td>김치볶음밥</td>
                            <td>3000원</td>
                            <td><button type="button" class="btn btn-default" data-dismiss="modal">수정</button></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>맛있는 한식</td>
                            <td>2022.04.20</td>
                            <td>H01</td>
                            <td>김치볶음밥</td>
                            <td>3000원</td>
                            <td><button type="button" class="btn btn-default" data-dismiss="modal">수정</button></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>맛있는 한식</td>
                            <td>2022.04.20</td>
                            <td>H01</td>
                            <td>김치볶음밥</td>
                            <td>3000원</td>
                            <td><button type="button" class="btn btn-default" data-dismiss="modal">수정</button></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>맛있는 한식</td>
                            <td>2022.04.20</td>
                            <td>H01</td>
                            <td>김치볶음밥</td>
                            <td>3000원</td>
                            <td><button type="button" class="btn btn-default" data-dismiss="modal">수정</button></td>
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
                    <h4 class="modal-title">월간 식단 입력</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-4">
                            <p>상품명</p>
                        </div>
                        <div class="col-8">
                            <!-- select box -->

                            <select class="selectpicker">
                                <option>주 5회 (월~금)</option>
                                <option>주 3회 (월/수/금)</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <p>도시락명</p>
                        </div>
                        <div class="col-8">

                            <select class="selectpicker">
                                <option>주 5회 (월~금)</option>
                                <option>주 3회 (월/수/금)</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <p>날짜</p>
                        </div>
                        <div class="col-8">

                            <select class="selectpicker">
                                <option>주 5회 (월~금)</option>
                                <option>주 3회 (월/수/금)</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <p>무게</p>
                        </div>
                        <div class="col-8">

                            <select class="selectpicker">
                                <option>주 5회 (월~금)</option>
                                <option>주 3회 (월/수/금)</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <p>탄수화물</p>
                        </div>
                        <div class="col-8">
                            <input type="text" class="spiner-text" id="quantity" value="1">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <p>단백질</p>
                        </div>
                        <div class="col-8">
                            <input type="text" class="spiner-text" id="quantity" value="1">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <p>지방</p>
                        </div>
                        <div class="col-8">
                            <input type="text" class="spiner-text" id="quantity" value="1">
                        </div>
                    </div>
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