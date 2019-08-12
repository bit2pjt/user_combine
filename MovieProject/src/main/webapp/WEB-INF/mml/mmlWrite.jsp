<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
/**
* @Class Name : mmlWrite.jsp
* @Description : 나영리 글쓰기
* @Modification Information
* @
* @  수정일     	  수정자            		수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.09    김상필      		 최초생성
* @ 2019.07.23    한유진      		 back-end 작업
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/
-->

<%@ include file="../header1.jsp"%>

<!-- 2. 여기에 페이지별 css 추가해주세요 -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/sp_style.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/ws_personal.css" />">
<script src="https://kit.fontawesome.com/bb8498b585.js"></script>

<script>
function check(){
	//제목과 내용의 앞뒤 공백 제거
	var mml_title = mml_write_form.mml_title.value.trim();
	var mml_content = mml_write_form.mml_content.value.trim();
	
	if(mml_title.length == 0){
		alert("제목을 입력해주세요.");
		mml_write_form.mml_title.focus();
		return false;
	}
	if(mml_content.length == 0){
		alert("내용을 입력하세요.");
		mml_write_form.mml_content.focus();
		return false;
	}
	
	
	return true;
}
function register_back(){
	msg="나영리 작성을 취소하시겠습니까?";
	if(confirm(msg)!=0){
		location.href="mmlList";
	}
	
}
</script>
<!-- 3. heaer2.jsp : header -->
<%@ include file="../header2.jsp"%>

<div class="buster-light"
	style="padding: 75, 600, 75, 600; margin-top: 10%; min-height: 120px;">
	<!-- 글쓰기 폼의 시작.-->
	<form name="mml_write_form" action="mmlWriteAction" method="post"
		onsubmit="return check()">
		<input type="hidden" name="id" value=${requestScope.id }>
		<div id="writer-box" style="padding: 75, 600, 75, 600">
			<center>
				<div id="top-writer" style="padding: 75, 600, 75, 600">
					<span><strong>제목:</strong></span> <span> <input
						name="mml_title"
						style="width: 850px; border-color: #999999; background-color: #FFFFFF; border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;"
						placeholder="제목을 적어주세요">
					</span> <span id="title-count">0</span>/50자 남음
				</div>
				<strong style="vertical-align: top;">&nbsp;&nbsp;내용
					:&nbsp;&nbsp;&nbsp;&nbsp; </strong>
				<textarea name="mml_content"
					style="border: 1; width: 900px; height: 400px; display: inline-block;"
					placeholder="내용을 적어주세요"></textarea>

				<div class="tab-content">
					<div id="tab1" class="tab active">
						<div class="row">

							<div class="slick-multiItem">
								<div class="slide-it">
									<div class="movie-item">
										<img src="<c:url value="/resources/images/sp_image/노트북.jpg"/>"
											alt="" width="185" height="284">
									</div>
								</div>
								<div class="slide-it">
									<div class="movie-item">

										<a href="movieList"> </i> <img
											src="<c:url value="/resources/images/sp_image/mv-item1.jpg"/>"
											alt="" width="185" height="284"> <i
											class="ion-android-arrow-dropright"></i> Add Movie
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</center>


		</div>
	</form>
</div>
<!-- end of writer-box -->
</form>



<%@ include file="../footer1.jsp"%>
<%@ include file="../footer2.jsp"%>