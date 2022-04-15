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
                text-align: center;
            }
            table {
                width: 800px;
                margin: 10px,0px,10px,0px;
                border-collapse: collapse;
            }
            th,td{
                border: 1px black solid;
                padding: 10px;
            }
            .container{
                width: 1200px;
            }
            div.review-title{
                text-align: left;
            }
            div.review-sort{
                text-align: right;
                
            }
            div.reivew-wirte{
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
    
    </head>
    <body>
        <div class="container">
            <div class="review-title">
                <h1>후기 게시판</h1>
                <hr>
            </div>

            <div class="review-sort">
                 <!-- 조회수, 등록순, 댓글순, 별점순(낮은순+높은순)-->
                <select name="" id="">
                    <option name="review_sort" value="0">--정렬방식--</option>
                    <option name="review_sort" value="reg">등록순</option>
                    <option name="review_sort" value="higirate">별점 높은순</option>
                    <option name="review_sort" value="rowrate">별점 낮은순</option>
                    <option name="review_sort" value="view">조회순</option>
                    <option name="review_sort" value="reply">댓글순</option>
                </select>
            </div>
           
            <div class="review-list">
                <table>
                    <thead>
                        <tr>
                            <th>
                                <span>번호</span> 
                            </th>
                            <th>
                                <span>이미지</span>
                            </th>
                            <th>
                                <span>상품</span>
                            </th>
                            <th>
                                <span>제목</span>
                            </th>
                            <th>
                                <span>글쓴이</span>
                            </th>
                            <th>
                                <span>별점</span>
                            </th>
                            <th>
                                <span>날짜</span>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>
                                <span>번호역순</span>
                            </th>  
                            <th>
                                <span>이미지</span>
                            </th>  

                            <th>
                                <span>상품</span>
                            </th>  
                            <th>
                                <span><a href="#">제목</a></span>
                            </th>  
                            <th>
                                <span>글쓴이</span>
                            </th>  
                            <th>
                                <span>별점</span>
                            </th>  
                            <th>
                                <span>날짜</span>
                            </th>  
                        </tr>
                    </tbody>
                </table>
             </div>
            <div class="reivew-wirte">
                <input type="button" value="리뷰쓰기">
            </div>
            <div class="reivew-search">
                <select name="" id="">
                    <option name="reviewsearch_sort" value="title">제목</option>
                    <option name="reviewsearch_sort" value="content">내용</option>
                </select>
                <input type="text" name="review_search">
                <input type="button" value="검색하기" id="btn">
            </div>
            <div class="reivew-pagination">
                <a class="pagination-newer" href="#">이전</a>
                <span>
                    <a class="page_number" href="#">1</a>

                </span>
                <a class="pagination-older" href="#">다음</a>
            </div>
        </div>
    </body>
</html>