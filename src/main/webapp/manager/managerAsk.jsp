<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>1 : 1문의 - 미미미</title>
		<style type="text/css">
			section {width: 1200px; margin: auto;}
			table {width: 1200px;}
			th, td {border: 1px solid black;}
		</style> 	
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	  	
	  	<style>
			.orderList-main {width: 1200px; margin: auto;}
			table {width: 100%;}
			.order_sort{text-align: right;}
			span{font-size:14pt; text-align: right;}
			</style>
			
			
		<script type="text/javascript">
			$(function(){
				$("select").change(function(){
					if($(this).val() != "0"){
						let url = `${path}/front?key=ask&methodName=selectAll&field=` + $(this).val();
						location.replace(url);
					}
					
				})
			})	
		
		</script>
     	
     	
</head>
<body>
<section class="askList-main">
	<h1><a href="${path}/front?key=ask&methodName=selectAllManager">1 : 1 문의 목록(관리자페이지)</a></h1>
	<section name="ask_sort" id="">
			<select name="ask_sort" id="">
					<option value="0">--정렬방식--</option>
					<option value="order_id">제목</option>
					<option value="user_id">내용</option>
			</select>	
	
	</section>
		<table class="table table-hover" id="askList" >
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
								<td colspan="5">구매 내역이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${askList}" var="ask">
							<tr>
								<td>
								<span>
								<a href="${path}/front?key=ask&methodName=selectByAskNoManager&askNo=${ask.askNo}">
								
								${ask.askNo}
								</a>
								</span>
								</td>
								<td>${ask.userId}</td>
								<td>${ask.askTitle}</td>
								<td>${ask.askContent}</td>
								<td>${ask.askAttach}</td>
								<td>${ask.askRegdate}</td>
								<td>${ask.askCategory}</td>
								<td>
							
								${ask.askComplete}
								</td>
							</tr>
							
							</c:forEach>
						</c:otherwise>
					</c:choose>
					
		    </tbody>
		</table>
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
		
</section>

</body>
</html>