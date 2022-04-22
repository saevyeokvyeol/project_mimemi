<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>이벤트 : 미미미</title>
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
			.event-view {width: 1200px; margin: 50px auto;}
			.btn-group {width: 1200px;}
			.event-each {margin: 50px 0;}
			.event-each > ul {width: 100%; margin: -15px; padding: 0; display: flex; flex-wrap: wrap;}
			.event-each > ul > li {flex-basis: 50%; max-width:50%; padding: 15px; list-style: none;}
			.event-each > ul > li > a {width: 100px; clear: both;}
			.event-each > ul > li > a > img {width: 585px; border-radius: 20px;}
			.event-each .event-each-content {padding: 25px 15px;}
			
			.event-view {width: 1000px; margin: 50px auto;}
		</style>
		<script type="text/javascript">
			$(function(){
				$(".evtbtn").click(function() {
					let url = `${path}/front?key=event&methodName=selectAll&field=` + $(this).val();
					location.href = url;
				});
			});
		</script>
	</head>
	<body>
	
		<section class="event-view">
			<div><h1>이벤트</h1></div>
			<table class="table table-hover ask-table" id="askList">
		
			<div class="btn-group btn-group-lg" role="group" aria-label="Basic outlined example">
			  <button type="button" class="btn btn-outline-primary evtbtn" value="preEvent">진행 예정</button>
			  <button type="button" class="btn btn-outline-primary evtbtn" value="Eventing">진행중</button>
			  <button type="button" class="btn btn-outline-primary evtbtn" value="afterEvent">진행 완료</button>
			</div>
		
		<div class="event-each">
			<ul>
				<c:forEach items="${requestScope.eventList}" var="event">
					<li>
						<a href="${path}/front?key=event&methodName=selectByEventNo&eventNo=${event.eventNo}"><img src="${path}/img/save/${event.eventImg}" class="card-img-top" alt="..."></a>
						<div class="event-each-content">
							<h5>${event.eventTitle}</h5>
							<span>이벤트 기간 : ${event.eventStartdate} ~ ${event.eventEnddate}</span>
						</div>
					</li>
				
<%-- 			</div>
			  <div class="card-body">
			    
			    <p class="card-text">${event.eventContent}</p>
			    <a class="btn btn-primary">Go somewhere</a>
			  </div> --%>
				</c:forEach>
			</ul>
		
		</div>
		</table>
	
		
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
		</section>
	</body>
<jsp:include page="../common/footer.jsp"/>
</html>