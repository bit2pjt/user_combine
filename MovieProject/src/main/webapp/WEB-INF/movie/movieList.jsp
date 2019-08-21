<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
/**
* @Class Name :  movieList.jsp
* @Description : 영화 목록
* @Modification Information
* @
* @  수정일      수정자              수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.03     한유진      최초생성
* @ 2019.07.09     한유진      jsp로 변경
* @ 2019.07.22     한유진    	 header, footer 수정(1,2 버전으로 변경)
*
* @author BIT 116기 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by bit 2조 All right reserved.
*/
-->

<%@ include file="../header1.jsp"%>
	<link rel="stylesheet" href="<c:url value="/resources/css/yj_style.css" />">
<%@ include file="../header2.jsp" %>
<!-- yj : 헤더와 본 컨텐츠를 분리하기 위해 section 사용-->
    <section>


	<div class="hero user-hero" style="z-index:-100;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="hero-ct">
						<h1 style="margin-left: 0px; margin-top: -100px;">영화 목록</h1>
						<ul style="margin-left: 0px;" class="breadcumb">
							<li class="active"><a href="index">영화</a></li>
							<li><span class="ion-ios-arrow-right"></span>영화 목록</li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- yj : start | movielist -->
        <div class="movielist mt-15" style="margin-top: -120px;">
            <!-- yj : start | movielist-search -->
            <div class="movielist-top">
                <select class="form-control" name="searchType" id="searchType">
                	<option value="u" <c:out value="${searchCriteria.searchType == null ? 'selected' : ''}"/>>:::::: 선택 ::::::</option>
                    <option value="n" <c:out value="${searchCriteria.searchType eq 'n' ? 'selected' : ''}"/>>영화제목</option>
                    <option value="d" <c:out value="${searchCriteria.searchType eq 'd' ? 'selected' : ''}"/>>영화감독</option>
                    <option value="a" <c:out value="${searchCriteria.searchType eq 'a' ? 'selected' : ''}"/>>영화배우</option>
                 </select>
                <input type="text" class="form-control" name="keyword" value="${searchCriteria.keyword}" id="keywordInput" placeholder="검색어" width="150px;">
                <button type="button" id="btn-hjs"> 검색 </button>
            </div>
            
            <!-- yj : start | movielist-bottom -->
            <div class="movielist-bottom" >
	                <c:forEach items="${movieList}" var="list" varStatus="status">
						<div class="movielist-card" id="${list.mi_ktitle }" >
							<img src="<c:url value='${list.mi_poster }' />" class="movieImage" width="200" height="270">
					 		<span class="desc">
						 		<h6 class="movie-title">${list.mi_ktitle }</h6>
						 		<span class="movie-in">상영 ${list.mi_time } </span> <br>
						 		<span class="movie-in">${list.grade_code } </span>
						 		<button type="button" class="btn-hjs-1" id="${list.mi_ktitle}" onclick="movieInfo(this.id)"> 상세보기 </button>
					 		</span>
					 	</div>
					
					 	<input type="hidden" id="title" value="${list.mi_ktitle}"/>

	                </c:forEach>
                <!-- yj : start | pagination -->
                <!-- 페이징 버튼 연동은 책보고 참고해서 추가하기 -->
                <div class="buster-light">
                        <div class="text-center">
                            <form id="listPageForm">
                                <input type="hidden" name="page" value="${pageMaker.criteria.page}">
                                <input type="hidden" name="perPageNum" value="${pageMaker.criteria.perPageNum}">
                            </form>
                            <ul class="pagination pagination-sm no-margin">
                                <c:if test="${pageMaker.prev}">
                                    <li><a href="${pageMaker.startPage - 1}">이전</a></li>
                                </c:if>
                                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                                    <li <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
                                        <a href="${idx}">${idx}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                    <li><a href="${pageMaker.endPage + 1}">다음</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
            </div>
        <!--end | movielist-->
        </div>
    </section>
<script>
	function movieInfo(id) {
		var mi_ktitle = id;
		location.href="movieDetail?mi_ktitle=" + mi_ktitle;
	}
	/*
	$(".movielist-bottom .movielist-card").on("click", function() {
		var mi_ktitle = $("#title").val();
		alert(mi_ktitle);
		location.href="movieDetail?mi_ktitle=" + mi_ktitle;
		//var movieform = $("#movieform");
		//movieform.attr("action", "movieDetail").attr("method", "GET");
		//movieform.submit();		
	});
	*/
	$(".pagination li a").on("click", function (event) {
	    event.preventDefault();
	
	    var targetPage = $(this).attr("href");
	    var listPageForm = $("#listPageForm");
	    listPageForm.find("[name='page']").val(targetPage);
	    listPageForm.attr("action", "movieList").attr("method", "get");
	    listPageForm.submit();
	});
	

    $("#btn-hjs").on("click", function (event) {
        self.location =
            "movieList${pageMaker.makeQuery(1)}"
            + "&searchType=" + $("select option:selected").val()
            + "&keyword=" + encodeURIComponent($("#keywordInput").val());
    });
</script>
<%@ include file="../footer1.jsp"%>
<%@ include file="../footer2.jsp"%>