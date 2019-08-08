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
<%@ include file="../header1.jsp"%>
	<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/kgh_style.css"/>">
<%@ include file="../header2.jsp" %>

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

	$("#brand option").on("change", function() {
		alert("클릭");
	});

	
	var select1 = $("select[name='local']");
	
	function LocalList() {
		var select1 = $("select[name='local']");
		select1.empty();
		select1.append("<option value='1'>전국</option>");
		select1.append("<option value='2'>서울</option>");
		select1.append("<option value='3'>인천/경기</option>");
		select1.append("<option value='4'>대전,충청/강원</option>");
		select1.append("<option value='5'>대구/울산/경북</option>");
		select1.append("<option value='6'>광주/전라/제주</option>");
	}
	
	function localName() {
		
	}
</script>
	

</head>
<body>

<!-- Start | Section -->
<div style="margin-top:150px;">
<section class="section">
<!-- 지역 영화관 선택 -->	
<form class="cinema_select" name="frm1">
<select id="brand" name="brand" size="3" onChange="LocalList()">
	<option value="CGV"> CGV </option>
	<option value="롯데시네마"> 롯데시네마 </option>
	<option value=" 메가박스 "> 메가박스 </option>
</select>

<select name="local" size="8"  onChange="LocalName()">
<!--
	<option value="1">전국</option>
	<option value="2">서울</option>
	<option value="3">인천/경기</option>
	<option value="4">대전,충청/강원</option>
	<option value="5">부산/경남</option>
	<option value="6">대구/울산/경북</option>
	<option value="7">광주/전라/제주</option>
	 -->	
</select>

<select name="gp_face" size="8" onChange = "redirect2(this.selectedIndex);">
</select>

<select name="gp_quantity" size="8">
</select>
</form>

<!-- 영화관 정보 시작 -->
<div class="cinema_info" >
	<div class="cinema_info_text">
		<span>CGV</span><span>서울 영화관1호</span><br>
		<span>인천광역시 중구 운서동 3088-3 예스타워 영종 7층</span><br>
		<a href="./www.naver.com">홈페이지 이동</a><span>02-444-4444</span><span>|</span><span>상영관 수</span><span>전체 좌석</span>
		<p style="float: right; background-color: #333; color: #fff; width: 120px;line-height: 80px; padding: 10px; margin-top: 30px; text-align: center; vertical-align: middle;">예매정보</p>
	</div>
	<div class="cinema_info_map">
		
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
</div>
<!-- END | Section -->


<%@ include file="../footer1.jsp"%>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<%@ include file="../footer2.jsp"%>

