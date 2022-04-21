<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error</title>
<script type="text/javascript">
$(function() {
	function start() {
		alert('${errorMsg}');
		history.go(-1);
	}
	start();
})


</script>
</head>
<body>
</body>
</html>
<jsp:include page="../common/footer.jsp"/>