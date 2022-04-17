<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <style>
            div{
                width: 1000px;
                margin: auto;
                text-align: center;
            }
            table {
                width: 800px;
                margin: 10px,0px,10px,0px;
                border-collapse: collapse;
            }
            th,td{
                border: 1px black solid;
                padding: 10px;
            }
            .container{
                width: 1200px;
            }
            div.review-title{
                text-align: left;
            }
            div.review-sort-area{
                text-align: right;
                
            }
            #review-list-img-preview{
                width: 50px;
                height: auto;
            }
            div.reivew-wirte-bnt{
                text-align: right;
            }
            span.review-list-img-preview-empty-area{
                width: 50px;
                height: auto;
            }
           
        </style>
        <!--부트스트랩 CSS CDN-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
                
        <!--부트스트랩 JS CDN-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
        </script>
        
        
        
    </head>
    <body>
        <div class="container">
            <div class="review-title">
                <h1>후기 게시판</h1>
                <hr>
            </div>

            <div class="review-sort-area">
                 <!-- 조회수, 등록순, 댓글순, 별점순(낮은순+높은순)-->
                <select name="review_sort_select" id="review_sort_select">
                    <option name="review_sort" value="reg" selected='selected'>등록순</option>
                    <option name="review_sort" value="higirate"<c:if test="${requestScope.field == 'higirate'}">selected='selected'</c:if>>별점 높은순</option>
                    <option name="review_sort" value="rowrate"<c:if test="${requestScope.field == 'rowrate'}">selected='selected'</c:if>>별점 낮은순</option>
                    <option name="review_sort" value="view"<c:if test="${requestScope.field == 'view'}">selected='selected'</c:if>>조회순</option>
                    <option name="review_sort" value="reply"<c:if test="${requestScope.field == 'reply'}">selected='selected'</c:if>>댓글순</option>
                </select>
            </div>
           
            <div class="review-list">
                <table id ="review-list-table">
                    <thead>
                        <tr>
                            <th>
                                <span>번호</span> 
                            </th>
                            <th>
                                <span>리뷰이미지</span>
                            </th>
                            <th>
                                <span>상품</span>
                            </th>
                            <th>
                                <span>제목</span>
                            </th>
                            <th>
                                <span>글쓴이</span>
                            </th>
                            <th>
                                <span>날짜</span>
                            </th>
                            <th>
                                <span>별점</span>
                            </th>
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
                                        <td>
                                            <span>${review.reviewNo}</span>
                                        </td>
                                        <td>
                                            <c:if test="${not empty review.reviewAttach}">
                                                <span class="review-list-img-preview-area">
                                                    <img src="${path}/img/save/${review.reviewAttach}" alt="후기 이미지입니다." id="review-list-img-preview"></span>
                                            </c:if>
                                            <span class="review-list-img-preview-empty-area"></span>
                                        </td>
                                        <td>
                                            <span>${review.goodsDTO.goodsName}</span>
                                        </td>
                                        <td>
                                            <span><a href="${path}/front?key=review&methodName=selectByReviewNo&reviewNo=${review.reviewNo}">${review.reviewTitle}</a></span>
                                        </td>
                                        <td>
                                            <span>${review.userDTO.userName}</span>
                                        </td>
                                        <td>
                                            <span>${review.reviewRegdate}</span>
                                        </td>
                                        <td>
                                            <span>${review.reviewRate}</span>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
             </div>
             <!-- 관리자 아이디면 작성불가 메세지 띄워주기 처리해야함-->
            <div class="reivew-wirte-bnt">
                <span class="write-bnt"><a href="${path}/board/reviewWrite.jsp">리뷰쓰기</a></span>
            </div>
            <div class="reivew-search">
                <select name="review_search_sort_select" id="review_search_sort_select">
                    <option name="review_search_sort" value="title">제목</option>
                    <option name="review_search_sort" value="content">내용</option>
                </select>
                <input type="text" name="review_search">
                <input type="button" value="검색하기" id="btn">
            </div>
            <!-- 페이징 처리 -->
            
            <nav aria-label="Page navigation example">
				<jsp:useBean class="mimemi.mvc.paging.PageCnt" id="p"/> 
				<c:set var="isLoop" value="false"/>
				<c:set var="temp" value="${(pageNum - 1) % p.blockcount}"/>
				<c:set var="startPage" value="${pageNum - temp}"/>
				<ul class="pagination justify-content-center">
					<c:if test="${(startPage - p.blockcount) > 0}">
						<li class="page-item"><a class="page-link" href="${path}/front?key=review&methodName=selectAll&pageNum=${startPage-1}">이전</a></li>
					</c:if>
					<c:forEach var='i' begin='${startPage}' end='${(startPage-1) + p.blockcount}'> 
						<c:if test="${(i-1) >= p.pageCnt}">
							<c:set var="isLoop" value="true"/>
						</c:if> 
						<c:if test="${not isLoop}" >
							<li class="page-item ${i == pageNum ? ' active' : ''}"><a class="page-link page_num" href="${path}/front?key=review&methodName=selectAll&pageNum=${i}">${i}</a></li> 
						</c:if>
					</c:forEach>
					<c:if test="${(startPage + p.blockcount) <= p.pageCnt}">
						<li class="page-item"><a class="page-link" href="${path}/front?key=review&methodName=selectAll&pageNum=${startPage+p.blockcount}">이후</a></li>
					</c:if>
				</ul>
			</nav>
        </div>
    </body>
</html>