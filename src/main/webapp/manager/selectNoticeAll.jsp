<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<title>공지사항 관리 - 미미미</title>
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
	 <script type="text/javascript">
	 
	 $(function() {
		 function selectAllNotice() {
	
			 $.ajax({
				url: "${path}/ajax",
				type: "post",
				dataType: "json",
				data:{key:"notice", methodName:"selectAllNotice"},
				success:function(result) {
				 let str="";
				 $.each(result, function(index, item){
					 str+="<tr>"
					 str+=`<td>\${item.noticeNo}</td>`;
				     str+=`<td>\${item.noticeTitle}</td>`;
				     str+=`<td>\${item.noticeContent}</td>`;
				     str+=`<td>\${item.noticeAttach}</td>`;
				     str+=`<td>\${item.noticeRegdate}</td>`;
				     str+="</tr>";
				});		
					$("#listTable tr:gt(0)").remove();
					$("#listTable tbody").append(str);
			   }
			 })	
		  }	
		 selectAllNotice();
	})
	 

	 
	 
	 </script>
	
	
	
	
	
	</head>
    <body>
	<section>
			<form action="">
            <input type="hidden" name="" id="">
				<h1>공지사항 관리 </h1>
				<div style="text-align: right;">
					<form name="sort" action="" method="post">
						<select name="keyField">
							<option value="0">--정렬선택--</option>
							<option value="eventTitle">제목</option>
							<option value="eventContent">내용</option>
							<option value="eventRegdate">작성날짜</option>
						</select> 
					</form>
				</div>
				
				<p>
				
				<table id="listTable">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>내용</th>
							<th>첨부파일명</th>
							<th>작성날짜</th>
							<th>수정날짜</th>
						</tr>
					</thead>	 
					<tbody>
						<tr>
							<td>1</td>
							<td>첫번째공지사항</td>
							<td>첫번째 공지사항입니다</td>
							<td>첨부파일</td>
							<td>2022-04-13</td>
							<td>2022-04-14</td>
						</tr>
            </tbody>
					<tfoot>
						<tr>
							
						</tr>
					</tfoot>
				</table>
				
				<p>
				
				<div style="text-align: left;">
					<form name="search" action="" method="post">
						<select name="keyField">
							<option value="0">--검색조건--</option>
							<option value="noticeTitle">제목</option>
							<option value="noticeContent">내용</option>
							<option value="noticeRegdate">작성날짜</option>
						</select>
						 
						<input type="text" name="keyWord"/>
						<input type="button" value="검색" />  
                        <button type="button" onclick="location.href='insertNoitice.jsp'" style="float: right;">작성하기</button>
					</form>
				</div>
			</form>
		</section>
	</body>
</html>