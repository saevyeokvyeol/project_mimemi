<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	span{font-size:9pt;}

</style>
 		<!--부트스트랩 CSS CDN-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
                
        <!--부트스트랩 JS CDN-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        
        
        <script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

function checkValid() {
	var f = window.document.updateForm;
	if ( f.askTitle.value == "" ) {
		alert( "제목을 입력해 주세요." );
		f.askTitle.focus();
		return false;
	}
	
	if ( f.askContent.value == "" ) {
        alert( "내용을 입력해 주세요." );
        f.askContent.focus();
        return false;
    }

	    
}



</script>
</head>
<body>
<h1>게시물 수정하기 페이지입니다.</h1>

<form name=updateForm method=post action="${path}/front?key=ask&methodName=updateAsk"  
onSubmit='return checkValid()' enctype="multipart/form-data">
    <input type="hidden" name="askNo" value="${askDto.askNo}" >
   <div>
   <table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
    <tr>
        <td width="1220" height="20" colspan="2">
            <p align="center"><font size="3"><b>  게시물 수정하기</b></font></p>
        </td>
    </tr>
    <tr>
        <td width="150" height="20">
            <span >제목</span>
           
        </td>
        <td>
         <textarea class="form-control" rows="1" name="askTitle" id="title" >${askDto.askTitle}</textarea>
        </td>
       
    </tr>
    
    <tr>
        <td width="150" height="20" >
            <b><span >내 용</span></b>
        </td>
        <td>
        <textarea class="form-control" rows="5" name="askContent" id="content" >${askDto.askContent}</textarea>
    	</td>
    </tr>
    <tr>
    	<td width="150" height="20" >
    		<span>
    			첨부파일
    		</span>
    	</td>
    	<td>	
    		<input type="file" name="askAttach" size="30">
			<p id="file-status">${askDto.askAttach}</p>
    	</td>
    
    </tr>
    
    
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span>
		<input type="submit" value="수정하기"> <input type="reset" value="다시쓰기"></span></b></td>
    </tr>
</table>
</div>
	
</form>
	<h3>댓글 정보</h3>
	<c:choose>
	<c:when test="${empty answerDto.repliesList}">
		<h5>댓글 정보가 없습니다.</h5>
	</c:when>
	<c:otherwise>
		<c:forEach items="${elec.repliesList}" var="reply">
			${reply.replyNum} / ${reply.replyContent} / ${reply.replyRegDate} / ${reply.parentModelNum} <br>
		</c:forEach>
	</c:otherwise>
</c:choose>

<hr>
<div align=right><span >&lt;<a href="${path}/board/ask2.jsp">리스트로 돌아가기</a>&gt;</span></div>
</body>
</html>