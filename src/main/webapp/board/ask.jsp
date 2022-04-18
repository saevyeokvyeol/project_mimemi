<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_ask</title>
<style type="text/css">
	span{ font-size:9pt;}
	


</style>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>

	
<script type="text/javascript">

	$(function(){
		alert(1);
	})
</script>
</head>
<body>
<h3>ask.jsp 페이지 입니다.</h3>

<h2>${requestSCope.askList}zz</h2>
</script>
<!-- <img src="../front_img/board_ask.jpg" alt="1:1 문의 화면 이미지입니다."/> -->

<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">
<caption><h2 align="center">1 : 1 문의하기</h2></caption>
<tr>
		<td bgcolor="gray">
            <p align="center">
            <b><span>글번호</span></b></p>
        </td>
        <td>
            <p align="center">
            <b><span >작성자 ID</span></b></p>
        </td>
        <td >
            <b><span >제목</span></b>
        </td>
       
        <td >
            <b><span >첨부파일명</span></b>
        </td>
        <td >
            <b><span >작성날짜</span></b>
        </td>
        <td >
            <b><span >카테고리명</span></b>
        </td>
        <td >
            <b><span >답변완료</span></b>
        </td>
    	
    </tr>
   
    <tr>
        <td>1</td>
        <td> <a href="${path}/board/askdetail.jsp?key=ask&methodName=selectByAskNo&modelNum=${AskDTO.userId}">
        		yong</a></td>
        <td>
        	구독관련
        </td>
 
        <td></td>
        <td>2022.04.15</td>
        <td>구매문의</td>
        <td>답변완료</td>
    <tr>
    <div align=right>
<span>&lt;<a href="${path}/board/write.jsp">문의하기</a>&gt;</span>
<hr color="green">
<c:choose>
    <c:when test="${empty requestScope.askList}">
	   <tr>
        <td colspan="5">
            <p align="center"><b><span style="font-size:9pt;">문의글이 없습니다.</span></b></p>
        </td>
    </tr>
    </c:when>
    <c:otherwise>
   
	<c:forEach items="${requestScope.askList}" var="AskDTO">
		    <tr onmouseover="this.style.background='#eaeaea'"
		        onmouseout="this.style.background='white'">
		        <td bgcolor="">
		            <p align="center"><span>
		            ${AskDTO.askNo}</span></p>
		        </td>
		        
		        <td bgcolor="">
		            <p align="center"><span>
		            <a href="${path}/front?key=ask&methodName=selectByAskNo&modelNum=${AskDTO.userId}">
		            ${AskDTO.userId}</span></p>
		        </td>
		        
		        
		        
		        <td bgcolor="">
		            <p align="center"><span>
		            ${AskDTO.askTitle}</span></p>
		        </td>
		       
		         <td bgcolor="">
		            <p align="center"><span >
		           "${AskDTO.askAttach} byte</span></p>
		        </td>
		        
		        <td bgcolor="">
		            <p align="center"><span>
		            ${AskDTO.askRegdate}</span></p>
		        </td>
		        <td bgcolor="">
		            <p align="center"><span>
		            ${AskDTO.askCategory}</span></p>
		        </td>
		        <td bgcolor="">
		            <p align="center"><span>
		            ${AskDTO.askComplete}</span></p>
		        </td>
		    </tr>
    </c:forEach>
	</c:otherwise>
</c:choose>
</table>
</div>
</body>
</html>