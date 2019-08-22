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
<link rel="stylesheet"
	href="<c:url value="/resources/css/kgh_style.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/yj_style.css" />">
<%@ include file="../header2.jsp"%>


<style type="text/css">
div ::-webkit-scrollbar {
	width: 16px;
}

div ::-webkit-scrollbar-track {
	background-color: #ccc;
}

div ::-webkit-scrollbar-thumb {
	background-color: #333;
	border-radius: 10px;
}

div ::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment
	{
	width: 16px;
	height: 16px;
	background: #ccc;
}
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f335bb208b909138d6a0bdf1ab13b4ca&libraries=services,clusterer,drawing"></script>
<script>
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
			url : "cineLocal",
			data : {
				cc_brand : cc_brand,
				cc_localnum : cc_localnum
			},
			type : "GET",
			dataType : "json",
			success : function(data) {
				selectLocal.empty();
				selectLocalName.empty();
				$.each(data, function(idx, value) {
					selectLocal.append("<option value='"+idx+"'>" + data[idx]
							+ "</option>");
				})
			},
			error : function() {
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
			url : "cineName",
			data : {
				cc_brand : cc_brand,
				cc_localnum : cc_localnum,
				cc_local_name : cc_local_name
			},
			type : "GET",
			dataType : "json",
			success : function(data) {
				selectName.empty();
				$.each(data, function(idx, value) {
					selectName.append("<option value='"+idx+"'>" + data[idx]
							+ "</option>");
				})
			},
			error : function() {
				alert("에러");
			}
		});
	}

	function getCineInfo() {
		var cc_brand = $("#brand option:selected").val();
		var cc_localnum = $("#local option:selected").val();
		var cc_local_name = $("#local_2 option:selected").text();
		var cc_name = $("#cname option:selected").text();

		$
				.ajax({
					url : "getCineInfo",
					data : {
						cc_brand : cc_brand,
						cc_localnum : cc_localnum,
						cc_local_name : cc_local_name,
						cc_name : cc_name
					},
					type : "GET",
					dataType : "json",
					success : function(data) {
						$(".cinemaName").text(data.cc_NAME);
						$(".cinemaAdd").text(data.cc_ADDRESS);
						$("#home").attr("href", data.cc_LINK);
						$("#home")
								.html(
										"<strong style='color:black;'> 홈페이지 이동 </strong>");
						$(".cinemaPhone").text(
								"TEL  " + data.cc_PHONE + "  |  "
										+ data.cc_THEATERS + "관 / "
										+ data.cc_SEATS + "석");
						//$(".cinemaTheaters").text(data.cc_THEATERS + "관 / " + data.cc_SEATS + "석");

						if (data.cc_CODE == 1123) {
							$("#cgvGang").show();
						} else {
							$("#cgvGang").hide();
						}

						if ((data.cc_CODE == 1128) || (data.cc_CODE == 1111)) {
							$("#cgvjung").show();
						} else {
							$("#cgvjung").hide();
						}

						if (data.cc_CODE == 1186) {
							$("#cgvchung").show();
						} else {
							$("#cgvchung").hide();
						}

						if (data.cc_CODE == 1071) {
							$("#lottebroad").show();
						} else {
							$("#lottebroad").hide();
						}

						if (data.cc_CODE == 1003) {
							$("#megacoex").show();
						} else {
							$("#megacoex").hide();
						}

						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(33.450701,
									126.570667), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨
						};

						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption);

						// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
						var mapTypeControl = new kakao.maps.MapTypeControl();

						map.addControl(mapTypeControl,
								kakao.maps.ControlPosition.TOPRIGHT);

						var zoomControl = new kakao.maps.ZoomControl();
						map.addControl(zoomControl,
								kakao.maps.ControlPosition.RIGHT);
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();

						// 주소로 좌표를 검색합니다
						geocoder.addressSearch(data.cc_ADDRESS, function(
								result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});

						var replyPageNum = 1;
						var cc_code = data.cc_CODE;
						//getReplies();
						getRepliesPaging(replyPageNum);

						$("#btn-hjs")
								.on(
										"click",
										function() {
											var session = "${sessionyn}";
											var replyText = $("#newReplyText");
											var cr_content = replyText.val();
											var cr_score = $(
													".review-write-star input[type='radio']:checked")
													.val();

											if (session == "") {
												alert("로그인 하셔야 이용하실수 있습니다.");
												location.href = "index";
												return false;
											}

											if (cr_content == "") {
												alert("댓글 내용을 입력해주세요!");
												return false;
											}

											if (typeof (cr_score) == "undefined") {
												alert("별점을 선택해주세요!");
												return false;
											}

											$
													.ajax({
														type : "post",
														url : "/movie/replies/cine/",
														headers : {
															"Content-type" : "application/json",
															"X-HTTP-Method-Override" : "POST"
														},
														dataType : "text",
														data : JSON
																.stringify({
																	cc_code : cc_code,
																	cr_content : cr_content,
																	cr_score : cr_score
																}),
														success : function(
																result) {
															if (result == "regSuccess") {
																alert("댓글 등록 완료!");
															}
															//getReplies();
															getRepliesPaging(replyPageNum);
															replyText.val("");
															$(
																	".review-write-star input[type='radio']")
																	.prop(
																			"checked",
																			false);
														}
													});
										});

						$("#replies").on(
								"click",
								".replyLi button",
								function() { // 댓글의 수정 버튼 클릭시
									var reply = $(this).parent().parent()
											.parent().parent(); // 댓글의 li
									var replyNo = reply.attr("data-replyNo"); // 댓글의 번호
									var replyText = reply.find(".replyText")
											.text(); //댓글의 내용
									$("#replyNo").val(replyNo); // 댓글 수정창의 댓글번호에 넣음
									$("#replyText").val(replyText); // 댓글 수정창의 댓글내용에 넣음
								});

						$("#replies")
								.on(
										"click",
										".replyLi .ws-btn-thumbs-up",
										function() { // 댓글의 수정 버튼 클릭시
											var reply = $(this).parent()
													.parent().parent().parent(); // 댓글의 li
											var cr_code = reply
													.attr("data-replyNo"); // 댓글의 번호
											var present = $(this).parent()
													.find(".ws-btn-thumbs-up");
											var session = "${sessionyn}";
											//var bf_rno = $("#replies > li");
											//alert($(this).parent().find(".ws-btn-thumbs-up").text());
											if (session == "") {
												alert("로그인 하셔야 이용하실수 있습니다.");
												location.href = "index";
												return false;
											}
											$
													.ajax({
														url : "CineReplyReco",
														data : {
															cr_code : cr_code,
															type : 1
														},
														dataType : "text",
														type : "post",
														success : function(data) {
															if (data == "fail") {
																alert("이미 추천/비추천을 누르셨습니다.");
																return false;
															} else {
																present
																		.html("<i class='far fa-thumbs-up' aria-hidden='true' ></i>  "
																				+ data);
															}
														},
														error : function() {
															alert("에러");
														}
													});

										});

						$("#replies")
								.on(
										"click",
										".replyLi .ws-btn-thumbs-down",
										function() { // 댓글의 수정 버튼 클릭시
											var reply = $(this).parent()
													.parent().parent().parent(); // 댓글의 li
											var cr_code = reply
													.attr("data-replyNo"); // 댓글의 번호
											var present = $(this)
													.parent()
													.find(".ws-btn-thumbs-down");
											var session = "${sessionyn}";
											//var bf_rno = $("#replies > li");
											//alert($(this).parent().find(".ws-btn-thumbs-up").text());
											if (session == "") {
												alert("로그인 하셔야 이용하실수 있습니다.");
												location.href = "index";
												return false;
											}
											$
													.ajax({
														url : "CineReplyReco",
														data : {
															cr_code : cr_code,
															type : 0
														},
														dataType : "text",
														type : "post",
														success : function(data) {
															if (data == "fail") {
																alert("이미 추천/비추천을 누르셨습니다.");
																return false;
															} else {
																present
																		.html("<i class='far fa-thumbs-down' aria-hidden='true' ></i> "
																				+ data);
															}
														},
														error : function() {
															alert("에러");
														}
													});

										});

						$("#replies").on(
								"click",
								".replyLi .ws-btn-warning",
								function() { // 댓글의 수정 버튼 클릭시
									var reply = $(this).parent().parent()
											.parent().parent(); // 댓글의 li
									var cr_code = reply.attr("data-replyNo"); // 댓글의 번호
									var present = $(this).parent().find(
											".ws-btn-warning");
									var session = "${sessionyn}";
									//var bf_rno = $("#replies > li");
									//alert($(this).parent().find(".ws-btn-thumbs-up").text());
									if (session == "") {
										alert("로그인 하셔야 이용하실수 있습니다.");
										location.href = "index";
										return false;
									}

									$.ajax({
										url : "CineReplyWarn",
										data : {
											cr_code : cr_code
										},
										dataType : "text",
										type : "post",
										success : function(data) {
											if (data == "success")
												alert("신고 되었습니다.");
											else
												alert("이미 신고 하셨습니다.");
										},
										error : function() {
											alert("에러");
										}
									});

								});

						$(".modalDelBtn").on("click", function() {
							var cr_code = $("#replyNo").val();
							$.ajax({
								type : "delete",
								url : "/movie/replies/cine/" + cr_code,
								headers : {
									"Content-type" : "application/json",
									"X-HTTP-Method-Override" : "DELETE"
								},
								dataType : "text",
								success : function(result) {
									console.log("result : " + result);
									if (result == "delSuccess") {
										//getReplies();
										getRepliesPaging(replyPageNum);
										alert("댓글 삭제 완료!");
										/*
										$("#modifyModal").modal("hide");
										
										$("#modifyModal").removeClass("in");
										$(".modal-backdrop").remove();
										$("body").removeClass("modal-open");*/
										// $(body)
									}
								}
							});
						});

						$(".modalModBtn").on("click", function() {
							var reply = $(this).parent().parent();
							var cr_code = reply.find("#replyNo").val();
							var cr_content = reply.find("#replyText").val();
							$.ajax({
								type : "put",
								url : "/movie/replies/cine/" + cr_code,
								headers : {
									"Content-type" : "application/json",
									"X-HTTP-Method-Override" : "PUT"
								},
								data : JSON.stringify({
									cr_content : cr_content
								}),
								dataType : "text",
								success : function(result) {
									console.log("result : " + result);
									if (result == "modSuccess") {
										//getReplies();
										getRepliesPaging(replyPageNum);
										alert("댓글 수정 완료!");
										$("#modifyModal").removeClass("in");
										$(".modal-backdrop").remove();
										$("body").removeClass("modal-open");
									}
								}
							});
						});

						var id = "${id}";
						var arr = [];
						arr[0] = "<i class='far fa-star fa-1x'></i><i class='far fa-star fa-1x'></i><i class='far fa-star fa-1x'></i><i class='far fa-star fa-1x'></i><i class='far fa-star fa-1x'></i>"; //0
						arr[1] = "<i class='fas fa-star-half-alt fa-1x'></i><i class='far fa-star fa-1x'></i><i class='far fa-star fa-1x'></i><i class='far fa-star fa-1x'></i><i class='far fa-star fa-1x'></i>"; //1
						arr[2] = "<i class='fas fa-star fa-1x'></i><i class='far fa-star fa-1x'></i><i class='far fa-star fa-1x'></i><i class='far fa-star fa-1x'></i><i class='far fa-star fa-1x'></i>"; //2
						arr[3] = "<i class='fas fa-star fa-1x'></i><i class='fas fa-star-half-alt fa-1x'></i><i class='far fa-star fa-1x'></i><i class='far fa-star fa-1x'></i><i class='far fa-star fa-1x'></i>";//3
						arr[4] = "<i class='fas fa-star fa-1x'></i><i class='fas fa-star fa-1x'></i><i class='far fa-star fa-1x'></i><i class='far fa-star fa-1x'></i><i class='far fa-star fa-1x'></i>";//4
						arr[5] = "<i class='fas fa-star fa-1x'></i><i class='fas fa-star fa-1x'></i><i class='fas fa-star-half-alt fa-1x'></i><i class='far fa-star fa-1x'></i><i class='far fa-star fa-1x'></i>";//5
						arr[6] = "<i class='fas fa-star fa-1x'></i><i class='fas fa-star fa-1x'></i><i class='fas fa-star fa-1x'></i><i class='far fa-star fa-1x'></i><i class='far fa-star fa-1x'></i>";//6
						arr[7] = "<i class='fas fa-star fa-1x'></i><i class='fas fa-star fa-1x'></i><i class='fas fa-star fa-1x'></i><i class='fas fa-star-half-alt fa-1x'></i><i class='far fa-star fa-1x'></i>";//7
						arr[8] = "<i class='fas fa-star fa-1x'></i><i class='fas fa-star fa-1x'></i><i class='fas fa-star fa-1x'></i><i class='fas fa-star fa-1x'></i><i class='far fa-star fa-1x'></i>";//8
						arr[9] = "<i class='fas fa-star fa-1x'></i><i class='fas fa-star fa-1x'></i><i class='fas fa-star fa-1x'></i><i class='fas fa-star fa-1x'></i><i class='fas fa-star-half-alt fa-1x'></i>";//9
						arr[10] = "<i class='fas fa-star fa-1x'></i><i class='fas fa-star fa-1x'></i><i class='fas fa-star fa-1x'></i><i class='fas fa-star fa-1x'></i><i class='fas fa-star fa-1x'></i>";//10

						var arr1 = [];
						arr1[0] = "<i class='far fa-star fa-3x'></i><i class='far fa-star fa-3x'></i><i class='far fa-star fa-3x'></i><i class='far fa-star fa-3x'></i><i class='far fa-star fa-3x'></i>"; //0
						arr1[1] = "<i class='fas fa-star-half-alt fa-1x'></i><i class='far fa-star fa-3x'></i><i class='far fa-star fa-3x'></i><i class='far fa-star fa-3x'></i><i class='far fa-star fa-3x'></i>"; //1
						arr1[2] = "<i class='fas fa-star fa-3x'></i><i class='far fa-star fa-3x'></i><i class='far fa-star fa-3x'></i><i class='far fa-star fa-3x'></i><i class='far fa-star fa-3x'></i>"; //2
						arr1[3] = "<i class='fas fa-star fa-3x'></i><i class='fas fa-star-half-alt fa-3x'></i><i class='far fa-star fa-3x'></i><i class='far fa-star fa-3x'></i><i class='far fa-star fa-3x'></i>";//3
						arr1[4] = "<i class='fas fa-star fa-3x'></i><i class='fas fa-star fa-3x'></i><i class='far fa-star fa-3x'></i><i class='far fa-star fa-3x'></i><i class='far fa-star fa-3x'></i>";//4
						arr1[5] = "<i class='fas fa-star fa-3x'></i><i class='fas fa-star fa-3x'></i><i class='fas fa-star-half-alt fa-3x'></i><i class='far fa-star fa-3x'></i><i class='far fa-star fa-3x'></i>";//5
						arr1[6] = "<i class='fas fa-star fa-3x'></i><i class='fas fa-star fa-3x'></i><i class='fas fa-star fa-3x'></i><i class='far fa-star fa-3x'></i><i class='far fa-star fa-3x'></i>";//6
						arr1[7] = "<i class='fas fa-star fa-3x'></i><i class='fas fa-star fa-3x'></i><i class='fas fa-star fa-3x'></i><i class='fas fa-star-half-alt fa-3x'></i><i class='far fa-star fa-3x'></i>";//7
						arr1[8] = "<i class='fas fa-star fa-3x'></i><i class='fas fa-star fa-3x'></i><i class='fas fa-star fa-3x'></i><i class='fas fa-star fa-3x'></i><i class='far fa-star fa-3x'></i>";//8
						arr1[9] = "<i class='fas fa-star fa-3x'></i><i class='fas fa-star fa-3x'></i><i class='fas fa-star fa-3x'></i><i class='fas fa-star fa-3x'></i><i class='fas fa-star-half-alt fa-3x'></i>";//9
						arr1[10] = "<i class='fas fa-star fa-3x'></i><i class='fas fa-star fa-3x'></i><i class='fas fa-star fa-3x'></i><i class='fas fa-star fa-3x'></i><i class='fas fa-star fa-3x'></i>";//10

						function getRepliesPaging(page) {
							$
									.getJSON(
											"/movie/replies/cine/" + cc_code
													+ "/" + page,
											function(data) {
												var scoreTotal = data.scoreTotal;
												var total = data.pageMaker.totalCount;
												var result = 0;

												if (total != 0)
													result = (scoreTotal / total)
															.toFixed(1);

												var str = "";
												if (data.replies == "") {
													str += "<li style='text-align:center; margin-top:30px;'> <h4>등록된 댓글이 없습니다.</h4> </li>";
												} else {
													$(data.replies)
															.each(
																	function() {
																		if (this.id != id) {
																			str += "<li data-replyNo='" + this.cr_code + "' class='replyLi'>"
																					+ "<div class='mv-user-review-item' style='width:100%;'>"
																					+ "<div class='user-rate movie-rate movie-rate2' id='star-hjs'>"
																					+ arr[this.cr_score]
																					+ "<span id='star-score'>"
																					+ this.cr_score
																					+ "</span></div>"
																					+ "<div class='user-info' style='width:75%; margin-left:30px;'>"
																					+ "<p> <span style='float:left; font-size:15px;'><strong>"
																					+ this.nickname
																					+ "</strong></span> <span style='float:right;'><strong>"
																					+ this.cr_write_date
																					+ "</strong></span> <br>"
																					+ "<span class='replyText' id='replyContent'>"
																					+ this.cr_content
																					+ "</span></p>"
																					+ "<div style='float:right; margin-top:10px;'>"
																					+ "<button class='ws-btn-thumbs-up' id='ws-cnt-tup' style='margin-left:10px;'><i class='far fa-thumbs-up' aria-hidden='true'></i> "
																					+ this.cr_like
																					+ "</button>"
																					+ "<button class='ws-btn-thumbs-down' id='ws-cnt-tdn' style='margin-left:10px;'><i class='far fa-thumbs-down' aria-hidden='true' ></i> "
																					+ this.cr_dislike
																					+ "</button>"
																					+ "<button class='ws-btn-warning' id='ws-cnt-warning' style='margin-left:10px;'><i class='fa fa-exclamation-triangle' aria-hidden='true'></i> 신고 </button>"
																					+ "</div></div></div></li>";
																		} else {
																			str += "<li data-replyNo='" + this.cr_code + "' class='replyLi'>"
																					+ "<div class='mv-user-review-item' align='center' style='width:100%;'>"
																					+ "<div class='user-rate movie-rate movie-rate2' id='star-hjs'>"
																					+ arr[this.cr_score]
																					+ "<span id='star-score'>"
																					+ this.cr_score
																					+ "</span></div>"
																					+ "<div class='user-info' style='width:75%; margin-left:30px;'>"
																					+ "<p> <span style='float:left; font-size:15px;'><strong>"
																					+ this.nickname
																					+ "</strong></span> <span style='float:right;'><strong>"
																					+ this.cr_write_date
																					+ "</strong></span> <br>"
																					+ "<span class='replyText' id='replyContent'>"
																					+ this.cr_content
																					+ "</span></p>"
																					+ "<div style='float:right; margin-top:10px;'>"
																					+ "<button class='ws-btn-thumbs-up' id='ws-cnt-tup' style='margin-left:10px;'><i class='far fa-thumbs-up' aria-hidden='true' ></i> "
																					+ this.cr_like
																					+ "</button>"
																					+ "<button class='ws-btn-thumbs-down' id='ws-cnt-tdn'style='margin-left:10px;'><i class='far fa-thumbs-down' aria-hidden='true' ></i> "
																					+ this.cr_dislike
																					+ "</button>"
																					+ "<button class='ws-btn-warning' id='ws-cnt-warning'style='margin-left:10px;'><i class='fa fa-exclamation-triangle' aria-hidden='true'></i> 신고 </button>"
																					+ "<button type='button' id='btn-hjs-2' style='margin-left:10px;' class='btn btn-xs btn-success modifyModal' data-toggle='modal' data-target='#modifyModal' style='float:right;''>댓글 수정</button></div>"
																					+ "</div></div></li>";
																		}
																	});
												}

												if (result == 10)
													$(".rate-star").html(
															arr1[10]);
												else if (result >= 9.0
														&& result <= 9.9)
													$(".rate-star").html(
															arr1[9]);
												else if (result >= 8.0
														&& result <= 8.9)
													$(".rate-star").html(
															arr1[8]);
												else if (result >= 7.0
														&& result <= 7.9)
													$(".rate-star").html(
															arr1[7]);
												else if (result >= 6.0
														&& result <= 6.9)
													$(".rate-star").html(
															arr1[6]);
												else if (result >= 5.0
														&& result <= 5.9)
													$(".rate-star").html(
															arr1[5]);
												else if (result >= 4.0
														&& result <= 4.9)
													$(".rate-star").html(
															arr1[4]);
												else if (result >= 3.0
														&& result <= 3.9)
													$(".rate-star").html(
															arr1[3]);
												else if (result >= 2.0
														&& result <= 2.9)
													$(".rate-star").html(
															arr1[2]);
												else if (result >= 0.1
														&& result < 2)
													$(".rate-star").html(
															arr1[1]);
												else
													$(".rate-star").html(
															arr1[0]);

												$("#replies").html(str);
												$(".rv").html(
														total + " Reviews");
												$(".scorediv").html(result);
												printPageNumbers(data.pageMaker);
											});
						}

						function printPageNumbers(pageMaker) {
							var str = "";
							if (pageMaker.prev) {
								str += "<li><a href='"
										+ (pageMaker.startPage - 1)
										+ "'>이전</a></li>";
							}
							for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
								var strCalss = pageMaker.criteria.page == i ? 'class=active'
										: '';
								str += "<li "+strCalss+"><a href='"+i+"'>" + i
										+ "</a></li>";
							}
							if (pageMaker.next) {
								str += "<li><a href='"
										+ (pageMaker.endPage + 1)
										+ "'>다음</a></li>";
							}
							$(".pagination-sm").html(str);
						}

						$(".pagination").on("click", "li a", function(event) {
							event.preventDefault();
							replyPageNum = $(this).attr("href");
							getRepliesPaging(replyPageNum);
						});
					},
					error : function() {
						alert("에러");
					}
				});
	}
</script>


</head>
<body>
	<!-- Start | Section -->
	<div class="hero user-hero" style="margin-top: -190px;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="hero-ct">
						<h1 style="margin-left: 0px; margin-top: 0px; text-align: left;">영화관
							목록</h1>
						<ul style="margin-left: 0px;" class="breadcumb">
							<li class="active"><a style="color: #ccc;"index">영화관</a></li>
							<li style="color: #ccc;"><span class="ion-ios-arrow-right"></span>영화관
								목록</li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</div>

	</div>
	<div class="buster-light" style="margin-top: 100px;">
		<section class="section">
			<!-- 지역 영화관 선택 -->
			<form class="cinema" name="frm1" style="margin-top: -70px;">
				<h1 style="margin-bottom: 20px;">극장정보</h1>
				<select id="brand" name="brand" size="3" onChange="LocalList()"
					style="">
					<option value="CGV">CGV</option>
					<option value="롯데시네마">롯데시네마</option>
					<option value="메가박스">메가박스</option>
				</select> <select id="local" name="local" size="8" onChange="LocalName()">
					<option value="선택">극장을 선택해주세요.</option>
				</select> <select id="local_2" name="local_2" size="8" onChange="getName()">
				</select> <select id="cname" name="cname" size="8" onChange="getCineInfo()">
				</select>

			</form>
			<!-- select box 수정 -->
			<br>
			<div style="width:1168px; height: 320px; background-color: #333; color: #fff; overflow: hidden; ">
				<img style="width:1168px; border: 1px solid #333;" src="http://img.cgv.co.kr/Theater/Theater/2014/1211/CGVgangnam.jpg">
			</div>
				
			<!-- services와 clusterer, drawing 라이브러리 불러오기 -->

			<!-- 영화관 정보 시작 -->
			<div class="cinema_info">
				<input type="hidden" id="cinecode" value="" />
				<div class="cinema_info_text" style="margin-top: 35px;">
					<div class="cinemaName"
						style="font-size: 25px; font-weight: bold; margin-bottom: 15px;"></div>
					<div class="cinemaAdd" style="margin-bottom: 5px;"></div>
					<span class="cinemaPhone"></span> <a href="#" id="home"
						target="_blank" style="margin-left: 10px;"></a>

				<div id="map"
					style="width: 1168px; height: 250px; margin-top: 40px; margin-right: 30px;  clear:both; float: right;"></div>


				<div class="introbox" style="display: none;" id="cgvGang">
					<h2 class="ittit pb30">
						<br>
						<br>
						<img
							src="//images.maxmovie.com/images/common/htitle/cinema_tit2.png"
							alt="극장소개">
					</h2>
					<p class="ittxt">
						365일 24시간 꺼지지 않는 젊음과 열정의 중심지! CGV강남<br>
						<br> 1. 편리한 접근성<br> 강남 문화의 중심지로 자리잡게 될 CGV강남은 지하철 2호선
						11번 출구에서 도보로 3분 거리에 있습니다.<br> <br> 2. 차별화된 인테리어<br>
						장식을 최소화한, 모던하고도 깔끔한 디자인으로 기존의 영화관과는 전혀 다른 편안하고도 안정적인 분위기의 휴식공간을
						제공합니다. <br> <br> 3. 도심 속의 자연 공간<br>도시의 한 복판에서 만날 수
						있는 야외 정원은 삭막한 도심 속에서 깨끗한 자연의 향기를 선사해 드립니다. <br> <br>4.
						Only One 서비스 <br>극장 외부에서도 발권할 수 있는 야외 티켓 매표소 운영<br>천연
						편백나무 향공조 시스템으로 산림욕 효과 체감<br>발권 대기 시간을 알려주는 순번 발권 시스템 <br>무료
						인터넷 이용 및 XBOX 360 체험 존 오픈 예정<br>
					</p>
					<h2 class="ittit pt30">
						<img
							src="//images.maxmovie.com/images/common/htitle/cinema_tit3.png"
							alt="교통편 안내">
					</h2>
					<div class="traffic">
						<div class="tbus">
							- 분당지역<br> 좌석버스 1005-1, 1005-2, 6800, 5500-2<br> 간선버스
							408, 462<br> 광역버스 9404, 9408<br> <br>-강북지역: 간선버스
							140, 144, 145, 471<br> <br>-강서지역: 좌석버스 1500, 간선버스 360<br>
							<br>-강동지역: 간선버스 402, 420, 470, 407<br> <br>-인근경기지역:
							좌석버스 3030, 2002, 2002-1<br> 광역버스 9409, 9500, 9501, <br>
							9503, 9700, 9711<br>
						</div>
						<div class="tsubway">
							2호선 강남역 11번 출구<br> <br>9호선 신논현역 5번출구<br> <br>
						</div>
					</div>
					<h2 class="ittit pt30">
						<img
							src="//images.maxmovie.com/images/common/htitle/cinema_tit4.png"
							alt="주차시설">
					</h2>
					<div class="traffic trbor">
						<div class="tcar">
							CGV강남은 오전 8시~오후 10시 30분까지 발렛 주차 서비스 제공하여, 편리하게 주차 서비스를 받으실 수
							있습니다.<br> <br>주차비는 영화 관람 티켓 소지 시 발렛비 포함 3시간 5,000원이며
							3시간 초과 이용시 1시간당 4,000원씩 추가 요금이 발생합니다. <br> <br>단, 주차공간이
							협소하여 주차가 어려울 수 있으니 대중교통을 이용 해 주시기 바랍니다 <br>
						</div>
					</div>
					<div class="timeex">
						<p class="exrf">잘못된 극장 정보는 고객센터로 문의 주시기 바랍니다.</p>
					</div>
				</div>

				<div class="introbox" style="display: none;" id="cgvjung">
					<h2 class="ittit pb30">
					<br><br>
						<img
							src="//images.maxmovie.com/images/common/htitle/cinema_tit2.png"
							alt="극장소개">
					</h2>
					<p class="ittxt">
						1. 패션과 유행의 중심, 압구정! <br>CGV압구정은 최초의 강남지역 CGV로서, CGV만의 서비스와
						다양한 이벤트로 명품브랜드 이상의 가치를 느끼실 수 있습니다. <br> <br>2. CGV만의
						차별화된 서비스와 시설<br>- 4Way 입체음향 시스템<br>- 삼림욕 효과의 편백향 공조 시스템<br>-
						24시간 ARS 시스템 및 좌석까지 선택할 수 있는 편리한 인터넷 예매 시스템<br>- 기다림마저 여유로운 각
						상영관별 전용 로비<br>- First Class 서비스 그 이상! CGV골드클래스 (6월 오픈 예정) <br>
						<br>3. 차별화된 인테리어 <br>각 상영관 별 개성있고 다양한 테마는 제3의 생활문화공간으로서의
						CGV압구정을 경험하실 수 있습니다. <br> <br>4. 편리한 접근성<br>3호선
						압구정역 3번 출구에서 도보로 1분! <br>
					</p>
					<h2 class="ittit pt30">
						<img
							src="//images.maxmovie.com/images/common/htitle/cinema_tit3.png"
							alt="교통편 안내">
					</h2>
					<div class="traffic">
						<div class="tbus">
							-압구정역(CGV앞) : 간선(B) 147,148<br>-국민은행 압구정지점 : 광역(R) 6800<br>-국민은행
							압구정지점 : 간선(B) 147,148<br>-현대백화점(압구정) : 지선(G) 강남07<br>-압구정역
							: 지선(G) 강남07, 4419, <br>-압구정역 : 간선(B) 606<br> <br>-현대아파트(압구정역)
							: 광역(R) 9407<br>-현대아파트(압구정역) 간선(B) :
							143,148,240,301,361,362,472<br>-현대아파트(압구정역) 지선(G) :
							2411,3422,4312,4418,4419,4422<br>-현대아파트(압구정역) 순환(Y) : 41<br>
						</div>
						<div class="tsubway">
							- 지하철 3호선 압구정역 3번 출구 이용<br> <br> <br>
						</div>
					</div>
					<h2 class="ittit pt30">
						<img
							src="//images.maxmovie.com/images/common/htitle/cinema_tit4.png"
							alt="주차시설">
					</h2>
					<div class="traffic trbor">
						<div class="tcar">
							유<br>1. 위치 : CGV압구정 건물 (기계식)<br> <br>2. 요금 : 3시간까지
							3,500원<br>- 반드시 매표소에서 주차권에 확인도장을 받으셔야 위 요금이 적용됩니다.<br>-
							기본요금 초과시 : 15분당 1,000원<br> <br>3. 이용시간<br>- 입차 :
							당일 첫 영화 상영시간 30분 전<br>- 출차 : 당일 마지막 영화 종영 후 30분<br> <br>4.
							기타정보<br>- 기계식 주차장으로 SUV, RV차량 및 2,500CC이상 승용차의 경우 입차가 제한 될 수
							있사오니,<br> 이 점 꼭 유의해 주십시오.<br>- 주차가 불가능할때에는 인근 공영주차장을
							이용해 주십시오.<br> (공영주차장 : 동호대교 남단, 현대백화점 압구정점 옆 - 단 CGV 이용에 따른
							할인혜택은 없습니다.)<br>- 총 주차 가능 대수 : 약 150대<br> <br>
						</div>
					</div>
					<div class="timeex">
						<p class="exrf">잘못된 극장 정보는 고객센터로 문의 주시기 바랍니다.</p>
					</div>
				</div>

				<div class="introbox" style="display: none;" id="cgvchung">
					<h2 class="ittit pt30">
						<br>
						<br>
						<br>
						<br> <img
							src="//images.maxmovie.com/images/common/htitle/cinema_tit3.png"
							alt="교통편 안내">
					</h2>
					<div class="traffic">
						<div class="tbus">
							- 씨네시티 앞<br> 4212번(영동소방파출소, 호림아트센터앞),<br> 145번(씨네시티,
							호림아트센터앞)<br> <br>- 난타 전용극장 앞<br> :1411번, 1224번,
							2411번, 4312번, 7015번, 4422번, 200번, 361번, 472번, 172번<br> <br>-
							늘봄공원 앞: 4422번<br> <br>- 도산공원 앞: 1011번, 3422번, 405번
						</div>
						<div class="tsubway">
							- 분당선 압구정로데오역 5번출구(도보 10분)<br>- 7호선 강남구청역 3번 출구 학동사거리 방면(도보
							10분)<br>- 3호선 압구정역 3번 출구(도보 20분)<br>- 3호선 신사역 1번 출구에서
							일반버스 환승(4212, 145) 후<br> 호림아트센터 하차<br> <br>
						</div>
					</div>
					<h2 class="ittit pt30">
						<img
							src="//images.maxmovie.com/images/common/htitle/cinema_tit4.png"
							alt="주차시설">
					</h2>
					<div class="traffic trbor">
						<div class="tcar">
							유<br>보다 편리한 이용을 위해 대중교통을 이용해 주시고 발렛파킹의 경우 가능한 차량수가 한정적이므로 주변
							교통상황에 따라 입,출차 시간이지연될 수 있습니다.<br> <br> [요금 안내] <br>1.
							발렛파킹 이용 시<br>- 발렛 입차+출차<br>- 주차비3시간 5,000 + 발렛비 5,000 =
							10,000원<br>- 3시간 초과 시 10분당 1,000원 부과<br> <br>2.
							셀프주차(호림아트센터 지하 4층 주차장 이용)이용 시<br>- 5,000원(4시간)(평일 19:00 ~
							23:00, 주말 6:00 ~ 23:00)<br>- 4시간 초과 시 2시간 2,000원<br>- 총
							6시간 주차가능<br> <br>3. 셔틀버스 이용 시<br>- 5,000원(3시간)<br>-
							발렛 입차 Only<br>- 영화 관람 전 발렛직원에게 차를 맡기세요<br>- 관람 후 무료셔틀로
							고객님의 차가 주차된 곳까지<br> 안내해 드립니다.(지하주차장 제외)<br> <br>
							[셔틀버스 운행안내] <br>- 평일 PM 3:00 ~ PM10:00 / 주말 PM 2:00 ~ PM
							11:00 <br>- 차량 탑승 위치: 청담씨네시티 앞<br>- 차량 하차 위치: 강남파라곤
							버스정류장<br>- 소요시간: 약 2분
						</div>
					</div>
					<div class="timeex">
						<p class="exrf">잘못된 극장 정보는 고객센터로 문의 주시기 바랍니다.</p>
					</div>
				</div>

				<div class="introbox" style="display: none;" id="lottebroad">
					<h2 class="ittit pt30">
						<img
							src="//images.maxmovie.com/images/common/htitle/cinema_tit3.png"
							alt="교통편 안내">
					</h2>
					<div class="traffic">
						<div class="tbus">
							순환(노랑) 41<br>지선(녹색) 1141,4212,4417,4421,4422,4424<br>간선(파랑)
							145, 405<br>광역(빨강) 9405<br>
						</div>
						<div class="tsubway">지하철 3호선 신사역 1번 출구 전방 20M</div>
					</div>
					<div class="timeex">
						<p class="exrf">잘못된 극장 정보는 고객센터로 문의 주시기 바랍니다.</p>
					</div>
				</div>

				<div class="introbox" style="display: none;" id="megacoex">
					<h2 class="ittit pb30">
					<br><br>
						<img
							src="//images.maxmovie.com/images/common/htitle/cinema_tit2.png"
							alt="극장소개">
					</h2>
					<p class="ittxt">
						메가박스 코엑스점은 2000년에 개관했다. 멀티플렉스 체인점인 메가박스의 제1호점이다. 개관 당시 국내 최대 규모의
						상영관과 초현대식 시설을 갖춰 화제를 불러 모았다. 그리고 많은 관객들을 강남 지역으로 몰리게 하는 데 혁혁한 공을
						세웠다. 지금은 멀티플렉스의 대표격 정도로 인식되고 있다. <br> <br>총 16개 상영관 중
						500석 규모의 대형관이 3개, 중형관(300석) 8개,소형관(200석 이하) 5개로 구성되어 있다. 인터락 시스템을
						영사 시설에 도입해 1개 프린트로 6개관에서 동시 상영할 수 있다. 또 국내 최초로 고음과 저음, 그리고 중음을 보강한
						3-way 스피커를 설치해 실감나는 음향을 선사한다. 또 음향 시설에 있어 아나로그와 디지털 음향을 완벽하게 재현,
						8채널 분리 방식을 채택했다. 그리고 영국제 Perl Lux 스크린을 설치했다. <br> <br>좌석은
						스타디움식으로 설계되었는데 계단 높이 330mm, 좌석 간격 전후 1,050mm, 좌석폭을 560m 로 정해 안락한
						영화 관람을 돕고 있다. 코엑스 몰에 입점해 있는 다양한 위락시설이 영화 관람을 전후로 해서 원스탑 엔터테인먼트를
						제공하다.<br>
					</p>
					<h2 class="ittit pt30">
						<img
							src="//images.maxmovie.com/images/common/htitle/cinema_tit3.png"
							alt="교통편 안내">
					</h2>
					<div class="traffic">
						<div class="tbus">
							간선(파랑): <br>143, 146, 301, 361, 362, 401, 640<br> <br>지선(초록):
							<br>2225, 2411,2413, 3217, 3218, 3411,<br>3414, 3415,
							3417, 4411, 4418, 4419<br> <br>광역(주황): 9407, 9413
						</div>
						<div class="tsubway">
							ㆍ지하철<br>2호선 삼성역 5, 6번 출구<br> <br>
						</div>
					</div>
					<h2 class="ittit pt30">
						<img
							src="//images.maxmovie.com/images/common/htitle/cinema_tit4.png"
							alt="주차시설">
					</h2>
					<div class="traffic trbor">
						<div class="tcar">
							ㆍ주차규모<br>2,000 ~ 3,000대<br> <br>ㆍ주차요금<br>1)당일
							영화 티켓+주차권 제시시 할인권 구매 가능<br>2)구매 장소-극장내[회원 전용 센터]<br>3)구매금액-3시간
							4,000원&lt;주간&gt;<br> 3시간 3,000원&lt;야간~22시 이후 입고&gt;<br>4)추가
							요금-3시간 이후 15분에 1,000원 적용<br>5)영화 상영시간 30분 전부터 구매 가능<br>
							<br>ㆍ주차장 위치<br>코엑스몰 주차장 이용
						</div>
					</div>
					<div class="timeex">
						<p class="exrf">잘못된 극장 정보는 고객센터로 문의 주시기 바랍니다.</p>
					</div>
				</div>
			</div>

			<!-- 영화관 정보 끝 -->


			<!-- 극장 정보 탭  시작 -->
			<div id="review" class="review" style="margin-top: 0px;">
				<div style="display: none;">
					<h1>3사 평점</h1>
					<div class="total-movie-rate">
						<span class="total-movie-rate-span">cgv</span>
						<div class="total-rate">
							<!-- <i class="fas fa-star fa-3x"></i> -->
							<p>
								<span>8.5</span> /10
							</p>
						</div>
						<div class="total-rate-star" width="600px">
							<i class="fas fa-star fa-1x"></i> <i class="fas fa-star fa-1x"></i>
							<i class="fas fa-star fa-1x"></i> <i
								class="fas fa-star-half-alt fa-1x"></i> <i
								class="far fa-star fa-1x"></i>
						</div>
					</div>
					<!-- lotte cinema -->
					<div class="total-movie-rate">
						<span class="total-movie-rate-span">롯데시네마</span>
						<div class="total-rate">
							<!-- <i class="fas fa-star fa-3x"></i> -->
							<p>
								<span>8.5</span> /10
							</p>
						</div>
						<div class="total-rate-star" width="600px">
							<i class="fas fa-star fa-1x"></i> <i class="fas fa-star fa-1x"></i>
							<i class="fas fa-star fa-1x"></i> <i
								class="fas fa-star-half-alt fa-1x"></i> <i
								class="far fa-star fa-1x"></i>
						</div>
					</div>
					<!-- megabox -->
					<div class="total-movie-rate">
						<span class="total-movie-rate-span">메가박스</span>
						<div class="total-rate">
							<!-- <i class="fas fa-star fa-3x"></i> -->
							<p>
								<span>8.5</span> /10
							</p>
						</div>
						<div class="total-rate-star" width="600px">
							<i class="fas fa-star fa-1x"></i> <i class="fas fa-star fa-1x"></i>
							<i class="fas fa-star fa-1x"></i> <i
								class="fas fa-star-half-alt fa-1x"></i> <i
								class="far fa-star fa-1x"></i>
						</div>
					</div>
				</div>

				<div class="blockbuster-rate"
					style="margin-top: 20px; margin-bottom: 30px;">
					<h1 style="text-align: left;">영화관 평점</h1>
					<div class="movie-rate" style="margin: auto;">
						<div class="rate">
							<!-- <i class="fas fa-star fa-3x"></i> -->
							<p>
								<span class="scorediv"> 0 </span> <span style="font-size: 15px;">/10</span><br>
								<span class="rv"> </span>
							</p>
						</div>
						<div class="rate-star" width="600px">
							<i class='far fa-star fa-3x'></i> <i class='far fa-star fa-3x'></i>
							<i class='far fa-star fa-3x'></i> <i class='far fa-star fa-3x'></i>
							<i class='far fa-star fa-3x'></i>
						</div>
					</div>
				</div>

				<hr>

				<div class="review-write" style="text-align: center;">
					<h3>리뷰 등록</h3>
					<div class="review-write-star">
						<fieldset class="rating">
							<input type="radio" id="star5" name="rating" value="10" /> <label
								class="full" for="star5" title="10"></label> <input type="radio"
								id="star4half" name="rating" value="9" /> <label class="half"
								for="star4half" title="9"></label> <input type="radio"
								id="star4" name="rating" value="8" /> <label class="full"
								for="star4" title="8"></label> <input type="radio"
								id="star3half" name="rating" value="7" /><label class="half"
								for="star3half" title="7"></label> <input type="radio"
								id="star3" name="rating" value="6" /> <label class="full"
								for="star3" title="6"></label> <input type="radio"
								id="star2half" name="rating" value="5" /> <label class="half"
								for="star2half" title="5"></label> <input type="radio"
								id="star2" name="rating" value="4" /> <label class="full"
								for="star2" title="4"></label> <input type="radio"
								id="star1half" name="rating" value="3" /><label class="half"
								for="star1half" title="3"></label> <input type="radio"
								id="star1" name="rating" value="2" /><label class="full"
								for="star1" title="2"></label> <input type="radio" id="starhalf"
								name="rating" value="1" /><label class="half" for="starhalf"
								title="1"></label>
						</fieldset>
					</div>
					<div class="review-write-input">
						<textarea rows="3" id="newReplyText" maxlength="300"
							name="replyText" placeholder="댓글 내용을 입력해주세요"></textarea>
					</div>
					<div class="review-write-button">
						<button class="btn" id="btn-hjs">등록</button>
					</div>
					<hr class="mv-user-review-hr">
				</div>

				<div class="content-wrapper">
					<section>
						<div class="modal fade" id="modifyModal" role="dialog">
							<div class="modal-dialog" style="margin-top: 100px;">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title">댓글 수정창</h4>
									</div>

									<div class="modal-body">
										<div class="form-group">
											<label for="replyNo" style="margin-bottom: 10px;"><strong>댓글
													번호</strong></label> <input class="form-control" id="replyNo" name="replyNo"
												readonly>
										</div>

										<div class="form-group">
											<label for="replyText" style="margin-bottom: 10px;"><strong>댓글
													내용</strong></label>
											<textarea class="form-control" id="replyText"
												name="replyText" placeholder="댓글 내용을 입력해주세요"
												style="resize: none; height: 100px;"></textarea>
										</div>

									</div>

									<div class="modal-footer">
										<button type="button" id='btn-hjs'
											class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
										<button type="button" id='btn-hjs'
											class="btn btn-success modalModBtn">수정</button>
										<button type="button" id='btn-hjs'
											class="btn btn-danger modalDelBtn" data-dismiss="modal">삭제
										</button>
									</div>
								</div>
							</div>
						</div>

						<div class="box box-primary">
							<div class="box-footer">
								<ul id="replies">

								</ul>
							</div>

							<div class="box-footer">
								<div class="text-center">
									<ul class="pagination pagination-sm no-margin">

									</ul>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
			<!-- 극장 정보 탭  끝 -->

		</section>
	</div>
	<!-- END | Section -->

	<%@ include file="../footer1.jsp"%>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<%@ include file="../footer2.jsp"%>