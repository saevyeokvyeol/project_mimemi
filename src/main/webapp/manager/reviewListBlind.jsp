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
                        <th scope="col">#</th>
                        <th scope="col">First</th>
                        <th scope="col">Last</th>
                        <th scope="col">Handle</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        </tr>
                        <tr>
                        <th scope="row">2</th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                        </tr>
                        <tr>
                        <th scope="row">3</th>
                        <td>Larry</td>
                        <td>the Bird</td>
                        <td>@twitter</td>
                        </tr>
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
                        <li class="page-item"><a class="page-link" href="${path}/front?key=review&methodName=selectAll&pageNum=${startPage-1}">이전</a></li>
                    </c:if>
                    <c:forEach var='i' begin='${startPage}' end='${(startPage-1) + p.blockcount}'> 
                        <c:if test="${(i-1) >= p.pageCnt}">
                            <c:set var="isLoop" value="true"/>
                        </c:if> 
                        <c:if test="${not isLoop}" >
                            <li class="page-item ${i == pageNum ? ' active' : page}"><a class="page-link page_num" href="${path}/front?key=review&methodName=selectAll&pageNum=${i}">${i}</a></li> 
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