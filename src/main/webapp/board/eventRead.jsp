<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
      <jsp:include page="../common/header.jsp"/>
        <style>
        .event-view{
             width: 1200px; margin: auto; padding: 50px 0;
         }
		.event-Front-Image-area {
				padding: 25px 30px; margin: 20px 0; border-top: 2px black solid; border-bottom: 1px grey solid;
			}

		.event-Front-Image-area > div {margin: 20px 0 0; display: flex; justify-content: space-between;}
            
        .event-Front-Image-area > div > span > span:last-child {margin-left: 30px;}
		.event-content-area {
				margin: 50px auto; padding: 0 25px;
			}
		.event-Attach-area {
				max-width: 100%;
			}
		
            
            
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
        <section class="event-view">
        	<h1>이벤트 상세 보기 </h1>
            <div class="event-container">
                
                
                    <!--이벤트 썸네일-->
                    <div class="event-Front-Image-area">
                        <c:choose>
                            <c:when test ="${not empty eventDetail.eventImg}">
                                <span>
                                    <img src="${path}/img/save/${eventDetail.eventImg}" alt="이벤트 썸네일입니다." name="eventImg" id="eventImg" class="img-thumbnail">
                                    
                                </span>
                            </c:when>
                            <c:otherwise>
                                <span class="event-Image-isEmpty">
                                    <img src="${path}/img/eventTumbnail.jpg" alt="이벤트 기본 썸네일 이미지입니다." name="eventImg-when-empty" id="eventImg-when-empty">
                                </span>
                            </c:otherwise>
                        </c:choose>
                         <div class="event-title">
                            <h3>${eventDetail.eventTitle}</h3>
                        </div>
                        <div class="event-date-info">
                        <span></span>
                        <span>
                            <span>이벤트 진행기간</span>
                            <span>${eventDetail.eventStartdate} ~ ${eventDetail.eventEnddate}</span>
                        </span>
                        </div>
                    </div>
                    <!--이벤트 내용-->
                    <div class="event-content-area">
                       
                        <div class="event-content">
                            <pre>${eventDetail.eventContent}</pre>
                        </div>
                         <!--이벤트 첨부파일 이미지-->
	                    <div class="event-Attach-area">
	                        <span><img src="${path}/img/save/${eventDetail.eventAttach}" alt="이벤트 상세 정보 이미지입니다." name="eventAttach" id="eventAttach"></span>
	                    </div>
                    </div>
                   
                
            </div>
        	<hr>
            <!--이벤트 정보 하단 -->
            <div class="base-btn">
                <span class="bLeft"><a href="${path}/front?key=event&methodName=selectAll&pageNum=${pageNum}" id="back-list-btn" class="btn btn-outline-dark shadow-none">목록으로 돌아가기</a></span>
            </div>

        </section>    
    </body>
    <jsp:include page="../common/footer.jsp"/>
</html>