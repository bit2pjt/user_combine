<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
/**
* @Class Name : mmlUpdate.jsp
* @Description : 나영리 글 수정하기
* @Modification Information
* @
* @  수정일     	  수정자            		수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.29    한유진      		 최초생성
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
		var mml_title = mml_update_form.mml_title.value.trim();
		var mml_content = mml_update_form.mml_content.value.trim();

		if (mml_title.length == 0) {
			alert("제목을 입력해주세요.");
			mml_update_form.mml_title.focus();
			return false;
		}
		if (mml_content.length == 0) {
			alert("내용을 입력하세요.");
			mml_update_form.mml_content.focus();
			return false;
		}

		return true;
	}
	function update_back() {
		msg = "나영리 수정을 취소하시겠습니까?";
		if (confirm(msg) != 0) {
			location.href = "mmlGet"+${requestScope.mml_num};
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
		<form name="mml_update_form" action="mmlUpdateAction" method="post" onsubmit="return check()">
			<input type="hidden" name="mml_num" value="${requestScope.mmlContentVO.mml_num }">
			<input type="hidden" name="id" value="${requestScope.mmlContentVO.id }">
			
			<!-- start | title -->
			<div class="mml-write-title">
				제목<br>
				<input name="mml_title" class="mml-title"
						placeholder="제목을 입력해주세요" maxlength="50" value="${requestScope.mmlContentVO.mml_title}" ><span id="counter">0</span><span>/50자</span>
			</div>
			<!-- end | title -->
			<!-- start | content -->
			<div class="mml-write-content">
				<br>내용<br>
				<textarea name="mml_content" id="summernote" style="border:1 solid;width:100%" placeholder="내용을 입력해주세요">${requestScope.mmlContentVO.mml_content}</textarea>
			</div>
			<!-- end | content -->
			<!-- start | movie list -->
			<div class="mml-write-movie">
				<br>영화 리스트<br>
				<div class="mml-movie-body">
				
					<div class="mml-movie-item">
        				<img src="./upload/${requestScope.mmlContentVO.mml_poster}">
					</div>
					
					<div class="mml-movie-item">
        				<img class="add_btn" src="<c:url value='/resources/images/mml_add.png'/>" alt="영화 추가하기"  onclick="openModal()">
					</div>
				</div>
			</div>
			<!-- end | movie list -->
			<!-- start | button -->
			<div class="mml-write-button">
				<input type="submit" value="수정">
				<input type="button" value="취소" onclick="update_back()">
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