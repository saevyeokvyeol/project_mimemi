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
            }
            div.review-updateForm{
                text-align: left;
            }
            .review-title-insert-area, .review-select-goods-area, .review-rate-insert-area, .review-content-insert-area, .review-file-insert-area, .review-image-insert-area{
                display: table;
            }
            .review-title-insert-title, .review-rate-title, .review-select-goods-title, .review-content-insert-title{
                width: 230px;
                height: 30px;
                font-size: 1em;
                color: white;
                text-align: center;
                border-radius: 20px;
                background-color: black;
                margin: 10px 0px 10px 0px;
                float: left;
            }
            .review-image-insert-button{
            	width: 230px;
                height: 50px;
                margin: 10px 0px 10px 0px;
                float: left;
            }
            .review-title-insert-Container, .review-select-goods-Container, .review-rate-Container{
                width: auto;
                height: 30px;
                margin: 10px 0px 10px 20px;
                float: left;
            }
            .reivew-image-fileContainer{
            	width: 700px;
            	height:150px;
            	margin: 10px 0px 10px 20px;
                float: left;
            }
            .review-image-fileName{
                border-bottom: 2px solid black;
            }
            img.starRateImg{
            	box-sizing: border-box;
                width:90px;
                height: auto;
                padding-bottom: 5px;                
            }
            
            label{
                width: 230px;
                height: 30px;
                cursor: pointer;
                font-size: 1em;
                color: white;
                text-align: center;
                border-radius: 20px;
                background-color: black;
            }
            #review-image-selector{
                visibility: hidden;
                width:230px;
                height:30px;
            }

            .review-image-Info{
            	box-sizing: border-box;
            	height: 50px;
            }

            .review-image-preview{
                box-sizing: border-box;
                width: 450px;
                height: 100%;
                align-items: center;
                justify-content: left;
                
            }
            #review-image-output{
                width: 150px;
            }
            .review-submit-button{
                text-align: center;
            }
            .review-update-foot-area{
                text-align: right;
            }
            textarea{
                height: 200px;
                resize: none;
            }
            #file-status{
             color: red;
             font-weight: bold;
            }
            
            
            
            
        </style>
        <!--부트스트랩 CSS CDN-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
                
        <!--부트스트랩 JS CDN-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        
        <!--JQgrid CDN-->
        
        <script> 
        console.log("12")
            var checkUpdateValid = function(){
                var form = window.document.updateReview;
                var selectCheck=$('#review_select_goods > option:selected').val();
                var radioCheck =$('input[name=rate]').is(":checked");
                console.log(form)
                alert(11)
                
                if(someBug()){
                	return false;
                }

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
    <!-- 첨부파일을 삭제하는 걸 front단에서 처리하는걸 아직 구현안했다. -->
    <body>
        <div class="container">
            <div class="review-title">
                <h1>후기 수정하기</h1>
                <hr>
            </div>
            <div class="review-updateForm">
                <form name="updateReview" method="post" action="${path}/front?key=review&methodName=update"
                			onSubmit="return checkUpdateValid();" enctype="multipart/form-data">
						<input type="hidden" name="reviewNo" value="${review.reviewNo}">
                    <!--후기제목 작성 영역-->
                    <div class="review-title-insert-area">
                        <div class="review-title-insert-title">
                            후기 제목
                        </div>
                        <div class="review-title-insert-Container">
                            <span><input type="text" name="review_title" id="review_title" value="${review.reviewTitle}"></span>
                        </div>
                    </div>
                    <!--후기 작성할 상품 선택 영역-->
                    <div class="review-select-goods-area">
                        <div class="review-select-goods-title">
                            후기 작성할 상품
                        </div>
                        <div class="review-select-goods-Container">
                            <select name="review_select_goods" id="review_select_goods">
                                <option name="reivew_goods" value="">--상품 이름--</option>
                                <option name="reivew_goods" value="JUNG01">정성한상</option>
                                <option name="reivew_goods" value="VEGAN01">비건 식단</option>
                                <!--value="{goodslist.goodsId}" / 정성한상 >> {goodslist.goodsName}-->
                            </select>
                        </div>
                    </div>
                    <!--후기별점 영역-->
                    <div class="review-rate-insert-area">
                        <div class="review-rate-title">
                            후기 별점
                        </div>
                        <div class="review-rate-Container">
                            <span>
                                <input type="radio" name="rate" value="1">
                                <img src="${path}/img/ui/starRate1.jpg" class="starRateImg">
                            </span>
                            <span>
                                <input type="radio" name="rate" value="2">
                                <img src="${path}/img/ui/starRate2.jpg" class="starRateImg">
                            </span>
                            <span>
                                <input type="radio" name="rate" value="3">
                                <img src="${path}/img/ui/starRate3.jpg" class="starRateImg">
                            </span>
                            <span>
                                <input type="radio" name="rate" value="4">
                                <img src="${path}/img/ui/starRate4.jpg" class="starRateImg">
                            </span>
                            <span>
                                <input type="radio" name="rate" value="5">
                                <img src="${path}/img/ui/starRate5.jpg" class="starRateImg">
                            </span>                           
                        </div>
                    </div>
                    <!--후기내용 작성 영역-->
                    <div class="review-content-insert-area">
                        <div class="review-content-insert-title">
                                후기 내용
                        </div>
                        <div class="review-content-Container">
                            <textarea name="review_contents" id="review_contents" cols="130" rows="10">${review.reviewContent}</textarea>
                        </div>
                    </div>
                    <!--첨부파일 영역-->
                    <div class="review-file-insert-area">
                        <div class="review-image-insert-area">
                            <div class="review-image-insert-button">
                                <label for="review-image-selector">
                                    👉 후기 사진 등록하기 👈
                                </label>
                                <input type="file" name ="review-image-selector"  id="review-image-selector" accept=".jpg, .jpeg, .png">
                            </div>
                            <div class="reivew-image-fileContainer">
                            	<div class="review-image-Info">
                            		<div class="review-image-fileName">
	                                    <span>FILE NAME: </span>
	                                    <span id="review-fileName">${review.reviewAttach}</span>
	                                 </div>
	                                <div class="review-image-status">
	                                	<p id="file-status"></p>
	                                </div>
                            	</div>
                            	<!-- 이미지부분 css 나중에 다시 수정하기.. 이미지 사이즈 조절.하기.. -->
                                <div class="review-image-preview">
                                	<img id="review-image-output" src="${path}/img/save/${review.reviewAttach}">
                            	</div>
                            	<script type="text/javascript">
                                    const status = document.getElementById('file-status')
                                    //const fileSelector =document.getElementById('review-image-selector')
                                    const output = document.getElementById('review-image-output')
                                    console.log(status)
                                    console.log(output)
                                        if(window.FileList && window.File && window.FileReader){
                                                
                                            document.getElementById('review-image-selector').addEventListener('change', event =>{
                                            output.src='';
                                            status.textContent='';
                                            const file = event.target.files[0];
                                            if(!file.type){
                                                status.textContent = "첨부가능한 파일 형식이 아닙니다."
                                                return;
                                             }
                                            var name = document.getElementById('review-fileName');
                                            name.textContent = file.name;
                                            const reader = new FileReader();
                                            reader.addEventListener('load', event =>{
                                                output.src = event.target.result;
                                             })
                                        reader.readAsDataURL(file);
                                         })
                                    
                                }  
                            	</script>
                            </div>
                            
                            
                        </div>
                    </div>

                    <!--후기 등록하기 버튼-->
					<div class="review-submit-button">
					
                		<input type="submit" value="후기 등록하기">
            		</div>
                </form>
               <form name="updateReview" method="post" action="${path}/front?key=review&methodName=update"
                			onSubmit="return checkUpdateValid();" enctype="multipart/form-data">
						<input type="hidden" name="reviewNo" value="${review.reviewNo}">
                		<input type="hidden" name= "review_select_goods" value="JUNG01">
                		<input type="submit" value="후기 등록하기22">
                </form>
            </div>
           
            <div class="review-update-foot-area">
                <span class="back-review-list"><a href="${path}/front?key=review&methodName=selectAll">목록으로 돌아가기</a></span>
            </div>
        </div>
    </body>
</html>