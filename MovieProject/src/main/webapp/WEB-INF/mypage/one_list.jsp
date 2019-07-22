<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--
/**
* @Class Name : one_list.jsp
* @Description : 1:1문의 게시판 리스트
* @Modification Information
* @
* @  수정일     	  수정자            		수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.06    황진석      		 	최초생성
* @ 2019.07.18    한유진       		    버튼 동작 수정 및 back-end 작업
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
				<div class="col-md-9 col-sm-12 col-xs-12">
					<div class="info_update" style="width: 100%;">
						<h1>
							<strong>1:1 문의내역</strong>
						</h1>
					</div>
					<br>
					<div>
						<ul>
							<li>
								<p class="inq_txt">
									<strong>상담시간</strong>
							</li>
							<li>평일(월 ~ 금) 10:00 ~ 17:00</li>
							<li>(Off-time 12:00 ~ 14:00, 토/일/공휴일 휴무)</li>
						</ul>
					</div>
					<div class="btn_t">
						<button type="button" class="btn-check-hjs"
							onclick="location.href='one_register.do'">1:1 문의쓰기</button>
					</div>

					<div class="static-table-list">
						<div class="card mb-3">
							<div class="card-body">
								<table class="one_table">
									<thead>
										<tr>
											<th style="width: 10%;" class="th_border">구분</th>
											<th style="width: 30%;" class="th_border">상담제목</th>
											<th style="width: 20%;" class="th_border">작성일</th>
											<th style="width: 10%;">답변유무</th>
										</tr>
									</thead>
									<!-- core jstl의 foreach로 게시글의 목록이 올 자리다 -->
									<tbody>
									<c:choose>
										<c:when test="${requestScope.qnaList[0].qna_no == null}">
											<tr>
												<td colspan="4">등록된 문의글이 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="qna" items="${requestScope.qnaList }">
												<tr>
													<td>${qna.qna_category }</td>
													<td><a href="one_get.do?qna_no=${qna.qna_no}">${qna.qna_title}</a></td>
													<td>${qna.qna_date}</td>
													<td>${qna.qna_answer}</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
									</tbody>
									
									<%-- 
									<tbody>
									<%
										for(int i=0; i<10; i++){
									%>
										<tr>
											<td>결말해석</td>
											<td><a href="one_get.do">고질라 쿠키영상 무슨뜻인가요?</a></td>
											<td>2011/04/25</td>
											<td>N</td>
										</tr>
									<%
										}
									%>
									</tbody> --%>
									
								</table>

								<ul class="pagination">
									<li class="icon-prev"><a href="#"><i
											class="ion-ios-arrow-left"></i></a></li>
									<li class="active"><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">...</a></li>
									<li><a href="#">21</a></li>
									<li><a href="#">22</a></li>
									<li class="icon-next"><a href="#"><i
											class="ion-ios-arrow-right"></i></a></li>
								</ul>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../footer1.jsp"%>
<%@ include file="../footer2.jsp"%>

