<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <jsp:include page="../common/header.jsp"/>
        <!-- jQuery -->        
        <script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
         <!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
		integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        
        
        
        
        <script>
        	$(function(){
        		$("#review_sort_select").change(function(){
        			if($(this).val() != "0"){
        				let url =`${path}/front?key=review&methodName=selectAll&field=` + $(this).val();
        				location.replace(url);
        			}
        		})
        	})
        	
        </script>
        <style>
           
            .review-view{
                width: 1200px; margin: auto; padding: 50px 0;
            }
            .thead-dark th { text-align: center;}
            
            .review-table td:first-child {width: 50px; text-align: center;}
            .review-table td:nth-child(2),
            .review-table td:nth-child(4),
            .review-table td:nth-child(5),
            .review-table td:nth-child(6) {width: 150px; text-align: center;}
            
            .review-table td{
                vertical-align: middle;
            }
            
            .review-table svg {padding-bottom: 3px;}
            
            img.starRateImg{
                width:70px; padding-bottom: 10px;
            }
            
            .selectbar {display: flex; justify-content: space-between; padding-bottom: 15px;}
            .selectbar h1 {display: inline;}
            .selectbar select {width: 200px; height:38px; display: inline;}
            
            .form-inline .form-select {width: 100px;}
            body > div > nav.navbar > div.review-search-box > form > input {margin: 0 5px;}
            
       </style>
        
        
    </head>
    <body>
        <div class="review-view">
            <!--정렬 카테고리-->
            <nav class="selectbar">
                <h1>후기 게시판</h1>
                <select class="form-select" name="review_sort_select" id="review_sort_select">
                    <option name="review_sort" value="0" selected='selected'>정렬방식</option>
                    <option name="review_sort" value="reg">등록순</option>
                    <option name="review_sort" value="higirate">별점 높은순</option>
                    <option name="review_sort" value="rowrate">별점 낮은순</option>
                    <option name="review_sort" value="view">조회순</option>
                </select>
            </nav>
            <!--후기 리스트-->
            <div class="review-list">
                <table class="table review-table">
                    <thead class="thead-dark">
                        <tr>
                        <th scope="col"></th>
                        <th scope="col">상품</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">날짜</th>
                        <th scope="col">별점</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test ="${empty requestScope.list}">
                                <tr>
                                    <th colspan="7">
                                        <span class="review-result-empty"> 등록된 후기가 없습니다.</span>
                                    </th>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${requestScope.list}" var="review">
                                    <tr>
                                        <td><span>${review.reviewNo}</span></td>
                                        <td><span>${review.goodsDTO.goodsName}</span></td>
                                        <td>
                                            <a href="${path}/front?key=review&methodName=selectByReviewNo&reviewNo=${review.reviewNo}">${review.reviewTitle}</a>
                                            <c:if test="${not empty review.reviewAttach}">
	                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-card-image" viewBox="0 0 16 16">
												  <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
												  <path d="M1.5 2A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13zm13 1a.5.5 0 0 1 .5.5v6l-3.775-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12v.54A.505.505 0 0 1 1 12.5v-9a.5.5 0 0 1 .5-.5h13z"/>
												</svg>
                                           </c:if>
                                        </td>
                                        <td><span>${review.userId.substring(0,4)}****</span></td>
                                        <td><span>${review.reviewRegdate}</span></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${review.reviewRate eq 1}"><img src="${path}/img/ui/starRate1.jpg" class="starRateImg"></c:when>
                                                <c:when test="${review.reviewRate eq 2}"><img src="${path}/img/ui/starRate2.jpg" class="starRateImg"></c:when>
                                                <c:when test="${review.reviewRate eq 3}"><img src="${path}/img/ui/starRate3.jpg" class="starRateImg"></c:when>
                                                <c:when test="${review.reviewRate eq 4}"><img src="${path}/img/ui/starRate4.jpg" class="starRateImg"></c:when>
                                                <c:when test="${review.reviewRate eq 5}"><img src="${path}/img/ui/starRate5.jpg" class="starRateImg"></c:when>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
            
            <!--리뷰쓰기/검색하기-->
            <nav class="navbar">
                <div class="reivew-wirte-bnt">
                    <span class="write-bnt"><a href="${path}/board/reviewWrite.jsp" id="write-btn" class="btn btn-outline-dark shadow-none">후기 작성하기</a></span>
                </div>
                <div class="review-search-box">
                    <form class="form-inline" action="${path}/front?key=review&methodName=selectByKeyword" method="post">
                        <select name="field" id="review_search_sort_select"  class="form-select">
                            <option name="review_search_sort" value="title">제목</option>
                            <option name="review_search_sort" value="content">내용</option>
                        </select>
                        <input class="form-control" name="keyword" type="text" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-dark shadow-none" type="submit" >검색하기</button>
                    </form>
                </div>
            </nav>
            <!-- 페이징 처리 -->
            <nav aria-label="Page navigation example">
				<jsp:useBean class="mimemi.mvc.paging.PageCnt" id="p"/> 
				<c:set var="isLoop" value="false"/>
				
				<c:set var="temp" value="${(pageNum - 1) % p.blockcount}"/>
				<c:set var="startPage" value="${pageNum - temp}"/>
				<ul class="pagination justify-content-center">
					<c:if test="${(startPage - p.blockcount) > 0}">
						<li class="page-item"><a class="page-link" href="${path}/front?key=review&methodName=selectByKeyword&pageNum=${startPage-1}&field=${requestScope.field}&keyword=${requestScope.keyword}">이전</a></li>
					</c:if>
					<c:forEach var='i' begin='${startPage}' end='${(startPage-1) + p.blockcount}'> 
						<c:if test="${(i-1) >= p.pageCnt}">
							<c:set var="isLoop" value="true"/>
						</c:if> 
						<c:if test="${not isLoop}" >
							<li class="page-item ${i == pageNum ? ' active' : page}"><a class="page-link page_num" href="${path}/front?key=review&methodName=selectByKeyword&pageNum=${i}&field=${requestScope.field}&keyword=${requestScope.keyword}">${i}</a></li> 
						</c:if>
					</c:forEach>
					<c:if test="${(startPage + p.blockcount) <= p.pageCnt}">
						<li class="page-item"><a class="page-link" href="${path}/front?key=review&methodName=selectByKeyword&pageNum=${startPage+p.blockcount}&field=${requestScope.field}&keyword=${requestScope.keyword}">이후</a></li>
					</c:if>
				</ul>
			</nav>
            
        </div>
    </body>
    <jsp:include page="../common/footer.jsp"/>
</html>