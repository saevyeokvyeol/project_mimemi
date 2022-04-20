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
            #write-btn{
                background-color: cornflowerblue;
                border: 1px solid cornflowerblue;
                border-radius: 15px;
                color: white;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                font-weight: bold;
                float:right;
            }
            #write-btn:hover{
                background-color: rgb(76, 132, 236);
                border: 1px solid rgb(76, 132, 236);
                color: white;
            }
            .review-search-box{
                display: inline-block;
                text-align: center;
            }
            select{
                width: 130px;
                height: 35px;
                background-color: white;
                padding: 5px;
                border-radius: 4px;
                border: 2px solid cornflowerblue;
                color: cornflowerblue;
            }
            select option{
                background-color: cornflowerblue;
                color: white;
                padding: 5px;
            }
            select icoArrow{
                border-left: 2px solid cornflowerblue;
                transition: .3s;
                width: 50%;
            }
            #review_sort_select{
            	float:right;
            }
            .review-search-keyword{
                border-radius: 4px;
                padding: 5px;
                width: 150px;
                height: 35px;
                border: 2px solid gray;
                color: gray;
                margin: 0px 5px 0px 10px;
            }
            .btn-search-submit{
                width: 50px;
                height: 35px;
                background-color: cornflowerblue;
                padding: 5px;
                border-radius: 4px;
                border: 2px solid cornflowerblue;
                color: white;
            }
            
       </style>
        
        
    </head>
    <body>
        <div class="container">
            <div class="review-title">
                <h3>후기 게시판</h3>
            </div>
            <!--정렬 카테고리-->
            <nav class="navbar navbar-light bg-light">
                <div class="review-sort-area">
                    <select name="review_sort_select" id="review_sort_select">
                        <option name="review_sort" value="0" selected='selected'>정렬방식</option>
                        <option name="review_sort" value="reg">등록순</option>
                        <option name="review_sort" value="higirate">별점 높은순</option>
                        <option name="review_sort" value="rowrate">별점 낮은순</option>
                        <option name="review_sort" value="view">조회순</option>
                    </select>
                </div>
            </nav>
            <!--후기 리스트-->
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
                                        <th><span>${review.reviewNo}</span></th>
                                        <th>
                                            <c:if test="${not empty review.reviewAttach}">
                                                <span class="review-list-img-preview-area">
                                                    <img src="${path}/img/save/${review.reviewAttach}" alt="후기 이미지입니다." id="review-list-img-preview"></span>
                                            </c:if>
                                            <span class="review-list-img-preview-empty-area"></span>
                                        </th>
                                        <th><span>${review.goodsDTO.goodsName}</span></th>
                                        <td><span class="review-list-content-link"><a href="${path}/front?key=review&methodName=selectByReviewNo&reviewNo=${review.reviewNo}">${review.reviewTitle}</a></span></td>
                                        <th><span>${review.userId.substring(0,4)}****</span></th>
                                        <th><span>${review.reviewRegdate}</span></th>
                                        <th>
                                            <c:choose>
                                                <c:when test="${review.reviewRate eq 1}"><img src="${path}/img/ui/starRate1.jpg" class="starRateImg"></c:when>
                                                <c:when test="${review.reviewRate eq 2}"><img src="${path}/img/ui/starRate2.jpg" class="starRateImg"></c:when>
                                                <c:when test="${review.reviewRate eq 3}"><img src="${path}/img/ui/starRate3.jpg" class="starRateImg"></c:when>
                                                <c:when test="${review.reviewRate eq 4}"><img src="${path}/img/ui/starRate4.jpg" class="starRateImg"></c:when>
                                                <c:when test="${review.reviewRate eq 5}"><img src="${path}/img/ui/starRate5.jpg" class="starRateImg"></c:when>
                                            </c:choose>
                                        </th>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
            
            <!--리뷰쓰기/검색하기-->
            <nav class="navbar navbar-light bg-light">
                <div class="reivew-wirte-bnt">
                    <span class="write-bnt"><a href="${path}/board/reviewWrite.jsp" id="write-btn">후기 작성하기</a></span>
                </div>
                <div class="review-search-box">
                    <form class="form-inline" action="${path}/front?key=review&methodName=selectByKeyword" method="post">
                        <select name="field" id="review_search_sort_select">
                            <option name="review_search_sort" value="title">제목</option>
                            <option name="review_search_sort" value="content">내용</option>
                        </select>
                        <input class="review-search-keyword" name="keyword" type="text" placeholder="Search" aria-label="Search">
                        <button class="btn-search-submit" type="submit" >검색하기</button>
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