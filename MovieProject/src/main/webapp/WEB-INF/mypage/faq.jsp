<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--
/**
* @Class Name : faq.jsp
* @Description : FAQ게시판
* @Modification Information
* @
* @  수정일     		     수정자            		수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.06         황진석      		 	최초생성
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/
-->
<%@ include file="../header.jsp" %>
<!DOCTYPE html>

<html>
<head>
	<link rel="stylesheet" href="<c:url value="/resources/css/hjs.css" />">
</head>
<div class="hero user-hero">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="hero-ct">
					<h1>Edward kennedy’s profile</h1>
					<ul class="breadcumb">
						<li class="active"><a href="#">Home</a></li>
						<li> <span class="ion-ios-arrow-right"></span>Rated movies</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="buster-light">
	<div class="page-single">
		<div class="container">
			<div class="row ipad-width2">
				<div class="col-md-3 col-sm-12 col-xs-12">
					<div class="info">
						<h2> <strong>황진석 님</strong> </h2>
						<h3> <strong>h10046245h@naver.com</strong></h3>
					</div>
					<div class="user-information-hjs">
						<div class="user-fav">
							<ul>
								<li><a href="mypage.do">마이페이지</a></li>
							</ul>
										
							<ul>
								<li>회원 정보</li>
								<li><a href="pw_confirm.do">&nbsp;&nbsp;&nbsp;&nbsp;회원정보수정</a></li>
								<li><a href="member_out.do">&nbsp;&nbsp;&nbsp;&nbsp;회원탈퇴</a></li>
							</ul>
					
							<ul>
								<li>고객센터</li>
								<li><a href="one_list.do">&nbsp;&nbsp;&nbsp;&nbsp;1:1 문의내역</a></li>
								<li><a href="faq.do">&nbsp;&nbsp;&nbsp;&nbsp;FAQ</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-9 col-sm-12 col-xs-12">
					<div class="tal_info1">
						<h1><strong>FAQ</strong></h1>
					</div>
					<div class="info_update">
						<p>찾으시는 답변이 없으면 <strong>1:1문의</strong>를 이용해 주세요.</p>
					</div>
					<br><br><br>
					<div class="small_tab">
						<ul class="small_ul">
							<li class="list">
								<a href="#">자주찾는 FAQ</a> 
							</li>
							<li class="list">
								<a href="#">영화</a>
							</li>
							<li class="list">
								<a href="#">예매</a>
							</li>
							<li class="list">
								<a href="#">이벤트</a>
							</li>
							<li class="list">
								<a href="#">기타</a>
							</li>
								
						</ul>
						<hr class="small_hr"> 
	
						<ul class="small_tab1">
							<li>
								<span style="margin-left:10%;">구분</span>
								<span style="margin-left:40%;">제목</span>
							</li>
							<li><hr class="small_hr1"></li>
							<li>
								<div class="faq_gubun">기타</div>
								<div class="faq_content"><a href="#">게시판 글쓰려면 회원가입 해야 하나요?게시판 글쓰려면 회원가입 해야 하나요?게시판 글쓰려면 회원가입 해야 하나요?</a></div>
							</li>
							<li><hr class="small_hr1"></li>
							<li>
								<span class="faq_gubun">기타</span>
								<span class="faq_content"><a href="#">영화티켓은 나눔게시판에서 나눔할 수 없나요?</a></span>
							</li>
							<li><hr class="small_hr1"></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- footer section-->
<%@ include file="../footer.jsp" %>
</body>
</html>