<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
 <head>
 <meta charset="UTF-8">
 <title>공지사항 고객뷰어</title>
	</head>
	<style type="text/css">
	.left side {width : 300px;
	            margin:auto;}
	.body {width : 900px;
	       margin:auto;}
	.search{background-color:#eeeeee; 
	        height : 50px; 
	        text-align:center;
	        vertical-align:middle;}
	 
	
	table {width:1200px;}
	th, td {border : 1px solid white;}
	</style>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<body>
	<table>
	<tr>	
	<td>
	<!-- left side -->
	<div class="left side"> 
		<div class="title">고객센터</div><hr width="100px">
		<ul class="menu">
			<li><a href="${path}/front?key=notice&methodName=selectAll">공지사항</a></li>
			<li class="">
				<a href="${path}/front?key=faq&methodName=selectAll">FAQ</a>
				<ul>
					<li class=""><a href="">교환/환불</a></li>
					<li class=""><a href="">회원관련</a></li>
					<li class=""><a href="">주문/결제</a></li>
					<li class=""><a href="">배송관련</a></li>
					<li class=""><a href="">기타</a></li>
				</ul>
			</li>
			<li><a href="ask.jsp">1:1문의</a></li>
		</ul>
	</div>
	</td>
	<td>
	<!-- body -->
	<div class="body"> 
		<div><h1>공지사항</h1></div>
		<!-- 검색하기 -->	
		    <nav class="navbar navbar-light bg-light">
			 <form class="form-inline" action="${path}/front?key=notice&methodName=selectByKeywordClient" method="post">
			  <div class="search">
				  <select name="field" id="notice_search_sort_keyWordCl">
					<option name="notice_search_sort_keyWordCl" value="title">제목</option>
					<option name="notice_search_sort_keyWordCl" value="content">내용</option>
			      </select>
				 <input class="notice-keyWord-search" name="keyword" type="text" placeholder="Search" aria-label="Search">
				<button type="submit" class="btn-keyWordCl-submit">검색</button>
			  </div>
			 </form>
			</nav>	
		<hr>
		
	  <table class="table" style="text-align:center" id="noticeList">
	    <thead>
	      <tr>
	       <th>순서</th> 
	       <th>제목</th>
	       <th>날짜</th>
	      </tr>
	    </thead>
        <tbody>
 	      <c:choose>
				<c:when test="${empty requestScope.list}">
					<tr>
						<td colspan="6">공지사항이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${requestScope.list}" var="notice">
					<tr>
						<td>${notice.noticeNo}</td>
						<td><span><a href="${path}/front?key=notice&methodName=selectByNoticeNo&noticeNo=${notice.noticeNo}">${notice.noticeTitle}</a></span></td>
						<td>${notice.noticeRegdate}</td>
					</tr>
					</c:forEach>
				</c:otherwise>
		  </c:choose>
		</tbody>
	  </table>
	</div>
	</table>
	</body>
			<nav aria-label="Page navigation example">
				<jsp:useBean class="mimemi.mvc.paging.PageCnt" id="p"/> 
				<c:set var="isLoop" value="false"/>
				<c:set var="temp" value="${(pageNum - 1) % p.blockcount}"/>
				<c:set var="startPage" value="${pageNum - temp}"/>
				<ul class="pagination justify-content-center">
					<c:if test="${(startPage - p.blockcount) > 0}">
						<li class="page-item"><a class="page-link" href="${path}/front?key=notice&methodName=selectByKeywordClient&pageNum=${startPage-1}&field=${requestScope.field}&keyword=${requestScope.keyword}">이전</a></li>
					</c:if>
					<c:forEach var='i' begin='${startPage}' end='${(startPage-1) + p.blockcount}'> 
						<c:if test="${(i-1) >= p.pageCnt}">
							<c:set var="isLoop" value="true"/>
						</c:if> 
						<c:if test="${not isLoop}" >
							<li class="page-item ${i == pageNum ? ' active' : ''}"><a class="page-link page_num" href="${path}/front?key=notice&methodName=selectByKeywordClient&pageNum=${i}&field=${requestScope.field}&keyword=${requestScope.keyword}">${i}</a></li> 
						</c:if>
					</c:forEach>
					<c:if test="${(startPage + p.blockcount) <=p.pageCnt}">
						<li class="page-item"><a class="page-link" href="${path}/front?key=notice&methodName=selectByKeywordClient&pageNum=${startPage+p.blockcount}&field=${requestScope.field}&keyword=${requestScope.keyword}">이후</a></li>
					</c:if>
				</ul>
			</nav>
	</body>
</html>