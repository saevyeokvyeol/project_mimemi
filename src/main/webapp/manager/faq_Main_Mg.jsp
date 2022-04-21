<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FAQ게시판 관리  - 미미미</title>
		<style type="text/css">
			section {width: 1100px; margin: auto;}
			table {width: 1200px;}
			th, td {border: 1px solid black;}
		</style>
		
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
		
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	  	
	  		<style>
			.faqList-main {width: 1200px; margin: auto;}
			table {width: 100%;}
			.faq_sort{text-align: right;}
			
		   
		</style>
		  
		
		<script type="text/javascript">
			$(function(){
				$("#faq_categry_select").change(function() {
					if($(this).val() != "0"){
						let url = `${path}/front?key=faq&methodName=selectAllFaq&field=` + $(this).val();
						location.replace(url);
					}
				})
			})
		</script>
  </head>
   <body>
	<section class="faqList-main">
			<h1><a href="${path}/front?key=faq&methodName=selectAllFaq">FAQ 관리</a></h1>
			<section class="faq_sort">
				<select name="faq_sort" id="faq_categry_select" >
					<option value="0">--정렬방식--</option>
					<option name="faq_category" value="cr">교환환불</option>
					<option name="faq_category" value="us">회원관련</option>
					<option name="faq_category" value="op">주문/결제</option>
					<option name="faq_category" value="de">배송관련</option>
					<option name="faq_category" value="ec">기타</option>
					
				</select>
			</section>
			<table class="table table-hover" id="faqList">
				<thead>
					<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>내용</th>
							<th>첨부파일명</th>
							<th>작성날짜</th>
							<th>수정날짜</th>
							<th>카테고리</th>
							<th>관리<th>
							
						</tr>
					</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty FaqList}">
							<tr>
								<td colspan="6">FAQ 가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${FaqList}" var="faq">
							<tr>
								<td>${faq.faqNo}</td>
								<td>${faq.faqTitle}</td>
								<td><a href="${path}/front?key=faq&methodName=selectAll">${faq.faqContent}</a></td>
								<td>${faq.faqAttach}</td>
								<td>${faq.faqRegdate}</td>
								<td>${faq.faqModidate}</td>
								<td>${faq.faqCategory}</td>
								<th><a href="${path}/front?key=faq&methodName=updateForm&faqNo=${faq.faqNo}" >관리</a><th>
							</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
		</table>
			<div style="float:right;">
				 <a href="${path}/manager/faq_Insert.jsp" class="btn btn-primary pull-right">작성하기</a>
		    </div>
			<nav aria-label="Page navigation example">
				<jsp:useBean class="mimemi.mvc.paging.FaqListPageCnt" id="p"/> 
				<c:set var="isLoop" value="false"/>
				<c:set var="temp" value="${(pageNum - 1) % p.blockcount}"/>
				<c:set var="startPage" value="${pageNum - temp}"/>
				<ul class="pagination justify-content-center">
					<c:if test="${(startPage - p.blockcount) > 0}">
						<li class="page-item"><a class="page-link" href="${path}/front?key=faq&methodName=selectAllFaq&pageNum=${startPage-1}&field=${requestScope.field}">이전</a></li>
					</c:if>
					<c:forEach var='i' begin='${startPage}' end='${(startPage-1) + p.blockcount}'> 
						<c:if test="${(i-1) >= p.pageCnt}">
							<c:set var="isLoop" value="true"/>
						</c:if> 
						<c:if test="${not isLoop}" >
							<li class="page-item ${i == pageNum ? ' active' : ''}"><a class="page-link page_num" href="${path}/front?key=faq&methodName=selectAllFaq&pageNum=${i}&field=${requestScope.field}">${i}</a></li> 
						</c:if>
					</c:forEach>
					<c:if test="${(startPage + p.blockcount) <=p.pageCnt}">
						<li class="page-item"><a class="page-link" href="${path}/front?key=faq&methodName=selectAllFaq&pageNum=${startPage+p.blockcount}&field=${requestScope.field}">이후</a></li>
					</c:if>
				</ul>
			</nav>
		</section>
	</body>
</html>