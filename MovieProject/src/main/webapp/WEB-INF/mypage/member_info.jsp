<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<div class="info_update">
							<h1><strong>회원정보 수정</strong></h1>
						</div>
						<form action="mypage.do" method="get">
						<div style="display:block;">
							<ul>
								<li class="tb_line">
									<div class="tb_th2"> 이메일 </div>
									<div class="tb_td2"> h10046245h@naver.com </div>
								</li>
	
								<li  class="tb_line">
									<div class="tb_th2"> 비밀번호<br>변경 </div>
									<div class="tb_td2">
										
											<div class="inpbx1">
												<label for="user_password">현재 비밀번호</label>
												<input id="user_password" placeholder="현재 비밀번호" type="password" class="ng-untouched ng-pristine ng-invalid">
											</div>
											<div class="inpbx1">
												<label for="new_password">신규 비밀번호</label>
												<input id="new_password" placeholder="신규 비밀번호" type="password" class="ng-untouched ng-pristine ng-invalid">
											</div>
											<div class="inpbx1">
												<label for="confirm_password">신규 비밀번호 확인</label>
												<input id="confirm_password" placeholder="신규 비밀번호 확인" type="password" class="ng-untouched ng-pristine ng-invalid">
												<br>
												<input type="submit" class="btn-check" value="비밀번호 변경"/>
											</div>
									</div>
								</li>
	
								<li class="tb_line">
									<div class="tb_th2"> 이름 </div>
									<div class="tb_td2"> 가나다 </div>
								</li>
	
								<li class="tb_line">
									<div class="tb_th2"> 닉네임 </div>
									<div class="tb_td2"> 비트인 </div>
									<button class="btn-check"> 닉네임 변경 </button>
								</li>
	
								<li class="tb_line">
									<div class="tb_th2" style="vertical-align: middle"> 휴대폰 번호 </div>
									<div class="tb_td2">
										<input id="user_cell1" maxlength="4" name="user_cell1" type="tel">
										<span class="dash">-</span>
										<input id="user_cell2" maxlength="4" name="user_cell2" type="tel">
										<span class="dash">-</span>
										<input id="user_cell3" maxlength="4" name="user_cell3" type="tel">
									</div>
								</li>
	
								<li class="tb_line">
										<div class="tb_th2"> 선호장르 </div>
										<div class="tb_td2"> 
											<label>
												<input type="radio" name="genre" value="fear">&nbsp;<span>공포/호러</span>
												<input type="radio" name="genre" value="melo">&nbsp;<span>멜로/로맨스</span>
												<input type="radio" name="genre" value="action">&nbsp;<span>액션</span><br>
												<input type="radio" name="genre" value="comedy">&nbsp;<span>코미디</span>
												<input type="radio" name="genre" value="crime">&nbsp;<span>범죄</span> 
												<input type="radio" name="genre" value="thriller">&nbsp;<span>스릴러</span>
												<input type="radio" name="genre" value="noir">&nbsp;<span>느와르</span><br>
												<input type="radio" name="genre" value="family">&nbsp;<span>가족</span>
												<input type="radio" name="genre" value="ani">&nbsp;<span>애니메이션</span>
											</label>
										</div>
								</li>
								<li class="tb_line">
										<div class="tb_th2"> 수신동의<br> 여부 </div>
										<div class="tb_td2"> 
											<div>
												SMS 수신동의 &nbsp;&nbsp;&nbsp;
												<input type="radio" name="check1" value="y">&nbsp;<span>동의함</span>&nbsp;
												<input type="radio" name="check1" value="n">&nbsp;<span>동의안함</span>&nbsp;
											</div>
											<div>
												이메일 수신동의 &nbsp;&nbsp;&nbsp;
												<input type="radio" name="check2" value="y">&nbsp;<span>동의함</span>&nbsp;
												<input type="radio" name="check2" value="n">&nbsp;<span>동의안함</span>&nbsp;
											</div>
											<div class="etc">
												이벤트정보, 기타 다양한 정보를 빠르게 만나실 수 있습니다
											</div>
										</div>
								</li>
							</ul>
							<div class="btn_m">
									<input type="submit" class="btn-check" value="수정"> &nbsp;
									<input type="reset" class="btn-check" value="취소">
							</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- footer section-->
<%@ include file="../footer.jsp" %>
</body>
</html>