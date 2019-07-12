<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
/**
* @Class Name : member_out.jsp
* @Description : 회원 탈퇴
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
					<div class="tal_info">
						<h1><strong> 회원 탈퇴 </strong></h1>
					</div>
						
					<div class="etcWrap">
						<dl class="secedeInfo">
							<dt class="tal_info"><strong>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</strong></dt>
							<dt class="b">회원 탈퇴는 회원님 스스로 신청하시는 것을 원칙으로 합니다.</dt>
							<dd>아이디 및 비밀번호 재확인 후 탈퇴 하실 수 있습니다.<br>
								만약 로그인이 되지 않아 탈퇴 신청을 할 수 없는 경우에는 1:1문의로
								연락 주시기 바랍니다.<br><br>
							</dd>
									
							<dt class="b">회원탈퇴 이후 개인정보 보유사유 및 기간</dt>
							<dd>
								 원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. <br>
								 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.<br>
									- 보존 항목 : 로그인ID<br>
									- 보존 근거 : 컨텐츠 이용ID 중복방지<br>
									- 보존 기간 : 3개월<br>
									<br>
									- 보존 항목 : 본인인증값<br>
									- 보존 근거 : 악용목적에 의한 가입 및 탈퇴방지<br>
									- 보존 기간 : 탈퇴일로 3일<br>
									<br>
									- 보존 항목 : 부정이용 기록<br>
									- 보존 근거 : 부정방지 이용<br>
									- 보존 기간 : 1년<br>
									<br>
									 그리고 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 <br>아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.<br><br>
									- 보존 항목 : 표시·광고에 관한 기록<br>
									- 보존 근거 : 전자상거래등에서의 소비자보호에 관한 법률<br>
									- 보존 기간 : 6개월<br><br>
					
									- 보존 항목 : 계약 또는 청약철회 등에 관한 기록<br>
									- 보존 근거 : 전자상거래등에서의 소비자보호에 관한 법률<br>
									- 보존 기간 : 5년<br><br>
					
									- 보존 항목 : 대금 결제 및 재화 등의 공급에 관한 기록<br>
									- 보존 근거 : 전자상거래등에서의 소비자보호에 관한 법률<br>
									- 보존 기간 : 5년<br><br>
					
									- 보존 항목 : 소비자의 불만 또는 분쟁처리에 관한 기록<br>
									- 보존 근거 : 전자상거래등에서의 소비자보호에 관한 법률<br>
									- 보존 기간 : 3년<br><br>
					
									- 보존 항목 : 로그기록자료, 접속지의 추적자료<br>
									- 보존 근거 : 통신비밀보호법<br>
									- 보존 기간 : 3개월<br><br>
								</dd>
								<dt class="b">지금 탈퇴 하시면 가입일 기준 최대 30일 이후에 재 가입이 가능합니다.</dt>
								<dd>(아이디가 여러 개인 경우 최종 가입 아이디 가입일 기준)<br>- 탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</dd>
							</dl>
					</div> <br>
					<div class="btn_m">
						<input type="button" class="btn-check" value="탈퇴"> &nbsp;
						<input type="reset" class="btn-check" value="취소">
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