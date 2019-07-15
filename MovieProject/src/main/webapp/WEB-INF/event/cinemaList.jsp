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

	<script type="text/javascript">
/**
* @Class Name : EgovSampleService.java
* @Description : EgovSampleService Class
* @Modification Information
* @
* @  수정일      수정자              수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.08   김광희      4단 영화관 지역선택
*
* @author BIT 116기 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by bit 2조 All right reserved.
*/



		/*두번째셀렉트박스*/
var groups = document.frm1.gd_code.options.length
var group=new Array(groups)

for (i=0; i<groups; i++){
group[i] = new Array()
}

group[0][0] = new Option("CGV_빨강", "CGV_빨강");
group[0][1] = new Option("CGV_노랑", "CGV_노랑");
group[1][0] = new Option("LotteCinema_주황", "LotteCinema_주황");
group[1][1] = new Option("LotteCinema_검정", "LotteCinema_검정");
group[2][0] = new Option("MegaBox_파랑", "MegaBox_파랑");
group[2][1] = new Option("MegaBox_보라", "MegaBox_보라");

 

 

var temp=document.frm1.gp_color
function redirect(x){
 for(m=temp.options.length-1;m>0;m--) //옵션이 생성되어 있으면 일단 그놈들을 없앤다.
 temp.options[m]=null
 for(i=0;i<group[x].length;i++)   //gd_code에 선택되어 있는 애들의 갯수만큼 루프를 돌면서 옵션을 만든다..
 {
  temp.options[i]=new Option(group[x][i].text,group[x][i].value)
 }
 temp.options[0].selected=true
 redirect1(0);
}


/*세번째셀렉트박스*/
var secondGroups=document.frm1.gp_color.options.length
var secondGroup=new Array() //secondGroup이라는 개체를 만들지..
for (i=0; i<groups; i++)  { //gd_code의 옵션 갯수만큼 루프돌면서 secondGroup[0]..등을 배열로 생성.
secondGroup[i]=new Array()
for (j=0; j<group[i].length; j++)  { //group의 총갯수(여기서는 6개)만큼 루프를 돌면서 secondGroup[0][0]..등의 배열을 생성..
secondGroup[i][j]=new Array()  }

}


secondGroup[0][0][0] = new Option("CGV_빨강_단면", "CGV_빨강_단면");
secondGroup[0][0][1] = new Option("CGV_빨강_양면", "CGV_빨강_양면");
secondGroup[0][1][0] = new Option("CGV_노랑_단면", "CGV_노랑_단면");
secondGroup[0][1][1] = new Option("CGV_노랑_양면", "CGV_노랑_양면");
secondGroup[1][0][0] = new Option("LotteCinema_주뢍_단면", "LotteCinema_주뢍_단면");
secondGroup[1][0][1] = new Option("LotteCinema_주뢍_양면", "LotteCinema_주뢍_양면");
secondGroup[1][1][0] = new Option("LotteCinema_검정_단면", "LotteCinema_검정_단면");
secondGroup[1][1][1] = new Option("LotteCinema_검정_양면", "LotteCinema_검정_양면");
secondGroup[2][0][0] = new Option("MegaBox_파랑_단면", "MegaBox_파랑_단면");
secondGroup[2][0][1] = new Option("MegaBox_파랑_양면", "MegaBox_파랑_양면");
secondGroup[2][1][0] = new Option("MegaBox_보라_단면", "MegaBox_보라_단면");
secondGroup[2][1][1] = new Option("MegaBox_보라_양면", "MegaBox_보라_양면");

 

var temp1=document.frm1.gp_face
function redirect1(z){
for (m=temp1.options.length-1;m>0;m--) //세번째 셀렉트박스에 옵션이 만들어져 있으면 그놈들을 없앤다.
temp1.options[m]=null
for (i=0;i<secondGroup[document.frm1.gd_code.options.selectedIndex][z].length;i++){
temp1.options[i]=new Option(secondGroup[document.frm1.gd_code.options.selectedIndex][z][i].text,secondGroup[document.frm1.gd_code.options.selectedIndex][z][i].value)
}
temp1.options[0].selected=true
redirect2(0)
}

/*네번째 셀렉트박스.. 제발되라.. ㅠㅠ*/
var thirdGroups = document.frm1.gp_face.options.length
var thirdGroup = new Array()
for (i=0; i<groups; i++){
thirdGroup[i] = new Array()
//alert("i : " + i );

 for (j=0; j<group[i].length; j++){
//  alert("j : " + j );
  thirdGroup[i][j] = new Array()
  for (k=0; k<secondGroup[i][j].length; k++){
//  alert("k : " + k );
   thirdGroup[i][j][k] = new Array()
  }
 }
}


thirdGroup[0][0][0][0] = new Option("CGV_빨강_단면_100", "CGV_빨강_단면_100");
thirdGroup[0][0][0][1] = new Option("CGV_빨강_단면_200", "CGV_빨강_단면_200");
thirdGroup[0][0][1][0] = new Option("CGV_빨강_양면_100", "CGV_빨강_양면_100");
thirdGroup[0][0][1][1] = new Option("CGV_빨강_양면_200", "CGV_빨강_양면_200");
thirdGroup[0][1][0][0] = new Option("CGV_노랑_단면_100", "CGV_노랑_단면_100");
thirdGroup[0][1][0][1] = new Option("CGV_노랑_단면_200", "CGV_노랑_단면_200");
thirdGroup[0][1][1][0] = new Option("CGV_노랑_양면_100", "CGV_노랑_양면_100");
thirdGroup[0][1][1][1] = new Option("CGV_노랑_양면_200", "CGV_노랑_양면_200");
thirdGroup[1][0][0][0] = new Option("LotteCinema_주뢍_단면_100", "LotteCinema_주뢍_단면_100");
thirdGroup[1][0][0][1] = new Option("LotteCinema_주뢍_단면_200", "LotteCinema_주뢍_단면_200");
thirdGroup[1][0][1][0] = new Option("LotteCinema_주뢍_양면_100", "LotteCinema_주뢍_양면_100");
thirdGroup[1][0][1][1] = new Option("LotteCinema_주뢍_양면_200", "LotteCinema_주뢍_양면_200");
thirdGroup[1][1][0][0] = new Option("LotteCinema_검정_단면_100", "LotteCinema_검정_단면_100");
thirdGroup[1][1][0][1] = new Option("LotteCinema_검정_단면_200", "LotteCinema_검정_단면_200");
thirdGroup[1][1][1][0] = new Option("LotteCinema_검정_양면_100", "LotteCinema_검정_양면_100");
thirdGroup[1][1][1][1] = new Option("LotteCinema_검정_양면_200", "LotteCinema_검정_양면_200");
thirdGroup[2][0][0][0] = new Option("MegaBox_파랑_단면_100", "MegaBox_파랑_단면_100");
thirdGroup[2][0][0][1] = new Option("MegaBox_파랑_단면_200", "MegaBox_파랑_단면_200");
thirdGroup[2][0][1][0] = new Option("MegaBox_파랑_양면_100", "MegaBox_파랑_양면_100");
thirdGroup[2][0][1][1] = new Option("MegaBox_파랑_양면_200", "MegaBox_파랑_양면_200");
thirdGroup[2][1][0][0] = new Option("MegaBox_보라_단면_100", "MegaBox_보라_단면_100");
thirdGroup[2][1][0][1] = new Option("MegaBox_보라_단면_200", "MegaBox_보라_단면_200");
thirdGroup[2][1][1][0] = new Option("MegaBox_보라_양면_100", "MegaBox_보라_양면_100");
thirdGroup[2][1][1][1] = new Option("MegaBox_보라_양면_200", "MegaBox_보라_양면_200");

 

var temp2=document.frm1.gp_quantity
function redirect2(a){
for (m=temp2.options.length-1;m>0;m--) //네번째 셀렉트박스에 옵션이 만들어져 있으면 그놈들을 없앤다.
temp2.options[m]=null
for (i=0;i<thirdGroup[document.frm1.gd_code.options.selectedIndex][document.frm1.gp_color.options.selectedIndex][a].length;i++){
temp2.options[i]=new Option(thirdGroup[document.frm1.gd_code.options.selectedIndex][document.frm1.gp_color.options.selectedIndex][a][i].text,thirdGroup[document.frm1.gd_code.options.selectedIndex][document.frm1.gp_color.options.selectedIndex][a][i].value)
}
temp2.options[0].selected=true
}

 


redirect(0);

	</script>
<!-- <script src="js/jquery.js"></script>
<script src="js/plugins.js"></script>
<script src="js/plugins2.js"></script>
<script src="js/custom.js"></script> -->
</body>
</html>
