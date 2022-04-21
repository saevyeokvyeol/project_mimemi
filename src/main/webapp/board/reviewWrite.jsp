<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>후기 :: 미미미</title>
        <jsp:include page="../common/header.jsp"/>
        <style>
            .review-insertform {
                width: 900px;
                margin: auto; padding: 50px 0;
            }
            
            .review-insertform h1 {padding-bottom: 10px; margin-bottom: 10px; border: }
            
            .review-table th {width: 120px; padding: 15px 30px;}
            .review-table td {vertical-align: middle;}
            
            .stars {margin-right: 15px;}
            
            img.starRateImg{
                width: 90px; padding-bottom: 7px;    
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
            
        </style>
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
        <div class="review-insertform">
            <div class="review-title">
                <h1>후기 :: 미미미</h1>
            </div>
            <div class="review-writeForm">
                <form name="writeReview" method="post" action="${path}/front?key=review&methodName=insert"
                onSubmit='return checkValid()' enctype="multipart/form-data">
                    <table class="table table-borderless review-table">
                        <tr>
                            <th>제목</th>
                            <td>
                            	<span><input type="text" class="form-control" name="review_title" placeholder="제목" maxlength='16'></span>
                            </td>
                        </tr>
                        <tr>
                            <th>상품</th>
                            <td>
                                <select class="form-select" name="review_select_goods" id="review_select_goods">
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
                            	<span class="stars">
	                                <input type="radio" name="rate" value="1">
	                                <img src="${path}/img/ui/starRate1.jpg" class="starRateImg">
                                </span>
                            	<span class="stars">
	                                <input type="radio" name="rate" value="2">
	                                <img src="${path}/img/ui/starRate2.jpg" class="starRateImg">
                                </span>
                            	<span class="stars">
	                                <input type="radio" name="rate" value="3">
	                                <img src="${path}/img/ui/starRate3.jpg" class="starRateImg">
                                </span>
                            	<span class="stars">
	                                <input type="radio" name="rate" value="4">
	                                <img src="${path}/img/ui/starRate4.jpg" class="starRateImg">
                                </span>
                            	<span class="stars">
	                                <input type="radio" name="rate" value="5">
	                                <img src="${path}/img/ui/starRate5.jpg" class="starRateImg"> 
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea class="form-control" name="review_contents" cols="50" rows="10" maxlength='333' placeholder="정성스러운 리뷰를 추첨하여 경품을 드립니다."></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td>
                                <div class="review-image-insert-area">
                                	<input type="file" class="form-control" id="review-image-selector" name="review_image" accept=".jpg, .jpeg, .png">
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
						<a class="back-review-list btn btn-outline-dark" href="${path}/front?key=review&methodName=selectAll">목록으로 돌아가기</a>
                		<input type="submit" class="btn btn-outline-dark" value="후기 등록하기">
            		</div>
                </form>
            </div>
        </div>
    </body>
    <jsp:include page="../common/footer.jsp"/>
</html>