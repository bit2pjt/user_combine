<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if IE 7]>
<html class="ie ie7 no-js" lang="en-US">
<![endif]-->
<!--[if IE 8]>
<html class="ie ie8 no-js" lang="en-US">
<![endif]-->
<!--[if !(IE 7) | !(IE 8)  ]><!-->
<html lang="en" class="no-js">
<head>
	<!-- Basic need -->
	<title>이벤트창</title>
	<meta charset="UTF-8">
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="">
	<link rel="profile" href="#">

    <!--Google Font-->
    <link rel="stylesheet" href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />
	<!-- Mobile specific meta -->
	<meta name=viewport content="width=device-width, initial-scale=1">
	<meta name="format-detection" content="telephone-no">

	<!-- CSS files -->
	<!-- c:url jstl 추가부분  -->
	<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/kgh_style.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/plugins.css"/>">
	
	<!-- 제이쿼리  -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
	</script>
	<script>
	// 탭기능 
	// tab menu
	$(function () {	
	tab('#tab',0);	
	});

	function tab(e, num){
    var num = num || 0;
    var menu = $(e).children();
    var con = $(e+'_con').children();
    var select = $(menu).eq(num);
    var i = num;

    select.addClass('on');
    con.eq(num).show();

    menu.click(function(){
        if(select!==null){
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
$(document).ready (function () {
    //탭(ul) onoff
    $('.jq_tabonoff>.jq_cont').children().css('display', 'none');
    $('.jq_tabonoff>.jq_cont div:first-child').css('display', 'block');
    $('.jq_tabonoff>.jq_tab li:first-child').addClass('on');
    $('.jq_tabonoff').delegate('.jq_tab>li', 'click', function() {
        var index = $(this).parent().children().index(this);
        $(this).siblings().removeClass();
        $(this).addClass('on');
        $(this).parent().next('.jq_cont').children().hide().eq(index).show();
    });
});

// 더보기 제이커리
$(window).on('load', function () {
    load('#js-load', '5');
    $("#js-btn-wrap .button").on("click", function () {
        load('#js-load', '5', '#js-btn-wrap');
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



</script>
	
	


</head>
<body>
<!--preloading-->
<div id="preloader">
    <img class="logo" src="images/logo1.png" alt="" width="119" height="58">
    <div id="status">
        <span></span>
        <span></span>
    </div>
</div>
<!--end of preloading-->
<!--login form popup-->
<div class="login-wrapper" id="login-content">
    <div class="login-content">
        <a href="#" class="close">x</a>
        <h3>Login</h3>
        <form method="post" action="login.php">
        	<div class="row">
        		 <label for="username">
                    Username:
                    <input type="text" name="username" id="username" placeholder="Hugh Jackman" pattern="^[a-zA-Z][a-zA-Z0-9-_\.]{8,20}$" required="required" />
                </label>
        	</div>
           
            <div class="row">
            	<label for="password">
                    Password:
                    <input type="password" name="password" id="password" placeholder="******" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required="required" />
                </label>
            </div>
            <div class="row">
            	<div class="remember">
					<div>
						<input type="checkbox" name="remember" value="Remember me"><span>Remember me</span>
					</div>
            		<a href="#">Forget password ?</a>
            	</div>
            </div>
           <div class="row">
           	 <button type="submit">Login</button>
           </div>
        </form>
        <div class="row">
        	<p>Or via social</p>
            <div class="social-btn-2">
            	<a class="fb" href="#"><i class="ion-social-facebook"></i>Facebook</a>
            	<a class="tw" href="#"><i class="ion-social-twitter"></i>twitter</a>
            </div>
        </div>
    </div>
</div>
<!--end of login form popup-->
<!--signup form popup-->
<div class="login-wrapper"  id="signup-content">
    <div class="login-content">
        <a href="#" class="close">x</a>
        <h3>sign up</h3>
        <form method="post" action="signup.php">
            <div class="row">
                 <label for="username-2">
                    Username:
                    <input type="text" name="username" id="username-2" placeholder="Hugh Jackman" pattern="^[a-zA-Z][a-zA-Z0-9-_\.]{8,20}$" required="required" />
                </label>
            </div>
           
            <div class="row">
                <label for="email-2">
                    your email:
                    <input type="password" name="email" id="email-2" placeholder="" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required="required" />
                </label>
            </div>
             <div class="row">
                <label for="password-2">
                    Password:
                    <input type="password" name="password" id="password-2" placeholder="" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required="required" />
                </label>
            </div>
             <div class="row">
                <label for="repassword-2">
                    re-type Password:
                    <input type="password" name="password" id="repassword-2" placeholder="" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required="required" />
                </label>
            </div>
           <div class="row">
             <button type="submit">sign up</button>
           </div>
        </form>
    </div>
</div>
<!--end of signup form popup-->

<!-- BEGIN | Header -->
<header class="ht-header" style="position: relative;">
	<div class="container">
		<nav class="navbar navbar-default navbar-custom">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header logo">
				    <div class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					    <span class="sr-only">Toggle navigation</span>
					    <div id="nav-icon1">
							<span></span>
							<span></span>
							<span></span>
						</div>
				    </div>
				    <a href="index.html"><img class="logo" src="images/logo1.png" alt="" width="119" height="58"></a>
			    </div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse flex-parent" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav flex-child-menu menu-left">
						<li class="hidden">
							<a href="#page-top"></a>
						</li>
						<!-- add : 각 항목의 텍스트 변경-->
						<li class="dropdown first">
								<a class="btn btn-default dropdown-toggle lv1" href="movieTicketing.html">
								예매
								</a>
							</li>
							<li class="dropdown first">
								<a class="btn btn-default dropdown-toggle lv1" data-toggle="dropdown" data-hover="dropdown">
								영화<i class="fa fa-angle-down" aria-hidden="true"></i>
								</a>
								<ul class="dropdown-menu level1">		
									<li><a href="movieChart.html">영화 차트</a></li>
									<li class="it-last"><a href="movieList.html">영화 목록</a></li>
								</ul>
							</li>
							<li class="dropdown first">
								<a class="btn btn-default dropdown-toggle lv1" href="cinemaList.html">
								영화관
								</a>
							</li>
							<li class="dropdown first">
								<a class="btn btn-default dropdown-toggle lv1" href="boardEventCollection.html">
								이벤트&정보
								</a>
							</li>
							<li class="dropdown first">
								<a class="btn btn-default dropdown-toggle lv1" data-toggle="dropdown" data-hover="dropdown">
								커뮤니티<i class="fa fa-angle-down" aria-hidden="true"></i>
								</a>
								<ul class="dropdown-menu level1">
									<li><a href="boardFreeList.html">자유 게시판</a></li>
									<li class="it-last"><a href="boardShreList.html">나눔 게시판</a></li>
								</ul>
							</li>
					</ul>
					<ul class="nav navbar-nav flex-child-menu menu-right">
						<li class="dropdown first">
							<a class="btn btn-default dropdown-toggle lv1" href="mmlList.html">
							나영리
							</a>
						</li>                
						<li><a href="mypage.html">마이페이지</a></li>
						<li class="loginLink"><a href="#">로그인</a></li>
						<li class="btn signupLink"><a href="#">회원가입</a></li>
					</ul>
				</div>
			<!-- /.navbar-collapse -->
	    </nav>
	    
	    
	</div>
</header>
<!-- END | Header -->


<!-- 이벤트 섹션 시작 -->

			<!-- 2번 탭 -->
<section>
	<div class="jq_tabonoff comm_tab1" style="width: 1200px; margin: 0 auto; margin-top: 40px; " >
                <ul class="jq_tab tab_menu tab-links tabs-mv">
                    <ul class="last_event" style="float: right;">
                	<li style="width: 120px;height: 40px; background-color: #333;"><a style="color: #fff;" href="./lastevent.do">지난이벤트</a></li>
                	<!-- <li style="width: 120px;height: 40px; background-color: #333;"><a style="color: #fff;" href="./winner.html">당첨자확인</a></li> -->

                	</ul>
                </ul>
    </div>
    
    <!--지난 이벤트 제목글 -->
    <div class="" style="width: 1200px; margin: 0 auto;">
    	<br>
    	<br>
    	<br>
    	<p style="color: #333; font-weight: bold; font-size: 20px; ">&nbsp;&nbsp; 당첨자 확인 </p>
    	<p style="color: #333; font-weight: bold; font-size: 14px; margin-bottom: 40px;">&nbsp;&nbsp;&nbsp; 당첨자 이벤트 <span style="color: red;">2458건</span> 있습니다.</p>



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

			<div style="width:1500px;">

				<div style="position:relative; ">

					

					<div style="width:1000px;">

					 <div >

						<!-- 1. listTable 배치 -->

						<table style="display:relative;top:100px;">

						 <thead>

							<!-- 2. 최초의 행. 열의 종류 구분 -->

							<tr style="background-color:#717F9A;color:#ffffff;width:1100px;">

							 <th style="width:75px;text-align:center;">글번호</th>

							 <th style="width: 100px;text-align:center;">카테고리</th>

							 <th style="width: 350px;text-align:center;">제목</th>

							 <th style="width: 100px;text-align:center;">글쓴이</th>

							 <th style="width: 100px;text-align:center;">최근수정일</th>

							 <th style="width: 100px;text-align:center;">조회수</th>

							</tr>

						 </thead>

						 

						 <!-- 향후 core jstl의 foreach로 게시글의 목록이 올 자리다 -->

						 <tbody>

						  <!-- 3. 공지사항. strong으로 강조를 주며, 게시자의 아이디가 다홍색으로 처리된다. 항상 최상단 노출-->

							<tr style="background-color:#DFE5F5;">

							 <td><strong>0026</strong></td>

							 <td><strong>공지</strong></td>

							 <td><strong>비속어 사용과 음란물 게시시 활동정지 처분합니다.</strong></td>

							 <td style="color:#FF6F61;"><strong>admin01</strong></td>

							 <td><strong>2011/04/25</strong></td>

							 <td><strong>84200</strong></td>

							</tr>

							<tr style="background-color:#DFE5F5;">

							 <td><strong>002</strong></td>

							 <td><strong>공지</strong></td>

							 <td><strong>정치글은 글삭제 대상입니다.</strong></td>

							 <td><strong>admin01</strong></td>

							 <td><strong>2011/07/25</strong></td>

							 <td><strong>16847</strong></td>

							</tr>

							<!--4. 자유게시판 게시글의 나열 시작 -->

							<tr style="background-color:#C3D8F5;">

							 <td>0024</td>

							 <td>결말해석</td>

							 <td>고질라 쿠키영상 무슨뜻인가요?</td>

							 <td>가모라</td>

							 <td>2009/01/12</td>

							 <td>2400</td>

							</tr>

							<tr style="background-color:#C3D8F5;">

							 <td>0023</td>

							 <td>잡담</td>

							 <td>Edinburgh</td>

							 <td>22</td>

							 <td>2012/03/29</td>

							 <td>$433,060</td>

							</tr>

							<tr style="background-color:#C3D8F5;">

							 <td>0022</td>

							 <td>토론</td>

							 <td>Tokyo</td>

							 <td>33</td>

							 <td>2008/11/28</td>

							 <td>$162,700</td>

							</tr>

							<tr style="background-color:#C3D8F5;">

							 <td>0020</td>

							 <td>잡담해석</td>

							 <td>New York</td>

							 <td>61</td>

							 <td>2012/12/02</td>

							 <td>$372,000</td>

							</tr>

							<tr style="background-color:#C3D8F5;">

							 <td>0019</td>

							 <td>잡담</td>

							 <td>San Francisco</td>

							 <td>59</td>

							 <td>2012/08/06</td>

							 <td>$137,500</td>

							</tr>

							<tr style="background-color:#C3D8F5;">

							 <td>0017</td>

							 <td>유머</td>

							 <td>Tokyo</td>

							 <td>55</td>

							 <td>2010/10/14</td>

							 <td>$327,900</td>

							</tr>

							<tr style="background-color:#C3D8F5;">

							 <td>0016</td>

							 <td>토론</td>

							 <td>San Francisco</td>

							 <td>39</td>

							 <td>2009/09/15</td>

							 <td>$205,500</td>

							</tr>

							<tr style="background-color:#C3D8F5;">

							 <td>0015</td>

							 <td>결말해석</td>

							 <td>Edinburgh</td>

							 <td>23</td>

							 <td>2008/12/13</td>

							 <td>$103,600</td>

							</tr>

							<tr style="background-color:#C3D8F5;">

							 <td>0014</td>

							 <td>결말해석</td>

							 <td>London</td>

							 <td>30</td>

							 <td>2008/12/19</td>

							 <td>$90,560</td>

							</tr>

							<tr style="background-color:#C3D8F5;">

							 <td>00013</td>

							 <td>유머</td>

							 <td>Edinburgh</td>

							 <td>22</td>

							 <td>2013/03/03</td>

							 <td>$342,000</td>

							</tr>

							<tr style="background-color:#C3D8F5;">

							 <td>00013</td>

							 <td>유머</td>

							 <td>Edinburgh</td>

							 <td>22</td>

							 <td>2013/03/03</td>

							 <td>$342,000</td>

							</tr>

							<tr style="background-color:#C3D8F5;">

							 <td>0014</td>

							 <td>결말해석</td>

							 <td>London</td>

							 <td>30</td>

							 <td>2008/12/19</td>

							 <td>$90,560</td>

							</tr>

							<tr style="background-color:#C3D8F5;">

							 <td>00013</td>

							 <td>유머</td>

							 <td>Edinburgh</td>

							 <td>22</td>

							 <td>2013/03/03</td>

							 <td>$342,000</td>

							</tr>

							<tr style="background-color:#C3D8F5;">

							 <td>00013</td>

							 <td>유머</td>

							 <td>Edinburgh</td>

							 <td>22</td>

							 <td>2013/03/03</td>

							 <td>$342,000</td>

							</tr>

							<tr style="background-color:#C3D8F5;">

							 <td>0014</td>

							 <td>결말해석</td>

							 <td>London</td>

							 <td>30</td>

							 <td>2008/12/19</td>

							 <td>$90,560</td>

							</tr>

							<tr style="background-color:#C3D8F5;">

							 <td>00013</td>

							 <td>유머</td>

							 <td>Edinburgh</td>

							 <td>22</td>

							 <td>2013/03/03</td>

							 <td>$342,000</td>

							</tr>

							<tr style="background-color:#C3D8F5;">

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

					<div class="form-style-1" style="display: -webkit-flex; position:relative;top:40px;width:1400px;background-color:#ffffff;" >

					<!-- display: -webkit-flex등등... 왜인지 모르게 relative 설정을 누군가 잡아먹는다. 강제로 줄띄기 설정 ㅜ -->

					


										

					<select style="width:90px;display:inline-block;border: 2px solid #020d18;color:#2F2F2F;">

						

						<option value="united">전체</option>

						<option value="saab">결말해석</option>

						<option value="saab">토론</option>

						<option value="saab">유머</option>

						<option value="saab">잡담</option>

						

					</select>

					&nbsp;&nbsp;

					<select style="width:90px;display:inline-block;border: 2px solid #020d18;color:#2F2F2F;">

						

						<option value="united">제목</option>

						<option value="saab">글쓴이</option>

						<option value="saab">전체</option>

												

					</select>

					

					&nbsp;&nbsp;

					<span>

					<input type="text" placeholder="원하시는 내용을 입력하세요" style="width:670px;border: 2px solid #020d18;color:#2F2F2F;">

					</span>

					<span>

					&nbsp;&nbsp;

					<input type="button" class="submit" value="검색" style="background-color:#FF6F61;width:70px;" >

					</span>

				</div>

				

				<!-- 6. 페이징 : 그대로 따옴 기초 탬플릿의 [ bloglist_ligth.html] -->

      	<ul class="pagination" style="width: 1000px;">

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

			

					

				</div>

			</div>

		</div>


<!--list 페이지 구현의 몸통부 끝. 이하 footer 등-->
    </div>
    <!--지난 이벤트 제목글 끝 -->

</section>
			



        <!--tabs end--> 
<!-- footer section-->
<!-- <footer class="ht-footer">
	<div class="container">
		<div class="flex-parent-ft">
			<div class="flex-child-ft item1">
				 <a href="index.html"><img class="logo" src="images/logo1.png" alt=""></a>
			</div>
			
			<div class="flex-child-ft item2">
				<a href="faq_list.html"><h4>고객센터 </h4></a>
			</div>
			
			<div class="flex-child-ft item3">
				<a href="one_regist.html"><h4>1:1 문의</h4></a>
			</div>

			<div class="flex-child-ft item4">
				<h4></h4>
			</div>
		</div>		
	<div class="ft-copyright">
		<div class="ft-left">
			<p>© 2019 Bit 2 Jo. All Rights Reserved.</p>
		</div>
		<div class="backtotop">
			<p><a href="#" id="back-to-top">맨 위로  <i class="ion-ios-arrow-thin-up"></i></a></p>
		</div>
	</div>
</footer> -->
<!-- end of footer section-->


<!-- end of footer section-->

<!-- <link rel="stylesheet" href="<c:url value="/resources/js/jquery.js"/>"> -->
<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/plugins.js" />"></script>
<script src="<c:url value="/resources/js/plugins2.js" />"></script>
<script src="<c:url value="/resources/js/custom.js" />"></script>

<!-- <script src="js/jquery.js"></script>
<script src="js/plugins.js"></script>
<script src="js/plugins2.js"></script>
<script src="js/custom.js"></script> -->
</body>
</html>
