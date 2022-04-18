<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        
         <!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
		integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        
        <!-- jQuery -->        
        <script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
        
       <style>
           div{
                width: 1000px;
                margin: auto;
            }
           #review-list-img-preview{
                width: 50px;
                height: 50px;
                object-fit:cover;
            }
            table th{
                text-align: center;
            }
            img.starRateImg{
                width:70px;
                height: auto; 
            }
       </style>
		
        <script>
        	$(function(){
        		$("#review_sort_select").change(function(){
        			if($(this).val() != "0"){
        				let url =`${path}/front?key=review&methodName=selectAllManager&field=` + $(this).val();
        				location.replace(url);
        			}
        		})
        		$("button").click(function(){
        			var target =$(this).attr("name")
        			var status = $(this).val()
        			console.log(status);
        			
        			$.ajax({
                    url: "${path}/front" , //서버요청주소
                    type: "post" , //요청방식 (get,post...)
                    data: {key:"review", methodName:"updateBlind", reviewNo: target, blindStatus: status} , //서버에게 보낼 데이터정보(parameter정보)
                    
                    success: function(result){
                        alert("블라인드 처리되었습니다.")
                        location.reload()
                    },

                    error: function(err){//실패했을 때 콜백함수
                        alert(err+"오류가 발생했습니다.")
                    } 

                    })
        		})
        	})
        </script>
        
        
        
    </head>
    <body>
        <div class="container">
            <div class="review-title">
                <h3>후기 게시판 관리</h3>
            </div>

            <div class="review-sort-area">
                <!-- 조회수, 등록순, 댓글순, 별점순(낮은순+높은순)-->
                <select name="review_sort_select" id="review_sort_select">
                    <option name="review_sort" value="0">--정렬방식--</option>
                    <option name="review_sort" value="reg" selected='selected'>등록순</option>
                    <option name="review_sort" value="higirate">별점 높은순</option>
                    <option name="review_sort" value="rowrate">별점 낮은순</option>
                    <option name="review_sort" value="view">조회순</option>
                </select>
            </div>
            <div class="review-list">
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                        <th scope="col">게시글번호</th>
                        <th scope="col">리뷰이미지</th>
                        <th scope="col">상품</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">날짜</th>
                        <th scope="col">별점</th>
                        <th scope="col">블라인드</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test ="${empty requestScope.list}">
                                <tr>
                                    <th colspan="8">
                                        <span class="review-result-empty"> 등록된 후기가 없습니다.</span>
                                    </th>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${requestScope.list}" var="review">
                                    <tr>
                                        <th>
                                            <span>${review.reviewNo}</span>
                                        </th>
                                        <th>
                                            <c:if test="${not empty review.reviewAttach}">
                                                <span class="review-list-img-preview-area">
                                                    <img src="${path}/img/save/${review.reviewAttach}" alt="후기 이미지입니다." id="review-list-img-preview"></span>
                                            </c:if>
                                            <span class="review-list-img-preview-empty-area"></span>
                                        </th>
                                        <th>
                                            <span>${review.goodsDTO.goodsName}</span>
                                        </th>
                                        <td>
                                            <span><a href="${path}/front?key=review&methodName=selectByReviewNo&reviewNo=${review.reviewNo}">${review.reviewTitle}</a></span>
                                        </td>
                                        <th>
                                            <span>${review.userDTO.userName}</span>
                                        </th>
                                        <th>
                                            <span>${review.reviewRegdate}</span>
                                        </th>
                                        <th>
                                            <c:choose>
                                                <c:when test="${review.reviewRate eq 1}">
                                                    <img src="${path}/img/ui/starRate1.jpg" class="starRateImg">
                                                </c:when>
                                                <c:when test="${review.reviewRate eq 2}">
                                                    <img src="${path}/img/ui/starRate2.jpg" class="starRateImg">
                                                </c:when>
                                                <c:when test="${review.reviewRate eq 3}">
                                                    <img src="${path}/img/ui/starRate3.jpg" class="starRateImg">
                                                </c:when>
                                                <c:when test="${review.reviewRate eq 4}">
                                                    <img src="${path}/img/ui/starRate4.jpg" class="starRateImg">
                                                </c:when>
                                                <c:when test="${review.reviewRate eq 5}">
                                                    <img src="${path}/img/ui/starRate5.jpg" class="starRateImg">
                                                </c:when>
                                            </c:choose>
                                        </th>
                                        <th>
                                            <c:choose>
                                                <c:when test="${review.reviewBlind eq 'F'}">
                                                    <button type="button" class="btn btn-danger" name="${review.reviewNo}" value="F">게시글 숨기기</button>
                                                </c:when>
                                                <c:when test="${review.reviewBlind eq 'T'}">
                                                    <button type="button" class="btn btn-secondary" name="${review.reviewNo}" value="T">블라인드 처리됨</button>
                                                </c:when>
                                            </c:choose>
                                        </th>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
            <nav class="navbar navbar-light bg-light">
            <form class="form-inline">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
            </nav>
                <!-- 페이징 처리 -->
                
            <nav aria-label="Page navigation example">
                <jsp:useBean class="mimemi.mvc.paging.PageCnt" id="p"/> 
                <c:set var="isLoop" value="false"/>
                <c:set var="temp" value="${(pageNum - 1) % p.blockcount}"/>
                <c:set var="startPage" value="${pageNum - temp}"/>
                <ul class="pagination justify-content-center">
                    <c:if test="${(startPage - p.blockcount) > 0}">
                        <li class="page-item"><a class="page-link" href="${path}/front?key=review&methodName=selectAllManager&pageNum=${startPage-1}">이전</a></li>
                    </c:if>
                    <c:forEach var='i' begin='${startPage}' end='${(startPage-1) + p.blockcount}'> 
                        <c:if test="${(i-1) >= p.pageCnt}">
                            <c:set var="isLoop" value="true"/>
                        </c:if> 
                        <c:if test="${not isLoop}" >
                            <li class="page-item ${i == pageNum ? ' active' : page}"><a class="page-link page_num" href="${path}/front?key=review&methodName=selectAllManager&pageNum=${i}">${i}</a></li> 
                        </c:if>
                    </c:forEach>
                    <c:if test="${(startPage + p.blockcount) <= p.pageCnt}">
                        <li class="page-item"><a class="page-link" href="${path}/front?key=review&methodName=selectAllManager&pageNum=${startPage+p.blockcount}">이후</a></li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </body>

</html>