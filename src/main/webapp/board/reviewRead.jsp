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
        
        <script>
        $(function(){
            var target ='${reviewDetail.reviewNo}'
            //var loginUser='${session.loginUser}' //세션으로 확인한 현재 로그인한 유저
            var loginUser='frog123'

            //전체 댓글 검색
        	function selectAllReply(){
                $.ajax({
				url: "${path}/ajax" , //서버요청주소
				type: "post" , //요청방식 (get,post...)
				dataType: "json" , //서버가 보내온 데이터(응답)type(text | html | xml | json)
				data: {key:"reviewreply", methodName:"select", reviewNo: target} , //서버에게 보낼 데이터정보(parameter정보)
				
				success: function(result){
					//alert("검색성공~")
					let str="";
					$.each(result,function(index,reply){
                        str+=`<div class="reply-user-info">`;
                            str+=`<span class="badge rounded-pill bg-light text-dark">\${reply.userId}</span>&nbsp;`
                           	str+=`<span class="badge rounded-pill bg-primary">\${reply.managerId}</span>`
                            str+=`<span class="badge rounded-pill bg-light text-dark">\${reply.replyRegdate}</span>`
                        str+=`</div>`;
                        str+=`<div class="reply-content">`;
                            str+=`<span class="reply-content-text">\${reply.replyContent}</span>`
                            str+=`<span class="badge rounded-pill bg-light text-dark"><a href="javascript:void(0);" id="reply-update-bnt" name=${'${reply.userId}'} reply_No="${'${reply.replyNo}'}>수정</a></span>`
                            str+=`<span class="badge rounded-pill bg-light text-dark"><a href="javascript:void(0);" id="reply-delete-bnt" name=${'${reply.userId}'} reply_No="${'${reply.replyNo}'}">삭제</a></span>`
                        str+=`</div>`;
                    })
                   	$("#review_reply_output").html(review_reply_output)
                   	$("#review_reply_output").append(str)
				},

				error: function(err){//실패했을 때 콜백함수
				  alert(err+"오류가 발생했습니다.")
				} 

			    })
            }
        	
            $("#reply-insert-btn").click(function(){
                let status =true;
                //댓글 유효성체크
                if($("#exampleFormControlTextarea1").val()==""){
                    alert("댓글을 입력해 주십시오.")
                    $(this).focus();
                    status=false;
                    return;
                }
                //댓글 달기
                if(status){
                    $.ajax({
                        url: "${path}/ajax" , //서버요청주소
                        type: "post" , //요청방식 (get,post...)
                        dataType: "text" , //서버가 보내온 데이터(응답)type(text | html | xml | json)
                        data: $("#reply-loginUser-insert").serialize() , //서버에게 보낼 데이터정보(parameter정보)
                        
                        success: function(result){
                            //alert("댓글등록성공~")
                            if(result==0){
                                alert("댓글을 등록하지 못 했습니다.")
                            }else{
                                //textarea부분 지우고 
                                $("textarea.form-control").val("")
                                //화면갱신한다
                                selectAllReply();
                            }
                        },

                        error: function(err){//실패했을 때 콜백함수
                        alert(err+"오류가 발생했습니다.")
                        } 

			        })
                }
            })
            $(document).on("click","#reply-delete-bnt",function(){
                
                var replyId = $(this).attr("name")
                alert("댓글유저아이디~~"+replyId)
                var replyNo =$(this).attr("reply_No")
                //alert(replyNo)

                //세션에서 로그인한 유저와 댓글 작성자 id가 일치하는지 확인
                if(loginUser==replyId){
                    $.ajax({
                        url: "${path}/ajax" , //서버요청주소
                        type: "post" , //요청방식 (get,post...)
                        dataType: "text" , //서버가 보내온 데이터(응답)type(text | html | xml | json)
                        data: {key:"reviewreply", methodName:"delete", reply_No: replyNo } , //서버에게 보낼 데이터정보(parameter정보)
                        
                        success: function(result){
                            if(result==0){
                                alert("댓글이 삭제되지 않았습니다.")
                            }else{
                                selectAllReply(); //화면갱신
                            }
                        
                        },

                        error: function(err){//실패했을 때 콜백함수
                        alert(err+"오류가 발생했습니다.")
                        } 

			        })
                }else{
                    alert("댓글은 자신이 단 댓글만 삭제 가능합니다.")
                }
            })
            

            selectAllReply();
        })
        	
        </script>
        

    </head>
    <body>
        <section>
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
            <!-- <리뷰 정보 하단 onclick만들어야 함!!!!!!!!!!!!!-->
            <div class="base-btn">
                <span class="bLeft"><a href="javascript:void(0);" onclick="backList()" id="back-list-btn">목록으로 돌아가기</a></span>
                <span class="bRight"><a href="${path}/front?key=review&methodName=delete&reviewNo=${reviewDetail.reviewNo}" id="delete-btn">삭제</a></span>
                <span class="bRight"><a href="${path}/front?key=review&methodName=updateForm&reviewNo=${reviewDetail.reviewNo}" id="update-btn" >수정</a></span>
            </div>
            <div class="review-reply">
                
                <!--댓글 등록하기-->
                <div class="card">
                    <div class="card-body">
                    	<form name="reply-loginUser-insert" method="post" id="reply-loginUser-insert">
                            <div class="form-inline mb-2">
                                <label for="replyId"><img src="${path}/img/ui/user.png" class="reply-user-icon"><img></label>
                                <span><strong>현재 로그인한 유저 아이디</strong></span>
                                <input type="hidden" name="reply_id" value="frog123"><!-- 나중에 세션으로 아이디 받기 -->
                                <input type="hidden" name="reply_manager_id" value="">
                            </div>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="reply_content"></textarea>
                            <input type="hidden" name="key" value="reviewreply">
                            <input type="hidden" name="methodName" value="insert">
                            <input type="hidden" name="reviewNo" value="${reviewDetail.reviewNo}">
                            <button type="button" class="btn btn-dark mt-3" id="reply-insert-btn" >댓글 등록하기</button>
                    	</form>
                    </div>
                </div>
                <!--댓글 조회하기 -->
                <div class="card-header bg-light">
	                <i class="fa fa-comment fa"></i> 
                </div>
                <div class="review_reply_wrap">
                    <div class="review_reply_area">
                       	<div id="review_reply_output"></div>
                    </div>
                </div>
                <!--댓글 조회창 하단-->
                <div class="card-header bg-light">
	                <i class="fa fa-comment fa"></i> 
                    
                </div>
                
            </div>

        </div>
        </section>
    </body>
    <jsp:include page="../common/footer.jsp"/>
</html>