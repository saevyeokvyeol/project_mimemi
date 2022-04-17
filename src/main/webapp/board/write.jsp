<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	span{font-size: 9pt; }


</style>
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

<form name="writeForm" method="post"  action="${path}/board/ask2.jsp?key=ask&methodName=insertAsk"
  onSubmit='return checkValid()' enctype="multipart/form-data">
<table align="center" cellpadding="5" cellspacing="2" width="600" border="1" >



    <tr>
        <td width="1220" height="20" colspan="2" >
            <p align="center"><fontsize="3"><b> 문의 하기 </b></font></p>
        </td>
    </tr>
    <tr>
    	<td>
    		<p><span>글 번호</span></p>
    	</td>
    	<td><span></span></td>
    </tr>
    <tr>
    	<td>
    		<span>회원 ID</span>
    	</td>
    	<td>
    		<span>
 				<input type="text" name="userId" size="15" id="">   	
    		</span>
    	</td>
    </tr>
    
    <tr>
        <td width="150" height="20" >
            <p align="center"><b><span>제목</span></b></p>
        </td>
        <td width="450" height="20"><b><span>
		<input type=text name="askTitle" size="20" id=""></span></b></td>
    </tr>
      <tr>
        <td width="150" height="20" >
            <p align="right"><b><span>내 용</span></b></p>
        </td>
        <td ><b><span style="font-size:9pt;">
		<textarea name="askContent" cols="50" rows="10"></textarea></span></b></td>
    </tr>
 
     <tr>
        <td width="150" height="20">
            <p align="center"><b><span>*파일첨부</span></b></p>
        </td>
        <td width="450" height="20">
        	<b><span>
        		 <input type="askAttach" name="file" maxlength="60" size="40">
        	   </span></b>
        </td>
    </tr>
    <tr>
    	<span>작성날짜</span>
    </tr>
    <tr>
    	<span></span>
    </tr>
    <tr>
    	<td>
    	<select>
    		<option value="0">--카테고리종류--</option>
			<option value="id_b">구매문의</option>
			<option value="id_a">기타문의</option>
		</select>
    	</td>
    	<td>
    		<input type="text" placeholder="직접 입력해주세요" >
    	</td>
    </tr>
   
    
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span><input type=submit value=문의하기 id="submit"> 
        <input type=reset value=다시쓰기></span></b></td>
    </tr>
</table>

</form>

<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${path}/board/ask2.jsp">리스트로 돌아가기</a>&gt;</span></div>
</body>
</html>