<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.member.MemberVO" %>
<%
	MemberVO member = (MemberVO)request.getAttribute("member");
%>
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

<%@ include file="../header1.jsp"%>

<!-- 2. 여기에 페이지별 css 추가해주세요 -->

<link rel="stylesheet" href="<c:url value="/resources/css/hjs.css" />">

<script>
	
	function confirm(form){
		var pw1 = form.con_pw.value;
		var pw2 = form.m_password.value;
		
		if(pw1 != pw2){
			alert("비밀번호가 일치하지 않습니다.");
			form.m_password.value="";
			form.m_password.focus();
			return false;
		}
		
		
		
		
	}
	
	</script>

<!-- 3. heaer2.jsp : header -->
<%@ include file="../header2.jsp" %>

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
						<h2> <strong><%= member.getM_name() %></strong> </h2>
							<h3> <strong><%= member.getM_email() %></strong></h3>
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
								<form id="basic-form" onsubmit="return confirm(this)" action="member_info.do?id=<%= member.getId() %>" method="post">
									<div class="form-pw">
										<span>
											<strong>이메일: <%= member.getM_email() %> </strong>
										</span><br><br>
										<span> 
											<strong>비밀번호:</strong>
										</span>
											<input type="hidden" name="con_pw" value=<%=member.getM_password() %>>
											<input type="password" name="m_password" size="10" placeholder="비밀번호 입력" required/> <br><br>
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
<!-- 5. footer1.jsp : footer -->
<%@ include file="../footer1.jsp"%>

<!-- 6. 페이지별 script 추가해 주세요. -->

<!-- 7. footer2.jsp : script -->
<%@ include file="../footer2.jsp"%> 