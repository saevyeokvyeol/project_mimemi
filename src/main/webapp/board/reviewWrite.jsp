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
        
        <!--JQgrid CDN-->
        <script src="../util/js/jquery-3.6.0.min.js"></script>
        <script>
            function checkValid(){
                var form = window.document.writeReview;
                var selectCheck=$('#review_select_goods > option:selected').val();
                var radioCheck =$('input[name=rate]').is(":checked");
                

                if(form.review_title.value==""){
                    alert("후기 제목을 입력해 주십시오.")
                    form.review_title.focus();
                    return false;
                }
                if(!selectCheck){
                	alert("후기를 쓸 상품을 선택해주십시오.")
                	return false;
                }
                if(!radioCheck){
                    alert("상품의 별점을 선택해주십시오.")
                    return false;
                }
                if(form.review_contents.value==""){
                    alert("후기 내용을 입력해 주십시오.")
                    form.review_contents.focus();
                    return false;
                }
                
                return true;
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
                onSubmit='return checkValid()' enctype="multipart/form-data">
                    <table>
                        <tr>
                            <th>제목</th>
                            <td>
                            	<span><input type="text" name="review_title" placeholder="제목"></span>
                            </td>
                        </tr>
                        <tr>
                            <th>상품</th>
                            <td>
                                <select name="review_select_goods" id="review_select-goods">
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
                                <div class="review-image-insert-area">
                                	<input type="file" id="review-image-selector" multiple accept=".jpg, .jpeg, .png">
                                	<p id="file-status"></p>
                                    <div class="review-image-preview">
                                        <img id="review-image-output">
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