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
	


    <img class="logo" src="/resources/images/logo1.png" alt="" width="119" height="58">
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
				    <a href="index.html"><img class="logo" src="/resources/images/logo1.png" alt="" width="119" height="58"></a>
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

<!-- Start | Section -->
<section class="section">
<!-- 지역 영화관 선택 -->	
<form class="cinema_select" name="frm1" >
<select name="gd_code" size="3" onChange="redirect(this.selectedIndex);">
<option value="1">CGV</option>
<option value="2">롯데시네마</option>
<option value="3">메가박스</option>
</select>

<select name="gp_color" size="8" onChange="redirect1(this.selectedIndex);">
</select>

<select name="gp_face" size="8" onChange = "redirect2(this.selectedIndex);">
</select>

<select name="gp_quantity" size="8">
</select>
</form>

<!-- 영화관 정보 시작 -->
<div class="cinema_info" style="">
	<div class="cinema_info_text">
		<span>CGV</span><span>서울 영화관1호</span><br>
		<span>인천광역시 중구 운서동 3088-3 예스타워 영종 7층</span><br>
		<a href="./www.naver.com">홈페이지 이동</a><span>02-444-4444</span><span>|</span><span>상영관 수</span><span>전체 좌석</span>
		<p style="float: right; background-color: #333; color: #fff; width: 120px;line-height: 80px; padding: 10px; margin-top: 30px; text-align: center; vertical-align: middle;">예매정보</p>
	</div>
	<div class="cinema_info_map">
		<img src="./images/.png">지도
	</div>
	
</div>

<!-- 영화관 정보 끝 -->


<!-- 극장 정보 탭  시작 -->
<div class="cinema_tab">
	<div class="tab-wrap">
    <ul>
        <li><a href="#tab1">tab1</a></li>
        <li><a href="#tab2">tab2</a></li>
    </ul>

    <div>
        <article id="tab1">
            <h1>극장정보</h1>
            <div class="cinema_traffic">
            	<div class="cinema_traffic_info" style="">
            		<!-- 교통 / 주차 정보 데이터 -->
            		<p>- 교통편</p>
            		<p style="width: 1200px; height: 300px; border: 1px solid:#333;">교통편 설명</p>
            		<p>- 주차</p>
            		<p style="width: 1200px; height: 300px; border: 1px solid:#333;">교통편 설명</p>
            	</div>
            </div>

        </article>
        <article id="tab2">
            <h1>리뷰</h1>
           	<div class="cinema_review">
           		<div class="cinema_review_table">
           			<p>영화 리스트 넣으면됨~</p>
           		</div>
           	</div>
        </article>
    </div>
</div>
</div>
<!-- 극장 정보 탭  끝 -->

</section>

<!-- END | Section -->



        <!--tabs end--> 
<!-- footer section-->
<footer class="ht-footer">
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



        <!--tabs end--> 
<!-- footer section-->

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
