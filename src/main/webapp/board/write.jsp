<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	span{font-size: 9pt; }
	body { padding-top: 70px;padding-bottom: 30px;}

</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!--JQgrid CDN-->
<script src="../util/js/jquery-3.6.0.min.js"></script>


<script type="text/javascript">

function checkValid() {
	
	var f = window.document.writeForm;
	
	if ( f.model_num.value == "") {
	    alert( "제목을 입력해주세요." );
	    f.model_num.focus();
		return false;
    }
	
	if ( f.description.value == "") {
	    alert( "내용을 입력해주세요." );
	    f.description.focus();
		return false;
    }
	

	
    return true;
}

</script>
</head>
<body>
<h1>문의하기페이지입니다.</h1>
 <form name="writeNotice" method="post" action="${path}/front?key=ask&methodName=insertAsk"
       onsubmit='return checkValid()' enctype="multipart/form-data">
		<div class="container" role="main">
			
				<div class="mb-3">
					<label for="title">회원 ID</label>
					<input type="text" class="form-control" name="user_id" id="title" placeholder="회원의 ID를 입력해주세요">
				</div>
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="ask_title" id="title" placeholder="제목을 입력해 주세요">
				</div>
				<div class="mb-3">
					<label for="content">문의 내용</label>
					<textarea class="form-control" rows="5" name="ask_content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
				<div class="mb-3">
					<label for="attach">첨부파일</label>
				 <input type="file" name="notice_attach" maxlength="" size="40">
				</div>
				<div class="mb-3">
					<label for="title">카테고리</label>
					<input type="text" class="form-control" name="ask_category" id="title" placeholder="카테고리명을 입력해주세요. ex)구독관련문의, 구매관련문의 등등">
				</div>
     			<div >
     				<input type="submit" value="문의하기" />
				    <input type="button" value="목록보기" onclick="location.href='ask2.jsp'"/>
			</div>
		</div>
</form>
<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${path}/board/ask2.jsp">리스트로 돌아가기</a>&gt;</span></div>
</body>
</html>