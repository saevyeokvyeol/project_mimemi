<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_ask</title>
</head>
<body>
<h3>ask.jsp 페이지 입니다.</h3>
<!-- <img src="../front_img/board_ask.jpg" alt="1:1 문의 화면 이미지입니다."/> -->

<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">
<caption><h2 align="center">1 : 1 문의하기</h2></caption>
<tr>
		<td bgcolor="gray">
            <p align="center">
            <font color="white"><b><span style="font-size:9pt;">글번호</span></b></font></p>
        </td>
        <td bgcolor="blue">
            <p align="center">
            <font color="white"><b><span style="font-size:9pt;">제목</span></b></font></p>
        </td>
        <td bgcolor="blue">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">작성자 ID</span></b></font></p>
        </td>
        <td bgcolor="blue">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">첨부파일명</span></b></font></p>
        </td>
        <td bgcolor="blue">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">문의일시</span></b></font></p>
        </td>
     
    </tr>
    <div align=right>
<span style="font-size:9pt;">&lt;<a href="${path}/board/write.jsp">문의하기</a>&gt;</span>

<c:choose>
    <c:when test="${empty requestScope.list}">
	   <tr>
        <td colspan="5">
            <p align="center"><b><span style="font-size:9pt;">문의글이 없습니다.</span></b></p>
        </td>
    </tr>
    </c:when>
    <c:otherwise>
	<c:forEach items="${requestScope.list}" var="AskDTO">
		    <tr onmouseover="this.style.background='#eaeaea'"
		        onmouseout="this.style.background='white'">
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${AskDAO.askNo}</span></p>
		        </td>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            <fmt:formatNumber value="${AskDTO.askTitle}"/></span></p>
		        </td>
		        <td bgcolor="">
					<p><span style="font-size:9pt;">
					<a href="${path}/front?key=elec&methodName=selectByModelNum&modelNum=${AskDTO.userId}&pageNo=${pageNo}">
					  ${AskDTO.userId}
					</a>
					</span></p>
		        </td>
		         <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            <fmt:formatNumber value="${AskDTO.askAttach}"/> byte</span></p>
		        </td>
		        
		        
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${AskDTO.askRegdate}</span></p>
		        </td>
		    </tr>
    </c:forEach>
	</c:otherwise>
</c:choose>
</div>
</body>
</html>