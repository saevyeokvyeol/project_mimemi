<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<jsp:include page="../common/header.jsp"/>
</head>
<style type="text/css">
 .left side {width : 300px;
             margin:auto;}
 .body {width : 900px;
        margin:auto;}
 .search{background-color:#eeeeee; 
         height : 50px; 
         text-align:center;
         vertical-align:middle;}
 
 table {width:1200px;}
 th, td {border : 1px solid white;}
</style>

<script type="text/javascript">

</script>


<body>
<table>
<tr>   
<td>
<!-- left side -->
<div class="left side"> 
   <div class="title">고객센터</div><hr width="100px">
   <ul class="menu">
      <li><a href="${path}/front?key=notice&methodName=selectAll">공지사항</a></li>
      <li class="">
         <a href="${path}/front?key=faq&methodName=selectAll">FAQ</a>
         <ul>
            <li class=""><a href="${path}/front?key=faq&methodName=selectAll&field=cr">교환/환불</a></li>
            <li class=""><a href="${path}/front?key=faq&methodName=selectAll&field=us">회원관련</a></li>
            <li class=""><a href="${path}/front?key=faq&methodName=selectAll&field=op">주문/결제</a></li>
            <li class=""><a href="${path}/front?key=faq&methodName=selectAll&field=de">배송관련</a></li>
            <li class=""><a href="${path}/front?key=faq&methodName=selectAll&field=ec">기타</a></li>
         </ul>
      </li>
      <li><a href="ask.jsp">1:1문의</a></li>
   </ul>
</div>
</td>
<td>
<!-- body -->
<div class="body"> 
   <div><h1>FAQ</h1></div>
   <hr>
   <table class="table" style="text-align:center" id="noticeList">
    <tbody>
     <section class="faqList-main">
     <c:choose>
         <c:when test="${empty FaqList}">
             <tr>
               <td colspan="6">공지사항이 없습니다.</td>
             </tr>
          </c:when>
          <c:otherwise>
             <c:forEach items="${FaqList}" var="faq">
                <h2 class="" id="">
                  <button class="faq-title" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne${faq.faqNo}" aria-expanded="false" aria-controls="flush-collapseOne">
                    Q . ${faq.faqTitle}
                  </button>
                </h2>
                <div id="flush-collapseOne${faq.faqNo}" class="faq-content" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                    <h3 style="display: inline"><strong>A.</strong></h3>&nbsp;&nbsp;  ${faq.faqContent} 
                     <c:if test="${not empty faq.faqAttach}">
                     <div> 
                     <span class="faq-list-img-preview-area">
                     <img src="${path}/img/${faq.faqAttach}"></span></div>
                     </c:if>
                </div>           
              </c:forEach>
           </c:otherwise>
      </c:choose>
 </tbody>
 </table>
</div>

</td>
</tr>
</table>
</body>
         <nav aria-label="Page navigation example">
            <jsp:useBean class="mimemi.mvc.paging.FaqListPageCnt" id="p"/> 
            <c:set var="isLoop" value="false"/>
            <c:set var="temp" value="${(pageNum - 1) % p.blockcount}"/>
            <c:set var="startPage" value="${pageNum - temp}"/>
            <ul class="pagination justify-content-center">
               <c:if test="${(startPage - p.blockcount) > 0}">
                  <li class="page-item"><a class="page-link" href="${path}/front?key=faq&methodName=selectAll&pageNum=${startPage-1}&field=${requestScope.field}">이전</a></li>
               </c:if>
               <c:forEach var='i' begin='${startPage}' end='${(startPage-1) + p.blockcount}'> 
                  <c:if test="${(i-1) >= p.pageCnt}">
                     <c:set var="isLoop" value="true"/>
                  </c:if> 
                  <c:if test="${not isLoop}" >
                     <li class="page-item ${i == pageNum ? ' active' : ''}"><a class="page-link page_num" href="${path}/front?key=faq&methodName=selectAll&pageNum=${i}&field=${requestScope.field}">${i}</a></li> 
                  </c:if>
               </c:forEach>
               <c:if test="${(startPage + p.blockcount) <=p.pageCnt}">
                  <li class="page-item"><a class="page-link" href="${path}/front?key=faq&methodName=selectAll&pageNum=${startPage+p.blockcount}&field=${requestScope.field}">이후</a></li>
               </c:if>
            </ul>
         </nav>
      </section>
   </body>
   <jsp:include page="../common/footer.jsp"/>
</html>
