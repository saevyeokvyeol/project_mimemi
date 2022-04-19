<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>이벤트 전체 리스트 - 미미미</title>
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
			section {width: 1200px; margin: auto;}
			table {width: 100%;}
			td {padding: 30px;}
			a {color: black;}
		</style>
		<script type="text/javascript">
			$(function(){
				
			});
		</script>
	</head>
	<body>
		<section>
			<h1>이벤트 전체</h1>
			<table class="" id="">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>첨부파일명</th>
						<th>썸네일</th>
						<th>작성날짜</th>
						<th>이벤트시작일</th>
						<th>이벤트종료일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.eventList}" var="event">
                    	<tr>
                        	<td>
                            	${event.eventNo} 
                          	</td>
                            <td>
                                ${event.eventTitle}
                            </td>
                            <td>
                                ${event.eventContent}
                            </td>
                            <td>
                                ${event.eventAttach}
                            </td>
                            <td>
                                ${event.eventImg}
                            </td>
                            <td>
                                ${event.eventRegdate}
                            </td>
                            <td>
                                ${event.eventStartdate}
                            </td>
                            <td>
                                ${event.eventEnddate}
                            </td>
                       </tr>
                	</c:forEach>
				</tbody>
			</table>
		</section>
	</body>
</html>