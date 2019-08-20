<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!-- 당첨자확인 표 크롤링 -->
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
<!-- kgh_css -->
<!-- 제이쿼리  -->
<%@ include file="../header2.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>




	<!-- 이벤트 섹션 시작 -->

	<!-- 2번 탭 -->
	<section style="margin-top: 120px;">
		<div class="jq_tabonoff comm_tab1"
			style="width: 1200px; margin: 0 auto; margin-top: 40px;">
			<ul class="jq_tab tab_menu tab-links tabs-mv">
				<ul class="last_event" style="float: right;">

					<li style="width: 120px; height: 40px; background-color: #333;"><a
						style="color: #fff;" href="./lastevent">지난이벤트</a></li>
					<!-- <li style="width: 120px;height: 40px; background-color: #333;"><a style="color: #fff;" href="./winner.html">당첨자확인</a></li> -->

				</ul>
			</ul>
		</div>

		<!--지난 이벤트 제목글 -->
		<div class="" style="width: 1200px; margin: 0 auto;">
			<br> <br> <br>
			<p style="color: #333; font-weight: bold; font-size: 20px;">&nbsp;&nbsp;
				당첨자 확인</p>
			<p
				style="color: #333; font-weight: bold; font-size: 14px; margin-bottom: 40px;">
				&nbsp;&nbsp;&nbsp; 당첨자 이벤트 <span style="color: red;">2458건</span>
				있습니다.
			</p>



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






			<!-- 당첨자확인 3사 크롤링 -->
			<div>
				<div id="js-load1" class="main1">
					<table border="1">
						<thead>
							<tr>
								<th style="width: 14%; background-color: #333; color:#fff; ">구분</th>
								<th style="background-color: #333; color:#fff;">제목</th>
								<th style="width: 24%; background-color: #333; color:#fff;">이벤트 기간</th>
							</tr>
						</thead>
						<!-- 당첨자발표 1 -->
						${element}
						<!-- 당첨자발표 2 -->
						${element2}

						<br>


						<!-- <tbody>
						<for:each>
						
						</for:each>
						<tr>
							<td>번호1</td>
							<td>${td_0 }</td>
							<td>${td_1 }</td>
							<td>${td_2 }</td>
						</tr>
						<tr>
							<td>번호1</td>
							<td>${td_0 }</td>
							<td>${td_3 }</td>
							<td>${td_4 }</td>
						</tr>
						<tr>
							<td>번호1</td>
							<td>${td_0 }</td>
							<td>${td_5 }</td>
							<td>${td_6 }</td>
						</tr>
						<tr>
							<td>번호1</td>
							<td>${td_0 }</td>
							<td>${td_7 }</td>
							<td>${td_8 }</td>
						</tr>
						<tr>
							<td>번호1</td>
							<td>${td_0 }</td>
							<td>${td_9 }</td>
							<td>${td_10 }</td>
						</tr>

					</tbody> -->
					</table>
					
					<div class="add_button"> 
						<a href="#" type="button">더보기</a>
					</div>

				</div>
				
			</div>
			<!-- 더보기 버튼 -->
			


			<!-- 바탕 : 흰색 -->





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
	<!-- <script src="<c:url value="/resources/js/jquery.js" />"></script>
	<script src="<c:url value="/resources/js/plugins.js" />"></script>
	<script src="<c:url value="/resources/js/plugins2.js" />"></script>
	<script src="<c:url value="/resources/js/custom.js" />"></script>
 -->
	<!-- <script src="js/jquery.js"></script>
<script src="js/plugins.js"></script>
<script src="js/plugins2.js"></script>
<script src="js/custom.js"></script> -->

	<!-- 5. footer1.jsp : footer -->
	<%@ include file="../footer1.jsp"%>
	<!-- 7. footer2.jsp : script -->
	<%@ include file="../footer2.jsp"%>


