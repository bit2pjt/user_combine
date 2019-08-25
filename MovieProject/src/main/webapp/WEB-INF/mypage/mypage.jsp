<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.spring.member.MemberVO" %>
<%
	MemberVO member = (MemberVO)request.getAttribute("member");
%>
<!--
/**
* @Class Name : mypage.jsp
* @Description : 마이페이지 첫 화면
* @Modification Information
* @
* @  수정일     		     수정자            		수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.06         황진석      		 	최초생성
* @ 2019.07.22    한유진      		 	qnaList 기능 추가
* @author bit 2조
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/
-->
<%@ include file="../header1.jsp"%>

<!-- 2. 여기에 페이지별 css 추가해주세요 -->

<link rel="stylesheet" href="<c:url value="/resources/css/hjs.css" />">
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script>
function update_img(){
	var a = document.getElementById("file_img").value;
	if (a.length == 0) {
		alert('사진변경을 취소합니다.');
	} else {
		$('#sbtn').click();
	}
}
/*
$(function() {
		var session = "${sessionyn}";
		var img_btn = $("#m_image_btn");
		var file_img = $("#file_img");
		
		reco.on("click", function() {
		 	if( session == "") {
		 		alert("로그인 하셔야 이용하실수 있습니다.");
		 		location.href="index";
		 		return false;
		 	}
			$.ajax({
				url:"profileAddAction",
				data: {id: session, file: 1},
				dataType: "text",
				type:"post",
				success: function(data) {
					if(data == "fail") {
						alert("이미 추천/비추천을 누르셨습니다.");
						return false;
					}else {
						reco.html("<i class='far fa-thumbs-up' aria-hidden='true' ></i>  " + data);
					}
				},
				error: function() {
					alert("에러");
				}
			});
		});
		
		deco.on("click", function() {
		 	if( session == "") {
		 		alert("로그인 하셔야 이용하실수 있습니다.");
		 		location.href="index";
		 		return false;
		 	}
			$.ajax({
				url:"boardFreeReco",
				data: {bf_bno: bno, type: 0},
				dataType: "text",
				type:"post",
				success: function(data) {
					if(data == "fail") {
						alert("이미 추천/비추천을 누르셨습니다.");
						return false;
					}else {
						deco.html("<i class='far fa-thumbs-down' aria-hidden='true'></i>  " + data);
					}
				},
				error: function() {
					alert("에러");
				}
			});
		});
		*/
</script>
<!-- 3. heaer2.jsp : header -->
<%@ include file="../header2.jsp" %>

<div class="hero user-hero">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="hero-ct">
					<h1 style="margin-left: 0px; margin-top: -105px;">마이페이지</h1>
					<ul style="margin-left: 0px;" class="breadcumb">
						<li class="active"><a href="index">홈</a></li>
						<li><span class="ion-ios-arrow-right"></span> 마이페이지</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="buster-light" style="margin-top: -180px;">
	<div class="page-single">
		<div class="container">
			<div class="row ipad-width2">
				<div class="col-md-3 col-sm-12 col-xs-12">
						<div class="info">
							<h2> <strong><%= member.getM_name() %> 님</strong> </h2>
							<h3> <%= member.getM_email() %></h3>
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
					<div class="info">
						<h1> <strong>마이 페이지</strong></h1>
					</div>
					<hr class="hr_style"/>
					<div class="form-style-1-hjs user-pro-hjs">
						<div style="display:block;">
							<div class="information-hjs">
								<div class="user-img">
									<%if(member.getM_image() == null || member.getM_image().equals("") || member.getM_image().equals("null")) {%>
										<img src="resources/images/customs/ws_img/defaultprofile.PNG" style="width:120px;height:120px;border-radius:60px;">
									<%}else{ %>

									<img src="./upload/${requestScope.member.m_image }" style="width:120px;height:120px;border-radius:60px;">

									<%} %>
									<form name="goodsform" action="./profileAddAction?id=<%= member.getId() %>" method="post" enctype="multipart/form-data">
										<input name="file" id="file_img" type="file" onchange="update_img()" style="visibility:hidden;height:1px;" />
										<input type="button" value="사진 변경" id="m_image_btn" onclick="$('#file_img').click();" style="width: 120px;background-color: black;color: white;font-weight: bold;"/>
										<input id="sbtn" type="submit" style="visibility:hidden;height:1px;" />
									</form>
								</div>
								
								<div class="hjs-info" >
									<h4> 이름: <%= member.getM_name() %></h4> 
									<h4> 닉네임: <%= member.getM_nickname() %></h4> 
									<h4> 이메일: <%= member.getM_email() %></h4> 
									<h4> 선호장르: <%= member.getM_favorite() %></h4> 
								</div>
							</div>
							
							<br><br>
							<div class="div_one">
								<table class="tb_hjs">
									<caption class="caption-hjs"> 
										<h2>1:1 문의 내역 <a href="one_list" class="caption_a"> 더보기 </a></h2>
									</caption>
									<colgroup>
										<col width="10%" />
										<col width="25%"/>
										<col width="15%"/>
										<col width="10%"/>
									</colgroup>
									<thead>
										<tr>
											<th class="th_border"> 구분 </th>
											<th class="th_border"> 상담제목 </th>
											<th class="th_border"> 작성날짜 </th>
											<th> 답변여부 </th>
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
											<c:forEach var="qna" items="${requestScope.qnaList }" end="4">
												<tr>
													<td>${qna.qna_category }</td>
													<td><a href="one_get?qna_no=${qna.qna_no}">${qna.qna_title}</a></td>
													<td>${qna.qna_date}</td>
													<td>${qna.qna_answer}</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
									</tbody>
								</table>
							</div>
							<br><br><br>
							<div class="div_one">
									<table class="tb_hjs">
										<caption class="caption-hjs"> 
											<h2> 나의 팔로잉/팔로워 <a href="folfol_list?id=${requestScope.member.id}" class="caption_a"> 더보기 </a> </h2></caption>
												
											<colgroup>
												<col width="25%" />
												<col width="25%"/>
											</colgroup>
											<thead>
												<tr>
													<th colspan="2" class="th_border"> 팔로잉 닉네임 </th>
													<th colspan="2"> 팔로워 닉네임 </th>
												</tr>
											</thead>
											
											<tbody>
												<tr>
													<td colspan="2" style="padding:0px;">
													<c:forEach var="foling" items="${requestScope.following }" end="4">
													<div style="padding:2px; border:1px solid rgba(51, 51, 51, 0.1)">
													<a href="mmlMemberList?id=${foling.id}">${foling.m_nickname }</a><br>
													</div>
													</c:forEach>
													 </td>
													<td colspan="2" style="padding:0px;">
													<c:forEach var="foler" items="${requestScope.follower }" end="4">
													<div style="padding:2px; border:1px solid rgba(51, 51, 51, 0.1)">
													<a href="mmlMemberList?id=${foler.id}"> ${foler.m_nickname}</a> <br>
													 </div>
												</c:forEach>
													 </td>
												</tr>
											</tbody>
									</table>
								</div>
							</div>
						</div>
						<hr class="hr_style"/>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 5. footer1.jsp : footer -->
<%@ include file="../footer1.jsp"%>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<!-- 6. 페이지별 script 추가해 주세요. -->

<!-- 7. footer2.jsp : script -->
<%@ include file="../footer2.jsp"%> 