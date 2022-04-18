<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	span{font-size:9pt;}

</style>

<script type="text/javascript">

function checkValid() {
	var f = window.document.updateForm;
	if ( f.askTitle.value == "" ) {
		alert( "모델이름을 입력해 주세요." );
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

<form name=updateForm method=post action="${path}//board/ask.jsp" onSubmit="return checkValid()">
    <input type="hidden" name="key" value="elec" >
    <input type="hidden" name="methodName" value="update" >
    <input type='hidden' name='modelNum' value="${ask.modelNum}">
	<table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
    <tr>
        <td width="1220" height="20" colspan="2">
            <p align="center"><font size="3"><b>  게시물 수정하기</b></font></p>
        </td>
    </tr>
    <tr>
        <td width="150" height="20">
            <b><span >제목</span></b>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="askTitle" size="30"
		 value="${askDto.askTitle}"></span></b></td>
    </tr>
    
    <tr>
        <td width="150" height="20" >
            <b><span >내 용</span></b>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<textarea name="askContent" cols="50" rows="10">${ask.askContent}</textarea></span></b></td>
    </tr>
    
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span>
		<input type="submit" value="수정하기"> <input type="reset" value="다시쓰기"></span></b></td>
    </tr>
</table>

</form>
<hr>
<div align=right><span >&lt;<a href="${path}/board/ask2.jsp">리스트로 돌아가기</a>&gt;</span></div>
</body>
</html>