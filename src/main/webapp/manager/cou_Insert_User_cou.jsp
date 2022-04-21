<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원쿠폰 지급 - 미미미</title>


<style>
  table {border: double 5px gray; width:500px}
  td,th{border:1px black solid ;  padding:10px}

  input{border:solid 1px gray;}
  tr td:first-child{width:100px; text-align: center;}
  div{text-align:left;}
  a{text-decoration: none}
  
</style>
<script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
$(function() {
	//쿠폰종류선택
	function selectCouponType(){
		
			if($("select[name=select_CouponType]").val() == "LiveCp"){
				$.ajax({
					url: "${path}/ajax",
					type: "post",
					dataType: "json",
					data: {key: "coupon", methodName: "selectAllLiveCp"},
					success: function(result) {
						
						let text = "";
						$("select[name=select_Coupon]").children().remove();
						$.each(result, function(index, item) {
							
							text += `<option value="\${item.livecouId}">\${item.livecouName}</option>`;	
							
						});//each함수 끝
						
						$("select[name=select_Coupon]").append(text);
						
						
					}, // 성공 메소드
					error : function(result) {
						alert(err + " 에러 발생!");
					} // 에러 메소드
				}); // ajax 종료
				
			}else if($("select[name=select_CouponType]").val() == "RgCp"){
				
				$.ajax({
					url: "${path}/ajax",
					type: "post",
					dataType: "json",
					data: {key: "coupon", methodName: "selectAllRgCp"},
					success: function(result) {
						
						let text = "";
						$("select[name=select_Coupon]").children().remove();
						$.each(result, function(index, item) {
							text += `<option value="\${item.rgcouId}">\${item.rgcouName}</option>`;
							
						});//each함수 끝
						
						$("select[name=select_Coupon]").append(text);
						
						
					}, // 성공 메소드
					error : function(result) {
						alert(err + " 에러 발생!");
					} // 에러 메소드
				}); // ajax 종료
				
			}//if-else끝
			
		
	} // selectCouponType() 메소드 종료
	
	$(document).on("change", "select[name=select_CouponType]", function() {
		selectCouponType();
	})
	selectCouponType();
	
});//ready 끝
   

	
</script>

</head>
<body>

<form name="inForm" method="post" id="inForm" action="${path}/front?key=coupon&methodName=insertUserCp">
<table>
   <caption><h2> 회원쿠폰지급 Form</h2></caption>
  <tr>
	<td>회원ID</td>
	<td><input type="text" name="userId" id="userId"/></td>
  </tr>
  <tr>
	<td>쿠폰종류</td>
	<td>
		<select name="select_CouponType" id="select_CouponType">
        	<option name="couponType" value="LiveCp">-실시간쿠폰-</option>
            <option name="couponType" value="RgCp">-정기쿠폰-</option>          
        </select>
	</td>
  </tr>
  <tr>
	<td>쿠폰선택</td>
	<td>
		<select name="select_Coupon" id="select_Coupon" >        
        </select>
	</td>
  </tr>
  <tr>
	<td>쿠폰사용여부</td>
	<td><input type="text" name="usercouUsable" id="usercouUsable"/></td>
  </tr>
  <tr>
	<td>쿠폰발행일</td>
	<td><input type="text" name="usercouPubdate" id="usercouPubdate"/></td>
  </tr>
  <tr>
	<td>쿠폰만료일</td>
	<td><input type="text" name="usercouPubdate" id="usercouPubdate"/></td>
  </tr>
  <tr>
	<td colspan="2" >
	
	<input type="submit" value="지급" id="btn"/>
	<input type="reset" value="취소" />
	</td>
	
  </tr>
  </table> 
</form>

<p>
<div>
	<a href="selectCouponAll.jsp">&lt;리스트로 돌아가기&gt;</a>
</div>


</body>
</html>