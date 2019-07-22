<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
/**
* @Class Name : one_register.jsp
* @Description : 1:1문의 등록
* @Modification Information
* @
* @  수정일     	  수정자            		수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.06    황진석      		 	최초생성
* @ 2019.07.19    한유진       		    버튼 동작 수정 및 back-end 작업, check() 기능 추가( 미입력시 알림창)
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/
-->
<%@ include file="../header1.jsp"%>
	<link rel="stylesheet" href="<c:url value="/resources/css/hjs.css" />">
<%@ include file="../header2.jsp"%>


<!-- 2. 여기에 페이지별 css 추가해주세요 -->
<script>
function check(){
	//제목과 내용의 앞뒤 공백 제거
	var qna_title=qnaform.qna_title.value.trim();
	var qna_content=qnaform.qna_content.value.trim();
	
	if(qna_title.length == 0){
		alert("제목을 입력해주세요.");
		qnaform.qna_title.focus();
		return false;
	}
	if(qna_content.length == 0){
		alert("내용을 입력하세요.");
		qnaform.qna_content.focus();
		return false;
	}
	
	//공백 제거 후 양식에 맞게 값이 입력되어있을 경우 폼의 데이터를 변경 -> 자바코드에서 공백제거해줄랭
	//document.getElementById("qna_title").value=qna_title;
	//document.getElementById("qna_content").value=qna_content;
	
	return true;
}
function register_back(){
	msg="1:1 문의글 작성을 취소하시겠습니까?";
	if(confirm(msg)!=0){
		location.href="one_list.do";
	}
	
}
</script>

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
				<div>
					<div class="col-md-9 col-sm-12 col-xs-12">
						<div class="info_update">
							<h1>
								<strong>1:1 문의쓰기</strong>
							</h1>
						</div>

						<div>
							<form name="qnaform" action="one_registerAction.do" method="post" onsubmit="return check()">
								<table class="onetable_hjs">
									<colgroup>
										<col width="5%" />
										<col width="30%" />
									</colgroup>
									<tbody>
										<tr>
											<td class="vertical_top">상담구분</td>
											<td>
												<div>
													<label for=""> 
														<label class="fancy-radio custom-color-coral"> 
															<input name="qna_category" type="radio" checked value="영화 문의"><span><i></i><b>영화 문의</b></span>
														</label> 
														<label class="fancy-radio custom-color-coral"> 
															<input name="qna_category" type="radio" value="예매 문의"><span><i></i><b>예매 문의</b> </span>
														</label> 
														<label class="fancy-radio custom-color-coral"> 
															<input name="qna_category" type="radio" value="이벤트 문의"><span><i></i><b>이벤트 문의</b></span>
														</label> 
														<label class="fancy-radio custom-color-coral"> 
															<input name="qna_category" type="radio" value="회원정보 문의"><span><i></i><b>회원정보 문의</b></span>
														</label> 
														<label class="fancy-radio custom-color-coral"> 
															<input name="qna_category" type="radio" value="기타 문의"><span><i></i><b>기타 문의</b></span>
														</label>
													</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>닉네임</td>
											<td>
												<div>${requestScope.m_nickname }</div>
											</td>
										</tr>
										<tr>
											<td>제목</td>
											<td>
												<div>
													<input type="text" maxlength="25" placeholder="제목을 입력하세요.(25자까지 입력가능)" id="qna_title" name="qna_title"/>
												</div>
											</td>
										</tr>

										<tr>
											<td>내용</td>
											<td>
												<div>
													<textarea cols="1" rows="1"
														style="resize: none; height: 200px" id="qna_content" name="qna_content"></textarea>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="btn_m">
									<input type="submit" class="btn-check-hjs" value="등록">
									&nbsp;<input type="button" class="btn-check-hjs" value="취소" onclick="register_back()">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- footer section-->
<%@ include file="../footer1.jsp"%>
<%@ include file="../footer2.jsp"%>

