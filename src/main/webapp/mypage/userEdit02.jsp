<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userEdit</title>
<style type="text/css">
	#updatePwdForm{border: thin; border-color: green}
	span{display: none; color: red;}
	
	#pwdCheck_Success{color: blue;}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>
<script type="text/javascript">
	$(function(){	
	
	/*
	비밀번호 일치 여부 체크
	*/
	$("#userPwd2").focusout(function() {
		let pwd1 = $("#userPwd").val();
		let pwd2 = $("#userPwd2").val();
		
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
			}	
		}
	})
	
	/*
		비밀번호 형식 체크
		*/
		$("#userPwd").focusout(function(){
			var pwd = $("#userPwd").val();
			
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
})	
</script>
<script type="text/javascript">
$(function(){
	$("#updateUserForm").submit(function(){
		/*
		휴대폰 번호 중복체크 여부 확인
		*/
		if(!isPhoneChecked){
			alert("핸드폰번호 중복체크를 진행해주세요.");
			return false;
		}
	})
	
	/*
		핸드폰 번호 형식 체크
		*/
		$("#userPhone").focusout(function(){
			var userPhone = $(this).val();
			var isValidPhone = /^010?([0-9]{8})$/;
			
			if(!isValidPhone.test(userPhone)){
				$("#blankPhone").css("display","inline-block");
				return false;
				$(".userPhone_input").focus();
			}
		})//휴대폰 번호 형식 체크 끝
		
		
		/*
		핸드폰 번호 중복 체크
		*/
		$("#phoneCheck").click(function() {

			if ($(".userPhone_input").val() == '') {
				alert("휴대폰번호를 입력해주세요.")
				return;
			}
			if ($(".userPhone_input").val().includes("-")){
				alert("-를 제외한 번호 11자리를 입력해주세요")
				return;
			}
			$.ajax({
				url : "${path}/ajax",
				data : {
					key : "user",
					methodName : "phoneCheck",
					userPhone : $("input[id=userPhone]").val()
				}, 
				datatype : "text",

				success : function(data) {
					if (data == "true") {
						alert("이미 가입한 이력이 있는 번호입니다.<br>아이디 찾기를 이용해주세요");
						$(".userPhone_input").focus();
						return;
					} else {
						alert("사용가능한 번호입니다.");
						isPhoneChecked=true;
						return;
					}
				},//success 끝
				error : function(err){  
		   			alert(err+"에러 발생했어요.");
		   		}
			})//ajax 끝
		}) //번호 중복 체크 끝
	
	
	/*
		phone 값 변경하면 중복체크 다시
	*/
	$("input[id=userPhone]").keyup(function(){
		isPhoneChecked=false;
	})
	
})
</script>
</head>
<body>
<h1> 회원정보 수정하기 </h1>
  <form id="updatePwdForm" method="post" action="${path}/front?key=user$methodName=updatePwd">
   <fieldset>
    <legend> 비밀번호 수정 </legend>
    <table>
      <tr>
        <th>아이디</th>
        <td>${userId}</td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td><input type="password" name="userPwd" id="userPwd" size="50" placeholder="영문 대소문자, 숫자를 조합해서 8자리 이상 입력해주세요" required>
        <span id="notValidPwd">비밀번호는 공백 없이 영대문자, 영소문자와 숫자를 조합하여 8자리 이상 최대 20자리 이하로 입력해주세요</span></td>
      </tr>
      <tr>
        <th>비밀번호 확인</th>
        <td><input type="password" name="userPwd2" id="userPwd2" size="50" placeholder="한번 더 입력해주세요" required>
        <span id="pwdCheck_Success">비밀번호가 일치합니다</span>
		<span id="pwdCheck_Fail">비밀번호가 일치하지 않습니다.</span></td>
      </tr>
    </table>
    <div><button class="updatePwd">비밀번호 재설정하기</button></div>
    </fieldset>
  </form>
  
  <form id="updateUserForm">
    <table>
       <tr>
        <th>이름</th>
        <td>${userName}</td>
       </tr>
       <tr>
         <th>휴대폰 번호</th>
         <td><input type="text" id="userPhone" class="userPhone_input" name="userPhone" size="50" placeholder="-를 제외하고 입력해주세요" required>
			<button type="button" class="phone_overlap_button" id="phoneCheck" >중복검사</button>
			<span id="blankPhone">'-'를 제외하고 010으로 시작하는 휴대폰 번호 11자리를 입력해주세요</span></td>
       </tr>
		<tr>
		  <th>생년월일</th>
		  <td>${userBirth}</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td colspan="3"><input type="text" name="zip-code" size="10">-
				<input type="text" name="zip-code" size="10"> <input
				type="submit" value="우편번호검색"></td>
		</tr>
		<tr>
			<th>배송지 주소</th>
			<td>
				<input type="text" id="sample6_postcode" name="zipcode" readonly="readonly" required>
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호검색"><br>
				<input type="text" id="sample6_address" name="addrAddr" required><br>
				<input type="text" id="sample6_detailAddress" name="addrDetailAddr" placeholder="상세주소1(선택)">
				<input type="text" id="sample6_extraAddress" name="addrRefAddr" placeholder="상세주소2(선택)">
			</td>
		</tr>
    </table>
    	<div><input type="submit" value="취소"><input type="submit" value="회원정보 수정"></div>
  </form>
     


</body>
</html>