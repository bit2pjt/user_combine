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
*
* @author BIT 116기 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by bit 2조 All right reserved.
*/
-->

<%@ include file="../header.jsp" %>
<head>
	<link rel="stylesheet" href="<c:url value="/resources/css/yj_style.css" />">
</head>
<!-- yj : 헤더와 본 컨텐츠를 분리하기 위해 section 사용-->
    <section>
        <!-- yj : start | movielist -->
        <div class="movielist mt-15">
            <!-- yj : start | movielist-search -->
            <div class="movielist-top">
                <select id="mcategory">
                    <option>영화 제목</option>
                    <option>영화 감독</option>
                    <option>영화 배우</option>
                </select>
                <input type="text" id="moviesearch" width="50px;">
                <img src="<c:url value="/resources/images/uploads/cast1.jpg" />">
            </div>
            <!-- yj : start | movielist-bottom -->
            <div class="movielist-bottom">
                <div>
               	<%
               	for(int i=0; i<10; i++){
               	%>
                    <div class="movielist-card" onclick="location.href='movieDetail.do'">
                        <img src="<c:url value='/resources/images/uploads/mv-it12.jpg' />" width="170" height="261">
                        <h4 class="movie-title">비트와 함께 사라지다.</h4>
                    </div>
                <%
               	}
                %>
                </div>
                <!-- yj : start | pagination -->
                <!-- 페이징 버튼 연동은 책보고 참고해서 추가하기 -->
                <div class="paging">
                    <ul class="pagination">
                        <li class="icon-prev"><a href="#"><i class="ion-ios-arrow-left"></i></a></li>
                        <li class="active"><a href="movieList.do?page=1">1</a></li>
                        <li><a href="movieList.do?page=2">2</a></li>
                        <li><a href="movieList.do?page=3">3</a></li>
                        <li><a href="movieList.do?page=4">4</a></li>
                        <li><a href="movieList.do?page=5">5</a></li>
                        <li><a href="movieList.do?page=6">6</a></li>
                        <li><a href="movieList.do?page=7">7</a></li>
                        <li><a href="movieList.do?page=8">8</a></li>
                        <li><a href="movieList.do?page=9">9</a></li>
                        <li><a href="movieList.do?page=10">10</a></li>
                        <li class="icon-next"><a href="#"><i class="ion-ios-arrow-right"></i></a></li>
                    </ul>       
                </div>
            </div>
        <!--end | movielist-->
        </div>
    </section>
    <%@ include file="../footer.jsp" %>
