<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!doctype html>
    <html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>식단관리</title>
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
        </style>
        <script type="text/javascript">
            var meals
            function fillUpdateModal(dayMenuId, goodsId, mealId, dayMenuDate) {
                $('#updateDayMenuId').text(dayMenuId)
                $('#updateDayMenuIdHidden').val(dayMenuId)
                $('#updateGoodsId').text(getGoodsIdByMealId(mealId))
                $('#updateGoodsIdHidden').val(getGoodsIdByMealId(mealId))
                $('#updateMealName').text(getMealNameByMealId(mealId))
                $('#updateMealNameHidden').val(getMealNameByMealId(mealId))
                $('#updateDayMenuDate').val(dayMenuDate)

                text = ""
                $.each(meals, function (index, item) {
                    if (item.mealId.charAt(0) === mealId.charAt(0)) {
                        text += "<option value=\"" + item.mealId + "\">" + item.mealId + "</option>"
                    }
                });
                $("#updateMealId").empty();
                $("#updateMealId").append(text);
                $('#updateMealId').val(mealId)
            }

            function getMealNameByMealId(mealId) {
                for (var idx in meals) {
                    item = meals[idx]
                    console.log(item)
                    if (item.mealId === mealId) {
                        return item.mealName
                    }
                }
                return ""
            }

            function getGoodsIdByMealId(mealId) {
                for (var idx in meals) {
                    item = meals[idx]
                    if (item.mealId === mealId) {
                        return item.goodsId
                    }
                }
                return ""
            }

            function fillTable(result) {
                let text = "";
                $.each(result, function (index, item) {
                    text += "<tr>"
                    text += '<td>' + item.dayMenuId + '</td>'
                    text += '<td>' + item.goodsId + '</td>'
                    text += '<td>' + item.mealId + '</td>'
                    text += '<td>' + getMealNameByMealId(item.mealId) + '</td>'
                    text += '<td>' + item.dayMenuDate + '</td>';
                    text += "<td><button type=\"button\" class=\"btn btn-primary\" data-bs-toggle=\"modal\" data-bs-target=\"#updateDayMealModal\" onclick=\"fillUpdateModal(" + item.dayMenuId + ", \'" + item.goodsId + "\', \'" + item.mealId + "\', \'" + item.dayMenuDate + "\')\">수정</button></td>";
                    text += '</tr>';
                });
                $("#dayMealTable tr:gt(0)").remove();
                $("#dayMealTable tbody").append(text);
            }

            function dayMealSelectAll() {
                $.ajax({
                    url: "${path}/ajax",
                    type: "get",
                    dataType: "json",
                    data: { key: "daymeal", methodName: "dayMealSelectAll"},
                    success: function (result) {
                        fillTable(result)
                    }
                })
            }

            function mealSelectAll() {
                $.ajax({
                    url: "${path}/ajax",
                    type: "get",
                    dataType: "json",
                    data: { key: "meal", methodName: "getMealList" },
                    success: function (result) {
                        meals = result
                        dayMealSelectAll()
                        text = ""
                        $.each(result, function (index, item) {
                            text += "<option value=\"" + item.mealId + "\">" + item.mealName + "</option>"
                        });
                        $("#mealId").append(text);
                    }
                })
            }

            function dayMealInsert() {
                let dayMenuId = $('#dayMenuId').val()
                goodsId = $('#goodsId').val()
                mealId = $('#mealId').val()
                dayMenuDate = $('#dayMenuDate').val()

                $.ajax({
                    url: "${path}/ajax",
                    type: "post",
                    data: {
                        key: 'daymeal',
                        methodName: 'dayMealInsert',
                        dayMenuId: dayMenuId,
                        goodsId: goodsId,
                        mealId: mealId,
                        dayMenuDate: dayMenuDate
                    }
                    ,
                    success: function (result) {
                        location.reload()
                    }
                })
            }

            /*식단 수정하기*/
            function dayMealUpdate() {
                let dayMenuId = $('#updateDayMenuIdHidden').val()
                mealId = $('#updateMealId').val()
                dayMenuDate = $('#updateDayMenuDate').val()

                $.ajax({
                    url: "${path}/ajax",
                    type: "post",
                    data: {
                        key: "daymeal",
                        methodName: "dayMealUpdate",
                        dayMenuId: dayMenuId,
                        mealId: mealId,
                        dayMenuDate: dayMenuDate
                    },
                    success: function (result) {
                        location.reload()
                    }
                })
            }

            $(function () {
                if (window.location.href.endsWith('.jsp')) {
                    window.location.href = '${path}/front?key=daymeal&methodName=getDayMealList';
                }
                mealSelectAll()
            })
        </script>
    </head>

    <body>
        <section style="width: 100%; padding: 100px 50px 100px 250px;">
            <div class="container-fluid">
                <div class="row">
                    <div class="table-responsive">
                        <table class="table table-striped table-sm" id="dayMealTable">
                            <thead>
                                <tr>
                                    <th scope="col">식단번호</th>
                                    <th scope="col">상품ID</th>
                                    <th scope="col">도시락ID</th>
                                    <th scope="col">도시락이름</th>
                                    <th scope="col">날짜</th>
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
                        <button type="button" class="btn btn-info btn-lg" data-bs-toggle="modal"
                            data-bs-target="#addDayMealModal">+</button>
                    </div>
                </div>
            </div>


            <div id="updateDayMealModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">월간 식단 수정</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-4">
                                    <p>식단 번호</p>
                                </div>
                                <div class="col-8">
                                    <p id="updateDayMenuId"></p>
                                    <input type="hidden" class="spiner-text" id="updateDayMenuIdHidden" value="1">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>상품ID</p>
                                </div>
                                <div class="col-8">
                                    <p id="updateGoodsId"></p>
                                    <input type="hidden" class="spiner-text" id="updateGoodsIdHidden" value="1">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>도시락ID</p>
                                </div>
                                <div class="col-8">
                                    <select class="selectpicker" id="updateMealId">
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>도시락 이름</p>
                                </div>
                                <div class="col-8">
                                    <p id="updateMealName"></p>
                                    <input type="hidden" class="spiner-text" id="updateMealNameHidden" value="1">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>날짜 입력</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="updateDayMenuDate" value="YYYY/MM/DD">
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal"
                                    onclick="dayMealUpdate()">등록</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div id="addDayMealModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">월간 식단 추가</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-4">
                                    <p>식단 번호</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="dayMenuId" value="1">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <p>도시락명</p>
                                </div>
                                <div class="col-8">
                                    <select class="selectpicker" id="mealId">
                                    </select>
                                </div>
                            </div>
                            <!-- <div class="row">
                    <div class="col-4">
                        <p>도시락 이름</p>
                    </div>
                    <div class="col-8">
                        <input type="text" class="spiner-text" id="quantity" value="1">
                    </div>
                </div> -->
                            <div class="row">
                                <div class="col-4">
                                    <p>날짜 수정</p>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="spiner-text" id="dayMenuDate" value="YYYY/MM/DD">
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal"
                                    onclick="dayMealInsert()">등록</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
    </body>

    </html>