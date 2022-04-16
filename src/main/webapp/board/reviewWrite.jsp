<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <style>
            div{
                width: 1000px;
                margin: auto;
            }
            table {
                width: 700px;
                margin-left: auto;
                margin-right: auto;
                border-collapse: collapse;
            }
            table th{
                width: 200px;
                text-align: center;
                background-color: gainsboro;
                font-weight: bold;
            }
            div.review-writeForm{
                text-align: left;
            }
            div.review-submit-button{
                text-align: center;
            }
            div.review-write-foot-area{
                text-align: right;
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
        <script>
            function checkValid(){

            }
        </script>
    </head>
    <body>
        <div class="container">
            <div class="review-title">
                <h1>후기 게시판 등록</h1>
                <hr>
            </div>
            <div class="review-writeForm">
                <form name="writeReview" method="post" action="${path}/front?key=review&methodName=insert"
                onsubmit='return checkValid()' enctype="multipart/form-data">
                    <table>
                        <tr>
                            <th>제목</th>
                            <td>
                                <input type="text" name="review_title" placeholder="제목">
                            </td>
                        </tr>
                        <tr>
                            <th>상품</th>
                            <td>
                                <select name="" id="">
                                	<option name="reivew_goods" value="0">--상품 이름--</option>
                                	<option name="reivew_goods" value="goodsid">정성한상</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>별점</th>
                            <td>
                                <input type="radio" name="rate" value="1">★ 
                                <input type="radio" name="rate" value="2">★★ 
                                <input type="radio" name="rate" value="3">★★★
                                <input type="radio" name="rate" value="4">★★★★ 
                                <input type="radio" name="rate" value="5">★★★★★ 
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="review_contents" cols="50" rows="10" placeholder="정성스러운 리뷰를 추첨하여 경품을 드립니다."></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td>
                                <input type="file" name="review_image" maxlength="60" size="" >
                            </td>
                        </tr>
                    </table>

                </form>
            </div>
            <div class="review-submit-button">
                <input type="button" value="후기 등록하기">
            </div>
            <div class="review-write-foot-area">
                <span class="back-review-list"><a href="${path}/front?key=review&methodName=selectAll">목록으로 돌아가기</a></span>
            </div>
        </div>
    </body>
</html>