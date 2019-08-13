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

<div class="jq_tabonoff comm_tab1"
	style="width: 1200px; margin: 0 auto; margin-top: 120px;">
	<ul class="jq_tab tab_menu tab-links tabs-mv" style="display:none;">
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
							<strong>CGV -> 전체 입니다.</strong>
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
										<th style="width: 14%">구분</th>
										<th>제목</th>
										<th style="width: 24%">이벤트 기간</th>
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
							<strong>CGV -> 영화</strong>

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
							<strong>CGV -> 3사 이벤트</strong>

						</div>

						<!-- 3 이벤트 리스트 공간 -->
						<div id="contents" style="overflow: hidden;">
							<div id="js-load2" class="main">
								<ul class="lists">

									${movie_3 }
									
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
							<strong>CGV -> 시사회</strong>
						</div>
						<!-- 탭 : 시사회 뷰단 -->
						<div class="table-responsive">

							<table class="class="tabletable-borderedtable-hover">
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>등록일</th>
										<th style="width: 14%;">조회수</th>
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
							<strong>CGV -> 제휴</strong>

						</div>

						<!-- 영화 카드형 리스트 start -->
						<div id="contents" style="overflow: hidden;">
							<div id="js-load2" class="main">
								<ul class="lists">

									<!-- cgv 제휴 이벤트 컨틀롤러에서 가져오는것 -->
									<!-- li 10개 목록 -->
									${cgv_alliance_list } ${cgv_alliance_list2 }




								</ul>
								<div id="js-btn-wrap" class="btn-wrap">
									<a href="javascript:;" class="button">더보기</a>
								</div>
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
							<strong>LotteCinema -> 전체 </strong><br> <br>

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








						<!-- 바탕 : 흰색 -->

						<div class="buster-light">








							<div class="container">

								<div class="row">

									<!-- listTable 배치 시작 -->

									<div style="width: 1500px;">

										<div style="position: relative;">



											<div style="width: 1000px;">

												<div>

													<!-- 1. listTable 배치 -->

													<table
														style="display: relative; top: 50px; margin: 0 auto;">

														<thead>

															<!-- 2. 최초의 행. 열의 종류 구분 -->

															<tr
																style="background-color: #717F9A; color: #ffffff; width: 1100px;">

																<th style="width: 75px; text-align: center;">글번호</th>

																<th style="width: 100px; text-align: center;">카테고리</th>

																<th style="width: 350px; text-align: center;">제목</th>

																<th style="width: 100px; text-align: center;">글쓴이</th>

																<th style="width: 100px; text-align: center;">최근수정일</th>

																<th style="width: 100px; text-align: center;">조회수</th>

															</tr>

														</thead>



														<!-- 향후 core jstl의 foreach로 게시글의 목록이 올 자리다 -->

														<tbody>

															<!-- 3. 공지사항. strong으로 강조를 주며, 게시자의 아이디가 다홍색으로 처리된다. 항상 최상단 노출-->

															<tr style="background-color: #DFE5F5;">

																<td><strong>0026</strong></td>

																<td><strong>공지</strong></td>

																<td><strong>비속어 사용과 음란물 게시시 활동정지 처분합니다.</strong></td>

																<td style="color: #FF6F61;"><strong>admin01</strong></td>

																<td><strong>2011/04/25</strong></td>

																<td><strong>84200</strong></td>

															</tr>

															<tr style="background-color: #DFE5F5;">

																<td><strong>002</strong></td>

																<td><strong>공지</strong></td>

																<td><strong>정치글은 글삭제 대상입니다.</strong></td>

																<td><strong>admin01</strong></td>

																<td><strong>2011/07/25</strong></td>

																<td><strong>16847</strong></td>

															</tr>

															<!--4. 자유게시판 게시글의 나열 시작 -->

															<tr style="background-color: #C3D8F5;">

																<td>0024</td>

																<td>결말해석</td>

																<td>고질라 쿠키영상 무슨뜻인가요?</td>

																<td>가모라</td>

																<td>2009/01/12</td>

																<td>2400</td>

															</tr>

															<tr style="background-color: #C3D8F5;">

																<td>0023</td>

																<td>잡담</td>

																<td>Edinburgh</td>

																<td>22</td>

																<td>2012/03/29</td>

																<td>$433,060</td>

															</tr>

															<tr style="background-color: #C3D8F5;">

																<td>0022</td>

																<td>토론</td>

																<td>Tokyo</td>

																<td>33</td>

																<td>2008/11/28</td>

																<td>$162,700</td>

															</tr>

															<tr style="background-color: #C3D8F5;">

																<td>0020</td>

																<td>잡담해석</td>

																<td>New York</td>

																<td>61</td>

																<td>2012/12/02</td>

																<td>$372,000</td>

															</tr>

															<tr style="background-color: #C3D8F5;">

																<td>0019</td>

																<td>잡담</td>

																<td>San Francisco</td>

																<td>59</td>

																<td>2012/08/06</td>

																<td>$137,500</td>

															</tr>

															<tr style="background-color: #C3D8F5;">

																<td>0017</td>

																<td>유머</td>

																<td>Tokyo</td>

																<td>55</td>

																<td>2010/10/14</td>

																<td>$327,900</td>

															</tr>

															<tr style="background-color: #C3D8F5;">

																<td>0016</td>

																<td>토론</td>

																<td>San Francisco</td>

																<td>39</td>

																<td>2009/09/15</td>

																<td>$205,500</td>

															</tr>

															<tr style="background-color: #C3D8F5;">

																<td>0015</td>

																<td>결말해석</td>

																<td>Edinburgh</td>

																<td>23</td>

																<td>2008/12/13</td>

																<td>$103,600</td>

															</tr>

															<tr style="background-color: #C3D8F5;">

																<td>0014</td>

																<td>결말해석</td>

																<td>London</td>

																<td>30</td>

																<td>2008/12/19</td>

																<td>$90,560</td>

															</tr>

															<tr style="background-color: #C3D8F5;">

																<td>00013</td>

																<td>유머</td>

																<td>Edinburgh</td>

																<td>22</td>

																<td>2013/03/03</td>

																<td>$342,000</td>

															</tr>

															<tr style="background-color: #C3D8F5;">

																<td>00013</td>

																<td>유머</td>

																<td>Edinburgh</td>

																<td>22</td>

																<td>2013/03/03</td>

																<td>$342,000</td>

															</tr>

															<tr style="background-color: #C3D8F5;">

																<td>0014</td>

																<td>결말해석</td>

																<td>London</td>

																<td>30</td>

																<td>2008/12/19</td>

																<td>$90,560</td>

															</tr>

															<tr style="background-color: #C3D8F5;">

																<td>00013</td>

																<td>유머</td>

																<td>Edinburgh</td>

																<td>22</td>

																<td>2013/03/03</td>

																<td>$342,000</td>

															</tr>

															<tr style="background-color: #C3D8F5;">

																<td>00013</td>

																<td>유머</td>

																<td>Edinburgh</td>

																<td>22</td>

																<td>2013/03/03</td>

																<td>$342,000</td>

															</tr>

															<tr style="background-color: #C3D8F5;">

																<td>0014</td>

																<td>결말해석</td>

																<td>London</td>

																<td>30</td>

																<td>2008/12/19</td>

																<td>$90,560</td>

															</tr>

															<tr style="background-color: #C3D8F5;">

																<td>00013</td>

																<td>유머</td>

																<td>Edinburgh</td>

																<td>22</td>

																<td>2013/03/03</td>

																<td>$342,000</td>

															</tr>

															<tr style="background-color: #C3D8F5;">

																<td>00013</td>

																<td>유머</td>

																<td>Edinburgh</td>

																<td>22</td>

																<td>2013/03/03</td>

																<td>$342,000</td>

															</tr>

														</tbody>

													</table>

												</div>

											</div>

										</div>

										<!--TableList의 끝-->



										<!--5. 검색바 구현부 -->

										<div class="form-style-1"
											style="display: -webkit-flex; position: relative; top: 40px; width: 1400px; background-color: #ffffff;">

											<!-- display: -webkit-flex등등... 왜인지 모르게 relative 설정을 누군가 잡아먹는다. 강제로 줄띄기 설정 ㅜ -->






											<select
												style="width: 90px; display: inline-block; border: 2px solid #020d18; color: #2F2F2F;">



												<option value="united">전체</option>

												<option value="saab">결말해석</option>

												<option value="saab">토론</option>

												<option value="saab">유머</option>

												<option value="saab">잡담</option>



											</select> &nbsp;&nbsp; <select
												style="width: 90px; display: inline-block; border: 2px solid #020d18; color: #2F2F2F;">



												<option value="united">제목</option>

												<option value="saab">글쓴이</option>

												<option value="saab">전체</option>



											</select> &nbsp;&nbsp; <span> <input type="text"
												placeholder="원하시는 내용을 입력하세요"
												style="width: 670px; border: 2px solid #020d18; color: #2F2F2F;">

											</span> <span> &nbsp;&nbsp; <input type="button"
												class="submit" value="검색"
												style="background-color: #FF6F61; width: 70px;">

											</span>

										</div>



										<!-- 6. 페이징 : 그대로 따옴 기초 탬플릿의 [ bloglist_ligth.html] -->

										<ul class="pagination" style="width: 1000px;">

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





								</div>

							</div>

						</div>

						<!--list 페이지 구현의 몸통부 끝. 이하 footer 등-->


					</div>
					<!-- 탭2-1// -->

					<!-- //탭2-2 -->
					<div class="cont">

						<div style="margin-top: 40px; margin-bottom: 40px;">
							<strong>LotteCinema -> 영화</strong><br> <br>

						</div>

						<!-- 영화 카드형 리스트 start -->
						<div id="contents" style="overflow: hidden;">
							<div id="js-load2" class="main">
								<ul class="lists">
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>


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
							<strong>LotteCinema -> 3사 이벤트</strong><br> <br>

						</div>

						<!-- 영화 카드형 리스트 start -->
						<div id="contents" style="overflow: hidden;">
							<div id="js-load2" class="main">
								<ul class="lists">
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>


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
							<strong>LotteCinema -> 3사 시사회</strong><br> <br>

						</div>

						<!-- 게시판 형태 -->
						<div class="static-table-list">
							<div class="card mb-3">
								<div class="card-header">
									<h2></h2>


								</div>
								<div class="card-body" style="width: 100%;">
									<div class="table-responsive">
										<table width="900px" cellspacing="0">
											<thead>
												<tr>
													<th style="width: 75px;">글번호</th>
													<th style="width: 100px;">카테고리</th>
													<th style="width: 350px;">글제목</th>
													<th style="width: 100px;">글쓴이</th>
													<th style="width: 100px;">최근수정일</th>
													<th style="width: 100px;">조회수</th>
												</tr>
											</thead>

											<!-- core jstl의 foreach로 게시글의 목록이 올 자리다 -->
											<tbody>
												<tr>
													<td><strong>0026</strong></td>
													<td><strong>공지</strong></td>
													<td><strong>비속어 사용과 음란물 게시시 활동정지 처분합니다.</strong></td>
													<td><strong>admin01</strong></td>
													<td><strong>2011/04/25</strong></td>
													<td><strong>84200</strong></td>
												</tr>
												<tr>
													<td><strong>002</strong></td>
													<td><strong>공지</strong></td>
													<td><strong>정치글은 글삭제 대상입니다.</strong></td>
													<td><strong>admin01</strong></td>
													<td><strong>2011/07/25</strong></td>
													<td><strong>16847</strong></td>
												</tr>
												<tr>
													<td>0024</td>
													<td>결말해석</td>
													<td>고질라 쿠키영상 무슨뜻인가요?</td>
													<td>가모라</td>
													<td>2009/01/12</td>
													<td>2400</td>
												</tr>
												<tr>
													<td>0023</td>
													<td>잡담</td>
													<td>Edinburgh</td>
													<td>22</td>
													<td>2012/03/29</td>
													<td>433,060</td>
												</tr>
												<tr>
													<td>0022</td>
													<td>토론</td>
													<td>Tokyo</td>
													<td>33</td>
													<td>2008/11/28</td>
													<td>162,700</td>
												</tr>
												<tr>
													<td>0020</td>
													<td>잡담해석</td>
													<td>New York</td>
													<td>61</td>
													<td>2012/12/02</td>
													<td>372,000</td>
												</tr>
												<tr>
													<td>0019</td>
													<td>잡담</td>
													<td>San Francisco</td>
													<td>59</td>
													<td>2012/08/06</td>
													<td>137,500</td>
												</tr>
												<tr>
													<td>0017</td>
													<td>유머</td>
													<td>Tokyo</td>
													<td>55</td>
													<td>2010/10/14</td>
													<td>327,900</td>
												</tr>
												<tr>
													<td>0016</td>
													<td>토론</td>
													<td>San Francisco</td>
													<td>39</td>
													<td>2009/09/15</td>
													<td>205,500</td>
												</tr>
												<tr>
													<td>0015</td>
													<td>결말해석</td>
													<td>Edinburgh</td>
													<td>23</td>
													<td>2008/12/13</td>
													<td>103,600</td>
												</tr>
												<tr>
													<td>0014</td>
													<td>결말해석</td>
													<td>London</td>
													<td>30</td>
													<td>2008/12/19</td>
													<td>90,560</td>
												</tr>
												<tr>
													<td>00013</td>
													<td>유머</td>
													<td>Edinburgh</td>
													<td>22</td>
													<td>2013/03/03</td>
													<td>342,000</td>
												</tr>

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
							<strong>LotteCinema -> 3사 제휴</strong><br> <br>

						</div>

						<!-- 영화 카드형 리스트 start -->
						<div id="contents" style="overflow: hidden;">
							<div id="js-load2" class="main">
								<ul class="lists">
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>


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
							<strong>MegaBox -> 전체 </strong><br> <br>

						</div>

						<!-- 게시판 형태 -->
						<div class="static-table-list">
							<div class="card mb-3">
								<div class="card-header">
									<h2></h2>


								</div>
								<div class="card-body" style="width: 100%;">
									<div class="table-responsive">
										<table width="900px" cellspacing="0">
											<thead>
												<tr>
													<th style="width: 75px;">글번호</th>
													<th style="width: 100px;">카테고리</th>
													<th style="width: 350px;">글제목</th>
													<th style="width: 100px;">글쓴이</th>
													<th style="width: 100px;">최근수정일</th>
													<th style="width: 100px;">조회수</th>
												</tr>
											</thead>

											<!-- core jstl의 foreach로 게시글의 목록이 올 자리다 -->
											<tbody>
												<tr>
													<td><strong>0026</strong></td>
													<td><strong>공지</strong></td>
													<td><strong>비속어 사용과 음란물 게시시 활동정지 처분합니다.</strong></td>
													<td><strong>admin01</strong></td>
													<td><strong>2011/04/25</strong></td>
													<td><strong>84200</strong></td>
												</tr>
												<tr>
													<td><strong>002</strong></td>
													<td><strong>공지</strong></td>
													<td><strong>정치글은 글삭제 대상입니다.</strong></td>
													<td><strong>admin01</strong></td>
													<td><strong>2011/07/25</strong></td>
													<td><strong>16847</strong></td>
												</tr>
												<tr>
													<td>0024</td>
													<td>결말해석</td>
													<td>고질라 쿠키영상 무슨뜻인가요?</td>
													<td>가모라</td>
													<td>2009/01/12</td>
													<td>2400</td>
												</tr>
												<tr>
													<td>0023</td>
													<td>잡담</td>
													<td>Edinburgh</td>
													<td>22</td>
													<td>2012/03/29</td>
													<td>433,060</td>
												</tr>
												<tr>
													<td>0022</td>
													<td>토론</td>
													<td>Tokyo</td>
													<td>33</td>
													<td>2008/11/28</td>
													<td>162,700</td>
												</tr>
												<tr>
													<td>0020</td>
													<td>잡담해석</td>
													<td>New York</td>
													<td>61</td>
													<td>2012/12/02</td>
													<td>372,000</td>
												</tr>
												<tr>
													<td>0019</td>
													<td>잡담</td>
													<td>San Francisco</td>
													<td>59</td>
													<td>2012/08/06</td>
													<td>137,500</td>
												</tr>
												<tr>
													<td>0017</td>
													<td>유머</td>
													<td>Tokyo</td>
													<td>55</td>
													<td>2010/10/14</td>
													<td>327,900</td>
												</tr>
												<tr>
													<td>0016</td>
													<td>토론</td>
													<td>San Francisco</td>
													<td>39</td>
													<td>2009/09/15</td>
													<td>205,500</td>
												</tr>
												<tr>
													<td>0015</td>
													<td>결말해석</td>
													<td>Edinburgh</td>
													<td>23</td>
													<td>2008/12/13</td>
													<td>103,600</td>
												</tr>
												<tr>
													<td>0014</td>
													<td>결말해석</td>
													<td>London</td>
													<td>30</td>
													<td>2008/12/19</td>
													<td>90,560</td>
												</tr>
												<tr>
													<td>00013</td>
													<td>유머</td>
													<td>Edinburgh</td>
													<td>22</td>
													<td>2013/03/03</td>
													<td>342,000</td>
												</tr>

											</tbody>
										</table>
									</div>
								</div>

							</div>
						</div>
						<!-- 게시판형태 끗 -->
					</div>
					<!-- 탭3-1// -->

					<!-- //탭3-2 -->
					<div class="cont">
						<div style="margin-top: 40px; margin-bottom: 40px;">
							<strong>MegaBox -> 영화</strong><br> <br>

						</div>

						<!-- 영화 카드형 리스트 start -->
						<div id="contents" style="overflow: hidden;">
							<div id="js-load2" class="main">
								<ul class="lists">
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>


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
							<strong>MegaBox -> 3사 이벤트</strong><br> <br>

						</div>

						<!-- 영화 카드형 리스트 start -->
						<div id="contents" style="overflow: hidden;">
							<div id="js-load2" class="main">
								<ul class="lists">
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>


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
							<strong>MegaBox -> 3사 시사회</strong><br> <br>

						</div>

						<!-- 게시판 형태 -->
						<div class="static-table-list">
							<div class="card mb-3">
								<div class="card-header">
									<h2></h2>


								</div>
								<div class="card-body" style="width: 100%;">
									<div class="table-responsive">
										<table width="900px" cellspacing="0">
											<thead>
												<tr>
													<th style="width: 75px;">글번호</th>
													<th style="width: 100px;">카테고리</th>
													<th style="width: 350px;">글제목</th>
													<th style="width: 100px;">글쓴이</th>
													<th style="width: 100px;">최근수정일</th>
													<th style="width: 100px;">조회수</th>
												</tr>
											</thead>

											<!-- core jstl의 foreach로 게시글의 목록이 올 자리다 -->
											<tbody>
												<tr>
													<td><strong>0026</strong></td>
													<td><strong>공지</strong></td>
													<td><strong>비속어 사용과 음란물 게시시 활동정지 처분합니다.</strong></td>
													<td><strong>admin01</strong></td>
													<td><strong>2011/04/25</strong></td>
													<td><strong>84200</strong></td>
												</tr>
												<tr>
													<td><strong>002</strong></td>
													<td><strong>공지</strong></td>
													<td><strong>정치글은 글삭제 대상입니다.</strong></td>
													<td><strong>admin01</strong></td>
													<td><strong>2011/07/25</strong></td>
													<td><strong>16847</strong></td>
												</tr>
												<tr>
													<td>0024</td>
													<td>결말해석</td>
													<td>고질라 쿠키영상 무슨뜻인가요?</td>
													<td>가모라</td>
													<td>2009/01/12</td>
													<td>2400</td>
												</tr>
												<tr>
													<td>0023</td>
													<td>잡담</td>
													<td>Edinburgh</td>
													<td>22</td>
													<td>2012/03/29</td>
													<td>433,060</td>
												</tr>
												<tr>
													<td>0022</td>
													<td>토론</td>
													<td>Tokyo</td>
													<td>33</td>
													<td>2008/11/28</td>
													<td>162,700</td>
												</tr>
												<tr>
													<td>0020</td>
													<td>잡담해석</td>
													<td>New York</td>
													<td>61</td>
													<td>2012/12/02</td>
													<td>372,000</td>
												</tr>
												<tr>
													<td>0019</td>
													<td>잡담</td>
													<td>San Francisco</td>
													<td>59</td>
													<td>2012/08/06</td>
													<td>137,500</td>
												</tr>
												<tr>
													<td>0017</td>
													<td>유머</td>
													<td>Tokyo</td>
													<td>55</td>
													<td>2010/10/14</td>
													<td>327,900</td>
												</tr>
												<tr>
													<td>0016</td>
													<td>토론</td>
													<td>San Francisco</td>
													<td>39</td>
													<td>2009/09/15</td>
													<td>205,500</td>
												</tr>
												<tr>
													<td>0015</td>
													<td>결말해석</td>
													<td>Edinburgh</td>
													<td>23</td>
													<td>2008/12/13</td>
													<td>103,600</td>
												</tr>
												<tr>
													<td>0014</td>
													<td>결말해석</td>
													<td>London</td>
													<td>30</td>
													<td>2008/12/19</td>
													<td>90,560</td>
												</tr>
												<tr>
													<td>00013</td>
													<td>유머</td>
													<td>Edinburgh</td>
													<td>22</td>
													<td>2013/03/03</td>
													<td>342,000</td>
												</tr>

											</tbody>
										</table>
									</div>
								</div>

							</div>
						</div>
						<!-- 게시판형태 끗 -->
					</div>
					<!-- //탭3-5 -->
					<div class="cont">
						<div style="margin-top: 40px; margin-bottom: 40px;">
							<strong>MegaBox -> 3사 시사회</strong><br> <br>

						</div>

						<!-- 영화 카드형 리스트 start -->
						<div id="contents" style="overflow: hidden;">
							<div id="js-load2" class="main">
								<ul class="lists">
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>
									<li class="lists__item js-load2"><img
										style="width: 240px; height: 200px; border: 1px solid #720a1b;"
										src="./images/.png">
										<p>영화명</p>
										<p>기간 2019.07.03</p></li>


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
