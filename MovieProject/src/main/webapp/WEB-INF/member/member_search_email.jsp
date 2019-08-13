<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
	/**
	* @Class Name : member_search_email.jsp
	* @Description : 아이디 찾기 페이지
	* @Modification Information
	* @
	* @  수정일      수정자              수정내용
	* @ ---------   ---------   -------------------------------
	* @ 2019.07.02   박현민       최초생성
	* @ 2019.07.04   박현민       헤더 푸터 수정
	* @ 2019.07.16   박현민       헤더 푸터 링크 수정
	* @ 2019.07.18   박현민		헤더 푸터 파일 나눔
	* @ 2019.08.02   한유진		헤더에 있더 아이디 찾기 기능을 jsp파일로 분리
	* @author bit 2조
	* @since 2019. 07.01
	* @version 1.0
	* @see
	*
	*  Copyright (C) by Bit All right reserved.
	*/
	-->
<!-- 1. header1.jsp : head  -->
<%@ include file="../header1.jsp"%>

<!-- 2. 여기에 페이지별 css 추가해주세요 -->

<!-- yj : css 추가 -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/modifyplugins.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/memberstyle.css" />">

<!-- 3. heaer2.jsp : header -->
<%@ include file="../header2.jsp" %>

<div class="hero common-hero">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="hero-ct">
					<h1>아이디 찾기</h1>
					<ul class="breadcumb">
						<li class="active"><a href="index">홈</a></li>
						<li><span class="ion-ios-arrow-right"></span> 아이디 찾기</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- start | 아이디 찾기 양식 -->
<div class="container">
	<div class="row">
		<div class="col-md-6">
			<div class="search_content search_content_result">
				<h4>아이디 찾기 결과</h4>
				<hr>
				<div class="search">
					<h4 id="search_email_result">결과없음.<br>입력한 정보를 확인해주세요.</h4>
				</div>
				<div class="search">
					<button class="search_btn" type="button" onclick="location.href='memberSearchPwP'">비밀번호 찾기</button>
				</div>
			</div>
			<div class="search_content search_content_input">
				<h4>아이디 찾기</h4>
				<h6>-등록된 휴대폰 번호로 찾기</h6>
				<p>&ensp;가입 당시 입력한 휴대전화 번호를 통해 아이디를 찾을 수 있습니다.</p>
				<hr>
				<div class="search">
					<h5>이름</h5>
					<input name="m_name" id="search_m_name" type="text" placeholder="이름을 입력해주세요." required="required"/>
				</div>
				<div class="search">
					<h5>전화번호</h5>
					<input class="phone" id="search_phone1" type="number" required="required" maxlength="3" oninput="numberMaxLength(this);"/>&nbsp;-&nbsp;
					<input class="phone" id="search_phone2" type="number" required="required" maxlength="4" oninput="numberMaxLength(this);"/>&nbsp;-&nbsp;
					<input class="phone" id="search_phone3" type="number" required="required" maxlength="4" oninput="numberMaxLength(this);"/>
				</div>
				<div class="search">
					<button class="search_btn" type="button" id="search_pw_btn">확인</button>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 5. footer1.jsp : footer -->
<%@ include file="../footer1.jsp"%>
<!-- 6. 페이지별 script 추가 -->
<script src="<c:url value="/resources/js/member_js.js" />"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<!-- footer2.jsp : script -->
<%@ include file="../footer2.jsp"%>
