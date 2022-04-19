<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>관리자 답글 페이지</h2>
 <form name="writeNotice" method="post" action="${path}/front?key=answer&methodName=insertAnswerReply"
       onsubmit='return checkValid()' enctype="multipart/form-data">
		<div class="container" role="main">
			answerNo, askNo, answerContent, answerRegdate
			댓글번호,글번호,댓글내용,작성날짜
				
				<div class="mb-3">${param.askNo}
				<input type="hidden" value="${param.askNo}" name="askNo">
					<label for="content">댓글 내용</label>
					<textarea class="form-control" rows="5" name="answer_content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
				
     			<div >
     				<input type="submit" value="댓글달기" />
				    <input type="button" value="목록보기" onclick="location.href='../board/ask2.jsp'"/>
			</div>
		</div>
</form>
</body>
</html>