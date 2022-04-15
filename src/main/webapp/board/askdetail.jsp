<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">

	span{font-size:9pt;}

</style>
<script type="text/javascript">

function sendUpdate(){
	document.requestForm.methodName.value ="updateForm";
	document.requestForm.submit();
}



function sendDelete(){
	if(document.requestForm.password.value==""){
		alert("비밀번호 입력하세요.");
		document.requestForm.password.focus();
		return;
	}
	
	document.requestForm.methodName.value ="delete";
	document.requestForm.submit();
}

</script>
</head>
<body>
<h1>상세보기 페이지입니다.</h1>

<table align="center" cellpadding="5" cellspacing="2" width="600" border='1'>
    <tr>
        <td width="1220" height="20" colspan="4" >
            <p align="center"><size="3"><b>
             상세 보기</b></font></p>
        </td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span>글번호</span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<span><b>${elec.modelNum}</b></span>
        </td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span>작성날짜</span></b></p>
        </td>
        <td width="300" height="20">
        	<span ><b>${requestScope.ask.askRegdate}</b></span>
        </td>
        
    </tr>
    
    <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span>내용</span></b></p>
        </td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="450" height="200" valign="top" colspan="3">
        <span><b><pre>${requestScope.elec.description}</pre></b></span></td>
    </tr>
    
      <c:if test="${ask.askAttach!=null}">
       <tr>
        <td width="100" height="20">
            <p align="right"><b><span>첨부파일명</span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<span><b>
        	<a href='${path}/downLoad?fileName=${ask.askAttach}'>
    			${ask.askAttach} 
      		</a>
      		  
        </b></span>
        </td> 
    </tr>
    </c:if>
    
   
   
    <form name="requestForm" method=post action="${path}/board/askupdate.jsp">
 
    
    <tr>
        <td height="20" colspan="4" align="center" valign="middle">
			<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
				<input type=hidden name="askNo" value="${ask.askNo}">
				<input type=hidden name="key" value="ask">
				<input type=hidden name="methodName" >
				<input type=hidden name="pageNo" value="${pageNo}" >
				<input type=button value="수정하기" onClick="sendUpdate()">
				<input type=button value="삭제하기" onClick="sendDelete()">
    </form>
			
		</td>
    </tr>
</table>
</body>
</html>