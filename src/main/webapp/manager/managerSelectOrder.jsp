<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>managerSelectOrder</title>
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/themes/redmond/jquery-ui.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.14.0/css/ui.jqgrid.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.14.0/jquery.jqgrid.min.js"></script>
		<script>
			$(function() {
					"use strict";
					$("#grid").jqGrid({
							colModel: [
									{ name: "주문번호" },
									{ name: "회원아이디" },
									{ name: "주문일자" },
									{ name: "총결제금액" }
							],
							data: [
									{ 주문번호: 1, 회원아이디: "james12", 주문일자: "22/03/30", 총결제금액: "147000" },
									{ 주문번호: 1, 회원아이디: "james12", 주문일자: "22/03/30", 총결제금액: "147000" },
									{ 주문번호: 1, 회원아이디: "james12", 주문일자: "22/03/30", 총결제금액: "147000" }
							]
					});
			});
		</script>
		<style type="text/css">
			section {width: 1200px; margin: auto;}
			table {width: 100%;}
		</style>
	</head>
	<body>
		<section>
			<h1>전체 주문 조회</h1>
			<table id="grid"></table>
		</section>
	</body>
</html>