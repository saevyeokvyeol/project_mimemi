<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세페이지</title>
</head>
<style type="text/css">
 .left side {width : 300px;
             margin:auto;}
 .body {width : 900px;
        margin:auto;}
 .search{background-color:#eeeeee; 
         height : 50px; 
         text-align:center;
         vertical-align:middle;}
  
 
 table {width:1200px;}
 th, td {border : 1px solid white;}
        </style>
        <!--부트스트랩 CSS CDN-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
                
        <!--부트스트랩 JS CDN-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        
        <!--JQgrid CDN-->
   
<body>
<table>
<tr>	
<td>
<!-- left side -->
<div class="left side"> 
	<div class="title">고객센터</div><hr width="100px">
	<ul class="menu">
		<li><a href="${path}/front?key=notice&methodName=selectAllNotice">공지사항</a></li>
		<li class="">
			<a href="faq.jsp">FAQ</a>
			<ul>
				<li class=""><a href="">교환/환불</a></li>
				<li class=""><a href="">회원관련</a></li>
				<li class=""><a href="">주문/결제</a></li>
				<li class=""><a href="">배송관련</a></li>
				<li class=""><a href="">기타</a></li>
			</ul>
		</li>
		<li><a href="ask.jsp">1:1문의</a></li>
	</ul>
</div>
</td>
<td>

<div> 
<div class="container"> 
	<div class="notice-title"><h1>공지사항 상세페이지</h1></div><hr>
	<div class ="notice-contentTitle">
	     <p><strong class="noticeTitle">${noticeDetail.noticeTitle}</strong></p>
	     <p><strong class="noticeRegdate">${noticeDetail.noticeRegdate}</strong></p>
	</div>
	<hr>
	<div>
    <div class="notice-view">
           <div class=" notice-Info">
                    <div class="notice-img">
                    <img src="${path}/img/noticeimg/${noticeDetail.noticeAttach}">
                    </div>
                    <div class="notice-content">
                        <strong class ="noticeContent">${noticeDetail.noticeContent}</strong>
                    </div>
            </div>
   </div>
            <div class="base-btn">
                <span class="bLeft"><a href="javascript:void(0);" onclick="backList()">목록으로 돌아가기<img src="목록아이콘"></a></span>
                <span class="bRight">
                	<a href="${path}/front?key=notice&methodName=delete&noticeNo=${noticeDetail.noticeNo}" >삭제<img src="수정아이콘"></a>
                </span>
        
                <span class="bRight">
               	<a href="${path}/front?key=notice&methodName=updateForm&noticeNo=${noticeDetail.noticeNo}" >수정<img src="수정아이콘"></a>
                </span>
            
            </div>
			</div>
		</div>
	</div>
</td>
</tr>
</table>
</body>
</html>