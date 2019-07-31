<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
/**
* @Class Name : mmlWrite2.jsp
* @Description : 나영리 글쓰기
* @Modification Information
* @
* @  수정일     	  수정자            		수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.09    김상필      		 최초생성
* @ 2019.07.23    한유진      		 back-end 작업
* @ 2019.07.27    한유진      		 front-end 수정
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/
-->

<%@ include file="../header1.jsp"%>

<link rel="stylesheet" href="<c:url value="/resources/css/mml_write.css" />">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 

<!-- include summernote css/js-->
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="<c:url value="/resources/js/yj_js.js" />"></script>


<script>
	function check() {
		//제목과 내용의 앞뒤 공백 제거
		var mml_title = mml_write_form.mml_title.value.trim();
		var mml_content = mml_write_form.mml_content.value.trim();

		if (mml_title.length == 0) {
			alert("제목을 입력해주세요.");
			mml_write_form.mml_title.focus();
			return false;
		}
		if (mml_content.length == 0) {
			alert("내용을 입력하세요.");
			mml_write_form.mml_content.focus();
			return false;
		}

		return true;
	}
	function register_back() {
		msg = "나영리 작성을 취소하시겠습니까?";
		if (confirm(msg) != 0) {
			location.href = "mmlList";
		}
	}
	function openModal(){
		alert('모달 뿅!');
	}
</script>

<%@ include file="../header2.jsp"%>
<!-- <body> -->
<div class="hero common-hero">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="hero-ct">
					<h1>나영리 작성하기</h1>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="buster-light" style="min-height: 800px;margin-top: 20px;">
	<div class="col-md-10">
		<form name="mml_write_form" action="mmlWriteAction" method="post" onsubmit="return check()">
			<input type="hidden" name="id" value="${requestScope.id }">
			<!-- start | title -->
			<div class="mml-write-title">
				제목<br>
				<input name="mml_title" class="mml-title"
						placeholder="제목을 입력해주세요" maxlength="50"><span id="counter">0</span><span>/50자</span>
			</div>
			<!-- end | title -->
			<!-- start | content -->
			<div class="mml-write-content">
				<br>내용<br>
				<textarea name="mml_content" id="summernote" style="border:1 solid;width:100%" placeholder="내용을 입력해주세요"></textarea>
			</div>
			<!-- end | content -->
			<!-- start | movie list -->
			<div class="mml-write-movie">
				<br>영화 리스트<br>
				<div class="mml-movie-body">
					<div class="mml-movie-item">
        				<img src="<c:url value='/resources/images/mml_add.png'/>" alt="영화 추가하기"  onclick="openModal()">
					</div>
				</div>
			</div>
			<!-- end | movie list -->
			<!-- start | button -->
			<div class="mml-write-button">
				<input type="submit" value="등록">
				<input type="button" value="취소" onclick="register_back()">
			</div>
			<!-- end | button -->
		</form>
	</div>
</div>
<!-- end of buster-light -->


<script>




</script>
<!-- 5. footer1.jsp : footer -->
<%@ include file="/WEB-INF/footer1.jsp"%>
<!-- 6. 페이지별 script 추가 -->
<!-- footer2.jsp : script -->
<%@ include file="/WEB-INF/footer2.jsp"%>