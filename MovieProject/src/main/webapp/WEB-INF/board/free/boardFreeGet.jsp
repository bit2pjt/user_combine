
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 1. header1.jsp : head  -->
<%@ include file="/WEB-INF/header1.jsp"%>
<!-- 2. 여기에 페이지별 css 추가해주세요 -->
	<link rel="stylesheet" href="./resources/css/ws_personal.css?Ver=1.3">
<!-- 3. heaer2.jsp : header -->
<%@ include file="/WEB-INF/header2.jsp" %>

<script>
	/*
	var session = "${sessionyn}";

 	if( session == "") {
 		alert("로그인 하셔야 이용하실수 있습니다.");
 		location.href="index.do";
 	}
 	*/
 	$(function() {
 		var session = "${sessionyn}";
 		var reco = $("#ws-cnt-tup");
 		var deco = $("#ws-cnt-tdn");
 		var warn = ${"#ws-cnt-warning"};
 		var bno = "${boardFreeVO.bf_bno}";
 	
 		reco.on("click", function() {
 		 	if( session == "") {
 		 		alert("로그인 하셔야 이용하실수 있습니다.");
 		 		location.href="index.do";
 		 		return false;
 		 	}
 			$.ajax({
 				url:"boardFreeReco.do",
 				data: {bf_bno: bno, type: 1},
 				dataType: "text",
 				type:"post",
 				success: function(data) {
 					if(data == "fail") {
 						alert("이미 추천/비추천을 누르셨습니다.");
 						return false;
 					}else {
 						reco.html("<i class='fa fa-thumbs-o-up' aria-hidden='true' ></i>  " + data);
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
 		 		location.href="index.do";
 		 		return false;
 		 	}
 			$.ajax({
 				url:"boardFreeReco.do",
 				data: {bf_bno: bno, type: 0},
 				dataType: "text",
 				type:"post",
 				success: function(data) {
 					if(data == "fail") {
 						alert("이미 추천/비추천을 누르셨습니다.");
 						return false;
 					}else {
 						deco.html("<i class='fa fa-thumbs-o-down' aria-hidden='true'></i>  " + data);
 					}
 				},
 				error: function() {
 					alert("에러");
 				}
 			});
 		});
 		
 		warn.on("click", function() {
 		 	if( session == "") {
 		 		alert("로그인 하셔야 이용하실수 있습니다.");
 		 		location.href="index.do";
 		 		return false;
 		 	}
 		 	
 			$.ajax({
 				url:"boardFreeWarn.do",
 				data: {bf_bno: bno, type: 0},
 				dataType: "text",
 				type:"post",
 				success: function(data) {
 					
 				},
 				error: function() {
 					alert("에러");
 				}
 			});
 		});
 		
 	});
</script>

<div class="hero common-hero">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="hero-ct">
					<h1> 자유게시판</h1>
					<ul class="breadcumb">
						<li class="active"><a href="#">커뮤니티</a></li>
						<li> <span class="ion-ios-arrow-right"></span> 자유게시판</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
		
	<div class="buster-light">
		<div class="movie-items">
		<!--  베스트 게시물 슬라이더 : 산만해. 우측 바가 더 깔끔할듯 하다 
			<div class="slider movie-items" style="padding:5px;height:140px;">
				<div class="container">
					<div class="row" style="margin:-40px;">
					<h3 style="top:15px;">베스트 게시물</h3>
						<div  class="slick-multiItemSlider" style="padding:5px;min-width:300px;">
	    					<span><a href="#">여초에서 난리난 고질라 쿠키영상1</a></span>
	    					<span>페북에서 난리난 고질라 쿠키영상2</span>
	    					<span>고질라 쿠키영상3</span>
	    					<span>고질라 쿠키영상4</span>
	    					<span>고질라 쿠키영상5</span>
	    					<span>고질라 쿠키영상6</span>
	    					<span>고질라 쿠키영상7</span>
	    					<span>고질라 쿠키영상8</span>
	    					<span>고질라 쿠키영상9</span>
	    					<span>고질라 쿠키영상10</span>
	    					<span>고질라 쿠키영상11</span>
	    					<span>고질라 쿠키영상12</span>
	    					<span>고질라 쿠키영상13</span>
	    					<span>고질라 쿠키영상14</span>
	    					<span>고질라 쿠키영상15</span>
	    					<span>고질라 쿠키영상16</span>
	    				</div>
	    			</div>
				</div>
			</div>
			-->
<!-- blog detail section-->
<div class="container">
	<div class="col-md-12">
	<!-- 1. 글제목 자리 -->
		<div class="ws-post-get-title" >
			<h4> ${boardFreeVO.bf_title }</h4>
		</div>
		<!-- 글제목 자리 끝 -->
		<!-- 2. 글정보+개인정보의 배치 -->
		<div class="ws-post-get-info">
			<div class="ws-post-get-info-profile">
				<img src="${memberVO.m_image}" alt="프로필사진">
			</div>
			<div class="ws-post-get-info-inner">
				<div>작성자 : ${memberVO.m_nickname}</div>
				<div>작성일자 : <fmt:formatDate value="${boardFreeVO.bf_reg_date}" pattern="yyyy-MM-dd"/></div>
				<div>수정일자 : <fmt:formatDate value="${boardFreeVO.bf_update_date}" pattern="yyyy-MM-dd"/></div>
				<div>조회수 : ${boardFreeVO.bf_view_counter}</div>
				<div>선호장르 : ${memberVO.m_favorite} </div>
			</div>
		</div>
		<!-- 글정보+개인정보의 배치 끝 -->
		<!-- 3. 글본문 자리 -->
		<div class="ws-post-get-content">
			${boardFreeVO.bf_content }
		</div>
			<!-- 글본문 자리의 끝 -->
			<!-- 4. 글신고/글추천/글비추 자리 -->
		<center class="ws-post-get-buttons">
			<div style="float:left">
				<button class="ws-btn-warning" id="ws-cnt-warning"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i>신고 </button>
			</div>
			<span>
				<button class="ws-btn-thumbs-up" id="ws-cnt-tup"><i class="fa fa-thumbs-o-up" aria-hidden="true" ></i> ${boardFreeVO.bf_recommend} </button> 
				<button class="ws-btn-thumbs-down" id="ws-cnt-tdn"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i> ${boardFreeVO.bf_decommend}</button>
			</span>
			<div style="float:right;">
				수정 <button class="ws-btn-update"><i class="fa fa-repeat" aria-hidden="true"></i></button> 
				삭제 <button class="ws-btn-delete" data-toggle="modal" data-target="#CatModal-post-delete"><i class="fa fa-times" aria-hidden="true"></i></button>
			</div>
		</center>
		<span id="ws-content-msg"></span>
		<!-- 글신고/글추천/글비추 배치 끝 -->
		<!-- 5. 댓글 구현부의 시작 -->
	</div>
	
		<div class="ws-get-Rside">
		<div class="ws-side-best" >
			<ul>
				<li >추천수 급상승 Best 10</li>
				<li >감자튀김 사서 갔다가 입뺀 당한 후기[487]</li>
				<li >개지리는 마술[4]</li>
				<li >글제목이 길어서 두툼하게 두 세줄이 되더라도 사이드바 너비는 지금이 적당한거같아</li>
				<li >글제목이 길어서 두툼하게 두 세줄이 되더라도 사이드바 너비는 지금이 적당한거같아</li>
				<li >글제목이 길어서 두툼하게 두 세줄이 되더라도 사이드바 너비는 지금이 적당한거같아</li>
				<li >글제목이 길어서 두툼하게 두 세줄이 되더라도 사이드바 너비는 지금이 적당한거같아</li>
				<li >글제목이 길어서 두툼하게 두 세줄이 되더라도 사이드바 너비는 지금이 적당한거같아</li>
				<li >글제목이 길어서 두툼하게 두 세줄이 되더라도 사이드바 너비는 지금이 적당한거같아</li>
				<li >글제목이 길어서 두툼하게 두 세줄이 되더라도 사이드바 너비는 지금이 적당한거같아</li>
			</ul>	
		</div>
		<div class="ws-get-mmlbest" >
			<div class="ws-get-mmlbest-title">
				김시덕이 님의 가장 핫한 나영리
			</div>
			<div class="ws-get-mmlbest-poster" >
				<img src="https://t1.daumcdn.net/movie/676b7dbf7a2cf721d01efc61708493080d2a9d8e" >
			</div>
			<div class="ws-get-mmlbest-title"> 
				여름 스릴러 추천
				<br>
				누적 추천수 : 48742
			</div>
		</div>
		
		<div class="ws-side-recomend">
			당신이 좋아할 수도 있는 나영리
			<img src="https://t1.daumcdn.net/cfile/tistory/999A89485C3193F72F">
			괴수물 덕후 모여봐라 <br>
			조회수 : 24232
			
		</div>
	</div>
		
		
		
	<div class="col-md-12">
		<br>
		<h4>04 Comments</h4>
		<br>
		<!-- 댓글 시작과 끝에 파랗고 두꺼운 선. -->
		<div class="comments" style="border-width:3px 0px;border-style:solid;border-color:#525EAA;">
			<div class="ws-reply-buffer"></div>	
			<!-- 댓글2 -->
			<div class="ws-reply-outer">
				<div class="author-infor">
					<div class="flex-it2">
						<div>
						<!-- 댓글 좌상단의 작성자 정보부분  -->
							<div class="ws-reply-info" > 
								<a href="#">Steve Perrysssssssss</a>
								<a class="rep-btn" href="#"><i class="fa fa-reply" aria-hidden="true" style="color:#FF6F61;"></i>댓글</a>  
								<span class="ws-best"><strong> BEST !</strong></span>
								<br>
								등록/수정일 : <span class="time"> - 19/07/08 13:10</span> <span>선호장르 : sf</span>
							</div>
							  
							<!-- 댓글 우상단의 댓글 추비추&신고 -->
							<div class="ws-reply-btns">
								<span class="ws-reply-msg"></span>
								<button class="ws-btn-warning" >	<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> 	</button>
								<button class="ws-btn-thumbs-up">	<i class="fa fa-thumbs-o-up" aria-hidden="true" ></i> 5			</button> 
								<button class="ws-btn-thumbs-down">	<i class="fa fa-thumbs-o-down" aria-hidden="true"></i> 1		</button>
							</div>
						</div>
						<!-- 댓글 본문 -->
						<div class="ws-reply-content">
							<p>나의 댓글의 경우, 신고 버튼이 없고, 추/비추 대신 수정 삭제 버튼으로 대체
								<br>ㅁㅁㅁㅁㅁ
							</p>
						</div>
						<!-- 댓글 본문의 끝 -->
					</div>
				</div>
			</div>
			<!-- 나의 댓글인 경우 -->
			<div class="ws-reply-outer">
				<div class="author-infor">
					<div class="flex-it2">
					<!-- 댓글작성자 정보부분 -->	
						<div>
						<!-- 좌측 댓글러 개인정보 -->
							<div class="ws-reply-info"> 
								<a href="#">Steve Perry</a> <a class="rep-btn" href="#"><i class="fa fa-reply" aria-hidden="true" style="color:#FF6F61;"></i>댓글</a> 
								<br>
								 등록/수정일 : <span class="time"> - 19/07/08 13:10</span> <span>선호장르 : sf</span>
							</div>
							<!-- 우측 버튼들. -->
								<div class="ws-reply-btns">
									수정 <button class="ws-btn-update"> <i class="fa fa-repeat" aria-hidden="true"></i></button> 
									삭제 <button class="ws-btn-delete" data-toggle="modal" data-target="#CatModal-reply-delete"><i class="fa fa-times" aria-hidden="true"></i></button>
								</div>
							</div>
							<!-- 댓글 본문 -->
							<div class="ws-reply-content">
								<p>나의 댓글의 경우, 신고 버튼이 없고, 추/비추 대신 수정 삭제 버튼으로 대체
									<br>
									<br>
									<br>asdasd
								</p>
							</div>
							<!-- 댓글 본문의 끝 -->
						</div>
					</div>
				</div>
				<!-- 기본 탬플릿의 대댓글 양식. 일단은 냅뒀다 -->
				<div class="cmt-item flex-it reply">
					<div class="author-infor">
						<div class="flex-it2">
							<h6><a href="#">김시덕이</a></h6> <span class="time"> - 27 Mar 2017</span>
						</div>
						<p>기존 서식의 댓글입니다(대댓글이지만).</p>
					</div>
				</div>
						
						<!-- 7. 페이징 : 그대로 따옴 기초 탬플릿의 [ bloglist_ligth.html]  -->
            	<ul class="pagination">
            		<li class="icon-prev"><a href="#"><i class="ion-ios-arrow-left"></i></a></li>
            		<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">6</a></li>
					<li><a href="#">7</a></li>
					<li class="icon-next"><a href="#"><i class="ion-ios-arrow-right"></i></a></li>
            	</ul>
				</div>		
						<!-- 8. 댓글 작성부 -->
					<div class="blog-detail-ct">	
					<div class="comment-form">
						<h4>댓글 남기기</h4>
						<form action="">
							<div class="row">
								<div class="col-md-12">
									<!-- 댓글 입력창 -->
									<textarea name="message" id="" placeholder="Message" style="height:100%;min-height:80px;"></textarea>
								</div>
							</div>
							<br>
							<input class="submit" type="submit" style="float:right;" value="등록">
						</form>
					</div>
					</div>
					<!-- comment form -->
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
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
       <div class="modal-body">
          <p>게시글을 삭제하시겠습니까?</p>
       </div>
       <div class="modal-footer">
          <button onclick="CatDelete()" type="button" class="btn btn-primary">삭제하기</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
       </div>
      </div>
    </div>
</div>

	<!-- 삭제 모달 : 댓글 -->		
		<div id="CatModal-reply-delete" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">댓글 삭제</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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

<!-- 5. footer1.jsp : footer -->
<%@ include file="/WEB-INF/footer1.jsp" %>


<!-- 6. 페이지별 script 추가 -->

<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript">

	function CatDelete() {
    location.replace("/board/free/boardFreeList.do");
  	}
	function replydel() {
	    location.replace("/board/free/boardFreeList.do");
	  	}
	
</script>

<!-- footer2.jsp : script -->
<%@ include file="/WEB-INF/footer2.jsp"%>

