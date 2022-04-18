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
                width: 1000px;
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
            div.review-updateForm{
                text-align: left;
            }
            img.starRateImg{
            	box-sizing: border-box;
                width:90px;
                height: auto;
                padding-bottom: 5px;                
            }
            div.review-image-insert-area{
            	width: 500px;
            	margin: 0px
            }
            div.review-image-preview{
                box-sizing: border-box;
                width: 450px;
                text-align: left;
                margin: 0px;

            }
            #review-image-output{
                width: 100px;
                height: auto;
            }
            div.review-submit-button{
                text-align: center;
            }
            div.review-update-foot-area{
                text-align: right;
            }
            
        </style>
        <!--부트스트랩 CSS CDN-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
                
        <!--부트스트랩 JS CDN-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        
        
        <script type="text/javascript" src="${path}/util/js/jquery-3.6.0.min.js"></script>
        <script>
            function checkValid(){
                var title = document.updateReview2.review_title;
                var contents = document.updateReview2.review_contents;
                
                if(title.value==""){
                	alert("후기 제목을 입력해 주십시오.");
                	title.focus();
                	return false;
                }
                if(contents.value==""){
                	alert("후기 내용을 입력해 주십시오.");
                	contents.focus();
                	return false;
                }
                if($("select[name=review_select_goods]").val()==""){
                	alert("후기를 쓸 상품을 선택해주십시오.");
                	$("#review_select_goods").focus();
                	return false;
                }
                if($("input[name=rate]:radio:checked").length<1){
                	alert("상품의 별점을 선택해주십시오.")
                    return false;
                }
                
                return true;
            }
        </script>
    </head>
    <body>
        <div class="container">
            <div class="review-title">
                <h1>후기 게시판 수정</h1>
                <hr>
            </div>
            <div class="review-writeForm">
                <form name="updateReview2" method="post" action="${path}/front?key=review&methodName=update"
                onSubmit='return checkValid()' enctype="multipart/form-data">
                <input type="hidden" name="reviewNo" value="${review.reviewNo}">
                    <table>
                        <tr>
                            <th>제목</th>
                            <td>
                            	<span><input type="text" name="review_title" placeholder="제목" maxlength='16' value="${review.reviewTitle}"></span>
                            </td>
                        </tr>
                        <tr>
                            <th>상품</th>
                            <td>
                                <select name="review_select_goods" id="review_select_goods">
                                	<option name="reivew_goods" value="">--상품 이름--</option>
                                	<option name="reivew_goods" value="JUNG01">정성한상</option>
                                    <option name="reivew_goods" value="VEGAN01">비건 식단</option>
                                    <!--value="{goodslist.goodsId}" / 정성한상 >> {goodslist.goodsName}-->
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>별점</th>
                            <td>
                                <input type="radio" name="rate" value="1">
                                <img src="${path}/img/ui/starRate1.jpg" class="starRateImg">
                                <input type="radio" name="rate" value="2">
                                <img src="${path}/img/ui/starRate2.jpg" class="starRateImg">
                                <input type="radio" name="rate" value="3">
                                <img src="${path}/img/ui/starRate3.jpg" class="starRateImg">
                                <input type="radio" name="rate" value="4">
                                <img src="${path}/img/ui/starRate4.jpg" class="starRateImg">
                                <input type="radio" name="rate" value="5">
                                <img src="${path}/img/ui/starRate5.jpg" class="starRateImg"> 
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="review_contents" cols="50" rows="10" maxlength='333' placeholder="정성스러운 리뷰를 추첨하여 경품을 드립니다.">${review.reviewContent}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td>
                                <div class="review-image-insert-area">
                                	<input type="file" id="review-image-selector" name="review_image" accept=".jpg, .jpeg, .png">
                                	<p id="file-status">${review.reviewAttach}</p>
                                    <div class="review-image-preview">
                                        <img id="review-image-output" src="${path}/img/save/${review.reviewAttach}">
                                    </div>
                                    <script>
                                        const status = document.getElementById('file-status')
                                        //const fileSelector =document.getElementById('review-image-selector')
                                        const output = document.getElementById('review-image-output')
                                        
                                        if(window.FileList && window.File && window.FileReader){
                                            document.getElementById('review-image-selector').addEventListener('change', event =>{
                                                output.src='';
                                                status.textContent='';
                                                const file = event.target.files[0];
                                                if(!file.type){
                                                    status.textContent = "첨부한 파일 타입이 현재 브라우저에서 지원하지 않습니다."
                                                    return;
                                                }
                                                const reader = new FileReader();
                                                reader.addEventListener('load', event =>{
                                                    output.src = event.target.result;
                                                })
                                                reader.readAsDataURL(file);
                                            })
                                        }
                                    </script>
                                </div>
                            </td>
                        </tr>
                    </table>
					<div class="review-submit-button">
                		<input type="submit" value="후기 등록하기">
            		</div>
                </form>
            </div>
           
            <div class="review-write-foot-area">
                <span class="back-review-list"><a href="${path}/front?key=review&methodName=selectAll">목록으로 돌아가기</a></span>
            </div>
        </div>
    </body>
</html>