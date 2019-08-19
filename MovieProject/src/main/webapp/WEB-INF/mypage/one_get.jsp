<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("m_email") == null) {
		System.out.println("m_email : " + (String) session.getAttribute("m_email"));
		out.println("<script>");
		out.println("alert('로그인 후 이용해주세요.')");
		out.println("location.href='index'");
		out.println("</script>");
	}
%>
<!--
/**
* @Class Name : one_get.jsp
* @Description : 1:1문의 상세
* @Modification Information
* @
* @  수정일               수정자                  수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.06         황진석                최초생성
* @ 2019.07.07  박현민       header, footer 수정   
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
<script>
	function deleteQnaDetail() {

		var qno = qform.qna_no.value;
		msg = "삭제 하시겠습니까?";
		if (confirm(msg) != 0) {

			location.href = "one_delete?qna_no=" + qno;
		}

	}
</script>


<!-- 3. heaer2.jsp : header -->
<%@ include file="../header2.jsp"%>
<!-- 4. 여기에 페이지별 본문을 추가해주세요 -->

<div class="hero user-hero">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="hero-ct">
					<h1 style="margin-left: 0px; margin-top: -80px;">1:1 문의내역</h1>
					<ul style="margin-left: 0px;" class="breadcumb">
						<li class="active"><a href="index">마이페이지</a></li>
						<li><span class="ion-ios-arrow-right"></span> 1:1 문의내역</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</div>

<div class="buster-light">
	<div class="page-single" style="margin-top: 0px;">
		<div class="container" style="margin-top: -180px;">
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
								<li style="font-weight: bold;"><a style="font-size: 18px;"
									href="mypage">마이페이지</a></li>
							</ul>
							<ul style="border-top: 1px solid #ccc; padding-top: 20px;">
								<li>회원 정보</li>
								<li><a href="pw_confirm">&nbsp;&nbsp;&nbsp;&nbsp;회원정보수정</a></li>
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
				<!--  좌측 메뉴 끝 -->
				<div>
					<div class="col-md-9 col-sm-12 col-xs-12">
						<div class="info_update">
							<h1>
								<strong>1:1 문의내역</strong>
							</h1>
						</div>
						<div>
							<form>
								<ul>
									<li class="tb_line">
										<div class="tb_th1">상담구분</div>
										<div class="tb_td1">
											${requestScope.qnaDetail.qna_category }</div>
									</li>
									<li class="tb_line">
										<div class="tb_th1">닉네임</div>

										<div class="tb_td1">${requestScope.m_nickname }</div>
									</li>
									<li class="tb_line">
										<div class="tb_th1">제목</div>

										<div class="tb_td1">${requestScope.qnaDetail.qna_title }
										</div>
									</li>
									<li class="tb_line">

										<div class="tb_th1">내용</div>
										<div class="tb_td1" style="word-break: break-all">
											${requestScope.qnaDetail.qna_content }</div>

									</li>
								</ul>
								<br>
								<div class="btn_m">
									<input style="width:200px; height: 40px;" type="button"
										onClick="location.href='one_update?qna_no=${requestScope.qnaDetail.qna_no}'"
										class="btn-check-hjs" value="수정"> &nbsp; <input style="width:200px; height: 40px;"
										type="reset" class="btn-check-hjs" value="삭제"
										onclick="deleteQnaDetail()"> 
									<input  type="hidden" name="qna_no" value="${requestScope.qnaDetail.qna_no}">
								</div>
								<br>
							</form>
						</div>
						<br> <br>
						<!-- hm |관리자 답변 폼 -->
						<div>




							<form>
								<c:choose>
									<c:when test="${requestScope.qnaAdDetail.aqna_content == null}">
										<br>

										<ul>
											<li class="tb_line"></li>
											<li class="tb_line">
												<div class="tb_th1">답변내용</div>
												<div class="tb_th1" style="width: 80%">답변이 아직 없습니다.</div>
											</li>
										</ul>
										<br>
									</c:when>
									<c:otherwise>
										<ul>
											<li class="tb_line"></li>
											<li class="tb_line">
												<div class="tb_th1">답변일시</div>
												<div class="tb_td1" style="word-break: break-all">${requestScope.qnaAdDetail.aqna_update_date }</div>
											</li>
											<li class="tb_line">
												<div class="tb_th1">답변내용</div>
												<div class="tb_td1">
													${requestScope.qnaAdDetail.aqna_content }</div>

											</li>
										</ul>
									</c:otherwise>
								</c:choose>

								<br>
								<div class="btn_m">
									<input style="width:400px; height: 60px;" type="button" onClick="location.href='one_list'"
										class="btn-check-hjs" value="> 목록으로 돌아가기">
								</div>
							</form>
						</div>
						<!--  hm |관리자 답변 폼  끝 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- footer section-->
<!-- 5. footer1.jsp : footer -->
<%@ include file="../footer1.jsp"%>
<!-- 6. 페이지별 script 추가해 주세요. -->
<!-- 7. footer2.jsp : script -->
<%@ include file="../footer2.jsp"%>