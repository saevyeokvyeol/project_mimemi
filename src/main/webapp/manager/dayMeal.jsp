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
    
    <script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
    
    <title>식단관리</title>

    <style>
        .wrap {
            width: 900px;
            margin: 10px auto;
        }
    </style>
    <script type = "text/javascript">
    
    	
    	function fillTable(result) {
    		let text = "";
			$.each(result, function(index, item){
				text+="<tr>"
				text+='<td>' + item.dayMenuId + '</td>'
				text+='<td>' + item.goodsId + '</td>'
				text+='<td>' + item.mealId + '</td>'
				text+='<td>' + item.dayMenuDate + '</td>';
				text+="<td><button type=\"button\" class=\"btn btn-primary\" data-bs-toggle=\"modal\" data-bs-target=\"#updateDayMealModal\" onclick=\"fillUpdateModal(\'" + item.goodsId + "\', \'" + item.goodsName + "\', \'" + item.goodsThumbnail + "\', " + item.goodsPrice + ", \'" + item.goodsSale + "\', \'" + item.goodsDetail + "\')\">수정</button></td>";
				text+='</tr>';
			});
			$("#dayMealTable tr:gt(0)").remove();
			$("#dayMealTable tbody").append(text);
    	}
    	
    	function dayMealSelectAll() {
			let month = '4'
			$.ajax({
				url: "${path}/ajax",
				type: "get",
				dataType: "json",
				data: {key: "daymeal", methodName: "dayMealSelectByMonth", month: month},
				success: function(result) {
					fillTable(result)  						
				}
			})
    	}
    	
    	$(function() {
    		if (window.location.href.endsWith('.jsp')) {
    			window.location.href='${path}/front?key=daymeal&methodName=getDayMealList';	
    		}
    		dayMealSelectAll()
    		
    	})
    </script>
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <div class="row container-fluid">
                <div class="col-9 text-center">
                    <h2>월간식단 관리</h2>
                </div>
                <div class="col-3">
                    <!-- select box -->

                    <select class="selectpicker">
                        <option>상품 카테고리 순</option>
                        <option>날짜순</option>
                    </select>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-sm" id="dayMealTable">
                    <thead>
                        <tr>
                            <th scope="col">식단번호</th>
                            <th scope="col">상품카테고리</th>
                            <th scope="col">도시락ID</th>
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

                <button type="button" class="btn btn-info btn-lg" data-bs-toggle="modal"
                    data-bs-target="#addDayMealModal">+</button>
            </div>
            <!-- 추가 모달 -->

            <!-- selectbox -->


            <!-- inputbox -->



        </div>
    </div>


	<div id="updateDayMealModal" class="modal fade" role="dialog">
	    <div class="modal-dialog">
	
	        <!-- Modal content-->
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title">월간 식단 입력</h4>
	            </div>
	            <div class="modal-body">
	                <div class="row">
	                    <div class="col-4">
	                        <p>상품카테고리</p>
	                    </div>
	                    <div class="col-8">
	                        <!-- select box -->
	
	                        <select class="selectpicker">
	                            <option>정성한상</option>
	                            <option>비건 식단</option>
	                            <option>시그니처</option>
	                            <option>300덮밥</option>
	                        </select>
	                    </div>
	                </div>
	                <div class="row">
	                    <div class="col-4">
	                        <p>도시락ID</p>
	                    </div>
	                    <div class="col-8">
	                        <input type="text" class="spiner-text" id="quantity" value="1">
	                    </div>
	                </div>
	                <div class="row">
	                    <div class="col-4">
	                        <p>도시락 이름</p>
	                    </div>
	                    <div class="col-8">
	                        <input type="text" class="spiner-text" id="quantity" value="1">
	                    </div>
	                </div>
	                <div class="row">
	                    <div class="col-4">
	                        <p>날짜 입력</p>
	                    </div>
	                    <div class="col-8">
	                        <input type="text" class="spiner-text" id="quantity" value="1">
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