<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!--
/**
* @Class Name : modal
* @Description : 헤더 수정 및 모달 연습
* @Modification Information
* @
* @  수정일      수정자              수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.02   박현민       최초생성
* @ 2019.07.04   박현민       헤더 푸터 수정
* @ 2019.07.05   qkrgusals
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/
-->
<%@ include file="./header.jsp" %>
<div class="slider movie-items">
		<div class="container">
			<div class="row">
				<!-- yj : start | moviechart slider-->
				<div class="movie-tabs">
					<div class="tabs">
						<ul id="moviechart-ul" class="tab-links tabs-mv">
							<!-- 유진 : 4개의 메뉴를 가운데 정렬 하고싶은데....모르겠다요...우선은 스페이스로 강제로 띄워놓음-->
							&emsp;&emsp;&emsp;
							<li class="active"><a href="#total">통합</a></li>
							<li><a href="#cgv"> CGV</a></li>
							<li><a href="#lottecinema"> 롯데시네마 </a></li>
							<li><a href="#megabox"> 메가박스</a></li>
						</ul>
						<div class="moviechart">
							<!-- yj : start | total tab-->
							<div id="total" class="tab active">
								total chart
								<div class="slick-multiItemSlider">
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											1
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											2
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											3
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											4
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											5
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											6
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											7
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											8
										</div>
									</div>
								</div>
							</div>
							<!-- yj : start | cgv tab-->
							<div id="cgv" class="tab review">
								cgv chart
								<div class="slick-multiItemSlider">
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											1
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											2
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											3
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											4
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											5
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											6
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											7
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											8
										</div>
									</div>
								</div>
							</div>
							<!-- yj : start | lottecinema tab-->
							<div id="lottecinema" class="tab">
								lottecinema chart
								<div class="slick-multiItemSlider">
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											1
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											2
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											3
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											4
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											5
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											6
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											7
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											8
										</div>
									</div>
								</div>
							</div>
							<!-- yj : start | megabox tab-->
							<div id="megabox" class="tab">
								megabox chart
								<div class="slick-multiItemSlider">
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											1
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											2
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											3
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											4
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											5
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											6
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											7
										</div>
									</div>
									<div class="movie-item">
										<div class="mv-img">
											<a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285"
													height="437"></a>
										</div>
										<div class="title-in">
											<h6><a href="#">movie title</a></h6>
											<p><i class="ion-android-star"></i>평점<span>0</span> /10</p>
											<p><i class="ion-android-star"></i>예매율<span>00%</span></p>
										</div>
										<div class="movie-ranking">
											8
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
                    
                </div>
            </div>
        </div>
    </div>
    
    <!-- yj : end | moviechart slider-->
    
<!-- hm : start | left list-->

<div class="row">
    <div id="lr-list">
        <div class="" id="l-list">
            <!-- BASIC TABS COLORED -->
            <ul class="nav nav-tabs nav-tabs-colored" role="tablist">
                <li class="active"><a href="#freeboard" role="tab" data-toggle="tab">자유게시판</a></li>
                <li><a href="#shareboard" role="tab" data-toggle="tab">나눔</a></li>
            </ul>
            <div class="tab-content tab-content-colored">
                <div class="tab-pane fade in active" id="freeboard">
                    <h5>자유게시판</h5>
                    <li><a href="#">자유게시판1</a></li>
                    <li><a href="#">게시글12</a></li>
                    <li><a href="#">게시글13</a></li>
                    <li><a href="#">게시글14</a></li>
                    <li><a href="#">게시글15</a></li>
                </div>
                <div class="tab-pane fade" id="shareboard">
                    <h5>나눔게시판</h5>
                    <li><a href="#">나눔게시판1</a></li>
                    <li><a href="#">게시글12</a></li>
                    <li><a href="#">게시글13</a></li>
                    <li><a href="#">게시글14</a></li>
                    <li><a href="#">게시글15</a></li>
                </div>
            </div>
            <!-- END BASIC TABS COLORED -->
        </div>

        <!-- hm : end | left list-->

        <!-- hm : start | right list-->

        <div class="" id="r-list">
            <!-- BASIC TABS COLORED -->
            <ul class="nav nav-tabs nav-tabs-colored" role="tablist">
                <li class="active"><a href="#notice" role="tab" data-toggle="tab">공지사항</a></li>
            </ul>
            <div class="tab-content tab-content-colored">
                <div class="tab-pane fade in active" id="notice">
                    <h5>공지사항</h5>
                    <li><a href="#">공지사항1</a></li>
                    <li><a href="#">게시글12</a></li>
                    <li><a href="#">게시글13</a></li>
                    <li><a href="#">게시글14</a></li>
                    <li><a href="#">게시글15</a></li>
                </div>

            </div>
            <!-- END BASIC TABS COLORED -->
        </div>
    </div>
</div>

<!-- hm : end | right list-->



                    <!-- modal test-->
    <div class="hero user-hero">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="hero-ct">
                        <h1>모달</h1>
                        <!--  hm |   잠깐 모달 버튼 추가-->
                        <ul class="breadcumb">
                            <li class="btn signupLink" href="#">회원가입 | </a>
                            <li class="btn signupokLink" href="">아이디 찾기 | </a>
                            <li class="btn loginLink" href="">로그인 | </a>
                            <li class="btn idfindLink" href="">아이디찾기 | </a>
                            <li class="btn idokLink" href="">아이디 찾기 확인 | </a>
                            <li class="btn pwfindLink" href="">비밀번호 찾기 | </a>
                            <li class="btn pwokLink" href="">비밀번호 찾기 확인 | </a>
                            <li class="btn idcheckLink" href="">아이디 중복체크 | </a>
                            <li class="btn nikcheckLink" href="">닉네임 중복확인 | </a>
                        </ul>
                        <!--   hm |  여까지 -->
                    </div>
                </div>
            </div>
        </div>
    </div>


    <button onclick="topFunction()" id="hm_myBtn" title="Go to top">Top</button>

<%@ include file="./footer.jsp" %>
</html>