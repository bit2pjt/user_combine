<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String msg = request.getParameter("msg");
%>
<%@ page import="com.spring.member.MemberVO"%>
<%
	MemberVO member = (MemberVO) request.getAttribute("member");
%>
<!--
/**
* @Class Name : pw_confirm.jsp
* @Description : 비밀번호 재확인 
* @Modification Information
* @
* @  수정일                수정자                  수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.06         황진석                최초생성
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/
-->
<%@ include file="../header1.jsp"%>
<%@ include file="../header2.jsp"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value="/resources/css/hjs.css" />">
</head>

<body>
	<!-- 비밀번호불치치 얼럿 -->

	<div class="hero user-hero" >
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="hero-ct" >
						<h1 style="margin-left: 0px; margin-top: -80px;">비밀번호 재확인</h1>
						<ul style="margin-left: 0px;" class="breadcumb">
							<li class="active"><a href="index">마이페이지</a></li>
							<li><span class="ion-ios-arrow-right"></span> 비밀번호 재확인</li>
						</ul>
					</div>
				</div>
				
			</div>
		</div>
	</div>

	<div class="buster-light">
		<div class="page-single" style="margin-top: 0px;">
			<div class="container" style="margin-top:-180px;">
				<div class="row ipad-width2">
					<div class="col-md-3 col-sm-12 col-xs-12">
						<div class="info">
							<h2>
								<strong><%=member.getM_name()%> 님</strong>
							</h2>
							<h3>
								<strong>${m_email }</strong>
							</h3>
						</div>
						<div class="user-information-hjs">
							<div class="user-fav">
								<ul>
									<li style="font-weight: bold;"><a style="font-size: 18px;" href="mypage">마이페이지</a></li>
								</ul>
										
								<ul style="border-top: 1px solid #ccc; padding-top: 20px;">
									<li>회원 정보</li>
									<li><a href="pw_confirm?id=<%= member.getId() %>">&nbsp;&nbsp;&nbsp;&nbsp;회원정보수정</a></li>
									<li><a href="member_out">&nbsp;&nbsp;&nbsp;&nbsp;회원탈퇴</a></li>
								</ul>
					
								<ul style="border-top: 1px solid #ccc; padding-top: 20px;">
									<li>고객센터</li>
									<li><a href="one_list">&nbsp;&nbsp;&nbsp;&nbsp;1:1 문의내역</a></li>
									<li><a href="faq">&nbsp;&nbsp;&nbsp;&nbsp;FAQ</a></li>
									<li><a href="myinfo">&nbsp;&nbsp;&nbsp;&nbsp;내가 쓴 게시글</a></li>
								</ul>
							</div>
						</div>
					</div>
					
					<div class="col-md-9 col-sm-12 col-xs-12">
						<div class="pw_info">
							<span>
								<h1>비밀번호 재확인</h1> <span style="text-align: center"> 회원님의
									소중한 정보보호를 위해 비밀번호를 재확인하고 있습니다 </span>
							</span>
						</div>
						<hr class="hr_style2">
						<div class="form-style-pw">
							<div class="form-div">
								<form id="basic-form" action="member_info" method="post">
									<div class="form-pw">
										<span> <strong>이메일: ${m_email } </strong>
										</span><br>
										<br> <span> <strong>비밀번호: </strong>

										</span> <input type="hidden" name="m_email" value="${m_email }" /> <input
											type="password" name="m_password" size="10"
											placeholder="비밀번호 입력" required /> <span class="pwchk_msg"
											style="color: red; font-size: 14px;"> <c:out
												value="${msg }" />

										</span> <br>
										<br>


										<div class="pw-btn">
											<input type="submit" class="btn-pw" value="확인">
											&nbsp; <input type="reset" class="btn-pw" value="취소">
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
	<div style="height: 90px;">>
	
	</div>
	<!-- footer section-->
	<%@ include file="../footer1.jsp"%>
	<%@ include file="../footer2.jsp"%>
</body>
</html>