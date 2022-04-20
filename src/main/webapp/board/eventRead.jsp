<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
       
        <style>
            section{
                
            }
            .container{
                width: 1000px;
                margin: auto;
            }
            .review-view{
                width: 1000px;
                height:500px;
            }
            
            .review-Image{
            	box-sizing: border-box;
                width: 400px;
                height: 100%;
                float: left;
                
            }
            .review-userInfo{
                box-sizing: border-box;
                width: 400px;
                height: 100%;
                padding: 20px 0px 20px 20px;
                float: left;
                
            }
            
            #reviewImg, #reveiwImg-when-empty{
            	box-sizing: border-box;
                width:400px;
                height: 100%;
                object-fit:contain;
                background-color: rgb(241, 241, 241);
                float: left;
            }
            .reivew-writer{
                box-sizing: border-box;
                height: 60px;
            }
            img.starRateImg{
            	box-sizing: border-box;
                width:130px;
                height: auto;
                padding-bottom: 5px;                
            }
            .review-contentTitle{
                box-sizing: border-box;
                height: 40px;
                font-size: large;
                font-weight: bold;
            }
            .review-content{
                box-sizing: border-box;
                overflow-y: auto;
                height: 300px;
            }
            
            .review-goods{
                box-sizing: border-box;
                height: auto;
            }
            #goodsImg{
                width: 20px;
                height: auto;
            }
            .bLeft{
                float: left;
            }
            .bRight{
                float: right;
            }
            
            .base-btn{
                width: 800px;
                height: 20px;
                margin: 20px 0px 50px;
            }
            #back-list-btn, #delete-btn, #update-btn{
                background-color: rgb(248, 249, 250);
                color: gray;
                border: 2px solid gray;
                border-radius: 15px;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                font-weight: bold;
            }
            #back-list-btn:hover{
                background-color: cornflowerblue;
                border: 2px solid cornflowerblue;
                color: white;
            }
            #delete-btn:hover, #update-btn:hover{
                background-color: rgb(207, 207, 207);
                border: 2px solid rgb(207, 207, 207);
                color: white
            }

            .review-reply{
                width: 800px;
            }
            .user-write-wrap{
                width: 800px;
                padding: 10px;
                border: 1px solid gray;
            }
            .review_reply_wrap{
                width: 800px;
                padding: 20px 30px 20px 30px;
            }
            img.reply-user-icon{
            	width: 30px;
            	margin-right: 10px;
            }
            pre{
            	white-space: pre-wrap;
            }
            .reply-user-info{
                padding-bottom: 5px;
            }
            .reply-content-text{
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
                width: fit-content;
                padding: 10px;
                border-radius: 15px;
                background-color: rgb(248, 249, 250);
                border: 1px solid rgb(196, 196, 196);
            }
            .reply-content{
            	padding:10px 10px 10px 0px;
            }
            #reply-update-bnt, #reply-delete-bnt{
            	color:gray;
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
        <section>
        <div class="container">
            <div class="review-title">
                <h4>이벤트 상세 보기 </h4>
                <hr>
            </div>
            <div class="review-view">
                <div class="review-Image">
                    <c:choose>
                        <c:when test ="${not empty reviewDetail.reviewAttach}">
                            <span>
                            	<img src="${path}/img/save/${reviewDetail.reviewAttach}" alt="회원이 올린 후기 사진입니다." name="reviewImg" id="reviewImg">
                            </span>
                        </c:when>
                        <c:otherwise>
                            <span class="review-Image-isEmpty">
                                <img src="${path}/img/goods/${reviewDetail.goodsDTO.goodsThumbnail}" alt="후기를 작성한 상품의 썸네일 이미지입니다." name="reveiwImg-when-empty" id="reveiwImg-when-empty">
                            </span>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="review-userInfo">
                    <div class="reivew-writer">
                        <div class="review-rate">
                            <c:choose>
                                <c:when test="${reviewDetail.reviewRate==1}">
                                    <span> <img src="${path}/img/ui/starRate1.jpg" class="starRateImg"></span>
                                </c:when>
                                <c:when test="${reviewDetail.reviewRate==2}">
                                    <span><img src="${path}/img/ui/starRate2.jpg" class="starRateImg"></span>
                                </c:when>
                                <c:when test="${reviewDetail.reviewRate==3}">
                                    <span><img src="${path}/img/ui/starRate3.jpg" class="starRateImg"></span>
                                </c:when>
                                <c:when test="${reviewDetail.reviewRate==4}">
                                    <span><img src="${path}/img/ui/starRate4.jpg" class="starRateImg"></span>
                                </c:when>
                                <c:when test="${reviewDetail.reviewRate==5}">
                                    <span><img src="${path}/img/ui/starRate5.jpg" class="starRateImg"></span>
                                </c:when>
                            </c:choose>
                        </div>
                        <div>
                            <strong class="userName">${reviewDetail.userDTO.userName}</strong>
                            <span>${reviewDetail.reviewRegdate}</span>
                        </div>
                    </div>
                    <div class="review-contentTitle">
                        <p>${reviewDetail.reviewTitle}</p>
                    </div>
                    <div class="review-content">
                        <pre>${reviewDetail.reviewContent}</pre>
                    </div>
                    <div>
                        <span>조회수</span><span>${reviewDetail.reviewViews}</span>
                    </div>
                    <div class="review-goods">
                            <img src="${path}/img/goods/${reviewDetail.goodsDTO.goodsThumbnail}" alt="상품 이미지입니다." name="goodsImg" id="goodsImg">
                            <a href="#">${reviewDetail.goodsDTO.goodsName}</a>
                    </div>
                </div>
            </div>
            <div class="base-btn">
                <span class="bLeft"><a href="javascript:void(0);" onclick="backList()" id="back-list-btn">목록으로 돌아가기</a></span>
                <span class="bRight"><a href="${path}/front?key=review&methodName=delete&reviewNo=${reviewDetail.reviewNo}" id="delete-btn">삭제</a></span>
                <span class="bRight"><a href="${path}/front?key=review&methodName=updateForm&reviewNo=${reviewDetail.reviewNo}" id="update-btn" >수정</a></span>
            </div>
            <div class="review-reply">
               <!-첨부파일 이미 -->
                
            </div>

        </div>
        </section>
    </body>
</html>