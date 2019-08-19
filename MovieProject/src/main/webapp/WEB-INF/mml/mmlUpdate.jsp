<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--
/**
* @Class Name : mmlUpdate.jsp
* @Description : 나영리 글 수정하기
* @Modification Information
* @
* @  수정일     	  수정자            		수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.29    한유진      		 최초생성
* @ 2019.08.01    한유진      		 모달추가
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
		
		//var mml_movie_item = document.getElementsByClassName("mml-movie-item");
		
		//첫번째로 등록된 영화의 이미지를 대표 썸네일로 사용
		//var mml_poster=document.getElementsByName("mml_poster");
		//mml_poster[0].setAttribute("value",mml_movie_item[1].children[1].alt );

		return true;
	}
	function update_back() {
		msg = "나영리 수정을 취소하시겠습니까?";
		if (confirm(msg) != 0) {
			location.href = "mmlGet?mml_num="+${requestScope.mmlContentVO.mml_num};
		}
	}
	function openModal(){
		alert('모달 뿅!');
	}
	function movie_select(mi_code,mi_poster){
		var mml_body = document.getElementsByClassName("mml-movie-body");
		mml_body[0].innerHTML = 
			mml_body[0].innerHTML
			+"<div class='mml-movie-item' id='"+mi_code+"'>"
			+"<input type='hidden' name='mi_code' value='"+ mi_code +"'>"
			+ "<img src='" +mi_poster + "' alt='"+mi_poster+"'>"
			+"<input type='hidden' name='mml_poster' value='"+ mi_poster +"'>"
			+"<img src='resources/images/mml_add.png' onclick='movie_delete("+mi_code+")' name='delete_movie' style='width:40px;height:40px;position:absolute;left:127px;top:-20px;transform: rotate(45deg);background: white; border-radius: 50%;'>"
			+"</div>";
		var modal = document.getElementById("movie-modal");
		modal.style.display="none";
	}
	function movie_delete(del_num){
		var del_movie = document.getElementById(del_num);
		del_movie.remove();
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
<div class="buster-light" style="min-height: 1000px;margin-top: 20px;">
	<div class="col-md-10" style="margin-left:10%;">
		<form name="mml_update_form" action="mmlUpdateAction" method="post" onsubmit="return check()">

			<input type="hidden" name="mml_num" value="${requestScope.mmlContentVO.mml_num }">
			<input type="hidden" name="id" value="${requestScope.mmlContentVO.id }">
			<%-- <input type="hidden" name="mml_poster" value="${requestScope.mmlContentVO.mml_poster }"> --%>
			
			<!-- start | title -->
			<div class="mml-write-title">
				제목<br> <input name="mml_title" class="mml-title"
					placeholder="제목을 입력해주세요" maxlength="50" value="${requestScope.mmlContentVO.mml_title }"><span id="counter">0</span><span>/50자</span>
			</div>
			<!-- end | title -->
			<!-- start | content -->
			<div class="mml-write-content">
				<br>내용<br>
				<textarea name="mml_content" id="summernote"
					style="border: 1 solid; width: 100%" placeholder="내용을 입력해주세요">${requestScope.mmlContentVO.mml_content }</textarea>
			</div>
			<!-- end | content -->
			<!-- start | movie list -->
			<div class="mml-write-movie">
				<br>영화 리스트<br>
				<div class="mml-movie-body">
					<div class="mml-movie-item">
						<img class="addbtn"
							src="<c:url value='/resources/images/mml_add.png'/>"
							alt="영화 추가하기" data-target="#movie-modal" data-toggle="modal"
							data-backdrop="static">
						<!-- start | modal -->
						<%-- <jsp:include page="mmlWriteModal.jsp"/> --%>
						<div class="modal fade" id="movie-modal" role="dialog">
							<div class="modal-dialog" style="margin-top: 100px;">
								<div class="modal-content">
									<!-- start | modal-header -->
									<div class="modal-header">
										<h4 class="modal-title">영화 선택</h4>
									</div>
									<!-- end | modal-header -->
									<!-- start | modal-body -->
									<div class="modal-body">

										<div class="form-group">
											<div class="movielist-top">
											
												<select id="mcategory">
													<option value="영화 제목" selected="selected">영화 제목</option>
													<option value="개봉 연도">개봉 연도</option>
													<option value="제작 국가">제작 국가</option>
													<option value="영화 감독">영화 감독</option>
													<option value="영화 배우">영화 배우</option>
												</select> 
												<input type="text" id="search_input" placeholder="검색어를 입력해주세요">
												<button id="search_btn">검색</button>
												 <!-- <a id="search_btn">검색</a>  -->
											
											</div>
										</div>
										<c:forEach var="movie" items="${requestScope.movieList }"
											end="5">
											<div class="movielist-card"
												onclick="movie_select(${movie.mi_code},'${movie.mi_poster}')"
												data-dismiss="modal">
												<img src="${movie.mi_poster}">
												<div class="movie-info">
													<h4 class="movie-ktitle">${movie.mi_ktitle}</h4>
													<h6 class="movie-etitle">${movie.mi_etitle}</h6>
													개봉년도 :
													<c:out value="${fn:substring(movie.mi_releaseday,24,28) }"></c:out>
													<br> 제작국가 :
													<c:out value="${movie.mi_ccode }"></c:out>
													<br> 감독 :
													<c:out value="${movie.mi_director }"></c:out>
													<br> 배우 :
													<c:out value="${movie.mi_actor }"></c:out>
													<br>

												</div>
											</div>
										</c:forEach>
									</div>
									<!-- end | modal-body -->
									<!-- start | modal-footer -->
									<div class="modal-footer">
										<button type="button" id='btn-hjs'
											class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
									</div>
									<!-- end | modal-footer -->
								</div>
							</div>
						</div>
						<!-- end | modal -->
					</div>
					
					<!-- start | 기존에 등록되었던 영화리스트를 뿌려줄 부분 -->
					<%-- <c:set var="mi_code" value="${fn:split(requestScope.movieList.mi_code,',')}" />
					<c:set var="mml_poster" value="${fn:split(requestScope.movieList.mml_poster,',')}" />
					<c:forEach var="result" items="${mi_code}" varStatus="status">
						<div class='mml-movie-item'>
							<input type='hidden' name='mi_code' value='<c:out value="${result }"></c:out>'>
							<img src='./upload/poster/' alt=''>
							<input type='hidden' name='mml_poster' value='${mml_poster[0]}'>
						</div>
					</c:forEach> --%>
					<c:set var="mml_poster" value="${fn:split(requestScope.mmlContentVO.mml_poster,',')}" />
					<c:forTokens items="${requestScope.mmlContentVO.mi_code }" delims="," var="mi_code" varStatus="i">
    					<div class='mml-movie-item' id='${mi_code }'>
							<input type='hidden' name='mi_code' value='${mi_code }'>
							<img src='${mml_poster[i.index]}' alt='${mml_poster[i.index]}'>
							<input type='hidden' name='mml_poster' value='${mml_poster[i.index]}'>
							<img src='resources/images/mml_add.png' onclick='movie_delete(${mi_code })' name='delete_movie' style='width:40px;height:40px;position:absolute;left:127px;top:-20px;transform: rotate(45deg);background: white; border-radius: 50%;'>
						</div>
					</c:forTokens>
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