<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<form name="writeForm" method="post"  action="${path}/board/ask.jsp?key=ask&methodName=insertAsk"
  onSubmit='return checkValid()' enctype="multipart/form-data">
<table align="center" cellpadding="5" cellspacing="2" width="600" border="1" >



    <tr>
        <td width="1220" height="20" colspan="2" >
            <p align="center"><fontsize="3"><b> 문의 하기 </b></font></p>
        </td>
    </tr>
    <tr>
        <td width="150" height="20" >
            <p align="center"><b><span style="font-size:9pt;">제목</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="askTitle" size="30" id="a"></span></b></td>
    </tr>
      <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">내 용</span></b></p>
        </td>
        <td ><b><span style="font-size:9pt;">
		<textarea name="askContent" cols="50" rows="10"></textarea></span></b></td>
    </tr>
 
     <tr>
        <td width="150" height="20">
            <p align="center"><b><span style="font-size:9pt;">*파일첨부</span></b></p>
        </td>
        <td width="450" height="20">
        	<b><span style="font-size:9pt;">
        		 <input type="askAttach" name="file" maxlength="60" size="40">
        	   </span></b>
        </td>
    </tr>
    
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;"><input type=submit value=문의하기 id="submit"> 
        <input type=reset value=다시쓰기></span></b></td>
    </tr>
</table>

</form>

<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${path}/board/ask.jsp">리스트로 돌아가기</a>&gt;</span></div>
</body>
</html>