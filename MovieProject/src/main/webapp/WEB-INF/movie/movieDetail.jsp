<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
/**
* @Class Name :  movieDetail.jsp
* @Description : 영화 세부정보
* @Modification Information
* @
* @  수정일      수정자              수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.03     한유진      최초생성
* @ 2019.07.09     한유진      jsp로 변경
*
* @author BIT 116기 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by bit 2조 All right reserved.
*/
-->
<%@ include file="../header.jsp"%>
<head>
	<link rel="stylesheet" href="<c:url value="/resources/css/yj_style.css" />">
</head>
<div class="buster-light">
		<div class="hero mv-single-hero">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<!-- <h1> movie listing - list</h1>
				<ul class="breadcumb">
					<li class="active"><a href="#">Home</a></li>
					<li> <span class="ion-ios-arrow-right"></span> movie listing</li>
				</ul> -->
					</div>
				</div>
			</div>
		</div>
		<div class="page-single movie-single movie-single2 movie_single">
			<div class="container">
				<div class="row ipad-width2">
					<div class="col-md-4 col-sm-5 col-xs-12">
						<div class="movie-img">
							<img src="resources/images/uploads/mv-it1.jpg" alt="" width="261px" height="401px">
						</div>
					</div>
					<div class="col-md-8 col-sm-12 col-xs-12">
						<div class="movie-single-ct main-content">
							<div class="movie-info">
								<h1 class="bd-hd">영화제목 _ 한국어 <span>2015</span></h1>
								<h3>&ensp;&ensp;영화제목 _ 영어</h3><br>
								<table>
									<tr>
										<td width="100px">심의등급 :</td>
										<td><span>심의등급</span></td>
									</tr>
									<tr>
										<td>감독 :</td>
										<td><span>감독</span></td>
									</tr>
									<tr>
										<td>배우 :</td>
										<td><span>배우</span></td>
									</tr>
									<tr>
										<td>장르 :</td>
										<td><span>장르</span></td>
									</tr>
									<tr>
										<td>상영시간 :</td>
										<td><span>상영시간</span></td>
									</tr>
									<tr>
										<td>제작국가 :</td>
										<td><span>제작국가</span></td>
									</tr>
								</table>
							</div>
							<div class="movie-tabs">
								<div class="tabs">
									<ul class="tab-links tabs-mv">
										&nbsp;&nbsp;&nbsp;
										<li class="active"><a href="#story"> 줄거리 </a></li>
										<li><a href="#video">관련영상</a></li>
										<li><a href="#review"> 리뷰 </a></li>
										<li><a href="#3rate"> 3사 평점 </a></li>
										<li><a href="#" class="redbtn">예매 정보</a></li>
									</ul>
								</div>
							</div>


						</div>
					</div>
					<div class="col-sm-12 col-xs-12">
						<div class="movie-single-ct main-content">
							<div class="movie-tabs col-md-12">
								<div class="tabs">
									<center>
									<div class="tab-content">
										<!-- start | 줄거리 -->
										<div id="story" class="tab active">
											<div class="row">
												<div class="story-content">
													줄거리<br>
													줄거리<br>
													줄거리<br>
													줄거리<br>
													줄거리<br>
												</div>
											</div>
										</div>
										<!-- end | 줄거리 -->
										<!-- start | 비디오 -->
										<div id="video" class="tab">
											<div class="row">
												<div class="title-hd-sm">
													<h4>Videos <span>(8)</span></h4>
												</div>
												<div class="mvsingle-item media-item">
												<%
													for(int i=0; i<20; i++){
												%>
													<div class="vd-item">
														<div class="vd-it">
															<img class="vd-img" src="resources/images/uploads/vd-item1.jpg"
																alt="">
															<a class="fancybox-media hvr-grow"
																href="https://www.youtube.com/embed/o-0hcF97wy0"><img
																	src="/resources/images/uploads/play-vd.png" alt=""></a>
														</div>
														<div class="vd-infor">
															<h6> <a href="#">Trailer: Watch New Scenes</a></h6>
															<p class="time"> 1: 31</p>
														</div>
													</div>
												<%
													}
												%>
													
												</div>

											</div>
										</div>
										<!-- end | 비디오 -->
										<!-- start | 리뷰 -->
										
										<div id="review" class="tab review">
												<div class="row">
													<div class="movie-rate">
														<div class="rate">
															<i class="fas fa-star fa-3x"></i>
															<p><span>8.5</span> /10<br>
																<span class="rv">56 Reviews</span>
															</p>
														</div>
														<div class="rate-star" width="600px">
				 											<i class="fas fa-star fa-2x"></i>
															<i class="fas fa-star fa-2x"></i>
															<i class="fas fa-star fa-2x"></i>
															<i class="fas fa-star-half-alt fa-2x"></i>
															<i class="far fa-star fa-2x"></i>
														</div>
													</div>
													
													<hr>
													<div class="review-write col-md-11">
														<div class="review-write-star">
															<fieldset class="rating">
																<input type="radio" id="star5" name="rating"
																	value="10" /><label class="full" for="star5"
																	title="10"></label>
																<input type="radio" id="star4half" name="rating"
																	value="9" /><label class="half" for="star4half"
																	title="9"></label>
																<input type="radio" id="star4" name="rating"
																	value="8" /><label class="full" for="star4"
																	title="8"></label>
																<input type="radio" id="star3half" name="rating"
																	value="7" /><label class="half" for="star3half"
																	title="7"></label>
																<input type="radio" id="star3" name="rating"
																	value="6" /><label class="full" for="star3"
																	title="6"></label>
																<input type="radio" id="star2half" name="rating"
																	value="5" /><label class="half" for="star2half"
																	title="5"></label>
																<input type="radio" id="star2" name="rating"
																	value="4" /><label class="full" for="star2"
																	title="4"></label>
																<input type="radio" id="star1half" name="rating"
																	value="3" /><label class="half" for="star1half"
																	title="3"></label>
																<input type="radio" id="star1" name="rating"
																	value="2" /><label class="full" for="star1"
																	title="2"></label>
																<input type="radio" id="starhalf" name="rating"
																	value="1" /><label class="half" for="starhalf"
																	title="1"></label>
															</fieldset>
														</div>
														<div class="review-write-input">
															<textarea maxlength="150" rows="3"></textarea>
														</div>
														<div class="review-write-button">
																<button class="redbtn">등록</button>
														</div>
														<hr class="mv-user-review-hr">
													</div>
													<!-- start | 사용자 리뷰 -->
													<%
														for(int i=0; i<5; i++){
													%>
													<!-- start | 한개의 리뷰 -->
													<div class="mv-user-review-item">
														<div class="user-info">
															
																<img src="resources/images/uploads/userava1.jpg" alt="">
																<!-- <div class="user-name">사용자이름</div> 

																<div class="user-review-date">작성날짜</div> -->
																<p>사용자 이름</p>
																<p>작성날짜</p>
															
														</div>
														<div class="user-rate movie-rate movie-rate2">
															<i class="fas fa-star fa-1x"></i>
															<i class="fas fa-star fa-1x"></i>
															<i class="fas fa-star fa-1x"></i>
															<i class="fas fa-star-half-alt fa-1x"></i>
															<i class="far fa-star fa-1x"></i>
														</div>
														<div class="user-content">
														<p>아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아</p>
														</div>
														<div class="user-like">
															<div class="notmyreview" >
																<button class="thumbs-up"><img class="far fa-thumbs-up" aria-hidden="true" onclick=""> 100</button>
																<button class="thumbs-down"><img class="far fa-thumbs-down" aria-hidden="true" onclick=""> 10</button>
																<button class="warning"><img src="resources/images/siren.png" width="40px" height="40px"></button>
															</div>
															
															<div class="myreview" hidden>
																	<button><img class="far fa-thumbs-up" aria-hidden="true" onclick="return false;"> 100</button>
																	<button><img class="far fa-thumbs-down" aria-hidden="true" onclick="return false;"> 10</button>
																<a onclick="">수정</a>
																<a onclick="">삭제</a>
															</div>
														</div>
													</div>
													<!-- end | 한개의 리뷰 -->
													<%
														}
													%>
													<!-- end | 사용자 리뷰-->
													<div class="topbar-filter">
														<label>Reviews per page:</label>
														<select>
															<option value="range">5 Reviews</option>
															<option value="saab">10 Reviews</option>
														</select>
														<div class="pagination2">
															<span>Page 1 of 6:</span>
															<a class="active" href="#">1</a>
															<a href="#">2</a>
															<a href="#">3</a>
															<a href="#">4</a>
															<a href="#">5</a>
															<a href="#">6</a>
															<a href="#"><i class="ion-arrow-right-b"></i></a>
														</div>
													</div>
												</div>
											</div>
										<!-- start | 3사 평점-->
										<div id="3rate" class="tab">
											<div class="row">
												<!-- cgv -->
												<div class="total-movie-rate">
													<h1>cgv</h1>
													<div class="total-rate">
															<i class="fas fa-star fa-3x"></i>
															<p><span>8.5</span> /10<br>
																<span class="rv">56 Reviews</span>
															</p>
														</div>
														<div class="total-rate-star" width="600px">
				 											<i class="fas fa-star fa-2x"></i>
															<i class="fas fa-star fa-2x"></i>
															<i class="fas fa-star fa-2x"></i>
															<i class="fas fa-star-half-alt fa-2x"></i>
															<i class="far fa-star fa-2x"></i>
														</div>
												</div>
												<!-- lotte cinema -->
												<div class="total-movie-rate">
													<h1>lottecinema</h1>
													<div class="total-rate">
															<i class="fas fa-star fa-3x"></i>
															<p><span>8.5</span> /10<br>
																<span class="rv">56 Reviews</span>
															</p>
														</div>
														<div class="total-rate-star" width="600px">
				 											<i class="fas fa-star fa-2x"></i>
															<i class="fas fa-star fa-2x"></i>
															<i class="fas fa-star fa-2x"></i>
															<i class="fas fa-star-half-alt fa-2x"></i>
															<i class="far fa-star fa-2x"></i>
														</div>
												</div>
												<!-- megabox -->
												<div class="total-movie-rate">
													<h1>megabox</h1>
													<div class="total-rate">
															<i class="fas fa-star fa-3x"></i>
															<p><span>8.5</span> /10<br>
																<span class="rv">56 Reviews</span>
															</p>
														</div>
														<div class="total-rate-star" width="600px">
				 											<i class="fas fa-star fa-2x"></i>
															<i class="fas fa-star fa-2x"></i>
															<i class="fas fa-star fa-2x"></i>
															<i class="fas fa-star-half-alt fa-2x"></i>
															<i class="far fa-star fa-2x"></i>
														</div>
												</div>
											</div>
										</div>
										<!-- end | 3사 평점-->
									</div>
								</center>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="js/yj_js.js"></script>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<%@ include file="../footer.jsp"%>
