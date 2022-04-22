<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>1 : 1문의 - 미미미</title>
		<jsp:include page="../common/sidebar.jsp"/>	
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	  	
	  	<style>
	  	
	  		
			
	  	
			.Ask-view {width: 1000px; margin: 50px auto;}
			.Ask-sideview {width: 200px; margin-rightx: 50p; z-index: 0;}
			.Ask-sideview h3 {margin: 0 0 20px 10px;}
			.Ask-mainview {width: 950px;}
			.search{background-color:#eeeeee; 
				height : 50px; 
				text-align:center;
				vertical-align:middle;}
			.side-minibar {padding: 0;}
			.side-minibar > a {font-size: 14px; padding-left: 40px;}
			
			.Ask-mainview {
                width: 900px;
                margin: auto; padding: 50px 0;
            }
             .Ask-mainview h1 {padding-bottom: 10px; margin-bottom: 10px; border: }
			
			.ask-table th {width: 120px; padding: 15px 30px;}
            .ask-table td {vertical-align: middle;}
		</style>
			
			
		<script type="text/javascript">
			$(function(){
				$("select").change(function(){
					if($(this).val() != "0"){
						let url = `${path}/front?key=ask&methodName=selectAllManager&field=` + $(this).val();
						location.replace(url);
					}
					
				})
			})	
		
		</script>
     	
     	
</head>
<body>
<section class="Ask-view d-flex p-2 bd-highlight">
	
		
		<!-- body -->
		<div class="Ask-mainview">
			<div><h1>1:1 문의 목록</h1></div>
			<!-- 목록 -->
			<table class="table table-hover ask-table" style="text-align:center" id="askList" >
				<thead>
					<tr bgcolor="">
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
								<td colspan="8">구매 내역이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${askList}" var="ask">
							<tr>
								<td>
								<span><a href="${path}/front?key=ask&methodName=selectByAskNoManager&askNo=${ask.askNo}">${ask.askNo}</a></span>
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
					
		    </tbody>
		</table>
		
		
		
		
			
			<!--페이징처리-->
			<nav aria-label="Page navigation example">
		
			
				<jsp:useBean class="mimemi.mvc.paging.AskListPageCnt" id="p"/> 
				<c:set var="isLoop" value="false"/>
				<c:set var="temp" value="${(pageNum - 1) % p.blockcount}"/>
				<c:set var="startPage" value="${pageNum - temp}"/>
				<ul class="pagination justify-content-center">
					<c:if test="${(startPage - p.blockcount) > 0}">
						<li class="page-item"><a class="page-link" href="${path}/front?key=ask&methodName=selectAllManager&pageNum=${startPage-1}">이전</a></li>
					</c:if>
					<c:forEach var='i' begin='${startPage}' end='${(startPage-1) + p.blockcount}'> 
						<c:if test="${(i-1) >= p.pageCnt}">
							<c:set var="isLoop" value="true"/>
						</c:if> 
						<c:if test="${not isLoop}" >
							<li class="page-item ${i == pageNum ? ' active' : 'page'}"><a class="page-link page_num" href="${path}/front?key=ask&methodName=selectAllManager&pageNum=${i}">${i}</a></li> 
						</c:if>
					</c:forEach>
					<c:if test="${(startPage + p.blockcount) <=p.pageCnt}">
						<li class="page-item"><a class="page-link" href="${path}/front?key=ask&methodName=selectAllManager&pageNum=${startPage+p.blockcount}">이후</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</section>

</body>

</html>