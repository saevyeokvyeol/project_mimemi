<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트등록 - 미미미</title>
<style>
  table {border: double 5px gray; width:500px}
  td,th{border:1px black solid ;  padding:10px}

  input{border:solid 1px gray;}
  tr td:first-child{width:100px; text-align: center;}
  div{text-align:left;}
  a{text-decoration: none}
   
</style>
<script type="text/javascript">
	function checkValid(){
		
	}
</script>
</head>
<body>

<!-- 
     아래 문장으로 전송하면 post방식으로 전송이되고 현재 파일업로드때문에 enctype="multipart/form-data" 설정되어 있기때문에 
     request로 값을 받을수가 없다. ( MulitpartRequest로 받아야한다.) 그런데 Controller로 가기전에 Controller를 찾기위해서 
     DispatherServlet에서 request로 두개의 값을 받고 있기때문에 key, methodName은 get방식으로 별도로 전송해야한다.
     
	<input type="hidden" name="key" value = "event" />
	<input type="hidden" name="methodName" value = "insert" />  

 -->
<div class="review-writeForm">
	<form name="writeReview" method="post" action="${path}/front?key=event&methodName=insert"
     onSubmit='return checkValid()' enctype="multipart/form-data">
		<table>
		
		    <tr>
		        <td colspan="2">
		            <p><font><b> 이벤트 등록 </b></font></p>
		        </td>
		    </tr>
		    <tr>
		        <td>
		            <p><b><span>제목</span></b></p>
		        </td>
		        <td><b><span>
				<input type=text name="eventTitle" size="50"></span></b></td>
		    </tr>
		    <tr>
		        <td>
		            <p><b><span>내용</span></b></p>
		        </td>
		        <td><b><span>
				<textarea name="eventContent" cols="50" rows="10"></textarea></span></b></td>
		    </tr>
		    <tr>
		        <td>
		            <p><b><span>*첨부파일</span></b></p>
		        </td>
		        <td><b><span>
				<input type="file" name="eventAttach" maxlength="60" size="40"></span></b></td>
		    </tr>
		    <tr>
		        <td>
		            <p><b><span>썸네일이미지</span></b></p>
		        </td>
		        <td><b><span>
				<input type="file" name="eventImg" maxlength="60" size="40"></span></b></td>
		    </tr>
		    <tr>
		        <td>
		            <p><b><span>이벤트 시작일</span></b></p>
		        </td>
		        <td><b><span>
				<input type=text name="eventStartdate" size="50"></span></b></td>
		    </tr>
		    
		     <tr>
		        <td>
		            <p><b><span>이벤트 종료일</span></b></p>
		        </td>
		        <td>
		        	<b><span>
		        		 <input type=text name="eventEnddate" size="50">
		        	   </span></b>
		        </td>
		    </tr>
		    <tr>
		        <td colspan="2"><b><span><input type=submit value=등록하기> 
		        <input type=reset value=취소하기></span></b></td>
		    </tr>
		</table>
	</form>
</div>
<p>
<div>
	<a href="${path}/front?key=event&methodName=selectAll">&lt;리스트로 돌아가기&gt;</a>
</div>


</body>
</html>