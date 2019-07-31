<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


	
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
<<<<<<< HEAD
<link rel="stylesheet" href="<c:url value="/resources/css/sp_style.css" />">
=======

<link rel="stylesheet" href="./resources/css/sp_style.css">
<link rel="stylesheet" href="./resources/css/ws_personal.css?Ver=4">

>>>>>>> a94a8023fa5a5843929e830508f93402d459c4a8
<script src="https://kit.fontawesome.com/bb8498b585.js"></script>

<!-- 3. heaer2.jsp : header -->
<%@ include file="/WEB-INF//header2.jsp" %>


<%String email = (String) session.getAttribute("m_email");%>
<input id="ws_email_session" type=hidden value=<c:out value="${m_email}"/>>
<input id="ws_id" type=hidden value=<c:out value="${member.id}"/>>
<input id="ws_mml_content_num" type=hidden value=<c:out value="${mml_content.mml_num}"/>>
<input id="ws_mmlGet_nickname" type=hidden value=<c:out value="${member.m_nickname}"/>>
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
								<h1 class="mmlTitle"><c:out value="${mml_content.mml_title}"/></h1>
							</div>
							<div style=" flex: 2;">
								<a href="#">
									<img class="ws_memberService" id="ws_following" style="width:65px; height:65px;" src="<c:url value="/resources/images/sp_image/add-user.png"/>">
								</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span OnClick="location.href ='mmlFollowList?id=<c:out value="${member.id}"/>'">
									<h4 style="display:inline">Followers</h4>
									<h4 id="ws_follower_set" style="display:inline; color: lightcoral" >
										<!-- 팔로워 수가 들어올 자리지만, 이는 Ajax가 페이지 로딩이 끝난 후 채워준다. 변화가 잦은 영역이기 때문 -->
									</h4>
								</span>
								<div  class="" style="display:inline;">
									&nbsp;&nbsp;&nbsp;&nbsp;
									<i class="fas fa-heart getheart ws_memberService" id="ws_give_like"></i>
									&nbsp;
									<h4 id= "ws_like_set" style="display:inline; color: lightcoral" >
										<!-- 좋아요 수가 들어올 자리지만, 이는 Ajax가 페이지 로딩이 끝난 후 채워준다. 변화가 잦은 영역 -->
									</h4>
									&nbsp;&nbsp;
								</div>
								<a href="#">
									<img class="ws_memberService" id="ws_give_warning" style="width:45px; height:45px; margin-top:0px;" src="<c:url value="/resources/images/sp_image/warning.png"/>">
								</a>
								&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
							<div class="right-it" style="flex: 1; vertical-align:middle;">
								<h4>
									<c:out value="${member.m_nickname}"/>
								</h4>
								<c:set var="level" value="${member.m_level}"/>
									<c:choose>
						    			<c:when test="${level eq 'BRONZE'}">
        									<img class="crown" src="<c:url value="/resources/images/sp_image/helmet.png"/>">
    									</c:when>
										<c:when test="${level eq 'SILVER'}">
        									<img class="crown" src="<c:url value="/resources/images/sp_image/shield.png"/>">
    									</c:when>
										<c:otherwise>
        									<img class="crown" src="<c:url value="/resources/images/sp_image/crown.png"/>">
    									</c:otherwise>
									</c:choose>
								<!-- c:set은 짝짝이 태그 -->
								<fmt:formatDate pattern="yyyy-MM-dd" value=	"${mml_content.mml_write_date}"/>
							</div>
						</div>
					</div>
					
					<textarea style="width: 100%; height: 358px; font-size: 20px;" ><c:out value="${mml_content.mml_view_count}"/>   <c:out value="${mml_content.mml_content}"/></textarea>

					<!-- share link -->
					<a href="/movie/movieDetail?mi_code=<c:out value="${mml_content.mi_code}"/> "> 
						<img src="<c:url value='${mml_content.mml_poster}'/>" alt="" width="185" height="284">
					</a> 
					<a href="#">
						<img src="<c:url value='${mml_content.mml_poster}'/>" alt="" width="185" height="284">
					</a>  
					<br>
					<div class="flex-it share-tag" style="width: 100%; float: left;"></div>
					<button class="submit2" type="button" data-toggle="modal" data-target="#CatModal-post-delete">삭제</button>
					<form action="/movie/mmlUpdate" method="get">			
						<button class="submit2" type="submit">수정</button> <!-- 이름은 맞는데 값은 모두 0&null -->
						<input type="hidden" name="mml_num" value="<c:out value="${mml_content.mml_num}"/>">
						<input type="hidden" name="mml_title" value="<c:out value="${mml_content.mml_title}"/>">
						<input type="hidden" name="mml_content" value="<c:out value="${mml_content.mml_content}"/>">
						<input type="hidden" name="mi_code" value="<c:out value="${mml_content.mi_code}"/>">
					</form>			
					<br>
	 			</div>
	 		</div>
	 	
	 		<div class="row">
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
										등록/수정일 : 
										<span class="time"> - 19/07/08 13:10</span>
										<span>선호장르 : sf</span>
									</div>
							  		<!-- 댓글 우상단의 댓글 추비추&신고 -->
									<div class="ws-reply-btns">
										<span class="ws-reply-msg"></span>
										<button class="ws-btn-warning" >
											<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
										</button>
										<button class="ws-btn-thumbs-up">
											<i class="fa fa-thumbs-o-up" aria-hidden="true" ></i> 5
										</button> 
										<button class="ws-btn-thumbs-down">	
											<i class="fa fa-thumbs-o-down" aria-hidden="true"></i> 1		
										</button>
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
										<a href="#">Steve Perry</a> 
										<a class="rep-btn" href="#">
											<i class="fa fa-reply" aria-hidden="true" style="color:#FF6F61;"></i>댓글
										</a> 
										<br>
								 		등록/수정일 : 
								 		<span class="time"> - 19/07/08 13:10</span>
								 		<span>선호장르 : sf</span>
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
		<form action="/movie/mmlDelete" method="get">
			<button onclick="CatDelete()" type="submit" class="btn btn-primary">삭제하기</button>
       		<input type="hidden" name="mml_num" value="${mml_content.mml_num}"/>
        </form>
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
    
  	}
	function replydel() {
	    location.replace("mmlGet");
	  	}
	
	
	
	$(function(){
	    $('.ws-btn-thumbs-up').click(function(){
	       $('.ws-reply-msg').css('color', 'red');
	    	
	    
	    });
	});
	
	//페이지 로딩시 자동으로 시행되는 구문
	$(document).ready(function(){ 
		console.log('좋아요 수 갱신 시작');
		
		//1. 게시자의 팔로워 수 조회
		countFollower ($('#ws_id').val(), function(result) {
			  $('#ws_follower_set').html(result);
		 });
		
		//2. 게시글의 추천수 조회
		
		
		countLike ($('#ws_mml_content_num').val(), function(result){
			$('#ws_like_set').html(result);
			
		});
			
			
			
	});
	
	
</script>


<%@ include file="../footer.jsp"%>
<script src="<c:url value="/resources/js/memberService.js" />"></script>
</html>