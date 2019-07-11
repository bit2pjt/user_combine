<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../header.jsp" %>

	<link rel="stylesheet" href="../../resources/css/ws_personal.css">

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
		
		
			<!-- 1. 베스트 게시물을 보여줄 창이다. -->
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
			<!-- 베스트 게시물 슬라이더의 끝 -->
		
		
<!-- blog detail section-->
<div class="container">
<div class="col-md-12">
	
	<!-- 1. 글제목 자리 -->
		<div class="ws-post-get-title">
		<h4> 글제목이 들어올 자리입니다.</h4>
		</div>
		<!-- 글제목 자리 끝 -->
		<!-- 2. 글정보+개인정보의 배치 -->
			<div class="ws-post-get-info">
				<span>
				<img src="../../resources/images/defaultprofile.PNG">
				</span>
				<span>
					<span>작성자 : 김시덕이 </span><br>
					<span>작성일자 : </span><span>19/07/01 13:15</span><br>
					<span>수정일자 :</span><span>19/07/01 15:15</span><br>
					<span>조회수 : </span><span>1258</span><br>
				</span>
			</div>
					<!-- 글정보+개인정보의 배치 끝 -->
					
					<!-- 3. 글본문 자리 -->
				<div class="ws-post-get-content">
						여기는 본문. 최소 높이=200px. 쓰는 만큼 늘어납니다.
				
				</div>
					<!-- 글본문 자리의 끝 -->
					
					<!-- 4. 글신고/글추천/글비추 자리 -->
				<center class="ws-post-get-buttons">
					<div style="float:left">
						<button class="ws-btn-warning"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> </button>
					</div>
						<button class="ws-btn-thumbs-up">  <i class="fa fa-thumbs-o-up" aria-hidden="true" ></i> 5</button> 
						<button class="ws-btn-thumbs-down"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i> 1</button>
					<div style="float:right;">
						<button class="ws-btn-update"><i class="fa fa-repeat" aria-hidden="true"></i></button> 
						
						<button class="ws-btn-delete" data-toggle="modal" data-target="#CatModal-post-delete"><i class="fa fa-times" aria-hidden="true"></i></button>
					</div>
				</center>
			  		<!-- 글신고/글추천/글비추 배치 끝 -->
					
					<!-- 5. 댓글 구현부의 시작 -->
					
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
										<a href="#">Steve Perrysssssssss</a> <a class="rep-btn" href="#"><i class="fa fa-reply" aria-hidden="true" style="color:#FF6F61;"></i>댓글</a>  
										<br>
										 등록/수정일 : <span class="time"> - 19/07/08 13:10</span>
									</div>
									<!-- 댓글 우상단의 댓글 추비추&신고 -->
									<div class="ws-reply-btns">
										<span class="ws-reply-msg" style="color:#ffffff;">중복불허</span>
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
										 등록/수정일 : <span class="time"> - 19/07/08 13:10</span>
									</div>
									<!-- 우측 버튼들. -->
									<div class="ws-reply-btns">
										
										<button class="ws-btn-update"><i class="fa fa-repeat" aria-hidden="true"></i></button> 
										<button class="ws-btn-delete" data-toggle="modal" data-target="#CatModal-reply-delete"><i class="fa fa-times" aria-hidden="true"></i></button>
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
					<li><a href="#">...</a></li>
					<li><a href="#">21</a></li>
					<li><a href="#">22</a></li>
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
							<input class="submit" type="submit" placeholder="submit" style="float:right;">
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
<script type="text/javascript">

	function CatDelete() {
    location.replace("/board/free/list");
  	}
	function replydel() {
	    location.replace("/board/free/list");
	  	}
	
	
	
	$(function(){
	    $('.ws-btn-thumbs-up').click(function(){
	       $('.ws-reply-msg').css('color', 'red');
	    	
	    
	    });
	});
	
	
</script>
<%@include file="../../footer.jsp" %>

