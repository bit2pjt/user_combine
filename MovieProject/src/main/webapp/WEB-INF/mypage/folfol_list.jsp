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



	<div class="hero user-hero" >
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="hero-ct" >
						<h1 style="margin-left: 0px; margin-top: -80px;">팔로잉 / 팔로워 리스트</h1>
						<ul style="margin-left: 0px;" class="breadcumb">
							<li class="active"><a href="index">마이페이지</a></li>
							<li><span class="ion-ios-arrow-right"></span>팔로잉 / 팔로워 리스트</li>
						</ul>
					</div>
				</div>
				
			</div>
		</div>
	</div>

<div class="buster-light" style="heignt:100%;">
	<div class="page-single" style="margin-top:-180px;">
		<div class="container">
			<div class="row ipad-width2">
				<div class="col-md-3 col-sm-12 col-xs-12">
					<div class="info">
						<h2>
							<strong>${requestScope.member.m_name } 님</strong>
						</h2>
						<h3>
							<strong>${sessionScope.m_email }</strong>
						</h3>
					</div>
					<div class="user-information-hjs">
						<div class="user-fav">
							<ul>
								<li style="font-weight: bold;"><a style="font-size: 18px;" href="mypage">마이페이지</a></li>
							</ul>

							<ul style="border-top: 1px solid #ccc; padding-top: 20px;">
								<li>회원 정보</li>
								<li><a href="pw_confirm">&nbsp;&nbsp;&nbsp;&nbsp;회원정보수정</a></li>
								<li><a href="member_out">&nbsp;&nbsp;&nbsp;&nbsp;회원탈퇴</a></li>
							</ul>

							<ul style="border-top: 1px solid #ccc; padding-top: 20px;">
								<li>고객센터</li>
								<li><a href="one_list">&nbsp;&nbsp;&nbsp;&nbsp;1:1
										문의내역</a></li>
								<li><a href="faq">&nbsp;&nbsp;&nbsp;&nbsp;FAQ</a></li>
								<li><a href="myinfo">&nbsp;&nbsp;&nbsp;&nbsp;내가 쓴 게시글</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-9 col-sm-12 col-xs-12">
					<div class="info_update" style="width: 100%;">
						<h1>
							<strong>팔로잉 / 팔로워 리스트</strong>
						</h1>
					</div>
					<br>
				
					

					<div class="static-table-list">
						<div class="card mb-3">
							<div class="card-body">
								<table class="one_table">
									<thead>
										<tr>
											<th style="width: 50%;" class="th_border"><a href="mmlFollowingList?id=${member.id}" style="color:white;">팔로잉</a></th>
											<th style="width: 50%;" class="th_border"><a href="mmlFollowList?id=${member.id}" style="color:white;">팔로워</a></th>
										</tr>
									</thead>
									<!-- core jstl의 foreach로 게시글의 목록이 올 자리다 -->
									<tbody>
									<c:choose>
										<c:when test="${requestScope.follower[0].m_nickname == null && requestScope.following[0].m_nickname == null }">
											<tr>
												<td colspan="4">팔로잉 팔로워가 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
										
												<tr>
													<td style="width:50%; padding:0px;">
													<c:forEach var="foling" items="${requestScope.following}" >
													<div style="padding:2px; border:1px solid rgba(51, 51, 51, 0.1)">
													<a href="mmlMemberList?id=${foling.id}">${foling.m_nickname }</a><br>
													</div>
													</c:forEach>
													 </td>
													<td style="width:50%; padding:0px;">
													<c:forEach var="foler" items="${requestScope.follower }" >
													<div style="padding:2px; border:1px solid rgba(51, 51, 51, 0.1)">
													<a href="mmlMemberList?id=${foler.id}"> ${foler.m_nickname} </a><br>
													 </div>
													</c:forEach>
													 </td>
												</tr>
									
										</c:otherwise>
									</c:choose>
									</tbody>
									
								
									
								</table>

								<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="icon-prev"><a href="one_list${pageMaker.makeQuery(pageMaker.startPage-1) }"><i
											class="ion-ios-arrow-left"></i></a></li>
								</c:if>
								
								<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="index">
									<li <c:if test="${index eq pageMaker.criteria.page }">class="active"</c:if>><a href="one_list${pageMaker.makeQuery(index)}">${index}</a></li>
								</c:forEach>
								
								<c:if test="${pageMaker.next }">
									<li class="icon-next"><a href="one_list${pageMaker.makeQuery(pageMaker.endPage+1) }"><i
											class="ion-ios-arrow-right"></i></a></li>
											</c:if>
								</ul>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div style="width:1920px; height: 120px;"></div>

<%@ include file="../footer1.jsp"%>
<%@ include file="../footer2.jsp"%>

