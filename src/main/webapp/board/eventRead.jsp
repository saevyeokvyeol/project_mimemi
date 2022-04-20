<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
       
        <style>
            
            
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
        <section>
            <div class="event-container">
                <div class="event-title">
                    <h4>이벤트 상세 보기 </h4>
                    <hr>
                </div>
                <div class="event-view">
                    <!--이벤트 썸네일-->
                    <div class="event-Front-Image-area">
                        <c:choose>
                            <c:when test ="${not empty eventDetail.eventImg}">
                                <span>
                                    <img src="${path}/img/save/${eventDetail.eventImg}" alt="이벤트 썸네일입니다." name="eventImg" id="eventImg">
                                </span>
                            </c:when>
                            <c:otherwise>
                                <span class="event-Image-isEmpty">
                                    <img src="${path}/img/eventTumbnail.jpg" alt="이벤트 기본 썸네일 이미지입니다." name="eventImg-when-empty" id="eventImg-when-empty">
                                </span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <!--이벤트 내용-->
                    <div class="event-content-area">
                        <div class="event-title">
                            <p>${eventDetail.eventTitle}</p>
                        </div>
                        <div class="event-date-info">
                            <span>이벤트 진행기간</span>
                            <span>${eventDetail.eventStartdate} ~ ${eventDetail.eventEnddate}</span>
                        </div>
                        <div class="event-content">
                            <pre>${eventDetail.eventContent}</pre>
                        </div>
                    </div>
                    <!--이벤트 첨부파일 이미지-->
                    <div class="event-Attach-area">
                        <span><img src="${path}/img/save/${eventDetail.eventAttach}" alt="이벤트 상세 정보 이미지입니다." name="eventAttach" id="eventAttach"></span>
                    </div>
                </div>
            </div>
        
            <!--이벤트 정보 하단 onclick만들어야 함!!!!!!!!!!!!!-->
            <div class="base-btn">
                <span class="bLeft"><a href="${path}/front?key=event&methodName=selectAll" id="back-list-btn">목록으로 돌아가기</a></span>
            </div>

        </section>    
    </body>
</html>