<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
	/**
	* @Class Name : member_search_pw.jsp
	* @Description : 비밀번호 찾기 페이지
	* @Modification Information
	* @
	* @  수정일      수정자              수정내용
	* @ ---------   ---------   -------------------------------
	* @ 2019.07.02   박현민		최초생성
	* @ 2019.07.04   박현민		헤더 푸터 수정
	* @ 2019.07.16   박현민		헤더 푸터 링크 수정
	* @ 2019.07.18   박현민		헤더 푸터 파일 나눔
	* @ 2019.08.02   한유진		헤더에 있더 비밀번호 찾기 기능을 jsp파일로 분리
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
<%@ include file="../header2.jsp"%>
<div class="hero common-hero">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="hero-ct">
					<h1>비밀번호 찾기</h1>
					<ul class="breadcumb">
						<li class="active"><a href="index">홈</a></li>
						<li><span class="ion-ios-arrow-right"></span> 비밀번호 찾기</li>
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
			<div class="search_content search_content_input">
				<h1>비밀번호 찾기</h1>
				<hr>
				<div class="search">
					<h5>아이디</h5>
					<input id="search_m_email_chk" type="hidden" value='0'> <input
						name="m_email" id="search_m_email" type="text"
						placeholder="아이디를 입력해주세요." required="required" />
					<div id="email_msg1">ㄴ이메일 양식에 맞게 입력해주세요.</div>
				</div>
				<div class="search">
					<h5>이름</h5>
					<input name="m_name" id="search_m_name" type="text"
						placeholder="이름을 입력해주세요." required="required" />
				</div>
				<div class="search">
					<h5>전화번호</h5>
					<input class="phone" id="search_phone1" type="number"
						required="required" maxlength="3" oninput="numberMaxLength(this);" />&nbsp;-&nbsp;
					<input class="phone" id="search_phone2" type="number"
						required="required" maxlength="4" oninput="numberMaxLength(this);" />&nbsp;-&nbsp;
					<input class="phone" id="search_phone3" type="number"
						required="required" maxlength="4" oninput="numberMaxLength(this);" />
				</div>
				<div>
					<p>휴대전화로 계정 정보 요청 시, 카카오톡으로 전송되며 카카오톡 APP 미설치, 알림톡 받지 않기로 설정되어 있는 경우 문자메시지(SMS)로 전송됩니다.</p>
					<div
						style="background-color: #333; color: #fff; text-align: center; line-height: 100px; vertical-align: middle; margin-top: 20px;">
						<img class="logo" src="resources/images/logo1.png" alt=""
							width="119" height="58">
					</div>
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
<!-- footer2.jsp : script -->
<%@ include file="../footer2.jsp"%>