<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<style>
</style>

<script>
// FAQ 열었다 닫혔다 하는 스크립트 소스
var old_menu = '';
function menuclick(submenu) {
 
 if( old_menu !='' ) {
  old_menu.style.display = 'none';
 }
 submenu.style.display = '';
 old_menu = submenu;
 }
</script>
</head>

<body>

<dl>
 <dt><a href="javascript:menuclick(faq1);" onFocus="this.blur()">1. FaQ에대해서 궁금합니다</a></dt>
 <dd id="faq1" style="display:none;"> 궁금증 해결</dd>
 
 <dt><a href="javascript:menuclick(faq2);" onFocus="this.blur()">2. 칫솔질은 언제부터 하나요?</a></dt>
 <dd id="faq2" style="display:none;"> 손잡이가 달린...</dd>
 
 <dt><a href="javascript:menuclick(faq3);" onFocus="this.blur()">3. 치과 검진은 언제부터 시작하는 것이 좋나요?</a></dt>
 <dd id="faq3" style="display:none;"> 어린이들의 치과...</dd>

 <dt><a href="javascript:menuclick(faq4);" onFocus="this.blur()">4. 작동은 잘 되나요?</a></dt>
 <dd id="faq4" style="display:none;"> 네 잘됩니다...</dd>
</dl>

</body>
</html>

</html>