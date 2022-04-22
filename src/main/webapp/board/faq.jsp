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
 .ac {margin: 40px 0;}
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
			<a href="${path}/front?key=faq&methodName=selectAll" class="list-group-item list-group-item-action active">
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
		<div class="FAQ-mainview">
		<div><h1>FAQ</h1></div>

		  <section class="faqList-main">
		  <c:choose>
				<c:when test="${empty FaqList}">
					 <tr>
						<td colspan="6" ><center><h2>등록된 FAQ가 없습니다.</h2></center></td>
					 </tr>
				 </c:when>
				 <c:otherwise>
					 <div class="accordion ac" id="accordionExample">
					 	<c:forEach items="${FaqList}" var="faq">
					 		<div class="accordion-item">
							    <h4 class="accordion-header" id="flush-headingOne">
							      <button class="faq-title accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne${faq.faqNo}" aria-expanded="false" aria-controls="flush-collapseOne">
							        Q . ${faq.faqTitle}
							      </button>
							    </h4>
						    </div>
						    <div id="flush-collapseOne${faq.faqNo}" class="faq-content accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
						        <div class="accordion-body">
							        <h3 style="display: inline"><strong>A.</strong></h3>&nbsp;&nbsp;  ${faq.faqContent}
							        <br><br><img src="${path}/img/${faq.faqAttach}">
							    </div>
						    </div>							     
			  			</c:forEach>
			  		</div>
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