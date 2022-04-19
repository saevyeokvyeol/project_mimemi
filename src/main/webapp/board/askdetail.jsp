<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	span{font-size:9pt;}

</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
 
<script type="text/javascript">

	$(function(){
		
	
		function sendUpdate(){
			document.requestForm.methodName.value ="updateForm";
			document.requestForm.submit();
		}
		
		$("a[name]").click(function(){
			if( confirm("정말 삭제하실래요??") ){
				
				var idValue = $(this).parent().siblings().eq(1).text();
				
				location.href="${path}/delete?id="+idValue;
			}
		})
	})

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
        	<div><b>${askDto.askNo}</b></div>
        </td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span>회원 ID</span></b></p>
        </td>
        <td width="300" height="20">
        	<span ><b>${askDto.userId}</b></span>
        </td>
        
    </tr>
    
    <tr>
		<td width="100" height="20" valign="top">
            <p align="right"><b><span>제목</span></b></p>
        </td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="300" height="20">
        	<span ><b>${askDto.askTitle}</b></span>
        </td>
   	
    </tr>
    
      
       <tr>
        <td width="100" height="20">
            <p align="right"><b><span>내용</span></b></p>
        </td>
        <td width="450" height="200" valign="top" colspan="3">
        <span><b>${askDto.askContent}</b></span>
        </td>
        
        
    </tr>
   
    
   
   
    <form name="requestForm" method=post action="${path}/front">
 
    
    <tr>
        <td height="20" colspan="4" align="center" valign="middle">
			<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
				<input type=hidden name="askNo" value="${askDto.askNo}">
				<input type=hidden name="key" value="ask">
				<input type=hidden name="methodName" >
				<input type=hidden name="pageNo" value="${pageNo}" >
				<input type=button value="답글달기" onClick="sendUpdate()">
				<input type=button value="삭제하기" onClick="sendDelete()">
				<a href="#" name="${askDto.userId}">삭제</a>
				
    </form>
			
		</td>
    </tr>
</table>
</body>
</html>