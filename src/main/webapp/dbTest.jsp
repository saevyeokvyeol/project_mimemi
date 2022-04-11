<%@page import="mimemi.mvc.util.DbUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>DB Test</title>
	</head>
	<body>
		<h1>DB 연결 Test</h1>
		
		<%
			Connection con = DbUtil.getConnection();
			out.println("con : " + con);
		%>
	</body>
</html>