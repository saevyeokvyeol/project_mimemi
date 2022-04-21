<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
 <head>
	<meta charset="UTF-8">
	<title>공지사항</title>
	<jsp:include page="../common/header.jsp"/>

	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	  

	<style type="text/css">
		.Notice-view {width: 1200px; margin: 50px auto;}
        .Notice-sideview {width: 200px; margin-right: 50px; z-index: 0;}
        .Notice-sideview h3 {margin: 0 0 20px 10px;}
		.Notice-mainview {width: 950px;}
 		.search{background-color:#eeeeee; 
			height : 50px; 
			text-align:center;
			vertical-align:middle;}
		.side-minibar {padding: 0;}
 		.side-minibar > a {font-size: 14px; padding-left: 40px;}		
	</style>
	
	 <script type="text/javascript">
		$(function() {
			function menuActive() {
				$("#${param.field}").attr("class", "list-group-item list-group-item-primary");
			}
			
			menuActive();
		})
	</script>

</head>
	
<body>
	<section class="Notice-view d-flex p-2 bd-highlight">
		<!-- left side -->
		<aside class="Notice-sideview">
			<h3>고객센터</h3>
			<div class="list-group">
				<a href="${path}/front?key=notice&methodName=selectAll"class="list-group-item list-group-item-action active">
					공지사항</a>
				<a href="${path}/front?key=faq&methodName=selectAll" class="list-group-item list-group-item-action" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
					FAQ</a>
				<div class="side-minibar">
					<a href="${path}/front?key=faq&methodName=selectAll&field=cr" class="list-group-item list-group-item-action" id="cr">교환/환불</a>
					<a href="${path}/front?key=faq&methodName=selectAll&field=us" class="list-group-item list-group-item-action" id="us">회원 관련</a>
					<a href="${path}/front?key=faq&methodName=selectAll&field=op" class="list-group-item list-group-item-action" id="op">주문/결제</a>
					<a href="${path}/front?key=faq&methodName=selectAll&field=de" class="list-group-item list-group-item-action" id="de">배송 관련</a>
					<a href="${path}/front?key=faq&methodName=selectAll&field=ec" class="list-group-item list-group-item-action" id="ec">기타</a>
				</div>
				<a href="${path}/front?key=ask&methodName=selectAll" class="list-group-item list-group-item-action">1:1문의</a>
			</div>
		</aside>
		<!-- body -->
		<div class="Notice-mainview"> 
			<div><h1>공지사항</h1></div>
			<!-- 검색하기 -->
			<nav class="navbar navbar-light bg-light">
				<div class="container-fluid">
					<span></span>
					<form class="form-inline" action="${path}/front?key=notice&methodName=selectByKeywordClient"method="post">
						<select name="field" id="notice_search_sort_keyWord" >
							<option name="notice_search_sort" value="title">제목</option>
							<option name="notice_search_sort" value="content">내용</option>
						</select>
						<input class="notice-search-keyWord" name="keyword" type="text" placeholder="Search" aria-label="Search">
						<button class="btn btn-success" type="submit">검색하기</button>
					</form>
				</div>
			</nav>
			  <!--검색하기 기존-->
			<form action="${path}/front?key=notice&methodName=selectByKeywordClient" method="post">
				<div class="search">
					<select name="field" id="notice_search_sort_keyWordCl">
						<option name="notice_search_sort_keyWordCl" value="title">제목</option>
						<option name="notice_search_sort_keyWordCl" value="content">내용</option>
					</select>
					<input class="notice-keyWord-search" name="keyword" type="text" placeholder="Search" aria-label="Search">
					<button type="submit" class="btn btn-success">검색</button>
				</div>
			</form>
			<hr>
			<!--목록-->		
			<table class="table" style="text-align:center" id="noticeList">
				<thead>
					<tr>
					<th>순서</th> 
					<th>제목</th>
					<th>날짜</th>
					</tr>
				</thead>
				<tbody>
					<section class="noticeList-main">
						<c:choose>
							<c:when test="${empty NoticeList}">
								<tr>
									<td colspan="6">공지사항이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${NoticeList}" var="notice">
								<tr>
									<td>${notice.noticeNo}</td>
									<td><span><a href="${path}/front?key=notice&methodName=selectByNoticeNo&noticeNo=${notice.noticeNo}">${notice.noticeTitle}</a></span></td>
									<td>${notice.noticeRegdate.substring(0,10)}</td>
								</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</section>
				</tbody>
			</table>
			<!--페이징 처리-->	
			<nav aria-label="Page navigation example">
				<jsp:useBean class="mimemi.mvc.paging.NoticeListPageCnt" id="p"/> 
				<c:set var="isLoop" value="false"/>
				<c:set var="temp" value="${(pageNum - 1) % p.blockcount}"/>
				<c:set var="startPage" value="${pageNum - temp}"/>
				<ul class="pagination justify-content-center">
					<c:if test="${(startPage - p.blockcount) > 0}">
						<li class="page-item"><a class="page-link" href="${path}/front?key=notice&methodName=selectAll&pageNum=${startPage-1}">이전</a></li>
					</c:if>
					<c:forEach var='i' begin='${startPage}' end='${(startPage-1) + p.blockcount}'> 
						<c:if test="${(i-1) >= p.pageCnt}">
							<c:set var="isLoop" value="true"/>
						</c:if> 
						<c:if test="${not isLoop}" >
							<li class="page-item ${i == pageNum ? ' active' : ''}"><a class="page-link page_num" href="${path}/front?key=notice&methodName=selectAll&pageNum=${i}">${i}</a></li> 
						</c:if>
					</c:forEach>
					<c:if test="${(startPage + p.blockcount) <=p.pageCnt}">
						<li class="page-item"><a class="page-link" href="${path}/front?key=notice&methodName=selectAll&pageNum=${startPage+p.blockcount}">이후</a></li>
					</c:if>
				</ul>
			</nav>
		</div>	
	</section>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>


 

