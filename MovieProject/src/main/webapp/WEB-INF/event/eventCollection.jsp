<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="../header1.jsp"%>
<!--[if IE 7]>
<html class="ie ie7 no-js" lang="en-US">
<![endif]-->
<!--[if IE 8]>
<html class="ie ie8 no-js" lang="en-US">
<![endif]-->
<!--[if !(IE 7) | !(IE 8)  ]><!-->
<!-- Basic need -->
<title>이벤트창</title>
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">
<link rel="profile" href="#">

<!--Google Font-->
<link rel="stylesheet"
	href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />
<!-- Mobile specific meta -->
<meta name=viewport content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone-no">

<!-- CSS files -->
<!-- c:url jstl 추가부분  -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/kgh_style.css"/>">
<%@ include file="../header2.jsp"%>
<!-- 제이쿼리  -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
	
</script>
<script>
	// 탭기능 
	// tab menu
	$(function() {
		tab('#tab', 0);
	});

	function tab(e, num) {
		var num = num || 0;
		var menu = $(e).children();
		var con = $(e + '_con').children();
		var select = $(menu).eq(num);
		var i = num;

		select.addClass('on');
		con.eq(num).show();

		menu.click(function() {
			if (select !== null) {
				select.removeClass("on");
				con.eq(i).hide();
			}

			select = $(this);
			i = $(this).index();

			select.addClass('on');
			con.eq(i).show();
		});
	}
	//2번째
	$(document)
			.ready(
					function() {
						//탭(ul) onoff
						$('.jq_tabonoff>.jq_cont').children().css('display',
								'none');
						$('.jq_tabonoff>.jq_cont div:first-child').css(
								'display', 'block');
						$('.jq_tabonoff>.jq_tab li:first-child').addClass('on');
						$('.jq_tabonoff')
								.delegate(
										'.jq_tab>li',
										'click',
										function() {
											var index = $(this).parent()
													.children().index(this);
											$(this).siblings().removeClass();
											$(this).addClass('on');
											$(this).parent().next('.jq_cont')
													.children().hide()
													.eq(index).show();
										});
					});

	// 더보기 제이커리
	$(window).on('load', function() {
		load('#js-load', '10');
		$("#js-btn-wrap .button").on("click", function() {
			load('#js-load', '10', '#js-btn-wrap');
		})
	});

	function load(id, cnt, btn) {
		var girls_list = id + " .js-load:not(.active)";
		var girls_length = $(girls_list).length;
		var girls_total_cnt;
		if (cnt < girls_length) {
			girls_total_cnt = cnt;
		} else {
			girls_total_cnt = girls_length;
			$('.button').hide()
		}
		$(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
	}
	// 영화3사 더보기
	function load2(id, cnt, btn) {
		var girls_list = id + " .js-load:not(.active)";
		var girls_length = $(girls_list).length;
		var girls_total_cnt;
		if (cnt < girls_length) {
			girls_total_cnt = cnt;
		} else {
			girls_total_cnt = girls_length;
			$('.button').hide()
		}
		$(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
	}
</script>

<!-- 이벤트 섹션 시작 -->

<!-- 2번 탭 -->

<div class="hero user-hero" style="z-index: -1;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="hero-ct">
						<h1 style="margin-left: 0px; margin-top: -100px;">이벤트</h1>
						<ul style="margin-left: 0px;" class="breadcumb">
							<li class="active"><a href="index">이벤트 &정보</a></li>
							<li><span class="ion-ios-arrow-right"></span>이벤트</li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</div>
 
<div class="jq_tabonoff comm_tab1"
	style="width: 1200px; margin: 0 auto; margin-top: -145px; ">
	<ul class="jq_tab tab_menu tab-links tabs-mv">
		<li class="active"><a href="javascript:;" class="tit"> CGV</a></li>
		<li><a href="javascript:;" class="tit">LotteCinema</a></li>
		<li><a href="javascript:;" class="tit">MegaBox</a></li>
		<br>

	</ul>


	<div class="jq_cont tab_cont">
		<!-- //탭1 -->
		<div class="cont">
			<div class="jq_tabonoff comm_tab2">
				<ul class="jq_tab tab_menu">
					<li><a href="javascript:;" class="tit">전체</a></li>
					<li><a href="javascript:;" class="tit">영화</a></li>
					<li><a href="javascript:;" class="tit">3사 이벤트</a></li>
					<li><a href="javascript:;" class="tit">시사회</a></li>
					<li><a href="javascript:;" class="tit">제휴</a></li>
					<br>
				</ul>
				<div class="jq_cont tab_cont">
					<!-- //탭1-1 -->
					<!-- CGV->전체 -->
					<div class="cont" style="width: 1200px; margin: 0 auto;">
						<div style="margin-top: 40px; margin-bottom: 40px;">
							<strong>이벤트 & 정보 -> 전체이벤트.</strong>
						</div>


						<!--  

@Class Name : EgovSampleService.java
@Description : EgovSampleService Class
@Modification Information
@
@  수정일
			수정자 				       수정내용

@ ---------   ---------   -------------------------------
@ 2019.07.2     이웅식
			최초 생성
@ 2019.07.4  김광희        listTable 배치 시작 style 변경 위치조정
*

@author BIT 116기 2조
@since 2019. 07.01
@version 1.0
@see
*

Copyright (C) by bit 2조 All right reserved.
/-->
						<!-- CGV 전체 -->
						<div>

							<table style="margin-bottom: 100px;">
								<tbody class="total_event_tbody">
									<tr>
										<th
											style="width: 14%; background-color: #333; color: #fff; text-align: center; border-right: 1px solid gray;">구분</th>
										<th
											style="background-color: #333; color: #fff; text-align: center; border-right: 1px solid gray;">제목</th>
										<th
											style="width: 24%; background-color: #333; color: #fff; text-align: center; border-right: 1px solid gray;">이벤트
											기간</th>
									</tr>
									<!-- eventcontrllor 에서 가져오기 -->
									${total_td } ${total_td2}

									<!-- <tr>
										<td>하이</td>
										<td>하이2</td>
										<td>하이3</td>
									</tr> -->
								</tbody>

							</table>
							<!-- li태그로 만들어보기 -->



						</div>


						<!--list 페이지 구현의 몸통부 끝. 이하 footer 등-->
					</div>
					<!-- 탭1-1// -->

					<!-- //탭1-2 -->
					<div class="cont" style="width: 100%;">
						<div style="margin-top: 40px; margin-bottom: 40px;">
							<strong>이벤트 & 정보 -> 영화이벤트</strong>

						</div>
						<!-- 영화 포스터  -->
						<br>
						<div id="contents" style="overflow: hidden;">
							<div id="js-load" class="main">
								<ul class="lists">
									<!-- CGV 크롤링 -->
									<!-- 이벤트 크롤링 -->
									${img} ${img2}
								</ul>
								<div id="js-btn-wrap" class="btn-wrap">
									<a href="javascript:;" class="button">더보기</a>
								</div>
							</div>
						</div>
					</div>
					<!-- 탭1-2// -->

					<!-- //탭1-3 -->
					<div class="cont">
						<div style="margin-top: 40px; margin-bottom: 40px;">
							<strong>이벤트 & 정보 -> 3사 이벤트</strong>

						</div>

						<!-- 3 이벤트 리스트 공간 -->
						<div id="contents" style="overflow: hidden;">
							<div id="js-load2" class="main">
								<ul class="lists">${movie_3 }

								</ul>
								<div id="js-btn-wrap" class="btn-wrap">
									<a href="javascript:;" class="button">더보기</a>
								</div>
							</div>
						</div>
					</div>
					<!-- 탭1-3// -->

					<!-- //탭1-4 -->
					<div class="cont">
						<div style="margin-top: 40px; margin-bottom: 40px;">
							<strong>이벤트 & 정보 -> 시사회</strong>
						</div>
						<!-- 탭 : 시사회 뷰단 -->
						<div class="table-responsive">

							<table class="class="tabletable-borderedtable-hover">
								<thead>
									<tr>
										<th
											style="background-color: #333; color: #fff; text-align: center; border-right: 1px solid gray;">번호</th>
										<th
											style="background-color: #333; color: #fff; text-align: center; border-right: 1px solid gray;">제목</th>
										<th
											style="width: 14%; background-color: #333; color: #fff; text-align: center; border-right: 1px solid gray;">등록일</th>
										<th
											style="width: 14%; background-color: #333; color: #fff; text-align: center; border-right: 1px solid gray;">조회수</th>
									</tr>
								</thead>
								<tbody>
									<!--시사회 tr 내용물이들어올 곡ㅇ간 -->
									${premiere_tbody_tr }

								</tbody>
							</table>
							<ul class="pagination">
							</ul>
						</div>

					</div>



					<!--탭 1-5 -->
					<div class="cont">
						<div style="margin-top: 40px; margin-bottom: 40px;">
							<strong>이벤트 & 정보 -> 제휴</strong>

						</div>

						<!-- 영화 카드형 리스트 start -->
						<div id="contents" style="overflow: hidden;">
							<div id="js-load2" class="main">
								<ul class="lists">

									<!-- cgv 제휴 이벤트 컨틀롤러에서 가져오는것 -->
									<!-- li 10개 목록 -->

									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19781&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0711/240x200.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
											
											<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19781&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19896&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0801/06__240x200.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19896&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!--  3-->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19923&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0807/CGV_1908_020_w.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19923&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


									<!--  4-->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19326&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0315/1903_040w.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19326&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


									<!-- 5 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19389&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0329/1903_067_wb.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19389&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


									<!-- 6 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19394&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0401/1903_091_w.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19394&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 7 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19185&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0201/240.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19185&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 8 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19190&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0201/1901_133_wb.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19190&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 9 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19215&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0725/240x200.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19215&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 10 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19060&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0102/1812_129_wb.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19060&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


									<!-- 11 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19132&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0121/240_200_1.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19132&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 12 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19133&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0121/240x200_190116.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19133&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 13 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16674&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2017/0829/1708_106_weblist.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16674&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 14 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=17104&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2017/1115/kb_wlist_.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=17104&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


									<!-- 15 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=18739&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2018/1102/1810_120_wb.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=18739&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


									<!-- 16 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16473&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2018/1231/1707_021_wlist.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16473&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 17 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16530&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2017/0728/gs_list.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16530&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 18 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16669&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2017/0828/happy_w_list.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16669&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 19 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=15662&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2018/1206/1702_144_nh_list.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=15662&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 20 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=15755&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2017/0314/[CGV_1703_064]w_b.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=15755&menu=4"
												target="_blank"> <em class="txt-lightblue"
												style="margin-top: 20px;">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


								</ul>
							</div>
						</div>
						<!-- 영화 카드형 리스트 end -->
					</div>
					<!-- 탭1-4// -->
				</div>
			</div>
		</div>
		<!-- 탭1// -->


		<!-- 롯데시네마 -->
		<!-- //탭2 -->
		<div class="cont">

			<div class="jq_tabonoff comm_tab2">
				<ul class="jq_tab tab_menu">
					<li><a href="javascript:;" class="tit">전체</a></li>
					<li><a href="javascript:;" class="tit">영화</a></li>
					<li><a href="javascript:;" class="tit">3사 이벤트</a></li>
					<li><a href="javascript:;" class="tit">시사회</a></li>
					<li><a href="javascript:;" class="tit">제휴</a></li>
					<br>
				</ul>
				<div class="jq_cont tab_cont">
					<!-- //탭2-1 -->
					<div class="cont">
						<div style="margin-top: 40px; margin-bottom: 40px;">
							<strong>이벤트 & 정보 > LotteCinema 전체 </strong><br> <br>

						</div>


						<!--  

@Class Name : EgovSampleService.java
@Description : EgovSampleService Class
@Modification Information
@
@  수정일
			수정자 				       수정내용

@ ---------   ---------   -------------------------------
@ 2019.07.2     이웅식
			최초 생성
@ 2019.07.4  김광희        listTable 배치 시작 style 변경 위치조정
*

@author BIT 116기 2조
@since 2019. 07.01
@version 1.0
@see
*

Copyright (C) by bit 2조 All right reserved.
/-->



						<div>

							<table style="margin-bottom: 100px;">
								<tbody class="total_event_tbody">
									<tr>
										<th
											style="width: 14%; background-color: #333; color: #fff; text-align: center; border-right: 1px solid gray;">구분</th>
										<th
											style="background-color: #333; color: #fff; text-align: center; border-right: 1px solid gray;">제목</th>
										<th
											style="width: 24%; background-color: #333; color: #fff; text-align: center; border-right: 1px solid gray;">이벤트
											기간</th>
									</tr>
									<!-- eventcontrllor 에서 가져오기 -->
									${total_td } ${total_td2}

									<!-- <tr>
										<td>하이</td>
										<td>하이2</td>
										<td>하이3</td>
									</tr> -->
								</tbody>

							</table>
							<!-- li태그로 만들어보기 -->



						</div>




						<!-- 바탕 : 흰색 -->


						<!--list 페이지 구현의 몸통부 끝. 이하 footer 등-->


					</div>
					<!-- 탭2-1// -->

					<!-- //탭2-2 -->
					<div class="cont">

						<div style="margin-top: 40px; margin-bottom: 40px;">
							<strong>이벤트 & 정보 > LotteCinema 영화</strong><br> <br>

						</div>

						<!-- 영화 카드형 리스트 start -->
						<div id="contents" style="overflow: hidden;">
							<div id="js-load2" class="main">
								<ul class="lists">${movie_3 }

								</ul>
								<div id="js-btn-wrap" class="btn-wrap">
									<a href="javascript:;" class="button">더보기</a>
								</div>
							</div>
						</div>
						<!-- 영화 카드형 리스트 end -->
					</div>
					<!-- 탭2-2// -->

					<!-- //탭2-3 -->
					<div class="cont">
						<div style="margin-top: 40px; margin-bottom: 40px;">
							<strong>이벤트 & 정보 > LotteCinema 3사 이벤트</strong><br> <br>

						</div>

						<!-- 영화 카드형 리스트 start -->
						<div id="contents" style="overflow: hidden;">
							<div id="js-load2" class="main">
								<ul class="lists">${movie_3 }

								</ul>
								<div id="js-btn-wrap" class="btn-wrap">
									<a href="javascript:load2();" class="button">더보기</a>
								</div>
							</div>
						</div>
						<!-- 영화 카드형 리스트 end -->
					</div>
					<!-- //탭2-4 -->
					<div class="cont">
						<div style="margin-top: 40px; margin-bottom: 40px;">
							<strong>이벤트 & 정보 > LotteCinema 3사 시사회</strong><br> <br>

						</div>

						<!-- 게시판 형태 -->
						<div class="static-table-list">
							<div class="card mb-3">
								<div class="card-header">
									<h2></h2>


								</div>
								<div class="card-body" style="width: 100%;">
									<div class="table-responsive">
										<table class="class="tabletable-borderedtable-hover">
											<thead>
												<tr>
													<th
														style="background-color: #333; color: #fff; text-align: center; border-right: 1px solid gray;">번호</th>
													<th
														style="background-color: #333; color: #fff; text-align: center; border-right: 1px solid gray;">제목</th>
													<th
														style="width: 14%; background-color: #333; color: #fff; text-align: center; border-right: 1px solid gray;">등록일</th>
													<th
														style="width: 14%; background-color: #333; color: #fff; text-align: center; border-right: 1px solid gray;">조회수</th>
												</tr>
											</thead>
											<tbody>
												<!--시사회 tr 내용물이들어올 곡ㅇ간 -->
												${premiere_tbody_tr }

											</tbody>
										</table>
									</div>
								</div>

							</div>
						</div>
						<!-- 게시판형태 끗 -->
					</div>
					<!-- //탭2-5 -->
					<div class="cont">
						<div style="margin-top: 40px; margin-bottom: 40px;">
							<strong>이벤트 & 정보 > LotteCinema 제휴</strong><br> <br>

						</div>

						<!-- 영화 카드형 리스트 start -->
						<div id="contents" style="overflow: hidden;">
							<div id="js-load2" class="main">
								<ul class="lists">

									<!-- cgv 제휴 이벤트 컨틀롤러에서 가져오는것 -->
									<!-- li 10개 목록 -->

									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19781&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0711/240x200.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19781&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19896&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0801/06__240x200.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19896&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!--  3-->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19923&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0807/CGV_1908_020_w.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19923&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


									<!--  4-->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19326&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0315/1903_040w.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19326&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


									<!-- 5 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19389&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0329/1903_067_wb.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19389&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


									<!-- 6 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19394&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0401/1903_091_w.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19394&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 7 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19185&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0201/240.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19185&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 8 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19190&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0201/1901_133_wb.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19190&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 9 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19215&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0725/240x200.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19215&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 10 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19060&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0102/1812_129_wb.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19060&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


									<!-- 11 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19132&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0121/240_200_1.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19132&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 12 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19133&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0121/240x200_190116.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19133&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 13 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16674&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2017/0829/1708_106_weblist.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16674&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 14 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=17104&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2017/1115/kb_wlist_.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=17104&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


									<!-- 15 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=18739&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2018/1102/1810_120_wb.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=18739&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


									<!-- 16 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16473&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2018/1231/1707_021_wlist.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16473&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 17 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16530&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2017/0728/gs_list.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16530&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 18 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16669&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2017/0828/happy_w_list.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16669&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 19 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=15662&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2018/1206/1702_144_nh_list.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=15662&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 20 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=15755&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2017/0314/[CGV_1703_064]w_b.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=15755&menu=4"
												target="_blank"> <em class="txt-lightblue"
												style="margin-top: 20px;">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


								</ul>

								<div id="js-btn-wrap" class="btn-wrap">
									<a href="javascript:;" class="button">더보기</a>
								</div>
							</div>
						</div>
						<!-- 영화 카드형 리스트 end -->
					</div>
					<!-- 탭2-3// -->
				</div>
			</div>
		</div>
		<!-- 탭2// -->

		<!-- //탭3 -->
		<div class="cont">

			<div class="jq_tabonoff comm_tab2">
				<ul class="jq_tab tab_menu">
					<li><a href="javascript:;" class="tit">전체</a></li>
					<li><a href="javascript:;" class="tit">영화</a></li>
					<li><a href="javascript:;" class="tit">3사 이벤트</a></li>
					<li><a href="javascript:;" class="tit">시사회</a></li>
					<li><a href="javascript:;" class="tit">제휴</a></li>
					<br>
				</ul>
				<div class="jq_cont tab_cont">
					<!-- //탭3-1 -->
					<div class="cont">
						<div style="margin-top: 40px; margin-bottom: 40px;">
							<strong>이벤트 & 정보 > MegaBox 전체 </strong><br> <br>

						</div>
						<div>

							<table style="margin-bottom: 100px;">
								<tbody class="total_event_tbody">
									<tr>
										<th
											style="width: 14%; background-color: #333; color: #fff; text-align: center; border-right: 1px solid gray;">구분</th>
										<th
											style="background-color: #333; color: #fff; text-align: center; border-right: 1px solid gray;">제목</th>
										<th
											style="width: 24%; background-color: #333; color: #fff; text-align: center; border-right: 1px solid gray;">이벤트
											기간</th>
									</tr>
									<!-- eventcontrllor 에서 가져오기 -->
									${total_td } ${total_td2}

									<!-- <tr>
										<td>하이</td>
										<td>하이2</td>
										<td>하이3</td>
									</tr> -->
								</tbody>

							</table>
							<!-- li태그로 만들어보기 -->



						</div>
						<!-- 게시판 형태 -->

						<!-- 게시판형태 끗 -->
					</div>
					<!-- 탭3-1// -->

					<!-- //탭3-2 -->
					<div class="cont">
						<div style="margin-top: 40px; margin-bottom: 40px;">
							<strong>이벤트 & 정보 > MegaBox 영화</strong><br> <br>

						</div>

						<!-- 영화 카드형 리스트 start -->
						<br>
						<div id="contents" style="overflow: hidden;">
							<div id="js-load2" class="main">
								<ul class="lists">${movie_3 }

								</ul>
								<div id="js-btn-wrap" class="btn-wrap">
									<a href="javascript:;" class="button">더보기</a>
								</div>
							</div>
						</div>
						<!-- 영화 카드형 리스트 end -->
					</div>
					<!-- 탭3-2// -->

					<!-- //탭3-3 -->
					<div class="cont">
						<div style="margin-top: 40px; margin-bottom: 40px;">
							<strong>이벤트 & 정보 > MegaBox 3사 이벤트</strong><br> <br>

						</div>

						<!-- 영화 카드형 리스트 start -->
						<div id="contents" style="overflow: hidden;">
							<div id="js-load2" class="main">
								<ul class="lists">${movie_3 }

								</ul>
								<div id="js-btn-wrap" class="btn-wrap">
									<a href="javascript:;" class="button">더보기</a>
								</div>
							</div>
						</div>
						<!-- 영화 카드형 리스트 end -->
					</div>
					<!-- //탭3-4 -->
					<div class="cont">
						<div style="margin-top: 40px; margin-bottom: 40px;">
							<strong>이벤트 & 정보 > MegaBox 3사 시사회</strong><br> <br>

						</div>

						<!-- 게시판 형태 -->
						<div class="table-responsive">

							<table class="class="tabletable-borderedtable-hover">
								<thead>
									<tr>
										<th
											style="background-color: #333; color: #fff; text-align: center; border-right: 1px solid gray;">번호</th>
										<th
											style="background-color: #333; color: #fff; text-align: center; border-right: 1px solid gray;">제목</th>
										<th
											style="width: 14%; background-color: #333; color: #fff; text-align: center; border-right: 1px solid gray;">등록일</th>
										<th
											style="width: 14%; background-color: #333; color: #fff; text-align: center; border-right: 1px solid gray;">조회수</th>
									</tr>
								</thead>
								<tbody>
									<!--시사회 tr 내용물이들어올 곡ㅇ간 -->
									${premiere_tbody_tr }

								</tbody>
							</table>
							<ul class="pagination">
							</ul>
						</div>
						<!-- 게시판형태 끗 -->
					</div>
					<!-- //탭3-5 -->
					<div class="cont">
						<div style="margin-top: 40px; margin-bottom: 40px;">
							<strong>이벤트 & 정보 > MegaBox 3사 시사회</strong><br> <br>

						</div>

						<!-- 영화 카드형 리스트 start -->
						<div id="contents" style="overflow: hidden;">
							<div id="js-load2" class="main">
								<ul class="lists">

									<!-- cgv 제휴 이벤트 컨틀롤러에서 가져오는것 -->
									<!-- li 10개 목록 -->

									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19781&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0711/240x200.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19781&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19896&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0801/06__240x200.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19896&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!--  3-->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19923&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0807/CGV_1908_020_w.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19923&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


									<!--  4-->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19326&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0315/1903_040w.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19326&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


									<!-- 5 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19389&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0329/1903_067_wb.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19389&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


									<!-- 6 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19394&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0401/1903_091_w.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19394&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 7 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19185&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0201/240.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19185&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 8 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19190&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0201/1901_133_wb.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19190&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 9 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19215&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0725/240x200.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19215&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 10 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19060&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0102/1812_129_wb.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19060&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


									<!-- 11 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19132&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0121/240_200_1.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19132&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 12 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19133&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2019/0121/240x200_190116.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=19133&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 13 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16674&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2017/0829/1708_106_weblist.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16674&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 14 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=17104&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2017/1115/kb_wlist_.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=17104&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


									<!-- 15 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=18739&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2018/1102/1810_120_wb.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=18739&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


									<!-- 16 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16473&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2018/1231/1707_021_wlist.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16473&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 17 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16530&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2017/0728/gs_list.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16530&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 18 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16669&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2017/0828/happy_w_list.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16669&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 19 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=15662&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2018/1206/1702_144_nh_list.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=15662&menu=4"
												target="_blank"> <em class="txt-lightblue">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>

									<!-- 20 -->
									<li class="lists__item js-load3">
										<div class="box-image" style="display: block;">
											<a id="tile_2"
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=15755&menu=4"
												target="_blank"><img
												src="http://img.cgv.co.kr/Event/Event/2017/0314/[CGV_1703_064]w_b.jpg"
												alt="스마일페이 결제 시 즉.시.할.인" style="height: 200px;"></a>
										</div>
										<div class="box-contents">
										<br>
											<a
												href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=15755&menu=4"
												target="_blank"> <em class="txt-lightblue"
												style="margin-top: 20px;">멤버십</em> <strong>
													&lt;알라딘&gt; 4DX 첫 100만 관객 돌파 기념 이벤트 <!--알라딘-->
											</strong>
											</a> <em class="date"> <span>기간: </span> 2019.07.29 ~
												2019.08.04
											</em>
										</div>
									</li>


								</ul>
								<div id="js-btn-wrap" class="btn-wrap">
									<a href="javascript:;" class="button">더보기</a>
								</div>
							</div>
						</div>
						<!-- 영화 카드형 리스트 end -->
					</div>
					<!-- 탭3-3// -->
				</div>
			</div>
		</div>
		<!-- 탭3// -->
	</div>
</div>


<!--tabs end-->


<!-- end of footer section-->
<!-- <link rel="stylesheet" href="<c:url value="/resources/js/jquery.js"/>"> -->

<!-- <script src="js/jquery.js"></script>
<script src="js/plugins.js"></script>
<script src="js/plugins2.js"></script>
<script src="js/custom.js"></script> -->

<%@ include file="../footer1.jsp"%>
<!-- 7. footer2.jsp : script -->
<%@ include file="../footer2.jsp"%>
