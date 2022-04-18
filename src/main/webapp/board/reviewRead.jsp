<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
       
        <style>
            .container{
                width: 1000px;
                margin: auto;
            }
            .review-view{
                width: 800px;
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
        </style>
        <!--부트스트랩 CSS CDN-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
                
        <!--부트스트랩 JS CDN-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        
        <!--JQgrid CDN-->
        <script>
        	var methodName = "${methodName}"
            function returnList(){

            }
        	function sendDelete(){
        		//session에 로그인된 사용자 id가 현재 게시글의 사용자 id와 일치하는지 체크하기
        	}
            function sendUpdate(){
            	//session에 로그인된 사용자 id가 현재 게시글의 사용자 id와 일치하는지 체크하기
            	if(true){
            		location.replace("${path}")
            	}
            
            }
        </script>
        

    </head>
    <body>
        <div class="container">
            <div class="review-title">
                <h4>후기 게시판</h4>
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
                                    <span>
                                        <img src="${path}/img/ui/starRate1.jpg" class="starRateImg">
                                    </span>
                                </c:when>
                                <c:when test="${reviewDetail.reviewRate==2}">
                                    <span>
                                        <img src="${path}/img/ui/starRate2.jpg" class="starRateImg">
                                    </span>
                                </c:when>
                                <c:when test="${reviewDetail.reviewRate==3}">
                                    <span>
                                        <img src="${path}/img/ui/starRate3.jpg" class="starRateImg">
                                    </span>
                                </c:when>
                                <c:when test="${reviewDetail.reviewRate==4}">
                                    <span>
                                        <img src="${path}/img/ui/starRate4.jpg" class="starRateImg">
                                    </span>
                                </c:when>
                                <c:when test="${reviewDetail.reviewRate==5}">
                                    <span>
                                        <img src="${path}/img/ui/starRate5.jpg" class="starRateImg">
                                    </span>
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
                        <span>조회수</span>
                        <span>${reviewDetail.reviewViews}</span>
                    </div>
                    <div class="review-goods">
                            <img src="${path}/img/goods/${reviewDetail.goodsDTO.goodsThumbnail}" alt="상품 이미지입니다." name="goodsImg" id="goodsImg">
                            <a href="#">${reviewDetail.goodsDTO.goodsName}</a>
                    </div>
                </div>
            </div>
            <div class="base-btn">
                <span class="bLeft"><a href="javascript:void(0);" onclick="backList()">목록으로 돌아가기<img src="목록아이콘"></a></span>
                <span class="bRight">
                	<a href="${path}/front?key=review&methodName=delete&reviewNo=${reviewDetail.reviewNo}">삭제<img src="삭제아이콘"></a>
                </span>
                <span class="bRight">
                	<a href="${path}/front?key=review&methodName=updateForm&reviewNo=${reviewDetail.reviewNo}" >수정<img src="수정아이콘"></a>
                </span>
            </div>
            <div class="review-reply">
                <div class="user-write-wrap">
                    <form>
                        <fieldset>
                            <legend class=""></legend>
                        </fieldset>
                        <div class="user-rbox-profile-area">
                            <div class="user_rbox_profile_id">
                                <b><span class="user_rbox_id">fro*****</span></b>
                            </div>
                        </div>
                        <div class="user_rbox_wirte_area">
                            <textarea name="user_write_reply" cols="80" rows="5" placeholder="댓글을 달아보세요."></textarea>
                            <input type="submit" value="등록">
                        </div>
                    </form>
                </div>
                <div class="review_reply_wrap">
                    <div class="review_reply_area">
                        <div class="review_reply-user-profile-area">
                            <div class="review_reply_userid">
                                <b><span class="reply_user_id">adf****</span></b>
                            </div>
                        </div>
                        <div class="review_reply_content_area">
                            <div class="review_reply_content">
                                <span>공감합니다 `~~^^</span>
                            </div>
                            <div class="review_reply_regdate">
                                <span>2022-04-14</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>