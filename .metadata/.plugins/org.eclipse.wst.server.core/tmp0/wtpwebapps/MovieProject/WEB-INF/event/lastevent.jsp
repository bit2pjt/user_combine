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
<!-- <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/plugins.css"/>">
  -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/kgh_style.css"/>">
	
<%@ include file="../header2.jsp"%>
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 제이쿼리  -->

<!-- 3. heaer2.jsp : header -->

	<!-- 이벤트 섹션 시작 -->

	<!-- 2번 탭 -->
	<section style="margin-top: 120px;">
		<div class="jq_tabonoff comm_tab1"
			style="width: 1200px; margin: 0 auto; margin-top: 40px;">
			<ul class="jq_tab tab_menu tab-links tabs-mv">
				<ul class="last_event" style="float: right;">
					<!-- <li style="width: 120px;height: 40px; background-color: #333;"><a style="color: #fff;" href="./lastevent.html">지난이벤트</a></li> -->

					<li style="width: 120px; height: 40px; background-color: #333;"><a
						style="color: #fff;" href="./winner">당첨자확인</a></li>
				</ul>
			</ul>
		</div>

		<!--지난 이벤트 제목글 -->
		<div class="" style="width: 1200px; margin: 0 auto;">
			<br> <br> <br>
			<p style="color: #333; font-weight: bold; font-size: 20px;">&nbsp;&nbsp;
				지난 이벤트</p>
			<p
				style="color: #333; font-weight: bold; font-size: 14px; margin-bottom: 40px;">
				&nbsp;&nbsp;&nbsp; 영화 이벤트에 지금 참여하세요.</p>



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
@ 2019.07.4  김광희                  지난이벤트 클로링
*

@author BIT 116기 2조
@since 2019. 08.04
@version 1.0
@see
*

Copyright (C) by bit 2조 All right reserved.
/-->


				<div id="cgv_cwal"">
					<!-- cgv 지난이벤트 li 크롤링  -->
							<ul class="lists1">
								${img}
								<br> ${img2}
								<br>
							</ul>
							<div id="js-btn-wrap1" class="btn-wrap">
								<a href="javascript:;" class="button">더보기</a>
							</div>
	
					<style>
#cgv_cwal {
	font-size: 0
}

#cgv_cwal .txt-lightblue {
	font-size: 13px;
}

#cgv_cwal strong {
	font-size: 14px;
}

#cgv_cwal em.date {
	font-size: 13px;
}

#cgv_cwal li {
	float: left;
	width: 240px;
	padding: 10px;
}

.
div.box-image {
	width: 240px;
}

.box-contents {
	margin-top: 20px;
	height: 100px;
}

.box-contents img {
	
}

.box-contents .txt-lightblue {
	display: block;
}

.box-contents strong {
	display: block
}
</style>
				</div>






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

	<!-- end of footer section-->


	<!-- end of footer section-->
	<!-- <link rel="stylesheet" href="<c:url value="/resources/js/jquery.js"/>"> -->
	<!-- <script src="<c:url value="/resources/js/jquery.js" />"></script>
	<script src="<c:url value="/resources/js/plugins.js" />"></script>
	<script src="<c:url value="/resources/js/plugins2.js" />"></script>
	<script src="<c:url value="/resources/js/custom.js" />"></script> -->
	<!-- 5. footer1.jsp : footer -->

	<!-- <script src="js/jquery.js"></script>
<script src="js/plugins.js"></script>
<script src="js/plugins2.js"></script>
<script src="js/custom.js"></script> -->

	<%@ include file="../footer1.jsp"%> 
	<!-- 7. footer2.jsp : script -->
	<%@ include file="../footer2.jsp"%>

