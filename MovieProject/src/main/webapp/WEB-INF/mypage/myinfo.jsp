<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--
/**
* @Class Name : one_list.jsp
* @Description : 1:1문의 게시판 리스트
* @Modification Information
* @
* @  수정일          수정자                  수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.06    황진석                최초생성
* @ 2019.07.18    한유진                 버튼 동작 수정 및 back-end 작업
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
					<h1 style="margin-left: 0px; margin-top: -80px;">내가 쓴 게시글</h1>
					<ul style="margin-left: 0px;" class="breadcumb">
						<li class="active"><a href="index">마이페이지</a></li>
						<li><span class="ion-ios-arrow-right"></span> 내가 쓴 게시글</li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</div>

<div class="buster-light" style="heignt: 100%;">
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
				<div class="col-md-9 col-sm-12 col-xs-12">
					<div class="info_update" style="width: 100%;">
						<h1>
							<strong> 내가 쓴 게시글 </strong>
						</h1>
					</div>
					<br>
					<div>
						<ul>
							<li>
								<p class="inq_txt">
									<strong>내가 쓴 모든 게시물을 확인 하실 수 있습니다.</strong>
								</p>
							</li>
						</ul>
					</div>
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab1" data-toggle="tab">자유게시판</a></li>
						<li><a href="#tab2" data-toggle="tab">나눔게시판</a></li>
					</ul>

					<div class="tab-content">
						<div class="tab-pane active" id="tab1">
							<div class="static-table-list1">
								<div class="card mb-3">
									<div class="card-body">
										<table class="one_table">
											<thead>
												<tr>
													<th style="width: 10%;" class="th_border">카테고리</th>
													<th style="width: 30%;" class="th_border">게시글 제목</th>
													<th style="width: 20%;" class="th_border">작성일</th>
												</tr>
											</thead>
											<!-- core jstl의 foreach로 게시글의 목록이 올 자리다 -->
											<tbody>
												<c:choose>
													<c:when test="${freeList == null}">
														<tr>
															<td colspan="3">등록된 게시글이 없습니다.</td>
														</tr>
													</c:when>
													<c:otherwise>
														<c:forEach items="${freeList}" var="freeList"
															varStatus="status">
															<tr>
																<td>${freeList.category}</td>
																<td><a href="boardFreeGet?bno=${freeList.bno}">${freeList.title}</a></td>
																<td><fmt:formatDate value="${freeList.reg_date}"
																		pattern="yyyy-MM-dd" /></td>
															</tr>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</tbody>

										</table>

										<div class="box-footer">
											<div class="text-center">
												<form id="listPageForm">
													<input type="hidden" name="page"
														value="${pageMaker1.criteria.page}"> <input
														type="hidden" name="perPageNum"
														value="${pageMaker1.criteria.perPageNum}">
												</form>
												<ul class="pagination">
													<c:if test="${pageMaker1.prev}">
														<li><a href="${pageMaker1.startPage - 1}">이전</a></li>
													</c:if>
													<c:forEach begin="${pageMaker1.startPage}"
														end="${pageMaker1.endPage}" var="idx">
														<li
															<c:out value="${pageMaker1.criteria.page == idx ? 'class=active' : ''}"/>>
															<a href="${idx}">${idx}</a>
														</li>
													</c:forEach>
													<c:if test="${pageMaker1.next && pageMaker1.endPage > 0}">
														<li><a href="${pageMaker1.endPage + 1}">다음</a></li>
													</c:if>
												</ul>
											</div>
										</div>
										<!-- end | pagination -->
									</div>
								</div>
							</div>
						</div>

						<div class="tab-pane" id="tab2">
							<div class="static-table-list2">
								<div class="card mb-3">
									<div class="card-body">
										<table class="one_table">
											<thead>
												<tr>
													<th style="width: 10%;" class="th_border">카테고리</th>
													<th style="width: 30%;" class="th_border">게시글 제목</th>
													<th style="width: 20%;" class="th_border">작성일</th>
												</tr>
											</thead>
											<!-- core jstl의 foreach로 게시글의 목록이 올 자리다 -->
											<tbody>
												<c:choose>
													<c:when test="${shareList == null}">
														<tr>
															<td colspan="3">등록된 게시글이 없습니다.</td>
														</tr>
													</c:when>
													<c:otherwise>
														<c:forEach items="${shareList}" var="shareList"
															varStatus="status">
															<tr class="post">
																<td>${shareList.category}</td>
																<td><a href="boardShareGet?bno=${shareList.bno}">${shareList.title}</a></td>
																<td><fmt:formatDate value="${shareList.reg_date}"
																		pattern="yyyy-MM-dd" /></td>
															</tr>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
										<div class="box-footer">
											<div class="text-center">
												<form id="listPageForm">
													<input type="hidden" name="page"
														value="${pageMaker2.criteria.page}"> <input
														type="hidden" name="perPageNum"
														value="${pageMaker2.criteria.perPageNum}">
												</form>
												<ul class="pagination">
													<c:if test="${pageMaker2.prev}">
														<li><a href="${pageMaker2.startPage - 1}">이전</a></li>
													</c:if>
													<c:forEach begin="${pageMaker2.startPage}"
														end="${pageMaker2.endPage}" var="idx">
														<li
															<c:out value="${pageMaker2.criteria.page == idx ? 'class=active' : ''}"/>>
															<a href="${idx}">${idx}</a>
														</li>
													</c:forEach>
													<c:if test="${pageMaker2.next && pageMaker.endPage > 0}">
														<li><a href="${pageMaker2.endPage + 1}">다음</a></li>
													</c:if>
												</ul>
											</div>
										</div>
										<!-- end | pagination -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(".pagination li a").on("click", function(event) {
		event.preventDefault();

		var targetPage = $(this).attr("href");
		var listPageForm = $("#listPageForm");
		listPageForm.find("[name='page']").val(targetPage);
		listPageForm.attr("action", "myinfo").attr("method", "get");
		listPageForm.submit();
	});
</script>
<%@ include file="../footer1.jsp"%>
<%@ include file="../footer2.jsp"%>
