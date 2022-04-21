<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>이벤트 전체 리스트 - 미미미</title>
		<jsp:include page="../common/header.jsp"/>
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<!-- jQuery -->
		<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <!-- jQuery ui -->
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<!-- jQuery ui -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<style type="text/css">
			section {width: 1200px; margin: auto;}
			table {width: 100%;}
			td {padding: 30px;}
			a {color: black;}
		</style>
		<script type="text/javascript">
			$(function(){
				$(".btn-check").click(function() {
					if($(this).val()!=""){
						let url = `${path}/front?key=event&methodName=selectAll&field=` + $(this).val();
						location.replace(url);
					}
				});
				
				$(document).on("click","#insert-btn",function(){   
	                 location.replace('manager/Event_Insert.jsp');
	                
	            })
				
			});
		</script>
	</head>
	<body>
		<section>
			<h1>이벤트 전체</h1>
			<div>
				<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
				  <input type="button" class="btn-check" id="btncheck1" name="" value="preEvent" >
				  <label class="btn btn-outline-primary" for="btncheck1">진행예정</label>
				
				  <input type="button" class="btn-check" id="btncheck2" name="" value="Eventing" >
				  <label class="btn btn-outline-primary" for="btncheck2">진행중</label>
				
				  <input type="button" class="btn-check" id="btncheck3" name="" value="afterEvent" >
				  <label class="btn btn-outline-primary" for="btncheck3">진행완료</label>
				</div>
			</div>
			<table class="" id="">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>첨부파일명</th>
						<th>썸네일</th>
						<th>작성날짜</th>
						<th>이벤트시작일</th>
						<th>이벤트종료일</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${empty requestScope.eventList}">
						<tr>
							<th colspan="10">
								<span>등록된 이벤트가 없습니다. </span>
							</th>
						</tr>
					</c:when>
				
				<c:otherwise>
					<c:forEach items="${requestScope.eventList}" var="event">
                    	<tr>
                        	<td>
                            	${event.eventNo} 
                          	</td>
                            <td>
                                ${event.eventTitle}
                            </td>
                            <td>
                                ${event.eventContent}
                            </td>
                            <td>
                                ${event.eventAttach}
                            </td>
                            <td>
                                ${event.eventImg}
                            </td>
                            <td>
                                ${event.eventRegdate}
                            </td>
                            <td>
                                ${event.eventStartdate}
                            </td>
                            <td>
                                ${event.eventEnddate}
                            </td>
                            <td><a href="${path}/front?key=event&methodName=updateEventForm&eventNo=${event.eventNo}" >수정</a></td>
                            <td><a href="${path}/front?key=event&methodName=delete&eventNo=${event.eventNo}"  >삭제</a></td>
                       </tr>
                	</c:forEach>
				</c:otherwise>
			</c:choose>	
				</tbody>
				<tfoot>
					<div style="text-align: right;">
						<input type="submit" id="insert-btn" value="이벤트등록">
					</div>
				</tfoot>
			</table>
		</section>
		<!-- 페이징 처리 -->
            <nav aria-label="Page navigation example">
				<jsp:useBean class="mimemi.mvc.paging.PageCnt" id="p"/> 
				<c:set var="isLoop" value="false"/>
				<c:set var="temp" value="${(pageNum - 1) % p.blockcount}"/>
				<c:set var="startPage" value="${pageNum - temp}"/>
				<ul class="pagination justify-content-center">
					<c:if test="${(startPage - p.blockcount) > 0}">
						<li class="page-item"><a class="page-link" href="${path}/front?key=event&methodName=selectAll&pageNum=${startPage-1}&field=${requestScope.field}">이전</a></li>
					</c:if>
					<c:forEach var='i' begin='${startPage}' end='${(startPage-1) + p.blockcount}'> 
						<c:if test="${(i-1) >= p.pageCnt}">
							<c:set var="isLoop" value="true"/>
						</c:if> 
						<c:if test="${not isLoop}" >
							<li class="page-item ${i == pageNum ? ' active' : page}"><a class="page-link page_num" href="${path}/front?key=event&methodName=selectAll&pageNum=${i}&field=${requestScope.field}">${i}</a></li> 
						</c:if>
					</c:forEach>
					<c:if test="${(startPage + p.blockcount) <= p.pageCnt}">
						<li class="page-item"><a class="page-link" href="${path}/front?key=event&methodName=selectAll&pageNum=${startPage+p.blockcount}&field=${requestScope.field}">이후</a></li>
					</c:if>
				</ul>
			</nav>
		
	</body>
</html>