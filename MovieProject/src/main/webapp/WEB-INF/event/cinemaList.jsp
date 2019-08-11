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

	var select1 = $("select[name='local']");
	
	function LocalList() {
		var selectBrand = $("select[name='local']");
		var selectLocal = $("select[name='local_2']");
		var selectLocalName = $("select[name='cname']");
		var cc_brand = $("#brand option:selected").val();

		selectBrand.empty();
		selectLocal.empty();
		selectLocalName.empty();
		selectBrand.append("<option value='1'>서울</option>");
		selectBrand.append("<option value='2'>인천/경기</option>");
		selectBrand.append("<option value='3'>대전/충청/강원</option>");
		selectBrand.append("<option value='4'>부산/경남</option>");
		selectBrand.append("<option value='5'>대구/울산/경북</option>");
		selectBrand.append("<option value='6'>광주/전라/제주</option>");
	}
	
	function LocalName() {
		var selectBrand = $("select[name='local']");
		var selectLocal = $("select[name='local_2']");
		var selectLocalName = $("select[name='cname']");
		var cc_brand = $("#brand option:selected").val();
		var cc_localnum = $("#local option:selected").val();
		
		$.ajax({
			url: "cineLocal",
			data: {cc_brand:cc_brand, cc_localnum:cc_localnum},
			type: "GET",
			dataType: "json",
			success: function(data) {
				selectLocal.empty();
				selectLocalName.empty();
				$.each(data, function(idx, value) {
					selectLocal.append("<option value='"+idx+"'>"+ data[idx] + "</option>");
				})
			},
			error: function() {
				alert("에러");
			}
		});
	}
	
	function getName() {
		var cc_brand = $("#brand option:selected").val();
		var cc_localnum = $("#local option:selected").val();
		var cc_local_name = $("#local_2 option:selected").text();
		var selectName = $("select[name='cname']");
		$.ajax({
			url: "cineName",
			data: {cc_brand:cc_brand, cc_localnum:cc_localnum, cc_local_name:cc_local_name},
			type: "GET",
			dataType: "json",
			success: function(data) {
				selectName.empty();
				$.each(data, function(idx, value) {
					selectName.append("<option value='"+idx+"'>"+ data[idx] + "</option>");
				})
			},
			error: function() {
				alert("에러");
			}
		});
	}
	
	function getCineInfo() {
		var cc_brand = $("#brand option:selected").val();
		var cc_localnum = $("#local option:selected").val();
		var cc_local_name = $("#local_2 option:selected").text();
		var cc_name = $("#cname option:selected").text();
		
		$.ajax({
			url: "getCineInfo",
			data: {cc_brand:cc_brand, cc_localnum:cc_localnum
				, cc_local_name:cc_local_name, cc_name: cc_name},
			type: "GET",
			dataType: "json",
			success: function(data) {
				
				$(".cinemaName").text(data.cc_NAME);
				$(".cinemaAdd").text(data.cc_ADDRESS);
				$("#home").attr("href", data.cc_LINK);
				$("#home").html("<strong> 홈페이지 이동 </strong>");
				$(".cinemaPhone").text(data.cc_PHONE + "  |  " + data.cc_THEATERS + "관 / " + data.cc_SEATS + "석");
				//$(".cinemaTheaters").text(data.cc_THEATERS + "관 / " + data.cc_SEATS + "석");
				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
				var mapTypeControl = new kakao.maps.MapTypeControl();
				
				map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
				
				var zoomControl = new kakao.maps.ZoomControl();
				map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(data.cc_ADDRESS, function(result, status) {
				
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
				
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});  
			},
			error: function() {
				alert("에러");
			}
		});
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
	<option value="메가박스"> 메가박스 </option>
</select>

<select id="local" name="local" size="8"  onChange="LocalName()">
</select>

<select id="local_2" name="local_2" size="8" onChange = "getName()">
</select>

<select id="cname" name="cname" size="8" onChange="getCineInfo()">
</select>

</form>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f335bb208b909138d6a0bdf1ab13b4ca&libraries=services,clusterer,drawing"></script>
<!-- 영화관 정보 시작 -->
<div class="cinema_info" >
	<div class="cinema_info_text" style="margin-top:35px;">
		<div class="cinemaName" style="font-size:25px; font-weight:bold; margin-bottom:15px;"></div>
		<div class="cinemaAdd" style="margin-bottom:5px;"></div>
		<span class="cinemaPhone"></span>
		<a href="#" id="home" target="_blank" style="margin-left:10px;"></a>
	</div>
	<div id="map" style="width:350px;height:250px;"></div>
	
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

