<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<jsp:include page="../common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정하기</title>
<style type="text/css">
	section{width: 1200px; margin: auto;}
	
	#pwdCheck_Success{color: blue; display:none;}
	#pwdCheck_Fail{color: red; display: none;}
	
</style>
<script type="text/javascript">
  $(function(){
	  /*
	  비밀번호 일치 여부 체크
	  */
	  $("#newPwd2").focusout(function(){
		  let pwd1 = $("#newPwd").val();
		  let pwd2 = $("#newPwd2").val();
		  
		  if(pwd1 != "" && pwd2 ==""){
			 null;
		  }else if(pwd1 != "" || pwd2 != ""){
			 if(pwd1 == pwd2){
				 $("#pwdCheck_Success").css("display","inline-block");
				 $("#pwdCheck_Fail").css("display","none");
				 return true;
			 }else{
				 $("#pwdCheck_Success").css("display","none");
				 $("#pwdCheck_Fail").css("display","inline-block");
				 return false;
				 $("#newPwd2").focus();
			 }	
		   }		  
	  })
	  
	  /*
	  비밀번호 유효성 체크
	  */
	  $("#newPwd").focusout(function(){
			var isValidPwd = /^[a-zA-Z0-9]{8,20}$/;
			if( !isValidPwd.test($(this).val())){
				alert("비밀번호는 영어와 숫자를 조합하여 8자리 이상 최대 20자리 이하로 입력해주세요");
				return false;
				$(".userPwd_input").focus();
			}
			return true;
		})
	  /*
	  비밀번호 재설정
	  */
  })
  
</script>
</head>
<body>
<h1>비밀번호를 재설정 해주세요</h1>
<section>
	<form>
		<table>
		  <tr>
       	     <th>비밀번호</th>
             <td><input type="password" name="pwd" size="50" id="newPwd" placeholder="영문 대소문자, 숫자를 조합해서 8자리 이상 입력해주세요"></td>
     	  </tr>
     	  <tr>
        	 <th>비밀번호 확인</th>
     	     <td><input type="password" name="pwd2" size="50" id="newPwd2" placeholder="한번 더 입력해주세요"></td>
     	  </tr><p>
     	  <tr>
	        <span id="pwdCheck_Success">비밀번호가 일치합니다</span>
	        <span id="pwdCheck_Fail">비밀번호가 일치하지 않습니다</span>
	      </tr>
		</table>
		<div>
		  <input type="submit" id="updatePwdBtn" value="비밀번호 재설정하기">
		</div>
	</form>
</section>
</body>
</html>