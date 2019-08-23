<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--
	/**
	* @Class Name : member_join.jsp
	* @Description : 회원가입 페이지
	* @Modification Information
	* @
	* @  수정일      수정자              수정내용
	* @ ---------   ---------   -------------------------------
	* @ 2019.07.02   박현민       최초생성
	* @ 2019.07.04   박현민       헤더 푸터 수정
	* @ 2019.07.16   박현민       헤더 푸터 링크 수정
	* @ 2019.07.18   박현민		헤더 푸터 파일 나눔	
	* @ 2019.08.02   한유진		header2에서 분리, 전체적인 수정
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
					<h1>회원가입</h1>
					<ul class="breadcumb">
						<li class="active"><a href="index">홈</a></li>
						<li><span class="ion-ios-arrow-right"></span> 회원가입</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- start | 회원가입 양식 -->
<div class="container">
	<div class="row">
		<div class="col-md-6">
			<div class="join_content">
				<input id="formtype" type="hidden" value="joinform">
				<form id="joinform" action="memberJoinPAction" method="post" onsubmit="return check()">
					<div class="join">
						<h1>회원가입</h1>
						<hr>
						<h5>이메일</h5>
						<input name="m_cert" type="hidden" value="N" /> 
						<input name="m_email" id="m_email" type="text" placeholder="인증메일 수신이 가능한 이메일을 입력해주세요." required="required"/>
						<button id="email_btn" type="button" value="0">중복확인</button>
						<div id="email_msg1">ㄴ이메일 양식에 맞게 입력해주세요.</div>
						<div id="email_msg2">ㄴ이메일 중복확인 버튼을 눌러주세요.</div>
					</div>
					<div class="join">
						<h5>이름</h5>
						<input name="m_name" id="m_name" type="text" placeholder="이름을 입력해주세요." required="required"/>
					</div>
					<div class="join">
						<h5>닉네임</h5>
						<input name="m_nickname" id="m_nickname" type="text" placeholder="닉네임을 입력해주세요." required="required"/>
						<button id="nickname_btn" type="button" value="0">중복확인</button>
						<div id="nickname_msg">ㄴ닉네임 중복확인 버튼을 눌러주세요.</div>
					</div>
					<div class="join">
						<h5>비밀번호</h5>
						<input name="m_password" id="m_password" type="password" placeholder="비밀번호를 입력해주세요." required="required" maxlength="20"/>
						<div id="password_msg">ㄴ8-20자 이내 영문자, 숫자, 특수문자의 조합으로 입력해주세요.</div>
					</div>
					<div class="join">
						<h5>비밀번호 확인</h5>
						<input id="pass_chk" type="hidden" value="0">
						<input name="repassword" id="repassword" type="password" placeholder="비밀번호 확인을 위해 다시 입력해주세요." required="required"/>
						<div id="pass_chk_f" >ㄴ비밀번호가 일치하지 않습니다.</div>
						<div id="pass_chk_t" style="display:none;color:blue;">ㄴ비밀번호가 일치합니다.</div>
					</div>
					<div class="join">
						<h5>전화번호</h5>
						<input name="m_phone" id="m_phone" type="hidden" />
						<input class="phone" id="phone1" type="number" required="required" maxlength="3" oninput="numberMaxLength(this);"/>&nbsp;-&nbsp;
						<input class="phone" id="phone2" type="number" required="required" maxlength="4" oninput="numberMaxLength(this);"/>&nbsp;-&nbsp;
						<input class="phone" id="phone3" type="number" required="required" maxlength="4" oninput="numberMaxLength(this);"/>
					</div>
					<div class="join">
						<h5>선호장르</h5>
						<label class="fancy-radio custom-color-coral"> 
							<input name="m_favorite" value="공포/호러" type="radio" checked><span><i></i>공포/호러</span>
						</label> 
						<label class="fancy-radio custom-color-coral"> 
							<input name="m_favorite" value="멜로/로맨스" type="radio"><span><i></i>멜로/로맨스</span>
						</label> 
						<label class="fancy-radio custom-color-coral"> 
							<input name="m_favorite" value="액션" type="radio"><span><i></i>액션</span>
						</label> 
						<label class="fancy-radio custom-color-coral"> 
							<input name="m_favorite" value="코미디" type="radio"><span><i></i>코미디</span>
						</label> 
						<label class="fancy-radio custom-color-coral"> 
							<input name="m_favorite" value="범죄" type="radio"><span><i></i>범죄</span>
						</label> 
						<label class="fancy-radio custom-color-coral"> 
							<input name="m_favorite" value="스릴러" type="radio"><span><i></i>스릴러</span>
						</label> 
						<label class="fancy-radio custom-color-coral"> 
							<input name="m_favorite" value="느와르" type="radio"><span><i></i>느와르</span>
						</label> 
						<label class="fancy-radio custom-color-coral"> 
							<input name="m_favorite" value="가족" type="radio"><span><i></i>가족</span>
						</label> 
						<label class="fancy-radio custom-color-coral"> 
							<input name="m_favorite" value="애니메이션" type="radio"><span><i></i>애니메이션</span>
						</label> 
						<label class="fancy-radio custom-color-coral"> 
							<input name="m_favorite" value="코미디" type="radio"><span><i></i>코미디</span>
						</label>
					</div>
					<div class="join">
						<h5>약관동의</h5>
						<label class="fancy-checkbox custom-bgcolor-coral">
							<input type="checkbox" id="chk_all"><span>전체동의</span>
						</label><br>
						<label class="fancy-checkbox custom-bgcolor-coral"> 
							<input class="chk_box" type="checkbox" name="usage_agree" id="usage_agree"><span>[필수]이용약관</span>
						</label> <a class="termsLink" href="#usage-modal" data-toggle="modal">약관보기</a>
						<label class="fancy-checkbox custom-bgcolor-coral"> 
							<input class="chk_box" type="checkbox" name="info_agree" id="info_agree"><span>[필수]개인정보 수집 및 이용</span>
						</label> <a class="termsLink">약관보기</a> 
						<label class="fancy-checkbox custom-bgcolor-coral">
							<input name="m_eagree" id="m_eagree" type="hidden" value="N">
							<input class="chk_box" type="checkbox" name="m_eagree_chk" id="m_eagree_chk"><span>이메일 수신 동의</span>
						</label> 
						<label class="fancy-checkbox custom-bgcolor-coral"> 
							<input name="m_sagree" id="m_sagree" type="hidden" value="N">
							<input class="chk_box" type="checkbox" name="m_sagree_chk" id="m_sagree_chk"><span>SMS 수신 동의</span>
						</label>
						
					</div>
					<div style="background-color:#333; color: #fff; text-align: center; line-height: 100px; vertical-align: middle; margin-top: 20px;">
						<img class="logo" src="resources/images/logo1.png" alt="" width="119" height="58">
					</div>
					<div class="join" >
						<input style="height: 60px;" class="join_btn" type="submit" value="가입하기">
					</div>
				</form>
				
				
			</div>
		</div>
	</div>
</div>

<!-- end | 회원가입 양식 -->


<!-- 5. footer1.jsp : footer -->
<%@ include file="../footer1.jsp"%>
<!-- 6. 페이지별 script 추가 -->
<script src="<c:url value="/resources/js/member_js.js" />"></script>
<!-- footer2.jsp : script -->
<%@ include file="../footer2.jsp"%>
