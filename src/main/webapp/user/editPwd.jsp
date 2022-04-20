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
	#notValidPwd{color: red; display: none;}
	
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
			 return false;
			 alert("비밀번호 일치 여부를 진행해주세요");
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
		  var pwd = $("#newPwd").val();
			
			var isNum = pwd.search(/[0-9]/g);
			var isLower = pwd.search(/[a-z]/g);
			var isUpper = pwd.search(/[A-Z]/g);
			
			if(pwd.length<8 || pwd.length>20){		//길이체크
				$("#notValidPwd").css("display","inline-block");
				return false;
				$(".userPwd_input").focus();
			}else if(pwd.search(/\s/) != -1 ){		//공백체크
				$("#notValidPwd").css("display","inline-block");
				return false;
				$(".userPwd_input").focus();
			}else if(isNum<0 || isLower<0 || isUpper<0){	//영대,소문자 숫자 체크
				$("#notValidPwd").css("display","inline-block");
				return false;
				$(".userPwd_input").focus();
			}else{
				$("#notValidPwd").css("display","none");
				return true;
			}
		})
	  /*
	  비밀번호 재설정
	  */
	  $("#updatePwdBtn").click(function(){
		  $.ajax({
			  url: "${path}/ajax",
			  type: "post",
			  datatype: "text",
			  data: {key: "user", methodName: "updatePwd", userId: $("#userId").val(), userPwd: $("#newPwd").val()},
			  success: function(result){
				  alert(result);
				  location.href="${path}/user/login.jsp";
			  },
			  error: function(err){
				  alert(err);
			  }
			  
		  })
	  })
  })
  
</script>
</head>
<body>
<h1>비밀번호를 재설정 해주세요</h1>
<section>
	<form action="${path}/front?key=user&methodName=updatePwd" method="post">
		<table>
		  <tr>
       	     <th>비밀번호</th>
             <td><input type="password" name="userPwd" size="50" id="newPwd" placeholder="영문 대소문자, 숫자를 조합해서 8자리 이상 입력해주세요"></td>
     	  </tr>
     	  <tr>
        	 <th>비밀번호 확인</th>
     	     <td><input type="password" name="userPwd2" size="50" id="newPwd2" placeholder="한번 더 입력해주세요">
     	     <span id="notValidPwd">비밀번호는 공백 없이 영대문자, 영소문자와 숫자를 조합하여 8자리 이상 최대 20자리 이하로 입력해주세요</span></td>
     	  </tr><p>
     	  <tr>
	        <span id="pwdCheck_Success">비밀번호가 일치합니다</span>
	        <span id="pwdCheck_Fail">비밀번호가 일치하지 않습니다</span>
	      </tr>
		</table>
		<div>
		  <input type="submit" id="updatePwdBtn" value="비밀번호 재설정하기">
		  <input type="hidden" value="${userId}" id="userId">
		  ${userId}
		</div>
	</form>
</section>
</body>
</html>