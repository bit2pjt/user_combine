<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.spring.member.MemberVO"%>
<%
	MemberVO member = (MemberVO) request.getAttribute("member");
String[] phone =  member.getM_phone().split("-");
String phone1 = phone[0];
String phone2 = phone[1];
String phone3 = phone[2];
	String favorite = member.getM_favorite();
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
<%@ include file="../header1.jsp"%>
<%@ include file="../header2.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value="/resources/css/hjs.css" />">
<script type="text/javascript">
function pw(form) {
	
	
	var m_password = pwform.m_password.value;
	
	//비밀번호와 비밀번호 확인 입력값이 일치하지 않을경우
	var pass_rule = /(?=.*\d{1,20})(?=.*[~`!@#$%\^&*()-+=]{1,20})(?=.*[a-zA-Z]{1,50}).{8,20}$/;
	if((pass_rule).test(m_password) == false || pwform.pass_chk.value == 0){
		alert('비밀번호를 확인해주세요.');
		return false;
	}else {
		alert("비밀번호가 수정되었습니다.");
	}

}

	function modify(form) {

		var ph;

		ph = form.user_cell1.value +"-"+ form.user_cell2.value
				+"-"+ form.user_cell3.value;

		document.getElementById("modify_phone").value = ph;

		var fa;
		fa = $("input:checkbox[name='chkbox']:checked").val();

		document.getElementById("modify_favorite").value = fa;

		var sa;
		var ea;

		sa = $("input:radio[name='smsyn']:checked").val();
		ea = $("input:radio[name='emailyn']:checked").val();

		document.getElementById("modify_sagree").value = sa;
		document.getElementById("modify_eagree").value = ea;

		alert("정보가 수정되었습니다.");
	}
</script>


</head>
<body>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

	<script type="text/javascript">
		$(document).ready(
				function() {
					
					//비밀번호 체크
					$('.inpbx1 #new_password').on('change keyup paste input', function() {
						
						var password_rule = /(?=.*\d{1,20})(?=.*[~`!@#$%\^&*()-+=]{1,20})(?=.*[a-zA-Z]{1,50}).{8,20}$/;
						var m_password = pwform.m_password.value;
						
						if(password_rule .test(m_password) == false){
							$('#password_msg').html('ㄴ8-20자 이내 영문자, 숫자의 조합으로 입력해주세요.').css('color', 'red');
						}else{
							$('#password_msg').html('');
						} 
					});
					
					//비밀번호 확인 체크
					$('.inpbx1 #confirm_password').on('change keyup paste input', function() {
						var pass_rule = /(?=.*\d{1,20})(?=.*[~`!@#$%\^&*()-+=]{1,20})(?=.*[a-zA-Z]{1,50}).{8,20}$/;
						var m_password = pwform.m_password.value;
						var c_password = pwform.confirm_pw.value;
						
						if(m_password != c_password){
							$('#pass_chk_f').css('display', '');
							$('#pass_chk_f').css('color', 'red');
							$('#pass_chk_t').css('display', 'none');
							$('#pass_chk').attr('value',0);
						}else{
							$('#pass_chk_f').css('display', 'none');
							$('#pass_chk_t').css('display', '');
							$('#pass_chk').attr('value',1);
						}
					});

					//라디오 요소처럼 동작시킬 체크박스 그룹 셀렉터
					$('input[type="checkbox"][name="chkbox"]').click(
							function() {
								//클릭 이벤트 발생한 요소가 체크 상태인 경우
								if ($(this).prop('checked')) {
									//체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
									$('input[type="checkbox"][name="chkbox"]')
											.prop('checked', false);
									$(this).prop('checked', true);
								}

							});

				});
	</script>

	<div class="hero user-hero" >
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="hero-ct" >
						<h1 style="margin-left: 0px; margin-top: -80px;">회원번호 수정</h1>
						<ul style="margin-left: 0px;" class="breadcumb">
							<li class="active"><a href="index">마이페이지</a></li>
							<li><span class="ion-ios-arrow-right"></span> 회원번호 수정</li>
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
								<strong><%=member.getM_email()%></strong>
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
										<div class="td-content"><%=member.getM_email()%></div>
									</td>
								</tr>
								<form action="update_pw?id=<%=member.getId()%>" name="pwform"
									onsubmit="return pw(this)" method="post">
									<tr>
										<td>비밀번호 변경</td>
										<td>
											<div class="td-content">
												<div class="inpbx1">
													<label for="user_password">현재 비밀번호</label> <input
														id="user_password" name="input_pw" placeholder="현재 비밀번호"
														type="password"
														class="ng-untouched ng-pristine ng-invalid"> <input
														name="pw_confirm" type="hidden"
														value="<%=member.getM_password()%>">
												</div>
												<div class="inpbx1">
													<label for="new_password">신규 비밀번호</label> <input
														id="new_password" name="m_password" placeholder="신규 비밀번호"
														type="password"
														class="ng-untouched ng-pristine ng-invalid">
														<div id="password_msg" style="font-size:4px;">ㄴ8-20자 이내 영문자, 숫자, 특수문자의 조합으로 입력해주세요.</div>
										</div>
												
												<div class="inpbx1">
													<label for="confirm_password">신규 비밀번호 확인</label> <input
														id="confirm_password" name="confirm_pw"
														placeholder="신규 비밀번호 확인" type="password"
														class="ng-untouched ng-pristine ng-invalid">
														<div id="pass_chk_f" style="display:none; font-size:4px;" >ㄴ비밀번호가 일치하지 않습니다.</div>
						<div id="pass_chk_t" style="display:none;color:blue;font-size:4px;">ㄴ비밀번호가 일치합니다.</div>
													<input type="submit" class="btn-check-hjs" value="비밀번호 변경" />
												</div>
											</div>
										</td>
									</tr>
								</form>
								<tr>
									<td>이름</td>
									<td>
										<div class="td-content"><%=member.getM_name()%></div>
									</td>
								</tr>
								<form id="nickChkform"
									action="update_nick?id=<%=member.getId()%>" method="post">
									<input type="hidden" name="id" value=<%=member.getId()%>>

									<tr>
										<td>닉네임</td>
										<td>
											<div class="td-content">
												<input type="text" id="nicknameVal" name="m_nickname"
													style="width: 250px" value="<%=member.getM_nickname()%>" /><br>
												<button id="nick_chk" class="btn-check-hjs">닉네임 변경</button>

											</div>
										</td>
									</tr>
								</form>
								<form name="modifyform"
									action="member_update?id=<%=member.getId()%>"
									onsubmit="return modify(this)" method="post">
									<tr>
										<td>휴대폰 번호</td>
										<td>
											<div class="td-content">
												<input class="user_te11" maxlength="4" name="user_cell1"
													value="<%=phone1%>" type="tel"> <span class="dash">-</span>
												<input class="user_cell1" maxlength="4" name="user_cell2"
													value="<%=phone2%>" type="tel"> <span class="dash">-</span>
												<input class="user_cell1" maxlength="4" name="user_cell3"
													value="<%=phone3%>" type="tel"> <input
													type="hidden" name="m_phone" id="modify_phone"
													value="<%=phone%>">
											</div>
										</td>
									</tr>
									<tr>
										<td style="vertical-align: top;">선호장르</td>
										<td>
											<div class="td-content">

												<label for="terms-2"> <label
													class="fancy-checkbox custom-bgcolor-coral"> <input
														name="chkbox" value="공포/호러" type="checkbox"
														<%if (member.getM_favorite().equals("공포/호러")) {%> checked
														<%}%>><span>공포/호러</span>
												</label> <label class="fancy-checkbox custom-bgcolor-coral">
														<input name="chkbox" value="멜로/로맨스" type="checkbox"
														<%if (member.getM_favorite().equals("멜로/로맨스")) {%> checked
														<%}%>><span>멜로/로맨스</span>
												</label> <label class="fancy-checkbox custom-bgcolor-coral">
														<input name="chkbox" value="액션" type="checkbox"
														<%if (member.getM_favorite().equals("액션")) {%> checked
														<%}%>><span>액션 </span>
												</label> <label class="fancy-checkbox custom-bgcolor-coral">
														<input name="chkbox" value="코미디" type="checkbox"
														<%if (member.getM_favorite().equals("코미디")) {%> checked
														<%}%>><span> 코미디 </span>
												</label> <label class="fancy-checkbox custom-bgcolor-coral">
														<input name="chkbox" value="범죄" type="checkbox"
														<%if (member.getM_favorite().equals("범죄")) {%> checked
														<%}%>><span> 범죄 </span>
												</label> <label class="fancy-checkbox custom-bgcolor-coral">
														<input name="chkbox" value="스릴러" type="checkbox"
														<%if (member.getM_favorite().equals("스릴러")) {%> checked
														<%}%>><span> 스릴러 </span>
												</label> <label class="fancy-checkbox custom-bgcolor-coral">
														<input name="chkbox" value="느와르" type="checkbox"
														<%if (member.getM_favorite().equals("느와르")) {%> checked
														<%}%>><span> 느와르 </span>
												</label> <label class="fancy-checkbox custom-bgcolor-coral">
														<input name="chkbox" value="가족" type="checkbox"
														<%if (member.getM_favorite().equals("가족")) {%> checked
														<%}%>><span> 가족 </span>
												</label> <label class="fancy-checkbox custom-bgcolor-coral">
														<input name="chkbox" value="애니메이션" type="checkbox"
														<%if (member.getM_favorite().equals("애니메이션")) {%> checked
														<%}%>><span> 애니메이션 </span>
												</label>

												</label> <input type="hidden" name="m_favorite" id="modify_favorite"
													value="<%=favorite%>">
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
															name="smsyn" value="y" type="radio"
															<%if (member.getM_sagree().equals("y")) {%> checked <%}%>><span><i></i>동의함</span>
														</label> <label class="fancy-radio custom-color-coral"> <input
															name="smsyn" value="n" type="radio"
															<%if (member.getM_sagree().equals("n")) {%> checked <%}%>><span><i></i>동의
																안함 </span>
														</label>
													</div> <br> 이메일 수신동의
													<div class="div-yn">
														<label class="fancy-radio custom-color-coral"> <input
															name="emailyn" value="y" type="radio"
															<%if (member.getM_eagree().equals("y")) {%> checked <%}%>><span><i></i>동의함</span>
														</label> <label class="fancy-radio custom-color-coral"> <input
															name="emailyn" value="n" type="radio"
															<%if (member.getM_eagree().equals("n")) {%> checked <%}%>><span><i></i>동의
																안함</span>
														</label> <input type="hidden" name="m_sagree" id="modify_sagree"
															value="<%=member.getM_sagree()%>"> <input
															type="hidden" name="m_eagree" id="modify_eagree"
															value="<%=member.getM_eagree()%>">

													</div>
												</label>
											</div>
											<div class="etc">이벤트정보, 기타 다양한 정보를 빠르게 만나실 수 있습니다</div>
										</td>
									</tr>
							</tbody>
						</table>
						<div class="btn_m">
							<input style="width: 200px; height: 40px;" type="submit" class="btn-check-hjs" value="수정">
							&nbsp; <a href="mypage"><input style="width: 200px; height: 40px;"  type="button" class="btn-check-hjs" value="취소"></a>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer section-->
	<%@ include file="../footer.jsp"%>
</body>
</html>
