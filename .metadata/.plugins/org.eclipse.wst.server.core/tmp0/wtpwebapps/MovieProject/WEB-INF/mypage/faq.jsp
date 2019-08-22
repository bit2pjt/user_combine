<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--
/**
* @Class Name : faq.jsp
* @Description : FAQ게시판
* @Modification Information
* @
* @  수정일     		     수정자            		수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.06         황진석      		 	최초생성
* @ 2019.07.19 	    박현민				faq 아코디언 기능 생성
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/
-->

<!-- 1. header1.jsp : head  -->
<%@ include file="../header1.jsp"%>

<!-- 2. 여기에 페이지별 css 추가해주세요 -->
<link rel="stylesheet" href="<c:url value="/resources/css/hjs.css" />">

<!-- 3. heaer2.jsp : header -->
<%@ include file="../header2.jsp"%>

<!-- 4. 여기에 페이지별 본문을 추가해주세요 -->

<div class="hero user-hero" >
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="hero-ct" >
						<h1 style="margin-left: 0px; margin-top: -80px;">FAQ</h1>
						<ul style="margin-left: 0px;" class="breadcumb">
							<li class="active"><a href="index">마이페이지</a></li>
							<li><span class="ion-ios-arrow-right"></span>FAQ</li>
						</ul>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
<div class="buster-light">
	<div class="page-single" style="margin-top: 0px;">
		<div class="container" style="margin-top:-180px;">
			<div class="row ipad-width2">
				<div class="col-md-3 col-sm-12 col-xs-12">
					<div class="info">
						<h2>
							<strong>${requestScope.m_name } 님</strong>
						</h2>
						<h3>
							<strong>${sessionScope.m_email }</strong>
						</h3>
					</div>
					<div class="user-information-hjs">
						<div class="user-fav">
							<ul>
								<li style="font-weight: bold;"><a style="font-size: 18px;" href="mypage">마이페이지</a></li>
							</ul>

							<ul style="border-top: 1px solid #ccc; padding-top: 20px;">
								<li>회원 정보</li>
								<li><a href="pw_confirm">&nbsp;&nbsp;&nbsp;&nbsp;회원정보수정</a></li>
								<li><a href="member_out">&nbsp;&nbsp;&nbsp;&nbsp;회원탈퇴</a></li>
							</ul>

							<ul style="border-top: 1px solid #ccc; padding-top: 20px;">
								<li>고객센터</li>
								<li><a href="one_list">&nbsp;&nbsp;&nbsp;&nbsp;1:1
										문의내역</a></li>
								<li><a href="faq">&nbsp;&nbsp;&nbsp;&nbsp;FAQ</a></li>
								<li><a href="myinfo">&nbsp;&nbsp;&nbsp;&nbsp;내가 쓴 게시글</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-9 col-sm-12 col-xs-12">
					<div class="tal_info1">
						<h1>
							<strong>FAQ</strong>
						</h1>
					</div>
					<div class="info_update">
						<p>
							찾으시는 답변이 없으면 <strong>1:1문의</strong>를 이용해 주세요.
						</p>
					</div>
					<br> <br> <br>
					<!-- 			<div class="small_tab">
						<ul class="small_ul">
							<li class="list"><a href="#">자주찾는 FAQ</a></li>
							<li class="list"><a href="#">영화</a></li>
							<li class="list"><a href="#">예매</a></li>
							<li class="list"><a href="#">이벤트</a></li>
							<li class="list1"><a href="#">기타</a></li>

						</ul>
						<hr class="small_hr">

						<ul class="small_tab1">
							<li><span style="margin-left: 10%;">구분</span> <span
								style="margin-left: 40%;">제목</span></li>
							<li><hr class="small_hr1"></li>
							<li>
								<div class="faq_gubun">기타</div>
								<div class="faq_content">
									<a href="#">게시판 글쓰려면 회원가입 해야 하나요?게시판 글쓰려면 회원가입 해야 하나요?게시판
										글쓰려면 회원가입 해야 하나요?</a>
								</div>
							</li>

							<li><hr class="small_hr1"></li>
							<li><span class="faq_gubun">기타</span> <span
								class="faq_content"><a href="#">영화티켓은 나눔게시판에서 나눔할 수
										없나요?</a></span></li>
							<li><hr class="small_hr1"></li>
						</ul>

					</div>  - -->

					<!-- hm |아코디언 기능 테스트 -->
					<section id="hm_content">

						<div id="hm_accordion" class="hm_accordion-container">
							<article class="hm_content-entry">
								<h4 class="hm_article-title">
									<i></i>게시판에 글을 쓰고싶은데 꼭 회원가입이 필요한가요?
								</h4>
								<div class="hm_accordion-content">
									<p>사이트의 모든 게시판 글 작성및 댓글 작성은 회원가입 후 로그인이 필요합니다</p>
								</div>
								<!--/.accordion-content-->
							</article>

							<article class="hm_content-entry">
								<h4 class="hm_article-title">
									<i></i>영화 티켓은 나눔게시판에서 나눔 할 수 없나요?
								</h4>
								<div class="hm_accordion-content">
									<p>영화사 약관에 부합하지 않는 경우 불가능 합니다.</p>
								</div>
								<!--/.accordion-content-->
							</article>
							<article class="hm_content-entry">
								<h4 class="hm_article-title">
									<i></i>회원 탈퇴 후 개인정보 보존기간은 얼마인가요?
								</h4>
								<div class="hm_accordion-content">
									<p>탈퇴 후 30일 까지는 회원님의 개인정보가 보존됩니다. 이는 회원탈퇴의사 철회를 위한
										조치이며, 그 외의 용도로는 개인정보를 수집 및 활용하지 않습니다.
									</p>
								</div>
								<!--/.accordion-content-->
							</article>
							<article class="hm_content-entry">
								<h4 class="hm_article-title">
									<i></i>블록버스터에서 예매를 직접 진행할 수는 없나요?
								</h4>
								<div class="hm_accordion-content">
									<p>블록버스터는 예매관련 정보만을 제공할 뿐, 직접적인 영화예매 서비스 및 수수료 취득행위는
										하지 않습니다.
									</p>
								</div>
								<!--/.accordion-content-->
							</article>
							<article class="hm_content-entry">
								<h4 class="hm_article-title">
									<i></i>악성 이용자에 대한 제재방침을 알려주세요
								</h4>
								<div class="hm_accordion-content">
									<p>신고가 빈번히 접수되는 이용자의 경우, 사전 경고없이 탈퇴처리 되며 해당 이메일은
										블랙리스트에 등록됩니다.<br>
										 한 번 블랙리스트에 등록된 이메일 계정으로는 별도의	사유가 없는 한, 회원가입이 거절됩니다.
									</p>
								</div>
								<!--/.accordion-content-->
							</article>
							<article class="hm_content-entry">
								<h4 class="hm_article-title">
									<i></i>나영리 게시판에는 최대 몇 개의 영화를 등록할 수 있나요?
								</h4>
								<div class="hm_accordion-content">
									<p>나만의 영화 이야기 게시판에서는 하나의 포스팅에 최대 네 개의 영화를 등록할 수 있습니다.</p>
								</div>
								<!--/.accordion-content-->
							</article>
							<article class="hm_content-entry">
								<h4 class="hm_article-title">
									<i></i>1:1 문의 답변을 받기 까지는 평균 어느정도의 기간이 소요되나요?
								</h4>
								<div class="hm_accordion-content">
									<p>1:1 문의의 경우 평균 6~8시간의 기간이 소요됩니다. 다만, 오후 3시를 넘긴 1:1 문의는 대체로 익일 오전중에 답변이 등록됩니다.</p>
								</div>
								<!--/.accordion-content-->
							</article>

						</div>
						<!--/#accordion-->

					</section>
					<!--/#content-->
					<!-- hm | 아코디언 기능 테스트 끝 -->
				</div>
			</div>
		</div>
	</div>
</div>

<div style="width:1920px; height: 80px;">
	
</div>

<!-- 5. footer1.jsp : footer -->
<%@ include file="../footer1.jsp"%>

<!-- 6. 페이지별 script 추가해 주세요. -->
<script>
	$(function() {
		var Accordion = function(el, multiple) {
			this.el = el || {};
			this.multiple = multiple || false;

			var links = this.el.find('.hm_article-title');
			links.on('click', {
				el : this.el,
				multiple : this.multiple
			}, this.dropdown)
		}

		Accordion.prototype.dropdown = function(e) {
			var $el = e.data.el;
			$this = $(this), $next = $this.next();

			$next.slideToggle();
			$this.parent().toggleClass('open');

			if (!e.data.multiple) {
				$el.find('.hm_accordion-content').not($next).slideUp().parent()
						.removeClass('open');
			}
			;
		}
		var accordion = new Accordion($('.hm_accordion-container'), false);
	});
</script>
<!-- 7. footer2.jsp : script -->
<%@ include file="../footer2.jsp"%>