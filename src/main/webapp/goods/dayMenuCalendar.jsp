<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>이달의 식단</title>
        <jsp:include page="../common/header.jsp" />
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- 부트스트랩 CSS CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <!-- 부트스트랩 JS CDN -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
        <script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>

        <style type="text/css">
            section {
                width: 1200px;
                margin: auto;
            }

            #deliCalendar {
                width: 100%;
                table-layout: fixed;
            }

            #deliCalendar th {
                text-align: center;
            }

            #deliCalendar td {
                width: 190px;
                height: 145px;
                padding: 10px 15px;
            }

            .null-date {
                background-color: #f5f5f5;
            }

            #deliCalendar>caption {
                text-align: center;
                margin: 0 0 30px;
            }

            h3 {
                display: inline;
            }

            #prevMonth,
            #nextMonth {
                margin: 0 0 20px;
            }

            #selectBox {
                text-align: right;
            }

            li {
                list-style: none;
                max-width: 240px;
            }

            ul>li:first-child {
                text-align: right;
            }

            tfoot {
                text-align: right;
            }
        </style>

        <script type="text/javascript">
        	var goods
            var meals
            var daymeals
            
            function goodsSelectAll() {
        		$.ajax({
        			url: "${path}/ajax",
        			type: "get",
        			dataType: "json",
        			data: {
        				key: "goods",
        				methodName: "getGoodsSelectForSale"	
        			},
        			success: function (result) {
        				goods = result
        				mealSelectAll()
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
                    }
                })
            }

            function dayMealSelectAll() {
                let month = '4' // TODO: 수정 필요
                $.ajax({
                    url: "${path}/ajax",
                    type: "get",
                    dataType: "json",
                    data: { key: "daymeal", methodName: "dayMealSelectByMonth", month: month },
                    success: function (result) {
                        daymeals = result
                        fillListGroups()
                        fillCalendar()
                    }
                })
            }
            
            function fillListGroups() {
            	for (var idx  in goods) {
            		item = goods[idx]
            		text = "<button type=\"button\" class=\"list-group-item list-group-item-action text-center\" aria-current=\"true\" onclick=\"fillCalendar(\'" + item.goodsId + "\')\">" + item.goodsName + "</button>"
            		$('#goodsListGroup').append(text)
            	}
            }

            function fillModal(mealId) {
                meal = getMealByMealId(mealId)
                /* $('#mealImg').src(meal.mealImg) */
                $('#mealName').text(meal.mealName)
                $('#mealWeight').text(meal.mealWeight)
                $('#mealKcal').text(meal.mealKcal)
                $('#mealCarbo').text(meal.mealCarbo)
                $('#mealProtein').text(meal.mealProtein)
                $('#mealFat').text(meal.mealFat)
            }

            function getMealByMealId(mealId) {
                for (var idx in meals) {
                    item = meals[idx]
                    if (item.mealId === mealId) {
                        return item
                    }
                }
                return ""
            }

            function getMealNameByMealId(mealId) {
                for (var idx in meals) {
                    item = meals[idx]
                    if (item.mealId === mealId) {
                        return item.mealName
                    }
                }
                return ""
            }

            function fillCalendar(goodsId) {
            	printCalendar()
                for (let idx in daymeals) {
                    let item = daymeals[idx]
                    if (item.goodsId === goodsId) {
                    	var day = item.dayMenuDate.substr(item.dayMenuDate.length - 2)
                        mealName = getMealNameByMealId(item.mealId)
                        text = "<button type=\"button\" class=\"btn btn-light w-100\" data-bs-toggle=\"modal\" data-bs-target=\"#mealDetailModal\" onclick=\"fillModal(\'" + item.mealId + "\')\">" + mealName + "</button>"
                        $('#' + day).append(text)	
                    }
                }
            }
            
            function printCalendar() {
                // 날짜, 연도, 월 구하기
                let today = new Date();
                let year = today.getFullYear();
                let month = today.getMonth();
                
                // 월 시작요일 구하기
                startDay = new Date(year, month, 1).getDay();

                // 월 종료일 구하기
                endDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
                endDay = endDays[month];

                week = 5;

                date = 1; // 1일부터 종료일까지 출력할 변수
                start = 0; // 첫 행 시작점 변수

                // 연월 찍기
                let caption = '<button type="button" class="btn btn-link btn-lg shadow-none" id="prevMonth"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/></svg></button>';
                caption += `<h3>\${year}년 \${month + 1}월</h3>`;
                caption += '<button type="button" class="btn btn-link btn-lg shadow-none" id="nextMonth"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/></svg></button>';
                $("#deliCalendar > caption").text("");
                $("#deliCalendar > caption").append(caption);

                let calendar = "";
                // 날짜 찍기
                for (i = 0; i < week; i++) { // tr
                    if (i > 4) break;
                    calendar += "<tr>";
                    for (j = 0; j < 7; j++) { // td
                        if (start < startDay) { // 시작일 이전
                            if (j == 0 || j == 6) {
                                start++;
                            } else {
                                calendar += "<td class='null-date'></td>"
                                start++;
                            }
                        } else if (date > endDay) { // 종료일 이후
                            if (j == 0 || j == 6) {
                            } else {
                                calendar += "<td class='null-date'></td>"
                            }
                        } else {
                            if (j == 0 || j == 6) {
                                date++;
                            } else {
                                paramDay = date;
                                if (paramDay < 10) paramDay = paramDay.toString().padStart(2, '0') + ""
                                calendar += `<td id=\${paramDay}><div class='deliCalendar-date'>` + date + "</div></td>";
                                date++;
                            }
                        }
                    }
                    calendar += "</tr>";
                }
                $("#deliCalendar > tbody").children().remove();
                $("#deliCalendar > tbody").append(calendar);
            }

            $(function () {
                // 이전 달로 이동
                $(document).on("click", "#prevMonth", function () {
                    if (month == 0) {
                        year -= 1;
                        month = 11;
                    } else {
                        month -= 1;
                    }
                    printCalendar();
                    printDeli();
                })

                // 다음 달로 이동
                $(document).on("click", "#nextMonth", function () {
                    if (month == 11) {
                        year += 1;
                        month = 0;
                    } else {
                        month += 1;
                    }
                    printCalendar();
                    printDeli();
                })

                printCalendar();
                goodsSelectAll();
            })

        </script>
        <script type="text/javascript">
            $()
        </script>

    </head>

    <body>
        <section>
            <h1>이달의 식단</h1>

            <div class="list-group list-group-horizontal" id="goodsListGroup">
            </div>

            <table class="table table-bordered caption-top" id="deliCalendar">
                <caption> <img alt="" src=""> </caption>
                <thead>
                    <tr>
                        <th>월</th>
                        <th>화</th>
                        <th>수</th>
                        <th>목</th>
                        <th>금</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </section>


        <div id="mealDetailModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="mealName"></h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-6">
                                <img id="mealImage">
                                <!-- 썸네일 이미지 -->
                            </div>
                            <div class="col-6">
                                <div class="row">
                                    <div class="col-4">
                                        <p>도시락 무게</p>
                                    </div>
                                    <div class="col-8">
                                        <p id=mealWeight></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4">
                                        <p>도시락 칼로리</p>
                                    </div>
                                    <div class="col-8">
                                        <p id=mealKcal></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4">
                                        <p>도시락 탄수화물</p>
                                    </div>
                                    <div class="col-8">
                                        <p id=mealCarbo></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4">
                                        <p>도시락 단백질</p>
                                    </div>
                                    <div class="col-8">
                                        <p id=mealProtein></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4">
                                        <p>도시락 지방</p>
                                    </div>
                                    <div class="col-8">
                                        <p id=mealFat></p>
                                    </div>
                                </div>
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

    </body>

    </html>