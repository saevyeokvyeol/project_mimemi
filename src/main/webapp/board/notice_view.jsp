<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세페이지</title>
    <jsp:include page="../common/header.jsp"/>
        <style type="text/css">
            .FAQ-view {width: 1200px; margin: 50px auto;}
            .FAQ-sideview {width: 200px; margin-right: 50px; z-index: 0;}
            .FAQ-sideview h3 {margin: 0 0 20px 10px;}
            .Notice-mainview {width: 950px;}
            .side-minibar {padding: 0;}
 		    .side-minibar > a {font-size: 14px; padding-left: 40px;}
            .notice-contentTitle{
                padding: 25px 30px; margin: 20px 0; border-top: 2px black solid; border-bottom: 1px grey solid;
			}
            .notice-contentTitle > div {margin: 20px 0 0; display: flex; justify-content: space-between;}
            
            .notice-contentTitle > div > span:last-child {margin-left: 30px;}
            .notice-contentview{
                margin: 50px auto; padding: 0 25px;
            }
            .notice-Image {
				max-width: 100%;
			}
            .base-btn {display: flex; justify-content: space-between; padding: 25px;}

            
        </style>

        <!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
		integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        
        <!-- jQuery -->        
        <script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
        



    </head>

    
<body>
    <section class="FAQ-view d-flex p-2 bd-highlight">
        <aside class="FAQ-sideview">
            <h3>고객센터</h3>
            <div class="list-group">
            <a href="${path}/front?key=notice&methodName=selectAll"class="list-group-item list-group-item-action active">
                공지사항
            </a>
                <a href="${path}/front?key=faq&methodName=selectAll" class="list-group-item list-group-item-action" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                FAQ
                </a>
                <div class="side-minibar">
                    <a href="${path}/front?key=faq&methodName=selectAll&field=cr" class="list-group-item list-group-item-action" id="cr">교환/환불</a>
                    <a href="${path}/front?key=faq&methodName=selectAll&field=us" class="list-group-item list-group-item-action" id="us">회원 관련</a>
                    <a href="${path}/front?key=faq&methodName=selectAll&field=op" class="list-group-item list-group-item-action" id="op">주문/결제</a>
                    <a href="${path}/front?key=faq&methodName=selectAll&field=de" class="list-group-item list-group-item-action" id="de">배송 관련</a>
                    <a href="${path}/front?key=faq&methodName=selectAll&field=ec" class="list-group-item list-group-item-action" id="ec">기타</a>
                </div>
            <a href="${path}/front?key=ask&methodName=selectAll" class="list-group-item list-group-item-action">1:1문의</a>
            </div>
        </aside>
        <!--공지 상세보기-->
        <div class="Notice-mainview"> 
            <div class="notice-view-detail"> 
                <div class="notice-title"><h1>공지사항 상세페이지</h1></div><hr>
                <div class ="notice-contentTitle">
                    <h4><strong class="noticeTitle">${noticeDetail.noticeTitle}</strong></h4>
                    <span><strong class="noticeRegdate">${noticeDetail.noticeRegdate}</strong></span>
                </div>
            </div>
            <div class="notice-contentview">
                <div class="notice-Image">
                    <img src="${path}/img/${noticeDetail.noticeAttach}">
                </div>
                <div class="notice-content">
                    <strong class ="noticeContent">${noticeDetail.noticeContent}</strong>
                </div>
            </div>
            <div class="base-btn">
                <span class="bLeft"><a href="javascript:history.back(-1)"class="btn btn-outline-dark shadow-none">목록으로 돌아가기</a></span>
                <span class="bRight"><a href="${path}/front?key=notice&methodName=delete&noticeNo=${noticeDetail.noticeNo}" class="btn btn-outline-dark shadow-none">삭제하기</a>
                <a href="${path}/front?key=notice&methodName=updateForm&noticeNo=${noticeDetail.noticeNo}" class="btn btn-outline-dark shadow-none">수정하기</a></span>
            </div>                    
        </div>
                
    </section>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>