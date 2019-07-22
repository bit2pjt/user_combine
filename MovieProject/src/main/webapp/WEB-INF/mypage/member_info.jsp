<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.spring.mypage.MemberVO"%>
<%
	MemberVO member1 = (MemberVO) request.getAttribute("member1");
String phone1 = member1.getM_phone().substring(0,3);
String phone2 = member1.getM_phone().substring(3,7);
String phone3 = member1.getM_phone().substring(7,11);
	
System.out.println(phone1);
System.out.println(phone2);
System.out.println(phone3);
%>
<!--
/**
* @Class Name : member_info.jsp
* @Description : 회원정보 수정
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

<!-- 1. header1.jsp : head  -->
<%@ include file="../header1.jsp"%>

<!-- 2. 여기에 페이지별 css 추가해주세요 -->

<link rel="stylesheet" href="<c:url value="/resources/css/hjs.css" />">
  
  
<script type="text/javascript">


	function pw(form) {
		var pass1 = form.pw_confirm.value;
		var pass2 = form.input_pw.value;
		var newpw1 = form.m_password.value;
		var newpw2 = form.confirm_pw.value;

		if (pass1 != pass2) {
			alert("비밀번호가 일치하지 않습니다.");
			pwform.input_pw.value = "";
			pwform.input_pw.focus();
			return false;
		} else if (newpw1 != newpw2) {
			alert("비밀번호가 일치하지 않습니다.");
			pwform.m_password.value = "";
			pwform.confirm_pw.value = "";
			pwform.m_password.focus();
			return false;
		} else {
			alert("비밀번호가 수정되었습니다.");
		}

	}
	
	function nick(form){
		
		alert("닉네임이 수정되었습니다.");
		
		
	}
	
	function modify(form){
		alert(form.m_phone.value);
		
	}
	
	
	
</script>
<!-- 3. heaer2.jsp : header -->
<%@ include file="../header2.jsp" %>

<div class="hero user-hero">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="hero-ct">
					<h1>Edward kennedy’s profile</h1>
					<ul class="breadcumb">
						<li class="active"><a href="#">Home</a></li>
						<li><span class="ion-ios-arrow-right"></span>Rated movies</li>
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
						<h2>
							<strong><%=member1.getM_name()%> 님</strong>
						</h2>
						<h3>
							<strong><%=member1.getM_email()%></strong>
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
				<div class="col-md-9 col-sm-12 col-xs-12">
					<div class="person_info">
						<h1>
							<strong>회원정보 수정</strong>
						</h1>
					</div>


					<table class="tbinfo_hjs">
						<colgroup>
							<col width="10%" />
							<col width="30%" />
						</colgroup>
						<tbody>
							<tr>
								<td>이메일</td>
								<td>
									<div class="td-content"><%=member1.getM_email()%></div>
								</td>
							</tr>
							<form action="update_pw.do?id=<%=member1.getId()%>" name="pwform"
								onsubmit="return pw(this)" method="post">
							<tr>
								<td>비밀번호 변경</td>
								<td>
									<div class="td-content">
										<div class="inpbx1">
											<label for="user_password">현재 비밀번호</label> <input
												id="user_password" name="input_pw" placeholder="현재 비밀번호"
												type="password" class="ng-untouched ng-pristine ng-invalid">
											<input name="pw_confirm" type="hidden"
												value="<%=member1.getM_password()%>">
										</div>
										<div class="inpbx1">
											<label for="new_password">신규 비밀번호</label> <input
												id="new_password" name="m_password" placeholder="신규 비밀번호"
												type="password" class="ng-untouched ng-pristine ng-invalid">
										</div>
										<div class="inpbx1">
											<label for="confirm_password">신규 비밀번호 확인</label> <input
												id="confirm_password" name="confirm_pw"
												placeholder="신규 비밀번호 확인" type="password"
												class="ng-untouched ng-pristine ng-invalid"> <br>
											<input type="submit" class="btn-check-hjs" value="비밀번호 변경" />
										</div>
									</div>
								</td>
							</tr>
							</form>
							<tr>
								<td>이름</td>
								<td>
									<div class="td-content"><%=member1.getM_name()%></div>
								</td>
							</tr>
							<form action="update_nick.do?id=<%=member1.getId()%>" onsubmit="return nick(this)" method="post">
							<tr>
								<td>닉네임</td>
								<td>
									<div class="td-content">
										<input type="text" name="m_nickname" style="width: 250px"
											value="<%=member1.getM_nickname()%>" />
										<button type="submit" class="btn-check-hjs">닉네임 변경</button>
									</div>
								</td>
							</tr>
							</form>

							<form name="modifyform" action="member_update.do?id=<%=member1.getId() %>" onsubmit="return modify(this)" method="post">
							<tr>
								<td>휴대폰 번호</td>
								<td>
									<div class="td-content">
										<input class="user_te11" maxlength="4" name="user_cell1" value="<%=phone1%>"
											type="tel"> <span class="dash">-</span> <input
											class="user_cell1" maxlength="4" name="user_cell2" value="<%=phone2%>" type="tel">
										<span class="dash">-</span> <input class="user_cell1"
											maxlength="4" name="user_cell3" value="<%=phone3%>" type="tel">
											<%
																				
											
											%>
											
											
											
										<input type="hidden" name="m_phone" value="<%=phone1%><%=phone2%><%=phone3%>">
									</div>
								</td>
							</tr>
							<tr>
								<td style="vertical-align: top;">선호장르</td>
								<td>
									<div class="td-content">
									
										<label for="terms-2"> <label
											class="fancy-checkbox custom-bgcolor-coral"> <input
												type="checkbox" <%if(member1.getM_favorite().equals("공포/호러")){%>checked<%} %> ><span>공포/호러</span>
										</label> <label class="fancy-checkbox custom-bgcolor-coral"> <input
												type="checkbox" <%if(member1.getM_favorite().equals("멜로/로맨스")){%>checked<%} %>><span>멜로/로맨스</span>
										</label> <label class="fancy-checkbox custom-bgcolor-coral"> <input
												type="checkbox" <%if(member1.getM_favorite().equals("액션")){%>checked<%} %>><span>액션 </span>
										</label> <label class="fancy-checkbox custom-bgcolor-coral"> <input
												type="checkbox" <%if(member1.getM_favorite().equals("코미디")){%>checked<%} %>><span> 코미디 </span>
										</label> <label class="fancy-checkbox custom-bgcolor-coral"> <input
												type="checkbox" <%if(member1.getM_favorite().equals("범죄")){%>checked<%} %>><span> 범죄 </span>
										</label> <label class="fancy-checkbox custom-bgcolor-coral"> <input
												type="checkbox" <%if(member1.getM_favorite().equals("스릴러")){%>checked<%} %>><span> 스릴러 </span>
										</label> <label class="fancy-checkbox custom-bgcolor-coral"> <input
												type="checkbox" <%if(member1.getM_favorite().equals("느와르")){%>checked<%} %>><span> 느와르 </span>
										</label> <label class="fancy-checkbox custom-bgcolor-coral"> <input
												type="checkbox" <%if(member1.getM_favorite().equals("가족")){%>checked<%} %>><span> 가족 </span>
										</label> <label class="fancy-checkbox custom-bgcolor-coral"> <input
												type="checkbox" <%if(member1.getM_favorite().equals("애니메이션")){%>checked<%} %>><span> 애니메이션 </span>
										</label>
										</label>
										
									</div>
								</td>
							</tr>

							<tr>
								<td>수신동의 여부</td>
								<td>
									<div class="td-content">
										<label for=""> SMS 수신동의
											<div class="div-yn">
												<label class="fancy-radio custom-color-coral"> <input
													name="smsyn" value="Y" type="radio" <%if(member1.getM_sagree().equals("y")){%>checked<%} %>><span><i></i>동의함</span>
												</label> <label class="fancy-radio custom-color-coral"> <input
													name="smsyn" value="N" type="radio" <%if(member1.getM_sagree().equals("n")){%>checked<%} %>><span><i></i>동의
														안함 </span>
												</label>
											</div>
											<br> 이메일 수신동의
											<div class="div-yn">
												<label class="fancy-radio custom-color-coral"> <input
													name="emailyn" value="Y" type="radio" <%if(member1.getM_eagree().equals("y")){%>checked<%} %>><span><i></i>동의함</span>
												</label> <label class="fancy-radio custom-color-coral"> <input
													name="emailyn" value="N" type="radio" <%if(member1.getM_eagree().equals("n")){%>checked<%} %>><span><i></i>동의
														안함</span>
												</label>
											</div>
										</label>
									</div>
									<div class="etc">이벤트정보, 기타 다양한 정보를 빠르게 만나실 수 있습니다</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="btn_m">
						<input type="submit" class="btn-check-hjs" value="수정">
						&nbsp; <input type="reset" class="btn-check-hjs" value="취소">
					</div>
					</form>
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

