<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   if (session.getAttribute("m_email") == null) {
      System.out.println("m_email : " + (String) session.getAttribute("m_email"));
      out.println("<script>");
      out.println("alert('로그인 후 이용해주세요.')");
      out.println("location.href='index'");
      out.println("</script>");
   }
%>
<!--  
* @Class Name : boardFreeWrite.jsp
* @Description : 자유게시판 작성
* @Modification Information
* @
* @    수정일           수정자                 수정내용
* @ -------------   ---------   -------------------------------
* @ 2019. 07. 24      박현민   				최초생성
* @ 2019. 08. 09      한유진				     수정
* @author BIT 116기 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by bit 2조 All right reserved.
*/-->
<!DOCTYPE html>
<!--[if IE 7]>
<html class="ie ie7 no-js" lang="en-US">
<![endif]-->
<!--[if IE 8]>
<html class="ie ie8 no-js" lang="en-US">
<![endif]-->
<!--[if !(IE 7) | !(IE 8)  ]><!-->
<html>
<head>
<!-- Basic need -->
<title>BlockBuster</title>
<meta charset="UTF-8">

<!--Google Font-->
<link rel="stylesheet"
   href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />
<!-- Mobile specific meta -->
<meta name=viewport content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone-no">

<!-- CSS files -->
<link rel="stylesheet"
   href="<c:url value="/resources/css/plugins.css" />">
<link rel="stylesheet"
   href="<c:url value="/resources/css/header_style.css" />">
<link rel="stylesheet"
   href="<c:url value="/resources/css/hm_css.css" />">
<link rel="stylesheet" href="resources/css/ws_personal.css">
<!-- 썸머노트 헤더 시작 -->
<link
   href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
   rel="stylesheet">
<script
   src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
   src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link
   href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css"
   rel="stylesheet">
<script
   src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<!-- 썸머노트 헤더 끝 -->

<!-- 추가 헤더 -->
<link rel="stylesheet" href="./resources/css/boardstyle.css">
</head>
<body>
   <script>
   $(function() {
  		var btn = $("#update-btn");
  		var from = $("#bfform");
		
  		btn.on("click", function() {
  			//alert($(".update-content").text());
  			if ($(".post-title").val().length == 0) {
  	            alert("제목을 입력해주세요.");
  	         	$(".post-title").focus();
  	            return false;
  	         }else if ($(".update-content").val().length == 0) {
  	            alert("내용을 입력하세요.");
  	        	$(".update-content").focus();
  	            return false;
  	         }else {
  	        	 if (confirm("등록하시겠습니까?") == true) { //확인
  	        		bfform.submit();
  	              } else { //취소
  	                 return false;
  	             }
  	        }
  			
  		})
  	});  
   
   function register_back() {
       msg = "게시글 작성을 취소하시겠습니까?";
       if (confirm(msg) != 0) {
      	 location.href = "/movie/boardFreeListP?page=${searchCriteria.page}"
               + "&perPageNum=${searchCriteria.perPageNum}"
               + "&searchType=${searchCriteria.searchType}"
               + "&keyword=${searchCriteria.keyword}";
       }
    }
 </script>
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
                  <li class="dropdown first"><a href="movieTicketing.html">
                        예매 </a></li>
                  <li class="dropdown first"><a href="movieList.html"> 영화 </a>
                  </li>

                  <li class="dropdown first"><a href="cinemaList.html"> 영화관
                  </a></li>
                  <li class="dropdown first"><a
                     href="boardEventCollection.html"> 이벤트 & 정보 </a></li>
                  <li class="dropdown first"><a data-toggle="dropdown"
                     data-hover="dropdown"> 커뮤니티<i class="fa fa-angle-down"
                        aria-hidden="true"></i>
                  </a>
                     <ul class="dropdown-menu level1">
                        <li><a href="boardFreeList">자유 게시판</a></li>
                        <li class="it-last"><a href="boardShareList">나눔 게시판</a></li>
                     </ul></li>
               </ul>
               <ul class="nav navbar-nav flex-child-menu menu-right">

                  <c:choose>
                     <c:when test="${!empty m_email }">
                        <li class="dropdown first"><a href="mmlList"> 나영리 </a></li>

                        <li><a href="mypage">마이페이지</a></li>
                        <li><a href="Logout">로그아웃</a></li>
                        <!--  hm |   <li><a href="member_join.html">회원가입</a></li> -->
                     </c:when>

                     <c:otherwise>
                        <li class="loginLink"><a href="#">로그인</a></li>
                        <li class="btn signupLink"><a href="#">회원가입</a></li>
                     </c:otherwise>
                  </c:choose>
               </ul>

            </div>

         </nav>

      </div>
   </header>
   <!-- header 끝 -->


   <!-- 서머노트 웹에서 ... 끝-->
   <!-- <body> -->
   <div class="hero common-hero">
      <div class="container">
         <div class="row">
            <div class="col-md-12">
               <div class="hero-ct">
                  <h1>새 글 작성</h1>
                  <ul class="breadcumb">
                     <li class="active"><a href="#">커뮤니티</a></li>
                     <li><span class="ion-ios-arrow-right"></span> 자유 게시판</li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
   </div>
   <div class="buster-light" style="min-height: 1300px;">
      <!-- 글쓰기 폼의 시작.-->
      <div class="movie-items">
         <div class="container">
            <div class="col-md-12" style="width: 100%;"> 
               <form name="bfform" action="boardFreeWriteAction" method="POST"
                  onsubmit="return check()">
                  <!--  1. 글쓰기 부분 전체를 감싸는 상자(writer-box)를 만든다  [19/07/03 border:1px solid black; 덜어냄. 더 깔끔하라고-->
                  <div class="ws-writer-box">
                     <div>
                        &nbsp;&nbsp;<strong>분류</strong> &nbsp;&nbsp; <label
                           class="fancy-radio custom-color-coral"> <input
                           name="bf_category" value="결말해석" type="radio" checked><span><i></i>결말해석</span>
                        </label>&nbsp;&nbsp;&nbsp; <label class="fancy-radio custom-color-coral">
                           <input name="bf_category" value="토론" type="radio"><span><i></i>토론</span>
                        </label>&nbsp;&nbsp;&nbsp; <label class="fancy-radio custom-color-coral">
                           <input name="bf_category" value="잡담" type="radio"><span><i></i>잡담</span>
                        </label>&nbsp;&nbsp;&nbsp; <label class="fancy-radio custom-color-coral">
                           <input name="bf_category" value="유머" type="radio"><span><i></i>유머</span>
                        </label>
                     </div>


                     <!-- 2.상단부는 제목과 출처가 들어간다.  -->
                     <div class="ws-top-writer">
                        <br> <br> <span><strong>&nbsp;&nbsp;제목
                              :&nbsp;&nbsp;&nbsp;&nbsp; </strong></span> <span> <!-- 밑줄만 나오는 style서식 -->



                           <input class="post-title" name="bf_title" id="bf_title" maxlength="49"
                           placeholder="제목을 적어주세요"></span> <span id="counter"></span><span>자
                           남음 </span> <br> <br> <strong>&nbsp;&nbsp;출처
                           :&nbsp;&nbsp;&nbsp;&nbsp; </strong> <span><input
                           class="post-source" name="bf_source" id="bf_source"
                           placeholder="출처를 적어주세요"></span> <br> <br> <br>
                     </div>
                     <!-- end of top-writer -->
                     <!-- 3. 중상단은 텍스트로 고정된 공지사항이 자리잡는다. -->

                     <br> <br>
                     <textarea id="summernote" name="bf_content" class="update-content" style="resize: none;"></textarea>

                     <br>
                     <div class="ws-middle-top-writer">
                        <br> &nbsp;&nbsp;<span style="color: #ff0000;"><strong>※</strong></span>
                        <span style="color: #ff0000;">음란물 및 욕설</span><strong>이
                           포함된 게시글은 사전 경고 없이 즉시 게시글이 삭제될 수 있습니다.</strong><br> <br>
                        &nbsp;&nbsp;<span style="color: #ff0000;"><strong>※</strong></span>
                        <span style="color: #ff0000;">스포일러</span><strong>가 포함된
                           글은 반드시 말머리에 [스포일러]를 붙여주세요.</strong><br> <br> &nbsp;&nbsp;<span
                           style="color: #ff0000;"><strong>※</strong></span> 기타 자세한 공지사항은
                        아래의 <span style="color: #ff0000;">통합공지</span><strong>
                           링크에서 확인할 수 있습니다.</strong><br> <a href="mypage/notice/list">&nbsp;&nbsp;-->
                           통합공지 페이지로 이동 </a>

                     </div>
                     <!-- end of middle-top-writer -->

                     <!-- 다홍색 단추를 가져오긴 했는데... 스타일만 가져오겠지? 기존의 것은 submit버튼의 양식 -->
                     <!-- ticket의 단추 가져오기 실패. <a>에만 쓸 수 있는 스타일이다 -->
                     <div style="text-align:center; padding:3%;">
                        <input type="button" id="update-btn" class="board_btn" value="작성하기" style="width:200px; height: 50px; margin-right: 20px; border-radius: 6px;"> 
                        <input style="width:200px; height: 50px; border-radius: 6px;" type="button" class="board_btn" value=" 취 소 " onclick="register_back()">
                     </div>



                  </div>
                  <!-- end of writer-box  -->
               </form>
            </div>
         </div>
      </div>
   </div>
   <!-- end of buster-white -->

   <script>
      //n자 남음 구현
      $(function() {
         $('.post-title')
               .keyup(
                     function(e) {
                        var content = $(this).val();
                        $(this)
                              .height(
                                    ((content.split('\n').length + 1) * 1.5)
                                          + 'em');
                        $('#counter').html(content.length + '/50');
                     });
         $('.post-title').keyup();
      });

      $(function() {
         // summernote editor

         $('#summernote').summernote({
            placeholder : '본문 내용을 입력해 주세요',
            tabsize : 2,
            height : 500
         });
         $("button").attr("aria-expanded", "true");
      });
   </script>

   <!--   hm |  footer section-->
   <footer class="ht-footer">
      <div class="container">
         <div class="ft-copyright">
            <div class="ft-left">
               <p>© 2019 Bit 2 Jo. All Rights Reserved.</p>
            </div>
            <div class="backtotop">
               <p>
                  <a href="#" id="back-to-top">맨 위로 <i
                     class="ion-ios-arrow-thin-up"></i></a>
               </p>
            </div>
         </div>
      </div>
   </footer>
   <!--   hm |  end of footer section-->


   <button onclick="topFunction()" id="hm_myBtn" title="Go to top">Top</button>

   <script src="<c:url value="/resources/js/header_custom.js" />"></script>
   <script src="<c:url value="/resources/js/hm_js.js" />"></script>

</body>
</html>