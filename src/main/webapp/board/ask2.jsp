<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>1 : 1문의 - 미미미</title>
	<jsp:include page="../common/header.jsp"/>
		 	
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	  	
	  	<style>
			.Ask-view {width: 1200px; margin: 50px auto;}
			.Ask-sideview {width: 200px; margin-right: 50px; z-index: 0;}
			.Ask-sideview h3 {margin: 0 0 20px 10px;}
			.Ask-mainview {width: 950px;}
			.search{background-color:#eeeeee; 
				height : 50px; 
				text-align:center;
				vertical-align:middle;}
			.side-minibar {padding: 0;}
			.side-minibar > a {font-size: 14px; padding-left: 40px;}
			table{font-size: 15px;}
			
		</style>
     	
</head>
<body>
	<section class="Ask-view d-flex p-2 bd-highlight" >
		<!--left side-->
		<aside class="Ask-sideview">
			<h3>고객센터</h3>
			<div class="list-group">
				<a href="${path}/front?key=notice&methodName=selectAll"class="list-group-item list-group-item-action">
					공지사항</a>
				<a href="${path}/front?key=faq&methodName=selectAll" class="list-group-item list-group-item-action" >
					FAQ</a>
				<div class="side-minibar">
					<a href="${path}/front?key=faq&methodName=selectAll&field=cr" class="list-group-item list-group-item-action" id="cr">교환/환불</a>
					<a href="${path}/front?key=faq&methodName=selectAll&field=us" class="list-group-item list-group-item-action" id="us">회원 관련</a>
					<a href="${path}/front?key=faq&methodName=selectAll&field=op" class="list-group-item list-group-item-action" id="op">주문/결제</a>
					<a href="${path}/front?key=faq&methodName=selectAll&field=de" class="list-group-item list-group-item-action" id="de">배송 관련</a>
					<a href="${path}/front?key=faq&methodName=selectAll&field=ec" class="list-group-item list-group-item-action" id="ec">기타</a>
				</div>
				<a href="${path}/front?key=ask&methodName=selectAll" class="list-group-item list-group-item-action active">1:1문의</a>
			</div>
		</aside>
		<!--body-->	
		<div class="Ask-mainview">
			<div><h1>1:1 문의 목록</h1></div>
			<!--목록-->
			<table class="table table-hover" style="text-align:center" id="askList" >
				<thead>
					<tr>
						<th>글 번호</th>
						<th>작성자 ID</th>
						<th>제목</th>
						<th>내용</th>
						<th>첨부파일명</th>
						<th>작성날짜</th>	
						<th>카테고리명</th>
						<th>답변완료</th> 
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty askList}">
							<tr>
								<td colspan="8">문의 내역이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${askList}" var="ask">
								<tr>
									<td>
										<span><a href="${path}/front?key=ask&methodName=selectByAskNo&askNo=${ask.askNo}">${ask.askNo}</a></span>
									</td>
									<td>${ask.userId}</td>
									<td>${ask.askTitle}</td>
									<td>${ask.askContent}</td>
									<td>${ask.askAttach}</td>
									<td>${ask.askRegdate}</td>
									<td>${ask.askCategory}</td>
									<td>
									<c:choose>
										<c:when test="${ask.askComplete eq 'F'}">답변 미완료</c:when>
										<c:when test="${ask.askComplete eq 'T'}">답변 완료</c:when>
									</c:choose>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<!--기존문의하기 버튼(118번째줄에 새로 만들었음 잘 되는지 확인하기)-->
				<!--	<form name=updateForm  method=post action="${path}/board/write.jsp"  
					onSubmit='return checkValid()' enctype="multipart/form-data">
						<div>
							<span><input type="submit" id="write-btn" value="문의하기" ></span>
						</div>
					</form>-->
				</tbody>
			</table>
			<!--검색하기-->
			<nav class="navbar navbar-light bg-light">
				<div class="Ask-search-box">
					<form class="form-inline" action="${path}/front?key=ask&methodName=selectByKeyword" method="post">
						<select name="field" id="review_search_sort_select">
							<option name="review_search_sort" value="title">제목</option>
							<option name="review_search_sort" value="content">내용</option>
						</select>
						<input class="ipt" name="keyWord" type="text" placeholder="Search" aria-label="Search">
						<button class="btn btn-success" type="submit" >검색하기</button>
					</form>
				</div>
				<div>
					<span><a href="${path}//board/write.jsp" id="write-btn2"  class="btn btn-outline-dark shadow-none">문의하기</a></span>
				</div>
			</nav>	
			
			<!--페이징처리-->
			<nav aria-label="Page navigation example">
				<jsp:useBean class="mimemi.mvc.paging.AskListPageCnt" id="p"/> 
				<c:set var="isLoop" value="false"/>
				<c:set var="temp" value="${(pageNum - 1) % p.blockcount}"/>
				<c:set var="startPage" value="${pageNum - temp}"/>
				<ul class="pagination justify-content-center">
					<c:if test="${(startPage - p.blockcount) > 0}">
						<li class="page-item"><a class="page-link" href="${path}/front?key=ask&methodName=selectAll&pageNum=${startPage-1}">이전</a></li>
					</c:if>
					<c:forEach var='i' begin='${startPage}' end='${(startPage-1) + p.blockcount}'> 
						<c:if test="${(i-1) >= p.pageCnt}">
							<c:set var="isLoop" value="true"/>
						</c:if> 
						<c:if test="${not isLoop}" >
							<li class="page-item ${i == pageNum ? ' active' : 'page'}"><a class="page-link page_num" href="${path}/front?key=ask&methodName=selectAll&pageNum=${i}">${i}</a></li> 
						</c:if>
					</c:forEach>
					<c:if test="${(startPage + p.blockcount) <=p.pageCnt}">
						<li class="page-item"><a class="page-link" href="${path}/front?key=ask&methodName=selectAll&pageNum=${startPage+p.blockcount}">이후</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</section>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>