<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
/**
* @Class Name : member_left_menu.jsp
* @Description : 마이페이지 좌측 메뉴 
* @Modification Information
* @
* @  수정일     		     수정자            		수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.22       박현민     		 최초생성
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/
-->
<%
	//
	
	//MyPageController.java의 oneList에서 넘어온 값(회원이름, 회원 이메일));
	String m_name = (String)request.getAttribute("m_name");
	String m_email = (String)request.getAttribute("m_email");
%>
<!-- 위에 -->
<!--  <div class="col-md-3 col-sm-12 col-xs-12"> -->
				<div class="col-md-3 col-sm-12 col-xs-12">
					<div class="info">
						<h2>
							<strong>${requestScope.m_name } 님</strong>
						</h2>
						<h3>
							<strong>${sessionScope.m_email }</strong>
						</h3>
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
								<li><a href="one_list.do">&nbsp;&nbsp;&nbsp;&nbsp;1:1
										문의내역</a></li>
								<li><a href="faq.do">&nbsp;&nbsp;&nbsp;&nbsp;FAQ</a></li>
							</ul>
						</div>
					</div>
				</div>
<!-- 위에  -->					
<!-- <div class="col-md-9 col-sm-12 col-xs-12">  -->