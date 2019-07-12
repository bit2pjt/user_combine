<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
/**
* @Class Name : pw_confirm.jsp
* @Description : 비밀번호 재확인 
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

<body>
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
						<div class="pw_info">
							<span>
								<h1>비밀번호 재확인</h1>
								<span style="text-align:center">
									회원님의 소중한 정보보호를 위해 비밀번호를 재확인하고 있습니다
								</span>
							</span>
						</div>
						<hr class="hr_style2">
						<div class="form-style-pw">
								<div class="form-div">
									<form id="basic-form" action="member_info.do" method="get">
										<div class="form-pw">
											<span>
												<strong>이메일: h10046245h@naver.com </strong>
											</span><br><br>
											<span> 
												<strong>비밀번호:</strong>
											</span>
											<input type="password" size="10" placeholder="비밀번호 입력" required/> <br><br>
											<div class="pw-btn">
												<input type="submit" class="btn-pw" value="확인"> &nbsp;
												<input type="reset" class="btn-pw" value="취소">
											</div>
										</div>
									</form>
								</div>
						</div>
						<hr class="hr_style2">
				</div>
			</div>
		</div>
	</div>
</div>

<!-- footer section-->
<%@ include file="../footer.jsp" %>
</body>
</html>