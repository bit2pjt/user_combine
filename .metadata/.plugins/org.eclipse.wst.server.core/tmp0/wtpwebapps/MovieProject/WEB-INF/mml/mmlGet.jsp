<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<%@ include file="../header1.jsp"%>

<!-- 2. 여기에 페이지별 css 추가해주세요 -->


<!-- 3. heaer2.jsp : header -->
<%@ include file="../header2.jsp" %>
<br>
<br>


<div class="buster-light">
	<!-- blog detail section-->
	<div class="page-single">
		<div class="container">
			<div class="row">

				<div class="blog-detail-ct">
					<div class="flex-it share-tag" style="width: 1258px; float: left;">
						<div class="social-link"">

							<div style="flex: 2;">

								<h1 class="mmlTitle">나영리 제목</h1>

							</div>

							<div style=" flex: 2;">
								<a href="#"><img style="width:65px; height:65px;"
									src="<c:url value="/resources/images/sp_image/add-user.png"/>"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;<span OnClick="location.href ='mmlFollowList.do'"><h4 style="display:inline">Followers</h4><h4 style="display:inline; color: lightcoral" >140 </h4></span>
									<div style="display:inline;">&nbsp;&nbsp;&nbsp;&nbsp;
								<i class="fas fa-heart getheart"></i>&nbsp;<h4 style="display:inline; color: lightcoral" >26 </h4>&nbsp;&nbsp;
									</div>
								<a href="#"><img style="width:45px; height:45px; margin-top:0px;"
									src="<c:url value="/resources/images/sp_image/warning.png"/>"></a>&nbsp;&nbsp;&nbsp;&nbsp;
							</div>

							<div class="right-it" style="flex: 1; vertical-align:middle;">
								<h4><img class="crown" src="<c:url value="/resources/images/sp_image/crown.png"/>">&nbsp;nickname</h4>
								2019.07.04

							</div>

						</div>
					</div>

					<textarea style="width: 1258px; height: 358px; font-size: 20px;">나영리내용</textarea>

					<!-- share link -->
					<a href="movieInfo.html"> <img
						src="<c:url value="/resources/images/sp_image/노트북.jpg"/>" alt=""
						width="185" height="284"></a> <a href="movieInfo.html"> <img
						src="<c:url value="/resources/images/sp_image/타이타닉.jpeg"/>" alt=""
						width="185" height="284"></a> <br>

					<div class="flex-it share-tag" style="width: 1258px; float: left;">
					</div>
					<button class="submit2" type="button" data-toggle="modal"
											data-target="#CatModal-post-delete">삭제</button>
					<button class="submit2" type="button">수정</button>


	<br>
					<h4>04 Comments</h4>
					<br>
					
					<!-- 댓글 시작과 끝에 파랗고 두꺼운 선. -->
					<div class="comments" style="border-width:3px 0px;border-style:solid;border-color:#525EAA;">

				


		</div>
			<!-- comment items -->
					<div class="ws-reply-buffer"></div>
					<!-- 댓글2 -->
					<div class="ws-reply-outer">
						<div class="author-infor">
							<div class="flex-it2">

								<div>
									<!-- 댓글 좌상단의 작성자 정보부분  -->
									<div class="ws-reply-info">
										<a href="#">Steve Perrysssssssss</a> <a class="rep-btn"
											href="#"><i class="fa fa-reply" aria-hidden="true"
											style="color: #FF6F61;"></i>댓글</a> <br> 등록/수정일 : <span
											class="time"> - 19/07/08 13:10</span>
									</div>
									<!-- 댓글 우상단의 댓글 추비추&신고 -->
									<div class="ws-reply-btns">
										<span class="ws-reply-msg" style="color: #ffffff;">중복불허</span>
										<button class="ws-btn-warning">
											<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
								  		</button>
										<button class="ws-btn-thumbs-up">
											<i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 5
										</button>
										<button class="ws-btn-thumbs-down">
											<i class="fa fa-thumbs-o-down" aria-hidden="true"></i> 1
										</button>
									</div>
								</div>
								<!-- 댓글 본문 -->
								<div class="ws-reply-content">
									<p>
										나의 댓글의 경우, 신고 버튼이 없고, 추/비추 대신 수정 삭제 버튼으로 대체 <br>ㅁㅁㅁㅁㅁ
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
										<a href="#">Steve Perry</a> <a class="rep-btn" href="#"><i
											class="fa fa-reply" aria-hidden="true"
											style="color: #FF6F61;"></i>댓글</a> <br> 등록/수정일 : <span
											class="time"> - 19/07/08 13:10</span>
									</div>
									<!-- 우측 버튼들. -->
									<div class="ws-reply-btns">

										<button class="ws-btn-update">
											<i class="fa fa-repeat" aria-hidden="true"></i>
										</button>
										<button class="ws-btn-delete" data-toggle="modal"
											data-target="#CatModal-reply-delete">
											<i class="fa fa-times" aria-hidden="true"></i>
										</button>
									</div>
								</div>
								<!-- 댓글 본문 -->
								<div class="ws-reply-content">
									<p>
										나의 댓글의 경우, 신고 버튼이 없고, 추/비추 대신 수정 삭제 버튼으로 대체 <br> <br>
										<br>asdasd
									</p>
								</div>
								<!-- 댓글 본문의 끝 -->
							</div>
						</div>
					</div>



					<!-- 7. 페이징 : 그대로 따옴 기초 탬플릿의 [ bloglist_ligth.html]  -->
					<ul class="pagination">
						<li class="icon-prev"><a href="#"><i
								class="ion-ios-arrow-left"></i></a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">...</a></li>
						<li><a href="#">21</a></li>
						<li><a href="#">22</a></li>
						<li class="icon-next"><a href="#"><i
								class="ion-ios-arrow-right"></i></a></li>
					</ul>
				</div>
		<!-- 8. 댓글 작성부 -->
					<div class="blog-detail-ct">	
					<div class="comment-form">
						<h4>댓글 남기기</h4>
						
							<div class="row">
								<div class="col-md-12">
									<!-- 댓글 입력창 -->
									<textarea name="message" id="" placeholder="Message" style="height:100%;min-height:80px;"></textarea>
							<br>
							<button class="submit2">등록</button>
							<br>
								</div>
							</div>
					</div>
					</div>
					<!-- comment form -->
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
    location.replace("mmlList.do");
  	}
	function replydel() {
	    location.replace("mmlGet.do");
	  	}
	
	
	
	$(function(){
	    $('.ws-btn-thumbs-up').click(function(){
	       $('.ws-reply-msg').css('color', 'red');
	    	
	    
	    });
	});
	
	
</script>


<%@ include file="../footer.jsp"%>
</body>
</html>