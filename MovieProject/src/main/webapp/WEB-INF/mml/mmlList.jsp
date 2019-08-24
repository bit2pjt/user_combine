<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--
/**
* @Class Name : mmlList.jsp
* @Description : 나영리 리스트
* @Modification Information
* @
* @  수정일                수정자                  수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.09        김상필                최초생성
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/
-->



<%@ include file="../header1.jsp"%>

<!-- 2. 여기에 페이지별 css 추가해주세요 -->
<link rel="stylesheet"
   href="<c:url value="/resources/css/sp_style.css" />">
<script src="https://kit.fontawesome.com/bb8498b585.js"></script>


<!-- 3. heaer2.jsp : header -->
<%@ include file="../header2.jsp"%>

<!DOCTYPE html>

<html>

<script type="text/javascript"
   src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
<script type="text/javascript">




function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    
}


$(document).ready(function(){
   $('#sort_date').show();
   $('#sort_date2').show();
   $('#sort_like').hide();
   $('#sort_like2').hide();
   
   var like = getParameterByName('like');
   var keyword = getParameterByName('keyword');
   
   
    
    if(like==1){
       $('#sort_like').show();
      $('#sort_like2').show();
      $('#sort_date').hide();
      $('#sort_date2').hide();
       
    }
    
    if(keyword != ""){
       $('#sort_like2').hide();
       $('#sort_date2').hide();
       
    }
      

});


$(function(){
   
   
   $('#date_sort').click(function(){
      $('#sort_date').show();
      $('#sort_date2').show();
      $('#sort_like').hide();
      $('#sort_like2').hide();
   });
   
   $('#like_sort').click(function(){
      $('#sort_like').show();
      $('#sort_like2').show();
      $('#sort_date').hide();
      $('#sort_date2').hide();
   });
      
});

 $(document).ready(function () {

    $("#searchBtn").on("click", function (event) {
        self.location =
            "mmlList${pageMaker.makeQuery(1)}"
            + "&searchType=" + $("select option:selected").val()
            + "&keyword=" + encodeURIComponent($("#keywordInput").val());
        
            
            
    });
}); 



</script>

<div class="hero user-hero" style="z-index: -100; margin-top: 30px;">
      <div class="container"   style="margin-top: -140px;">
         <div class="row">
            <div class="col-md-12">
               <div class="hero-ct">
                  <h1 style="margin-left: 0px; margin-top: 0px; text-align: left;">영화관
                     목록</h1>
                  <ul style="margin-left: 0px;" class="breadcumb">
                     <li class="active"><a style="color: #ccc;"index">영화관</a></li>
                     <li style="color: #ccc;"><span class="ion-ios-arrow-right"></span>영화관
                        목록</li>
                  </ul>
               </div>
            </div>

         </div>
      </div>
   </div>
   
   
<div class="flex-it share-tag" style="width: 1258px; float: left;">
</div>




<div class="buster-light" style="margin-top:-200px;">

   <!-- celebrity grid v2 section-->
   <div class="page-single">
      <div class="container">
         <div class="row">
            <div
               style="display: flex; margin-left: 20px; margin-right: 20px; padding-left: 15px; padding-right: 15px;">
               <div class="btn-group btn-group-lg mb-3" role="group"
                  aria-label="Large button group" style="flex: 5">
                  <button style="width:120px; height: 40px; border: 0px;"  class="btn btn-secondary" type="button" id="date_sort">최신순
                     보기</button>
                  <button style="width:120px; height: 40px;border: 0px;" class="btn btn-secondary" type="button" id="like_sort">추천순
                     보기</button>
               </div>
               <div style="flex: 2">
                  <button type="button" class="btn-check" style="float: right"
                     OnClick="location.href ='mmlWrite '">나영리 작성</button>
               </div>
            </div>
            <br>

<div class="row1" id="sort_like">
                  
            <c:forEach var="mml2" items="${mmlList2}" varStatus="status">   
      
   <div class="sp_col-md-41">
   <a href ="mmlGet?mml_num=${mml2.mml_num}">
                     <div class="card" style="cursor:pointer;">
                        <c:set var="poster_one" value="${fn:split(mml2.mml_poster,',')}" />
                           <img class="card-img" src="<c:url value="${poster_one[0] }"/>" alt="header" />
                           <div class="card-info">
                              <div class="card-ho"></div>
                                 <div class="ho-info" style="float:left;">                           
                                    <h1 style="text-align: left; font-size:25px">${mml2.mml_title}</h1>
                                    <div style="float:left;"><img class="mml_crown" src="<c:url value="/resources/images/sp_image/crown.png"/>">&nbsp;
                                    <h5 style="display:inline; text-align:left" class="card-author" style="display:inline">${mml2.m_nickname}</h5>
                                    </div><br>
                                       <span style="color:red"><i class="fas fa-heart"></i></span>&nbsp;${mml2.mml_like}&nbsp;<i class="far fa-eye"></i>&nbsp;${mml2.mml_view_count }&nbsp;
                           
                           </div>
                           
                           </div>       
                          </div></a>
               </div>
               </c:forEach>
               
               </div> 

            <div class="row1" id="sort_date" style="width:100%">
               <c:forEach var="mml" items="${mmlList}" varStatus="status">
                  <div class="sp_col-md-41">
                     <a
                        href="mmlGet${pageMaker.makeSearch(pageMaker.criteria.page)}&articleNo=${article.articleNo}&mml_num=${mml.mml_num}">
                        <div class="card" style="cursor: pointer;">
                           <c:set var="poster_one" value="${fn:split(mml.mml_poster,',')}" />
                           <img class="card-img" src="<c:url value="${poster_one[0] }"/>" alt="header" />
                           <div class="card-info">
                              <div class="card-ho"></div>
                              <div class="ho-info" style="float: left;">
                              <div style="height: 84px;" class="mml__list_title">
                                 <h1 style="text-align: left; font-size: 25px">${mml.mml_title }</h1>
                              </div>
                                 <div style="float: left;">
                                    <img class="mml_crown"
                                       src="<c:url value="/resources/images/sp_image/crown.png"/>">&nbsp;
                                    <h5 style="display: inline; text-align: left"
                                       class="card-author" style="display:inline">${mml.m_nickname }</h5>
                                 </div>
                                 <div style="float:right;">
                                 <span style="color: red;"><i class="fas fa-heart"></i></span>&nbsp;${mml.mml_like }&nbsp;
                                 <i class="far fa-eye"></i>&nbsp;${mml.mml_view_count }&nbsp;
                                 </div>
                                 
                              </div>

                           </div>
                        </div>
                     </a>
                  </div>
               </c:forEach>


            </div>

            <div class="row1" id="sort_date2">
               <nav aria-label="Page navigation example">
                  <ul class="pagination">
                     <c:if test="${pageMaker.prev}">
                        <li class="icon-prev"><a
                           href="mmlList${pageMaker.makeQuery(pageMaker.startPage-1) }"><i
                              class="ion-ios-arrow-left"></i></a></li>
                     </c:if>

                     <c:forEach begin="${pageMaker.startPage}"
                        end="${pageMaker.endPage }" var="index">
                        <li
                           <c:if test="${index eq pageMaker.criteria.page}">class="active"</c:if>><a
                           href="mmlList${pageMaker.makeQuery(index)}">${index}</a></li>
                     </c:forEach>

                     <c:if test="${pageMaker.next }">
                        <li class="icon-next"><a
                           href="mmlList${pageMaker.makeQuery(pageMaker.endPage+1)}"><i
                              class="ion-ios-arrow-right"></i></a></li>
                     </c:if>
                  </ul>
               </nav>
            </div>

            <div class="row1" id="sort_like2">
 <nav aria-label="Page navigation example">
                  <ul class="pagination">
                        <c:if test="${pageMaker2.prev}">
                           <li class="icon-prev"><a href="mmlList${pageMaker2.makeQuery(pageMaker.startPage-1)}"><i
                                 class="ion-ios-arrow-left"></i></a></li>
                        </c:if>
                        
                        <c:forEach begin="${pageMaker2.startPage}" end="${pageMaker2.endPage}" var="index">
                           <li <c:if test="${index eq pageMaker2.criteria.page}">class="active"</c:if>><a href="mmlList${pageMaker2.makeQuery(index)}&like=1">${index}</a></li>
                        </c:forEach>
                        
                        <c:if test="${pageMaker2.next}">
                           <li class="icon-next"><a href="mmlList${pageMaker2.makeQuery(pageMaker2.endPage+1)}"><i
                                 class="ion-ios-arrow-right"></i></a></li>
                                 </c:if>
                        </ul>
               </nav>
</div>  


            <div class="search-form" style="margin-left:20%;">
               <div style="background-color: white;">
                  <div class="col-md-12 form-it" style="display: flex;">
                     <select style="width:120px;" class="form-control" name="searchType" id="searchType"
                        style="flex: 1;">
                        <option value="n"
                           <c:out value="${searchCriteria.searchType == null ? 'selected' : ''}"/>>::::::
                           선택 ::::::</option>
                        <option value="t"
                           <c:out value="${searchCriteria.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
                        <option value="w"
                           <c:out value="${searchCriteria.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
                     </select>&nbsp;&nbsp;&nbsp;
                     <div style="flex: 3; display: flex;">
                        <input style=" width: 400px;" type="text" class="form-control"
                           name="keyword" id="keywordInput"
                           value="${searchCriteria.keyword}" placeholder="검색어">&nbsp;&nbsp;&nbsp;
                        <span class="input-group-btn">
                           <button style="flex: 1; height: 34px; width: 90px; background-color: #333; color: #fff; border: 0px;" type="button"
                              class="btn btn-primary btn-flat" id="searchBtn">
                              <i class="fa fa-search"></i> 검색
                           </button>
                        </span>
                     </div>
                  </div>

               </div>
            </div>


            <div class="col-md-3 col-xs-12 col-sm-12"></div>
         </div>
      </div>
   </div>
   <!-- end of celebrity grid v2 section-->
</div>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<%@ include file="../footer.jsp"%>
</body>

</html>