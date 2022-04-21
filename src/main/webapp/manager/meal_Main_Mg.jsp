<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!doctype html>
    <html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>도시락관리 페이지</title>
		<jsp:include page="../common/sidebar.jsp"/>
        <!-- 부트스트랩 CSS CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <!-- 부트스트랩 JS CDN -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>


        <script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>


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

        <script type="text/javascript">
            function fillUpdateModal(mealId, goodsId, mealName, mealWeight, mealKcal, mealCarbo, mealProtein, mealFat, mealImg, mealSale) {
                $('#updateMealId').text(mealId)
                $('#updateMealIdHidden').val(mealId)
                $('#updateGoodsIdHidden').val(goodsId)
                $('#updateMealName').val(mealName)
                $('#updateMealWeight').val(mealWeight)
                $('#updateMealKcal').val(mealKcal)
                $('#updateMealCarbo').val(mealCarbo)
                $('#updateMealProtein').val(mealProtein)
                $('#updateMealFat').val(mealFat)
                $('#updateMealImg').val(mealImg)
                $('#updateMealSale').val(mealSale)
            }

            function fillTable(result) {
                let text = "";
                $.each(result, function (index, item) {
                    text += "<tr>"
                    text += '<td>' + item.mealId + '</td>';
                    text += '<td>' + item.goodsId + '</td>';
                    text += '<td>' + item.mealName + '</td>';
                    text += '<td>' + item.mealWeight + '</td>';
                    text += '<td>' + item.mealKcal + '</td>';
                    text += '<td>' + item.mealCarbo + '</td>';
                    text += '<td>' + item.mealProtein + '</td>';
                    text += '<td>' + item.mealFat + '</td>';
                    text += '<td> <img src=\"' + item.mealImg + "\"></td>";
                    text += '<td>' + item.mealSale + '</td>';
                    text += "<td><button type=\"button\" class=\"btn btn-primary\" data-bs-toggle=\"modal\" data-bs-target=\"#updateMealModal\" onclick=\"fillUpdateModal(\'" + item.mealId + "\', \'" + item.goodsId + "\', \'" + item.mealName + "\', " + item.mealWeight + ", " + item.mealKcal + ", " + item.mealCarbo + ", " + item.mealProtein + ", " + item.mealFat + ", \'" + item.mealImg + "\', \'" + item.mealSale + "\')\">수정</button></td>";
                    text += '</tr>';
                });
                $("#mealTable tr:gt(0)").remove();
                $("#mealTable tbody").append(text);
            }

            /*도시락 가져오기*/
            function mealSelectAll() {
                $.ajax({
                    url: "${path}/ajax",
                    type: "get",
                    dataType: "json",
                    data: { key: "meal", methodName: "getMealList" },
                    success: function (result) {
                        fillTable(result)
                    }
                })
            }

            /* 상품추가 */
            function mealInsert() {
                /* mealID, goodsId, mealName, mealWeight, mealKcal, mealCarbo, mealProtein, mealFat, mealImg, mealSale */
                let mealId = $("#mealId").val()
                goodsId = $("#goodsId").val()
                mealName = $("#mealName").val()
                mealWeight = $("#mealWeight").val()
                mealKcal = $("#mealKcal").val()
                mealCarbo = $("#mealCarbo").val()
                mealProtein = $("#mealProtein").val()
                mealFat = $("#mealFat").val()
                mealImg = $("#mealImg").val()
                mealSale = $("#mealSale").val()

                let data = {
                    key: "meal",
                    methodName: "getMealInsert",
                    mealId: mealId,
                    goodsId: goodsId,
                    mealName: mealName,
                    mealWeight: mealWeight,
                    mealKcal: mealKcal,
                    mealCarbo: mealCarbo,
                    mealProtein: mealProtein,
                    mealFat: mealFat,
                    mealImg: mealImg,
                    mealSale: mealSale
                }
                $.ajax({
                    url: "${path}/ajax",
                    type: "post",
                    data: data,
                    success: function (result) {
                        location.reload()
                    }
                })
            }

            /*상품 수정하기*/
            function mealUpdate() {
                let mealId = $("#updateMealIdHidden").val()
                goodsId = $("#updateGoodsIdHidden").val()
                mealName = $("#updateMealName").val()
                mealWeight = $("#updateMealWeight").val()
                mealKcal = $("#updateMealKcal").val()
                mealCarbo = $("#updateMealCarbo").val()
                mealProtein = $("#updateMealProtein").val()
                mealFat = $("#updateMealFat").val()
                mealImg = $("#updateMealImg").val()
                mealSale = $("#updateMealSale").val()
                $.ajax({
                    url: "${path}/ajax",
                    type: "post",
                    data: {
                        key: "meal",
                        methodName: "getMealUpdate",
                        mealId: mealId,
                        goodsId: goodsId,
                        mealName: mealName,
                        mealWeight: mealWeight,
                        mealKcal: mealKcal,
                        mealCarbo: mealCarbo,
                        mealProtein: mealProtein,
                        mealFat: mealFat,
                        mealImg: mealImg,
                        mealSale: mealSale
                    },
                    success: function (result) {
                        //console.log('들어오냐')
                        location.reload()
                    }
                })
            }

            /*판매중인것들만 조회*/
            function mealSelectByForSale() {
                let sale = $("#mealSelectByForSale").val()
                let methodName = ''
                if (sale === '전체조회') {
                    methodName = 'getMealList'
                } else {
                    methodName = 'getMealSelectForSale'
                }

                $.ajax({
                    url: "${path}/ajax",
                    type: "get",
                    dataType: "json",
                    data: { key: "meal", methodName: methodName },
                    success: function (result) {
                        fillTable(result)
                    }
                })
            }

            /*상품이름으로 검색하기*/
            function mealSelectByKeyword() {
                let keyword = $("#searchkeyword").val()
                $.ajax({
                    url: "${path}/ajax",
                    type: "get",
                    dataType: "json",
                    data: { key: "meal", methodName: "mealSelectByMealId", keyword: keyword },

                    success: function (result) {
                        fillTable(result)
                    }
                })
            }

            $(function () {
                if (window.location.href.endsWith('.jsp')) {
                    window.location.href = '${path}/front?key=meal&methodName=mealSelectAll';
                }
                mealSelectAll();
            })
        </script>

    </head>

    <body>
        <div style="width: 100%; padding: 100px 50px 100px 250px;">
            <div class="container-fluid overflow-scroll">
                <div class="row">
                    <div class="row container-fluid">
                        <div class="col-9 text-center">
                            <h2>도시락관리 페이지</h2>
                        </div>
                        <div class="col-3">
                            <!-- select box -->
                            <select class="selectpicker" id="mealSelectByForSale">
                                <option>전체조회</option>
                                <option>판매중</option>
                            </select>
                            <button type="button" class="btn btn-primary" onclick="mealSelectByForSale()">조회</button>
                        </div>
                        <div>
                            <input type="text" class="spiner-text" id="searchkeyword" value="도시락 검색">
                            <button type="button" class="btn btn-primary" onclick="mealSelectByKeyword()">검색</button>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-sm" id="mealTable">
                            <thead>
                                <tr>
                                    <th scope="col">도시락ID</th>
                                    <th scope="col">상품ID</th>
                                    <th scope="col">도시락이름</th>
                                    <th scope="col">도시락_무게</th>
                                    <th scope="col">도시락_칼로리</th>
                                    <th scope="col">도시락_탄수화물</th>
                                    <th scope="col">도시락_단백질</th>
                                    <th scope="col">도시락_지방</th>
                                    <th scope="col">도시락_사진</th>
                                    <th scope="col">도시락_판매여부</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-2 float-right">
                        <button type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal"
                            data-bs-target="#addMealModal">+</button>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="addMealModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">상품 추가하기</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-4">
                                    <p>도시락 ID</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="mealId" value="1">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>상품 카테고리</p>
                                </div>
                                <div class="col-8">
                                    <!-- select box -->

                                    <select class="selectpicker" id="goodsId">
                                        <option value="JUNG01">정성한상</option>
                                        <option value="VEGAN01">비건 식단</option>
                                        <option value="SIG01">시그니처</option>
                                        <option value="RICE01">300 덮밥</option>
                                    </select>
                                </div>
                                <div class="col-4">
                                    <p>도시락이름</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="mealName" value="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>도시락 무게</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="mealWeight" value="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>도시락 칼로리</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="mealKcal" value="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>도시락 탄수화물</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="mealCarbo" value="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>도시락 단백질</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="mealProtein" value="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>도시락 지방</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="mealFat" value="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>도시락 사진 등록</p>
                                </div>
                                <div class="col-8">

                                    <button type="button" class="btn btn-primary" id="mealThumbnail">이미지 선택하기</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>도시락 판매여부</p>
                                </div>
                                <div class="col-8">
                                    <select class="selectpicker" id="mealSale">
                                        <option>Y</option>
                                        <option>N</option>
                                    </select>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" data-dismiss="modal" id="mealInsert"
                                        onclick="mealInsert()">등록</button>
                                    <button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>


            <!-- 수정 모달 -->
            <div id="updateMealModal" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">도시 수정하기</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-4">
                                    <p>도시락ID</p>
                                </div>
                                <div class="col-8">
                                    <p id="updateMealId"></p>
                                    <input type="hidden" class="spiner-text" id="updateMealIdHidden" value="">
                                </div>
                            </div>
                            <input type="hidden" class="spiner-text" id="updateGoodsIdHidden" value="">
                            <div class="row">
                                <div class="col-4">
                                    <p>도시락 이름</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="updateMealName" value="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>도시락 무게</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="updateMealWeight" value="1일/1식">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>도시락 칼로리</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="updateMealKcal" value="1일/1식">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>도시락 탄수화물</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="updateMealCarbo" value="1일/1식">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>도시락 단백질</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="updateMealProtein" value="1일/1식">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4">
                                    <p>도시락 지방</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="updateMealFat" value="1일/1식">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>도시락 사진 수정</p>
                                </div>
                                <div class="col-8">
                                    <button type="button" class="btn btn-default" id="updateMealImg">이미지
                                        선택하기</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>도시락 판매여부</p>
                                </div>
                                <div class="col-8">
                                    <select class="selectpicker" id="updateMealSale">
                                        <option>Y</option>
                                        <option>N</option>
                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" onclick="mealUpdate()">등록</button>
                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

    </html>