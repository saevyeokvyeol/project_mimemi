<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<jsp:include page="../common/header.jsp"/>

<style type="text/css">
.FAQ-view {width: 1200px; margin: 50px auto;}
.FAQ-sideview {width: 200px; margin-right: 50px; z-index: 0;}
.FAQ-sideview h3 {margin: 0 0 20px 10px;}
.FAQ-mainview {width: 950px;}
 .search{background-color:#eeeeee; 
         height : 50px; 
         text-align:center;
         vertical-align:middle;}
 
 table {width:1200px;}
 th, td {border : 1px solid white;}
 .list-group {}
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
	<section class="FAQ-view d-flex p-2 bd-highlight">
	<aside class="FAQ-sideview">
		<h3>고객센터</h3>
		<div class="list-group">
			<a href="${path}/front?key=notice&methodName=selectAll"class="list-group-item list-group-item-action">
				공지사항</a>
			<a href="${path}/front?key=faq&methodName=selectAll" class="list-group-item list-group-item-action active" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				FAQ</a>
			<div class="side-minibar">
				<a href="${path}/front?key=faq&methodName=selectAll&field=cr" class="list-group-item list-group-item-action" id="cr">교환/환불</a>
				<a href="${path}/front?key=faq&methodName=selectAll&field=us" class="list-group-item list-group-item-action" id="us">회원 관련</a>
				<a href="${path}/front?key=faq&methodName=selectAll&field=op" class="list-group-item list-group-item-action" id="op">주문/결제</a>
				<a href="${path}/front?key=faq&methodName=selectAll&field=de" class="list-group-item list-group-item-action" id="de">배송 관련</a>
				<a href="${path}/front?key=faq&methodName=selectAll&field=ec" class="list-group-item list-group-item-action" id="ec">기타</a>
			</div>
		  <a href="#" class="list-group-item list-group-item-action">1:1문의</a>
		</div>
	</aside>
		<div class="FAQ-mainview">
		<div><h1>FAQ</h1></div>
			<form>
			<div class="search">
				<select>
					<option value="TITLE">제목</option>
					<option value="CONTENT">내용</option>
				</select>
				<input type="text" class="ipt" name="keyword" maxlength="30" value=""/>
				<button type="submit" class="btn btn-success">검색</button>
			</div>
			</form>
		<hr>
		  <section class="faqList-main">
		  <c:choose>
				<c:when test="${empty FaqList}">
					 <tr>
						<td colspan="6">공지사항이 없습니다.</td>
					 </tr>
				 </c:when>
				 <c:otherwise>
				 	<c:forEach items="${FaqList}" var="faq">
					    <h4 class="" id="">
					      <button class="faq-title" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne${faq.faqNo}" aria-expanded="false" aria-controls="flush-collapseOne">
					        Q . ${faq.faqTitle}
					      </button>
					    </h4>
					    <div id="flush-collapseOne${faq.faqNo}" class="faq-content" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
					       <h3 style="display: inline"><strong>A.</strong></h3>&nbsp;&nbsp;  ${faq.faqContent}
					    </div>			  
		  			</c:forEach>
		  		</c:otherwise>
			</c:choose>
			
			<!-- 페이징처리입니다 -->
				<nav aria-label="Page navigation example">
					<jsp:useBean class="mimemi.mvc.paging.FaqListPageCnt" id="p"/> 
					<c:set var="isLoop" value="false"/>
					<c:set var="temp" value="${(pageNum - 1) % p.blockcount}"/>
					<c:set var="startPage" value="${pageNum - temp}"/>
					<ul class="pagination justify-content-center">
						<c:if test="${(startPage - p.blockcount) > 0}">
							<li class="page-item"><a class="page-link" href="${path}/front?key=faq&methodName=selectAll&pageNum=${startPage-1}&field=${requestScope.field}">이전</a></li>
						</c:if>
						<c:forEach var='i' begin='${startPage}' end='${(startPage-1) + p.blockcount}'> 
							<c:if test="${(i-1) >= p.pageCnt}">
								<c:set var="isLoop" value="true"/>
							</c:if> 
							<c:if test="${not isLoop}" >
								<li class="page-item ${i == pageNum ? ' active' : ''}"><a class="page-link page_num" href="${path}/front?key=faq&methodName=selectAll&pageNum=${i}&field=${requestScope.field}">${i}</a></li> 
							</c:if>
						</c:forEach>
						<c:if test="${(startPage + p.blockcount) <= p.pageCnt}">
							<li class="page-item"><a class="page-link" href="${path}/front?key=faq&methodName=selectAll&pageNum=${startPage+p.blockcount}&field=${requestScope.field}">이후</a></li>
						</c:if>
					</ul>
				</nav>
			</section>
			</div>
		</section>
	</body>
</html>