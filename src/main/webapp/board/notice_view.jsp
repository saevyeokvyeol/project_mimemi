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
            .notice-view{
                width: 1200px; margin: auto; padding: 50px 0;
            }
            table{
            	width:100%;
            }
            .left side{
                width: 100%;
              
            }
            
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
            a{ text-decoration: none; }
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
<section class="notice-view">
    <table>
        <tr>	
            <td>
                <!-- left side -->
                <div class="left side"> 
                    <div class="title">고객센터</div><hr width="100px">
                        <ul class="nav flex-column">
                            <li class="nav-item"><a class="nav-link" href="${path}/front?key=notice&methodName=selectAll">공지사항</a></liclass=>
                                <li class="nav-item"><a class="nav-link" href="${path}/front?key=faq&methodName=selectAll">FAQ</a> 
                                    <li class="nav-item"><a class="nav-link" href="${path}/front?key=faq&methodName=selectAll&field=cr">교환/환불</a></li>
                                    <li class="nav-item"><a class="nav-link" href="${path}/front?key=faq&methodName=selectAll&field=us">회원관련</a></li>
                                    <li class="nav-item"><a class="nav-link" href="${path}/front?key=faq&methodName=selectAll&field=op">주문/결제</a></li>
                                    <li class="nav-item"><a class="nav-link" href="${path}/front?key=faq&methodName=selectAll&field=de">배송관련</a></li>
                                    <li class="nav-item"><a class="nav-link" href="${path}/front?key=faq&methodName=selectAll&field=ec">기타</a></li>
                                </li>
                            <li class="nav-item"><a href="ask.jsp">1:1문의</a></li>
                        </ul>
                    </div>
                </div>
            </td>
            <td>
                <!--공지 상세보기-->
                <div> 
                    <div class="notice-view-detail"> 
                        <div class="notice-title"><h1>공지사항 상세페이지</h1></div><hr>
                            <div class ="notice-contentTitle">
                                <h4><strong class="noticeTitle">${noticeDetail.noticeTitle}제목</strong></h4>
                                <span><strong class="noticeRegdate">${noticeDetail.noticeRegdate}등록일</strong></span>
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
                            <span class="bRight"><a href="${path}/front?key=notice&methodName=delete&noticeNo=${noticeDetail.noticeNo}" class="btn btn-outline-dark shadow-none">삭제하기</a></span>
                            <span class="bRight"><a href="${path}/front?key=notice&methodName=updateForm&noticeNo=${noticeDetail.noticeNo}" class="btn btn-outline-dark shadow-none">수정하기</a></span>
                        </div>                    
                    </div>
                </div>
            </td>
        </tr>
    </table>
</section>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>