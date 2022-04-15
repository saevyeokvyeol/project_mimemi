<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
                border: solid 1px gray;
                align-items: center;
                display: flex;
                justify-content: center;
                float: left;
            }
            .review-userInfo{
                box-sizing: border-box;
                width: 400px;
                height: 100%;
                padding: 20px 0px 20px 20px;
                float: left;
                
            }
            
            #reviewImg{
                width: 400px;
            }
            .reivew-writer{
                box-sizing: border-box;
                height: 60px;
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/themes/redmond/jquery-ui.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.14.0/css/ui.jqgrid.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.14.0/jquery.jqgrid.min.js"></script>
        

    </head>
    <body>
        <div class="container">
            <div class="review-title">
                <h4>후기 게시판</h4>
                <hr>
            </div>
            <div class="review-view">
                <div class="review-Image">
                    <img src="../front_img/ddd.jpg" alt="회원이 올린 후기 사진입니다." name="reviewImg" id="reviewImg">
                </div>
                <div class="review-userInfo">
                    <div class="reivew-writer">
                        <div class="review-rate">
                            <span>★★★★☆</span>
                        </div>
                        <div>
                            <strong class="userName">홍*동</strong>
                            <span>2022-04-13</span>
                        </div>
                    </div>
                    <div class="review-contentTitle">
                        <p>상품이...</p>
                    </div>
                    <div class="review-content">
                        <p>정말 맛있어요 ~~ 추천 ~~^^!상품후기입니다상품후기입니다상품후기입니다상품후기입니다상품후기입니다
                            정말 맛있어요 ~~ 추천 ~~^^!상품후기입니다상품후기입니다상품후기입니다상품후기입니다상품후기입니다
                            정말 맛있어요 ~~ 추천 ~~^^!상품후기입니다상품후기입니다상품후기입니다상품후기입니다상품후기입니다
                            정말 맛있어요 ~~ 추천 ~~^^!상품후기입니다상품후기입니다상품후기입니다상품후기입니다상품후기입니다
                            정말 맛있어요 ~~ 추천 ~~^^!상품후기입니다상품후기입니다상품후기입니다상품후기입니다상품후기입니다
                            정말 맛있어요 ~~ 추천 ~~^^!상품후기입니다상품후기입니다상품후기입니다상품후기입니다상품후기입니다
                            정말 맛있어요 ~~ 추천 ~~^^!상품후기입니다상품후기입니다상품후기입니다상품후기입니다상품후기입니다
                        </p>
                    </div>
                    <div>
                        <span>조회수</span>
                        <span>3</span>
                    </div>
                    <div class="review-goods">
                            <img src="#" alt="상품 이미지입니다." name="goodsImg" id="goodsImg">
                            <a href="#">정성한상</a>
                    </div>
                </div>
            </div>
            <div class="base-btn">
                <span class="bLeft"><a href="#">목록으로 돌아가기<img src="목록아이콘"></a></span>
                <span class="bRight"><a href="#">삭제<img src="삭제아이콘"></a></span>
                <span class="bRight"><a href="#">수정<img src="수정아이콘"></a></span>
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