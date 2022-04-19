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
	<h1><a href="${path}/front?key=ask&methodName=selectAll">1 : 1 문의 목록</a></h1>
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
								<td>${ask.askNo}</td>
								
								<td>
								<a href="${path}/board/askdetail.jsp?key=ask&methodName=selectByAskNo&modelNum=${AskDTO.userId}">
								${ask.userId}
								</a>
								</td>
								<td>${ask.askTitle}</td>
								<td>${ask.askContent}</td>
								<td>${ask.askAttach}</td>
								<td>${ask.askRegdate}</td>
								<td>${ask.askCategory}</td>
								<td>${ask.askComplete}</td>
							</tr>
							
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<div align=right>
					<span>&lt;<a href="${path}/board/write.jsp">문의하기</a>&gt;</span>
					</div>
		    </tbody>
		</table>
		
	
</section>

</body>
</html>