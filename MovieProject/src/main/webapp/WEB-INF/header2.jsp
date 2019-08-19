

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- header2 시작 -->
<!--  hm | </head> 부터 </header>까지 -->
</head>

<body>

   <!--preloading-->
   <div id="preloader">
      <img class="logo" src="resources/images/logo1.png" alt="" width="119"
         height="58">
      <div id="status">
         <span></span> <span></span>
      </div>
   </div>
   <!--end of preloading-->

   <!-- ======================================================                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ================================================================== -->
   <!--                                               hm |        모달 팝업 시작                                                  -->
   <!-- ======================================================================================================================== -->

   <!-- ======================================================================================================================== -->
   <!--                                            hm |         로그인 팝업 시작                                                  -->
   <!-- 입력 폼 패턴 삭제 -->
   <div class="login-wrapper" id="login-content">
      <div class="login-content">
         <a href="#" class="close">x</a>
         <h3>Login</h3>
         <form action="Login" method="post" name="LoginForm">
            <!-- action 변경 필요 -->
            <div class="row">
               <label for="email"> <input type="text" name="m_email"
                  id="m_email" placeholder="이메일을 입력하세요" required="required"
                  autocapitalize="off" />
               </label>
            </div>

            <div class="row">
               <label for="password"> <input type="password"
                  name="m_password" id="m_password" placeholder="비밀번호를 입력하세요"
                  required="required" />
               </label>
            </div>
            <div class="row">
               <div class="remember">
                  <div>
                     <input type="checkbox" id="idSaveCheck" name="remember"
                        value="Remember me"><span>아이디 저장</span>
                  </div>
               </div>
            </div>
            <div class="row hm_logtext">
               <button type="button" id="loginbtn">Login</button>
               <a class="btn signupLinkP" href="memberJoinP">회원가입 | </a> <a
                  class="btn idfindLinkP" href="memberSearchEmailP">아이디 찾기 | </a> <a
                  class="btn pwfindLinkP" href="memberSearchPwP">비밀번호 찾기</a>
            </div>
         </form>

      </div>
   </div>
   <!--    hm |                                                         로그인 폼 팝업 끝                                                 -->
   <!-- ======================================================================================================================== -->

   
   <!-- BEGIN | Header -->
   <header class="ht-header sticky">
      <div class="container">
         <nav class="navbar navbar-default navbar-custom">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header logo">
               <div class="navbar-toggle" data-toggle="collapse"
                  data-target="#bs-example-navbar-collapse-1">
                  <span class="sr-only">Toggle navigation</span>
                  <div id="nav-icon1">
                     <span></span> <span></span> <span></span>
                  </div>
               </div>
               <a href="index"><img class="logo"
                  src="resources/images/logo1.png" alt="" width="119" height="58"></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse flex-parent"
               id="bs-example-navbar-collapse-1">
               <ul class="nav navbar-nav flex-child-menu menu-left">
                  <li class="hidden"><a href="#page-top"></a></li>
                  <!--  hm |   add : 각 항목의 텍스트 변경-->
                  <li class="dropdown first"><a
                     class="btn btn-default dropdown-toggle lv1"
                     href="movieTicketing"> 예매 </a></li>
                  <li class="dropdown first"><a
                     class="btn btn-default dropdown-toggle lv1" href="movieList">
                                             영화 </a></li>

                  <li class="dropdown first"><a
                     class="btn btn-default dropdown-toggle lv1"
                     href="cinemaList"> 영화관 </a></li>
                  <li class="dropdown first"><a
                     class="btn btn-default dropdown-toggle lv1"
                     href="eventCollection"> 이벤트 & 정보 </a></li>
                  <li class="dropdown first"><a
                     class="btn btn-default dropdown-toggle lv1"
                     data-toggle="dropdown" data-hover="dropdown"> 커뮤니티<i
                        class="fa fa-angle-down" aria-hidden="true"></i>
                  </a>
                     <ul class="dropdown-menu level1">
                        <li><a href="boardFreeListP">자유 게시판</a></li>
                        <li class="it-last"><a href="boardShareListP">나눔 게시판</a></li>
                     </ul></li>
               </ul>
               <ul class="nav navbar-nav flex-child-menu menu-right">

					<li class="dropdown first"><a
                           class="btn btn-default dropdown-toggle lv1" href="mmlList">
                              나영리 </a></li>
                  <c:choose>
                     <c:when test="${!empty m_email }">
                        <!-- <li class="dropdown first"><a
                           class="btn btn-default dropdown-toggle lv1" href="mmlList">
                              나영리 </a></li> -->

                        <li><a href="mypage">마이페이지</a></li>
                        <li><a href="Logout">로그아웃</a></li>
                        <!--  hm |   <li><a href="member_join.html">회원가입</a></li> -->
                     </c:when>

                     <c:otherwise>
                        <li class="loginLink"><a href="#">로그인</a></li>
                        <li class="btn signupLinkP"><a href="memberJoinP">회원가입</a></li>
                     </c:otherwise>
                  </c:choose>
               </ul>

            </div>
            <!-- 검색 모달 -->
            <form id="demo-2">
               <input type="search" placeholder="Search">
            </form>
         </nav>

      </div>
   </header>
   <!-- END | Header -->
   <script src="<c:url value="/resources/js/jquery.js" />"></script>

<script src="<c:url value="/resources/js/plugins.js" />"></script>
<script src="<c:url value="/resources/js/plugins2.js" />"></script>
<script>
$('#check_all').on('click', function() {
   //모든 이벤트가 작동이 안되는듯 하다. 페이지 내부에서는 작동. hn_js.js에서는 동일 코드가 미작동. 왜??
   alert('asdasd');
   if($('#check_all').is(':checked')) {      $('.chk_box').prop('checked', true);
   }else {
      $('.chk_box').prop('checked', false);
   }
   
});

</script>   
<!-- header2 끝 -->