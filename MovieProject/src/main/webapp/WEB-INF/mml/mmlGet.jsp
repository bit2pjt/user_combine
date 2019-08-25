<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!--
/**
* @Class Name : mmlGet.jsp
* @Description : 나영리 겟
* @Modification Information
* @
* @  수정일     		     수정자            		수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.09        김상필      		 	최초생성
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/
-->
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/header1.jsp"%>

<!-- 2. 여기에 페이지별 css 추가해주세요 -->

<link rel="stylesheet" href="./resources/css/sp_style.css">
<link rel="stylesheet" href="./resources/css/ws_personal.css?Ver=4">

<script src="https://kit.fontawesome.com/bb8498b585.js"></script>

<!-- 3. heaer2.jsp : header -->
<%@ include file="/WEB-INF//header2.jsp"%>


<%
	String email = (String) session.getAttribute("m_email");
	int vid = (int) request.getAttribute("vid");
%>
<input id="ws_email_session" type=hidden
	value=<c:out value="${m_email}"/>>
<input id="ws_id" type=hidden value=<c:out value="${member.id}"/>>
<input id="ws_mml_content_num" type=hidden
	value=<c:out value="${mml_content.mml_num}"/>>
<input id="ws_mmlGet_nickname" type=hidden
	value=<c:out value="${member.m_nickname}"/>>

<!-- 세션객체에서 id 추출 후, Javascript로 넘긴다. 왜 바로 못넘길까... -->

<br>
<br>
<div class="buster-light">
	<!-- blog detail section-->
	<div class="page-single">
		<div class="container">
			<div class="row">
				<div class="blog-detail-ct">
					<div class="flex-it share-tag" style="width: 100%; float: left;">
						<div class="social-link">
							<div style="flex: 2;">
								<h1 class="mmlTitle">
									<c:out value="${mml_content.mml_title}" />
								</h1>
								<!-- hm | 제목 하단 div 시작 -->
								<div class="right-it" style="color: #ccc">
									<!-- hm| 엠블럼 시작 -->
									<c:set var="level" value="${member.m_level}" />
									<c:choose>
										<c:when test="${level eq 'BRONZE'}">
											<img class="crown"
												style="height: 25px; width: 25px; margin: 5px"
												src="<c:url value="/resources/images/sp_image/crown.png" />">
										</c:when>
										<c:when test="${level eq 'SILVER'}">
											<img class="crown"
												style="height: 25px; width: 25px; margin: 5px"
												src="<c:url value="/resources/images/sp_image/crown.png"/>">
										</c:when>
										<c:otherwise>
											<img class="crown"
												style="height: 25px; width: 25px; margin: 5px"
												src="<c:url value="/resources/images/sp_image/crown.png"/>">
										</c:otherwise>
									</c:choose>
									<!-- c:set은 짝짝이 태그 -->
									<!--  hm| 엠블럼 끝 -->
									<!-- hm| 닉네임 시작 -->
									<h4 id="mml_con_nick" value="${member.m_nickname}">
										<c:out value="${member.m_nickname}" />
									</h4>
									<!-- hm | 닉네임 끝 -->


									<!-- 작성일 -->
									| 작성일
									<fmt:formatDate pattern="yyyy-MM-dd"
										value="${mml_content.mml_write_date}" />
									| 수정일
									<fmt:formatDate pattern="yyyy-MM-dd"
										value="${mml_content.mml_update_date}" />
									|
								</div>
								<!-- hm | 제목 하단 div 끝 -->
							</div>
							<!--
							<div style="flex: 2;">
								<a href="#"> <img class="ws_memberService" id="ws_following"
									style="width: 65px; height: 65px;"
									src="<c:url value="/resources/images/sp_image/add-user.png"/>">
								</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span
									OnClick="location.href ='mmlFollowList?id=<c:out value="${member.id}"/>'">
									<h4 style="display: inline">Followers</h4>
									<h4 id="ws_follower_set"
										style="display: inline; color: lightcoral">
										<!-- 팔로워 수가 들어올 자리지만, 이는 Ajax가 페이지 로딩이 끝난 후 채워준다. 변화가 잦은 영역이기 때문
									</h4>
								</span>
								<div class="" style="display: inline;">
									&nbsp;&nbsp;&nbsp;&nbsp; <i
										class="fas fa-heart getheart ws_memberService"
										id="ws_give_like"></i> &nbsp;
									<h4 id="ws_like_set" style="display: inline; color: lightcoral">
										<!-- 좋아요 수가 들어올 자리지만, 이는 Ajax가 페이지 로딩이 끝난 후 채워준다. 변화가 잦은 영역
									</h4>
									&nbsp;&nbsp;
								</div>
								<a href="#"> <img class="ws_memberService"
									id="ws_give_warning"
									style="width: 45px; height: 45px; margin-top: 0px;"
									src="<c:url value="/resources/images/sp_image/warning.png"/>">
								</a> &nbsp;&nbsp;&nbsp;&nbsp;
							</div>
							<div class="right-it" style="flex: 1; vertical-align: middle;">
								<h4>
									<c:out value="${member.m_nickname}" />
								</h4>
								<c:set var="level" value="${member.m_level}" />
								<c:choose>
									<c:when test="${level eq 'BRONZE'}">
										<img class="crown"
											src="<c:url value="/resources/images/sp_image/helmet.png"/>">
									</c:when>
									<c:when test="${level eq 'SILVER'}">
										<img class="crown"
											src="<c:url value="/resources/images/sp_image/shield.png"/>">
									</c:when>
									<c:otherwise>
										<img class="crown"
											src="<c:url value="/resources/images/sp_image/crown.png"/>">
									</c:otherwise>
								</c:choose>
								<fmt:formatDate pattern="yyyy-MM-dd"
									value="${mml_content.mml_write_date}" />
							</div>
							 -->

							<div class="right-it" style="flex: 1; vertical-align: middle;">
								<!-- hm | 팔뤄워수 -->

									<a href="#"> <img class="ws_memberService" id="ws_following"
									style="width: 25px; height: 25px; margin:10px;"
									src="<c:url value="/resources/images/sp_image/add-user.png"/>">
								</a> 
								 
								<span 
									onclick="location.href ='mmlFollowList?id=<c:out value="${member.id}"/>'">
									<h4 style="display: inline">Followers</h4></span>
									<h4 id="ws_follower_set"
										style="display: inline; color: lightcoral">
										<!-- 팔로워 수가 들어올 자리지만, 이는 Ajax가 페이지 로딩이 끝난 후 채워준다. 변화가 잦은 영역이기 때문 -->
									</h4>
									<span
									onclick="location.href ='mmlFollowingList?id=<c:out value="${member.id}"/>'">
									<h4 style="display: inline">Followings</h4></span>
									<h4 id="ws_following_set"
										style="display: inline; color: lightcoral">
										<!-- 팔로워 수가 들어올 자리지만, 이는 Ajax가 페이지 로딩이 끝난 후 채워준다. 변화가 잦은 영역이기 때문 -->
									</h4>

									<div class="" style="display: inline;">
										&nbsp;&nbsp;&nbsp;&nbsp;
										<svg
											class="svg-inline--fa fa-heart fa-w-8 getheart ws_memberService"
											style="line-height: 20px; vertical-align: middle;"
											id="ws_give_like" aria-hidden="true" data-prefix="fas"
											data-icon="heart" role="img"
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
											data-fa-i2svg="">
											<path fill="currentColor"
												d="M462.3 62.6C407.5 15.9 326 24.3 275.7 76.2L256 96.5l-19.7-20.3C186.1 24.3 104.5 15.9 49.7 62.6c-62.8 53.6-66.1 149.8-9.9 207.9l193.5 199.8c12.5 12.9 32.8 12.9 45.3 0l193.5-199.8c56.3-58.1 53-154.3-9.8-207.9z"></path></svg>
										<!-- <i class="fas fa-heart getheart ws_memberService" id="ws_give_like" aria-hidden="true"></i> -->
										&nbsp;
										<h4 id="ws_like_set"
											style="display: inline; color: lightcoral">10</h4>
										&nbsp;&nbsp;
									</div> <a href="#"> <img class="ws_memberService"
										id="ws_give_warning"
										style="width: 30px; height: 30px; margin-bottom: 40px; width: 30px; height: 30px;"
										src="/movie/resources/images/sp_image/warning.png"> 신고하기
								</a> &nbsp;&nbsp;&nbsp;&nbsp; 
							</div>
						</div>

					</div>

					<div style="width: 80%; height: 358px; font-size: 20px;">
						<c:out value="${mml_content.mml_content}" />
					</div>

					<!-- share link -->
					<c:set var="mml_poster"
						value="${fn:split(requestScope.mml_content.mml_poster,',')}" />
					<c:forTokens items="${requestScope.mml_content.mi_code }"
						delims="," var="mi_code" varStatus="i">
						<div class='mml-movie-item' id='${mi_code }'
							style="display: inline-block;">
							<input type='hidden' name='mi_code' value='${mi_code }'>
							<img src='${mml_poster[i.index]}' alt='${mml_poster[i.index]}'
								onclick="location.href='movieDetail?mi_ktitle=${requestScope.ktitleList[i.index]}'"
								style="width: 185px; height: 284px;">
						</div>
					</c:forTokens>
					<br>
					
				</div>
			</div>
			<!-- 진석코드 -->
			<div class="row">
				<br>
				<h3 class="box-title">댓글</h3>
				<br>
				<!-- 댓글 시작과 끝에 파랗고 두꺼운 선. -->
				<div class="comments"
					style="border-width: 3px 0px; border-style: solid;">
					<div class="ws-reply-buffer"></div>
					<!-- 댓글2 -->
					<div class="content-wrapper">
						<section class="content container-fluid">
							<div class="modal fade" id="modifyModal" role="dialog">
								<div class="modal-dialog" style="margin-top: 100px;">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">댓글 수정창</h4>
										</div>
										<div class="modal-body">
											<div class="form-group">
												<label for="replyNo" style="margin-bottom: 10px;"><strong>댓글
														번호</strong></label> <input class="form-control" id="replyNo" name="replyNo"
													readonly>
											</div>

											<div class="form-group">
												<label for="replyText" style="margin-bottom: 10px;"><strong>댓글
														내용</strong></label>
												<textarea class="form-control" id="replyText"
													name="replyText" placeholder="댓글 내용을 입력해주세요"
													style="resize: none; height: 100px;"></textarea>
											</div>

										</div>
										<div class="modal-footer">
											<button type="button" id='btn-hjs'
												class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
											<button type="button" id='btn-hjs'
												class="btn btn-success modalModBtn">수정</button>
											<button type="button" id='btn-hjs'
												class="btn btn-danger modalDelBtn" data-dismiss="modal">삭제
											</button>
										</div>
									</div>
								</div>
							</div>

							<div class="box box-primary">
								<div class="box-footer">
									<ul id="replies">

									</ul>
								</div>

								<div class="box-footer">
									<div class="text-center">
										<ul class="pagination pagination-sm no-margin">

										</ul>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>

				<div class="box-header with-border" style="margin-top: 30px;">
					<h3 class="box-title">댓글 작성</h3>
					<div class="box-body">
						<div class="form-group">
							<textarea class="form-control" id="newReplyText" name="replyText"
								placeholder="댓글 내용을 입력해주세요"
								style="resize: none; margin-top: 20px; height: 200px;"></textarea>
						</div>
						<div class="pull-right">
							<button type="button" id="replyAddBtn" class="btn btn-primary">
								댓글 저장</button>
						</div>
					</div>
				</div>

			</div>



		</div>
	</div>
</div>


<!-- end of  blog detail section-->
<!-- 삭제 모달 : 게시글 -->
<div id="CatModal-post-delete" class="modal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">게시글 삭제</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>게시글을 삭제하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<form action="/movie/mmlDelete" method="get">
					<button onclick="CatDelete()" type="submit" class="btn btn-primary">삭제하기</button>
					<input type="hidden" name="mml_num" value="${mml_content.mml_num}" />
				</form>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
			</div>
		</div>
	</div>
</div>

<!-- 삭제 모달 : 댓글 -->
<div id="CatModal-reply-delete" class="modal" tabindex="-1"
	role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">댓글 삭제</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>댓글을 삭제하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button onclick="replydel()" type="button" class="btn btn-primary">삭제하기</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

	function deleteMML() {
    	var abc = confirm("삭제 하시겠습니까?");
    	var mml_num = $("#mml_num").val();
    	
    	if( abc == true)
    		location.href="mmlDelete?mml_num="+mml_num;
    	else
    		return false;
  	}
	
	function replydel() {
		location.replace("mmlGet");
	}

	$(function() {
		$('.ws-btn-thumbs-up').click(function() {
			$('.ws-reply-msg').css('color', 'red');

		});
	});

	//페이지 로딩시 자동으로 시행되는 구문
	$(document).ready(function() {
		console.log('좋아요 수 갱신 시작');

		//1. 게시자의 팔로워 수 조회
		countFollower($('#ws_id').val(), function(result) {
			$('#ws_follower_set').html(result);
		});
		
		countFollowing($('#ws_id').val(), function(result) {
			$('#ws_following_set').html(result);
		});

		//2. 게시글의 추천수 조회

		countLike($('#ws_mml_content_num').val(), function(result) {
			$('#ws_like_set').html(result);

		});

	});
</script>
<script>
	var replyPageNum = 1;
	var mml_num = "${mml_content.mml_num}";

	getRepliesPaging(replyPageNum);

	$("#replyAddBtn").on("click", function() {
		var session = "${sessionyn}";
		var replyText = $("#newReplyText");
		var mml_reply_content = replyText.val();

		/* if( session == "") {
			alert("로그인 하셔야 이용하실수 있습니다.");
			location.href="index";
			return false;
		}  */

		if (mml_reply_content == "") {
			alert("댓글 내용을 입력해주세요!");
			return false;
		}

		$.ajax({
			type : "post",
			url : "/movie/replies/mml/",
			headers : {
				"Content-type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : "text",
			data : JSON.stringify({
				mml_num : mml_num,
				mml_reply_content : mml_reply_content
			}),
			success : function(result) {
				if (result == "regSuccess") {
					alert("댓글 등록 완료!");
				}
				//getReplies();
				getRepliesPaging(replyPageNum);
				replyText.val("");
			}
		});
	});

	$("#replies").on("click", ".replyLi button", function() { // 댓글의 수정 버튼 클릭시
		var reply = $(this).parent(); // 댓글의 li
		var replyNo = reply.attr("data-replyNo"); // 댓글의 번호
		var replyText = reply.find(".replyText").text(); //댓글의 내용
		$("#replyNo").val(replyNo); // 댓글 수정창의 댓글번호에 넣음
		$("#replyText").val(replyText); // 댓글 수정창의 댓글내용에 넣음
	});

	$("#replies")
			.on(
					"click",
					".replyLi .ws-btn-thumbs-up",
					function() { // 댓글의 추천 버튼 클릭시
						var reply = $(this).parent(); // 댓글의 li
						var mml_reply_code = reply.attr("data-replyNo"); // 댓글의 번호
						var present = $(this).parent()
								.find(".ws-btn-thumbs-up");
						var session = "${sessionyn}";
						//var bf_rno = $("#replies > li");
						//alert($(this).parent().find(".ws-btn-thumbs-up").text());
						/* if( session == "") {
						 	alert("로그인 하셔야 이용하실수 있습니다.");
						 	location.href="index";
						 	return false;
						 } */
						$
								.ajax({
									url : "MmlReplyReco",
									data : {
										mml_reply_code : mml_reply_code,
										type : 1
									},
									dataType : "text",
									type : "post",
									success : function(data) {
										if (data == "fail") {
											alert("이미 추천/비추천을 누르셨습니다.");
											return false;
										} else {
											present
													.html("<i class='fa fa-thumbs-up' aria-hidden='true' ></i>  "
															+ data);
										}
									},
									error : function() {
										alert("에러");
									}
								});

					});

	$("#replies")
			.on(
					"click",
					".replyLi .ws-btn-thumbs-down",
					function() { // 댓글의 비추 버튼 클릭시
						var reply = $(this).parent(); // 댓글의 li
						var mml_reply_code = reply.attr("data-replyNo"); // 댓글의 번호
						var present = $(this).parent().find(
								".ws-btn-thumbs-down");
						var session = "${sessionyn}";

						//var bf_rno = $("#replies > li");
						//alert($(this).parent().find(".ws-btn-thumbs-up").text());
						if (session == "") {
							alert("로그인 하셔야 이용하실수 있습니다.");
							location.href = "index";
							return false;
						}
						$
								.ajax({
									url : "MmlReplyReco",
									data : {
										mml_reply_code : mml_reply_code,
										type : 0
									},
									dataType : "text",
									type : "post",
									success : function(data) {
										if (data == "fail") {
											alert("이미 추천/비추천을 누르셨습니다.");
											return false;
										} else {
											present
													.html("<i class='fa fa-thumbs-down' aria-hidden='true'></i>  "
															+ data);
										}
									},
									error : function() {
										alert("에러");
									}
								});

					});

	$("#replies").on("click", ".replyLi .ws-btn-warning", function() { // 댓글의 수정 버튼 클릭시
		var reply = $(this).parent(); // 댓글의 li
		var mml_reply_code = reply.attr("data-replyNo"); // 댓글의 번호
		var present = $(this).parent().find(".ws-btn-warning");
		var session = "${sessionyn}";
		//var bf_rno = $("#replies > li");
		//alert($(this).parent().find(".ws-btn-thumbs-up").text());
		if (session == "") {
			alert("로그인 하셔야 이용하실수 있습니다.");
			location.href = "index";
			return false;
		}

		$.ajax({
			url : "MmlReplyWarn",
			data : {
				mml_reply_code : mml_reply_code
			},
			dataType : "text",
			type : "post",
			success : function(data) {
				if (data == "success")
					alert("신고 되었습니다.");
				else
					alert("이미 신고 하셨습니다.");
			},
			error : function() {
				alert("에러");
			}
		});

	});

	$(".modalDelBtn").on("click", function() {
		var replyRno = $("#replyNo").val();

		$.ajax({
			type : "delete",
			url : "/movie/replies/mml/" + replyRno,
			headers : {
				"Content-type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : "text",
			success : function(result) {
				console.log("result : " + result);
				if (result == "delSuccess") {
					//getReplies();
					getRepliesPaging(replyPageNum);
					alert("댓글 삭제 완료!");
					/*
					$("#modifyModal").modal("hide");
					
					$("#modifyModal").removeClass("in");
					$(".modal-backdrop").remove();
					$("body").removeClass("modal-open");*/
					// $(body)
				}
			}
		});
	});

	$(".modalModBtn").on("click", function() {
		var reply = $(this).parent().parent();
		var mml_reply_code = reply.find("#replyNo").val();
		var mml_reply_content = reply.find("#replyText").val();
		$.ajax({
			type : "put",
			url : "/movie/replies/mml/" + mml_reply_code,
			headers : {
				"Content-type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({
				mml_reply_content : mml_reply_content
			}),
			dataType : "text",
			success : function(result) {
				console.log("result : " + result);
				if (result == "modSuccess") {
					//getReplies();
					getRepliesPaging(replyPageNum);
					alert("댓글 수정 완료!");
					$("#modifyModal").removeClass("in");
					$(".modal-backdrop").remove();
					$("body").removeClass("modal-open");
				}
			}
		});
	});

	var total = "";
	var id = "${id}";
	function getRepliesPaging(page) {
		$
				.getJSON(
						"/movie/replies/mml/" + mml_num + "/" + page,
						function(data) {
							var str = "";
							total = data.pageMaker.totalCount;
							total = total - (page - 1) * 10;
							if (data.replies == "") {
								str += "<li style='text-align:center'> <h4>등록된 댓글이 없습니다.</h4> </li>";
							} else {
								$(data.replies)
										.each(
												function() {
													if (this.id != id) {
														str += "<li style='display:inline-block; width:100%;'data-replyNo='"
																+ this.mml_reply_code
																+ "' class='replyLi'>"
																+ "<input type='hidden' value='" + this.id +"'/>"
																+ "<p class='replyRno' style='display:inline-block;'> No. "
																+ total--
																+ "</p>"
																+ "<div class='replyDate'> <span class='replyWriter'> <strong>"
																+ this.nickname
																+ "</strong></span> <span style='float:right'><strong>등록일 : "
																+ this.mml_reply_write_date
																+ "</strong> </span>"
																+ "</div><br>"
																+ "<p class='replyText' style='word-break:break-all;'>"
																+ this.mml_reply_content
																+ "</p>"
																+ "<button style='float:right' class='ws-btn-thumbs-down' id='reply-cnt-tdn'><i class='fa fa-thumbs-down' aria-hidden='true'></i> "
																+ this.mml_reply_dislike
																+ "</button>"
																+ "<button style='float:right' class='ws-btn-thumbs-up' id='reply-cnt-tup'><i class='fa fa-thumbs-up' aria-hidden='true' ></i> "
																+ this.mml_reply_like
																+ "</button>"
																+ "<button style='float:right; margin-right:10px;' class='ws-btn-warning' id='ws-cnt-warning'><i class='fa fa-exclamation-triangle' aria-hidden='true'></i> 신고 </button>"
																+ "</li>"
																+ "<hr/>";
													} else {
														str += "<li data-replyNo='" + this.mml_reply_code + "' class='replyLi'>"
																+ "<input type='hidden' value='" + this.id +"'/>"
																+ "<p class='replyRno' style='display:inline-block;'> No. "
																+ total--
																+ "</p>"
																+ "<div class='replyDate'> <span class='replyWriter'> <strong>"
																+ this.nickname
																+ "</strong></span> <span style='float:right'><strong>등록일 : "
																+ this.mml_reply_write_date
																+ "</strong> </span>"
																+ "</div><br>"
																+ "<p class='replyText' style='word-break:break-all; margin-bottom:20px;'>"
																+ this.mml_reply_content
																+ "</p>"
																+ "<button type='button' id='btn-hjs' class='btn btn-xs btn-success modifyModal' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
																+ "<button style='float:right' class='ws-btn-thumbs-down' id='reply-cnt-tdn'><i class='fa fa-thumbs-down' aria-hidden='true'></i> "
																+ this.mml_reply_dislike
																+ "</button>"
																+ "<button style='float:right' class='ws-btn-thumbs-up' id='reply-cnt-tup'><i class='fa fa-thumbs-up' aria-hidden='true' ></i> "
																+ this.mml_reply_like
																+ "</button>"
																+ "<button style='float:right; margin-right:10px;' class='ws-btn-warning' id='ws-cnt-warning'><i class='fa fa-exclamation-triangle' aria-hidden='true'></i> 신고 </button>"
																+ "</li>"
																+ "<hr/>";
													}
												});
							}

							$("#replies").html(str);
							printPageNumbers(data.pageMaker);

						});
	}
	function printPageNumbers(pageMaker) {
		var str = "";
		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'>이전</a></li>";
		}
		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strCalss = pageMaker.criteria.page == i ? 'class=active' : '';
			str += "<li "+strCalss+"><a href='"+i+"'>" + i + "</a></li>";
		}
		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1) + "'>다음</a></li>";
		}
		$(".pagination-sm").html(str);
	}

	$(".pagination").on("click", "li a", function(event) {
		event.preventDefault();
		replyPageNum = $(this).attr("href");
		getRepliesPaging(replyPageNum);
	});

	var formObj = $("form[role='form']");
</script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<!-- footer2.jsp : script -->

<%@ include file="../footer.jsp"%>
<script src="<c:url value="/resources/js/memberService.js" />"></script>
</html>