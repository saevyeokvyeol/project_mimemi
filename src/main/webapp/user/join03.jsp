<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join02</title>

<jsp:include page="../common/header.jsp" />
<style type="text/css">

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
}</script>
<script type="text/javascript">
	//datepicker 설정
	$.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear: true,
		yearSuffix: '년'
	});
	
	$(".datepicker").datepicker();
	
})
</script>

</head>
<body>
<form>
	<h1>회원가입</h1>
	<table cellspacing="0" align="center">
		<tr>
			<th>아이디</th>
			<td colspan="3"><input type="text" name="ID" size="50" placeholder="영문자 숫자를 조합하여 최소 6자리 이상 입력해주세요"/><input type="submit" value="중복확인"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pwd" size="50" placeholder="영문 대소문자, 숫자를 조합해서 8자리 이상 입력해주세요"></td>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" name="pwd2" size="50" placeholder="한번 더 입력해주세요"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td colspan="3"><input type="text" name="name" size="50" placeholder="한글 5자, 혹은 영문 20자 이내로 입력해주세요"></td>
		</tr>
		<tr>
			<th>휴대폰 번호</th>
			<td colspan="3"><input type="text" name="phone" size="50" placeholder="-를 제외하고 입력해주세요"><input type="submit" value="중복확인"></td>
		</tr>
		<tr>
			<th>이메일 주소</th>
			<td colspan="3"><input type="text" name="E-MAIL" size="30">@
				<select name="domain" size="1">
					<option value="0">선택하세요</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="daum.net">daum.net</option>
			</select></td>
		</tr>
		<tr>
			<td>배송지 주소</td>
			<td>
				<input type="text" id="sample6_postcode">
				<input type="button" onclick="sample6_execDaumPostcode()"><br>
				<input type="text" id="sample6_address"><br>
				<input type="text" id="sample6_detailAddress">
				<input type="text" id="sample6_extraAddress">

			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
				<input type="text" readonly="readonly" class="datepicker">
			</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td colspan="3"><input type="text" name="zip-code" size="10">-
				<input type="text" name="zip-code" size="10"> <input
				type="submit" value="우편번호검색"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td colspan="3"><input type="text" name="address" size="50">
			</td>
		</tr>	
		<tr>
			<td><input type="submit" value="취소"> <input type="submit" value="회원가입"></td>
		</tr>

	</table>
</form>
</body>
</html>