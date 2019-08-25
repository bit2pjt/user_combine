<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
* @ 2019.07.29    한유진      		 영화선택 모달창 작업
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/
-->

<%@ include file="../header1.jsp"%>

<link rel="stylesheet"
	href="<c:url value="/resources/css/mml_write.css" />">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>

<!-- include summernote css/js-->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script src="<c:url value="/resources/js/yj_js.js" />"></script>


<script>
	function check() {
		/* alert('check start!'); */
		//제목과 내용의 앞뒤 공백 제거
		var mml_title = mml_write_form.mml_title.value.trim();
		var mml_content = mml_write_form.mml_content.value.trim();
		
		//타이틀, 컨텐츠가 입력되지 않았을 경우를 체
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

		//var mml_movie_item = document.getElementsByClassName("mml-movie-item");
		
		//첫번째로 등록된 영화의 이미지를 대표 썸네일로 사용
		//var mml_poster=document.getElementsByName("mml_poster");
		//mml_poster[0].setAttribute("value",mml_movie_item[1].children[1].alt );
		document.getElementById('mml_write_form').submit();
		return true;
	}
	function register_back() {
		msg = "나영리 작성을 취소하시겠습니까?";
		if (confirm(msg) != 0) {
			location.href = "mmlList";
		}
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
		$('.modal-backdrop').remove();
		
	}
	function movie_delete(del_num){
		var del_movie = document.getElementById(del_num);
		del_movie.remove();
	}
	$(function(){
		var search_btn = $("#search_btn");
		search_btn.on("click", function(event){
			event.preventDefault();
			/* alert('검색을 시작합니당'); */
			var page=1;
			var perPageNum=10;
			var keyword = $("#keywordInput").val();
			var searchType=$("select option:selected").val();
			$('#movielist_mid').html('');
			$.ajax({
				url:"/movie/mmlWriteMovie",
					data: {page:page, perPageNum:perPageNum, searchType: searchType ,keyword: keyword},
					dataType: "json",
					type:"get",
					/* contentType : 'application/json; charset=UTF-8', */
					success: function(data) {
						if(data != null) {
							$.each(data, function(index, item){
							$('#movielist_mid').html($('#movielist_mid').html()
									+'<div class="movielist-card" onclick="movie_select('+item.mi_code+','+"'"+item.mi_poster+"'"+')">'     //'+item.mi_code+','+"'"+item.mi_poster+"'"+'      data-dismiss="modal"
									+'<img src="'+item.mi_poster+'">'
									+'</div>');
							}); 
								

						}else {
							$('#movielist_mid').html('<br><br>검색 결과가 없습니다.');
						}
					},
					error: function() {
						$('#movielist_mid').html('<br><br>검색 결과가 없습니다.');
					}
			});
		});
	});
	$(".pagination li a").on("click", function (event) {
	    event.preventDefault();
	
	    var targetPage = $(this).attr("href");
	    var listPageForm = $("#listPageForm");
	    listPageForm.find("[name='page']").val(targetPage);
	    listPageForm.attr("action", "movieList").attr("method", "get");
	    listPageForm.submit();
	});
	
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
<div class="buster-light" style="min-height: 1000px; margin-top: 20px;">
	<div class="col-md-10" style="margin-left:10%;">
		<form name="mml_write_form" id="mml_write_form"action="mmlWriteAction" method="post"
			onsubmit="return check()">
			<input type="hidden" name="id" value="${requestScope.id }">
			<!-- <input type="hidden" name="mml_poster" value="0"> -->
			<!-- start | title -->
			<div class="mml-write-title">
				제목<br> <input name="mml_title" class="mml-title"
					placeholder="제목을 입력해주세요" maxlength="50"><span id="counter">0</span><span>/50자</span>
			</div>
			<!-- end | title -->
			<!-- start | content -->
			<div class="mml-write-content">
				<br>내용<br>
				<textarea name="mml_content" id="summernote"
					style="border: 1 solid; width: 100%" placeholder="내용을 입력해주세요"></textarea>
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
												<select class="form-control" name="searchType"
													id="searchType">
													<option value="u"
														<c:out value="${searchCriteria.searchType == null ? 'selected' : ''}"/>>::::::
														선택 ::::::</option>
													<option value="n"
														<c:out value="${searchCriteria.searchType eq 'n' ? 'selected' : ''}"/>>영화제목</option>
													<option value="d"
														<c:out value="${searchCriteria.searchType eq 'd' ? 'selected' : ''}"/>>영화감독</option>
													<option value="a"
														<c:out value="${searchCriteria.searchType eq 'a' ? 'selected' : ''}"/>>영화배우</option>
												</select> <input type="text" class="form-control" name="keyword"
													value="${searchCriteria.keyword}" id="keywordInput"
													placeholder="검색어" width="150px;">
												<button type="button" id="search_btn" style="background-color:black;color:white;">검색</button>
											</div>
										</div>
										<div id="movielist_mid">
											<div>
												<c:forEach items="${movieList}" var="list" varStatus="status">
													<div class="movielist-card" onclick="movie_select(${list.mi_code }, '${list.mi_poster }')"> 
														<img src="${list.mi_poster }">
														<h6 class="movie-title">${list.mi_ktitle }</h6>
													</div>
													<input type="hidden" id="title" value="${list.mi_ktitle}" />
												</c:forEach>
											</div>
										</div>
										<div class="buster-light">
											<div class="movielist-bottom">

												<!-- yj : start | pagination -->
												<!-- 페이징 버튼 연동은 책보고 참고해서 추가하기 -->
												<div class="buster-light">
													<div class="text-center">
														<form id="listPageForm">
															<input type="hidden" name="page"
																value="${pageMaker.criteria.page}"> <input
																type="hidden" name="perPageNum"
																value="${pageMaker.criteria.perPageNum}">
														</form>
														<ul class="pagination pagination-sm no-margin">
															<c:if test="${pageMaker.prev}">
																<li><a href="${pageMaker.startPage - 1}">이전</a></li>
															</c:if>
															<c:forEach begin="${pageMaker.startPage}"
																end="${pageMaker.endPage}" var="idx">
																<li
																	<c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
																	<a href="${idx}">${idx}</a>
																</li>
															</c:forEach>
															<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
																<li><a href="${pageMaker.endPage + 1}">다음</a></li>
															</c:if>
														</ul>
													</div>
												</div>
											</div>
										</div>
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
				</div>
			</div>
			<!-- end | movie list -->
			<!-- start | button -->
			<div class="mml-write-button">
				<input type="button" id="mml_submit" value="등록" onclick="check()"/> 
				<input type="button" value="취소" onclick="register_back()"/>
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