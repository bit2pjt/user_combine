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
	<link rel="stylesheet" href="<c:url value="/resources/css/yj_style.css" />">
<%@ include file="../header2.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f335bb208b909138d6a0bdf1ab13b4ca&libraries=services,clusterer,drawing"></script>
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
				$("#home").html("<strong style='color:black;'> 홈페이지 이동 </strong>");
				$(".cinemaPhone").text("TEL  " + data.cc_PHONE + "  |  " + data.cc_THEATERS + "관 / " + data.cc_SEATS + "석");
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
				
				var replyPageNum = 1;
			    var cc_code = data.cc_CODE;
			    //getReplies();
			    getRepliesPaging(replyPageNum);
				
			    $("#btn-hjs").on("click", function () {
			    	var session = "${sessionyn}";
			        var replyText = $("#newReplyText");
			        var cr_content = replyText.val();
			        var cr_score = $(".review-write-star input[type='radio']:checked").val();
			        
			        if( session == "") {
					 	alert("로그인 하셔야 이용하실수 있습니다.");
					 	location.href="index";
					 	return false;
					}
			        
			        if(cr_content == "") {
			        	alert("댓글 내용을 입력해주세요!");
			        	return false;
			        }
			        
			       
			        if(typeof(cr_score) == "undefined") {
			        	alert("별점을 선택해주세요!");
			        	return false;
			        }
			        
			        $.ajax({
			            type : "post",
			            url : "/movie/replies/cine/",
			            headers : {
			                "Content-type" : "application/json",
			                "X-HTTP-Method-Override" : "POST"
			            },
			            dataType : "text",
			            data : JSON.stringify({
			            	cc_code : cc_code,
			            	cr_content : cr_content,
			            	cr_score : cr_score
			            }),
			            success : function (result) {
			                if (result == "regSuccess") {
			                    alert("댓글 등록 완료!");
			                }
			                //getReplies();
			                getRepliesPaging(replyPageNum);
			                replyText.val("");
			                $(".review-write-star input[type='radio']").prop("checked", false);
			            }
			        });
			    });
				
			    $("#replies").on("click", ".replyLi button", function () { // 댓글의 수정 버튼 클릭시
			        var reply = $(this).parent().parent().parent().parent(); // 댓글의 li
			        var replyNo = reply.attr("data-replyNo"); // 댓글의 번호
			        var replyText = reply.find(".replyText").text(); //댓글의 내용
			        $("#replyNo").val(replyNo); // 댓글 수정창의 댓글번호에 넣음
			        $("#replyText").val(replyText); // 댓글 수정창의 댓글내용에 넣음
			    });
			    
			    
			    $("#replies").on("click", ".replyLi .ws-btn-thumbs-up", function () { // 댓글의 수정 버튼 클릭시
			    	var reply = $(this).parent().parent().parent().parent(); // 댓글의 li
			        var cr_code = reply.attr("data-replyNo"); // 댓글의 번호
			        var present = $(this).parent().find(".ws-btn-thumbs-up");
			        var session = "${sessionyn}";
			        //var bf_rno = $("#replies > li");
			        //alert($(this).parent().find(".ws-btn-thumbs-up").text());
			     	if( session == "") {
			 		 	alert("로그인 하셔야 이용하실수 있습니다.");
			 		 	location.href="index";
			 		 	return false;
			 		 }
			 		$.ajax({
			 			url:"CineReplyReco",
			 			data: {cr_code: cr_code, type: 1},
			 			dataType: "text",
			 			type:"post",
			 			success: function(data) {
			 				if(data == "fail") {
			 					alert("이미 추천/비추천을 누르셨습니다.");
			 					return false;
			 				}else {
			 					present.html("<i class='far fa-thumbs-up' aria-hidden='true' ></i>  " + data);
			 				}
			 			},
			 			error: function() {
			 				alert("에러");
			 			}
			 		});
			 			
				});
			    
			    $("#replies").on("click", ".replyLi .ws-btn-thumbs-down", function () { // 댓글의 수정 버튼 클릭시
			    	var reply = $(this).parent().parent().parent().parent(); // 댓글의 li
			        var cr_code = reply.attr("data-replyNo"); // 댓글의 번호
			        var present = $(this).parent().find(".ws-btn-thumbs-down");
			        var session = "${sessionyn}";
			        //var bf_rno = $("#replies > li");
			        //alert($(this).parent().find(".ws-btn-thumbs-up").text());
			     	if( session == "") {
			 		 	alert("로그인 하셔야 이용하실수 있습니다.");
			 		 	location.href="index";
			 		 	return false;
			 		 }
			 		$.ajax({
			 			url:"CineReplyReco",
			 			data: {cr_code: cr_code, type: 0},
			 			dataType: "text",
			 			type:"post",
			 			success: function(data) {
			 				if(data == "fail") {
			 					alert("이미 추천/비추천을 누르셨습니다.");
			 					return false;
			 				}else {
			 					present.html("<i class='far fa-thumbs-down' aria-hidden='true' ></i> " + data);
			 				}
			 			},
			 			error: function() {
			 				alert("에러");
			 			}
			 		});
			 			
				});
			    
			    $("#replies").on("click", ".replyLi .ws-btn-warning", function () { // 댓글의 수정 버튼 클릭시
			    	var reply = $(this).parent().parent().parent().parent(); // 댓글의 li
			        var cr_code = reply.attr("data-replyNo"); // 댓글의 번호
			        var present = $(this).parent().find(".ws-btn-warning");
			        var session = "${sessionyn}";
			        //var bf_rno = $("#replies > li");
			        //alert($(this).parent().find(".ws-btn-thumbs-up").text());
			     	if( session == "") {
			 		 	alert("로그인 하셔야 이용하실수 있습니다.");
			 		 	location.href="index";
			 		 	return false;
			 		 }
			     	
			 		$.ajax({
			 			url:"CineReplyWarn",
			 			data: {cr_code: cr_code},
			 			dataType: "text",
			 			type:"post",
			 			success: function(data) {
			 				if(data == "success")
									alert("신고 되었습니다.");
								else
									alert("이미 신고 하셨습니다.");
			 			},
			 			error: function() {
			 				alert("에러");
			 			}
			 		});
			 			
				});
				
			    $(".modalDelBtn").on("click", function () {
			        var cr_code = $("#replyNo").val();
			        $.ajax({
			            type : "delete",
			            url : "/movie/replies/cine/" + cr_code,
			            headers : {
			                "Content-type" : "application/json",
			                "X-HTTP-Method-Override" : "DELETE"
			            },
			            dataType : "text",
			            success : function (result) {
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
				
			    $(".modalModBtn").on("click", function () {
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
			            data : JSON.stringify(
			                {cr_content : cr_content}
			            ),
			            dataType : "text",
			            success : function (result) {
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
				arr[0] = "<i class='far fa-star fa-1x'></i><i class='far fa-star fa-1x'></i><i class='far fa-star fa-1x'></i><i class='far fa-star fa-1x'></i><i class='far fa-star fa-1x'></i>"; 	//0
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
				arr1[0] = "<i class='far fa-star fa-3x'></i><i class='far fa-star fa-3x'></i><i class='far fa-star fa-3x'></i><i class='far fa-star fa-3x'></i><i class='far fa-star fa-3x'></i>"; 	//0
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
			        $.getJSON("/movie/replies/cine/" + cc_code + "/" + page, function (data) {
			        	var scoreTotal = data.scoreTotal;
						var total = data.pageMaker.totalCount;
						var result = 0;
						
						if(total != 0)
							result = (scoreTotal/total).toFixed(1);
						
						var str = "";
						if(data.replies == "") {
			           		str += "<li style='text-align:center; margin-top:30px;'> <h4>등록된 댓글이 없습니다.</h4> </li>";	
						}else {
			                $(data.replies).each(function () {
			                	if(this.id != id) {
				                	str += "<li data-replyNo='" + this.cr_code + "' class='replyLi'>"
					        	   		+	"<div class='mv-user-review-item' style='width:100%;'>"
					        	 		+	"<div class='user-rate movie-rate movie-rate2' id='star-hjs'>"
					        			+	arr[this.cr_score] + "<span id='star-score'>" + this.cr_score + "</span></div>" 
					        			+	"<div class='user-info' style='width:75%; margin-left:30px;'>"
					        			+	"<p> <span style='float:left; font-size:15px;'><strong>"+ this.nickname +"</strong></span> <span style='float:right;'><strong>" + this.cr_write_date + "</strong></span> <br>"
					        			+	"<span class='replyText' id='replyContent'>" + this.cr_content + "</span></p>"
					        			+	"<div style='float:right; margin-top:10px;'>"
					        			+	"<button class='ws-btn-thumbs-up' id='ws-cnt-tup' style='margin-left:10px;'><i class='far fa-thumbs-up' aria-hidden='true'></i> "+ this.cr_like +"</button>"
					        			+	"<button class='ws-btn-thumbs-down' id='ws-cnt-tdn' style='margin-left:10px;'><i class='far fa-thumbs-down' aria-hidden='true' ></i> " +  this.cr_dislike + "</button>"
					        			+	"<button class='ws-btn-warning' id='ws-cnt-warning' style='margin-left:10px;'><i class='fa fa-exclamation-triangle' aria-hidden='true'></i> 신고 </button>"
					        			+	"</div></div></div></li>";
			                	}else {
			                		str += "<li data-replyNo='" + this.cr_code + "' class='replyLi'>"
				        	   		+	"<div class='mv-user-review-item' align='center' style='width:100%;'>"
				        	 		+	"<div class='user-rate movie-rate movie-rate2' id='star-hjs'>"
				        			+	arr[this.cr_score] + "<span id='star-score'>" + this.cr_score + "</span></div>" 
				        			+	"<div class='user-info' style='width:75%; margin-left:30px;'>"
				        			+	"<p> <span style='float:left; font-size:15px;'><strong>"+ this.nickname +"</strong></span> <span style='float:right;'><strong>" + this.cr_write_date + "</strong></span> <br>"
				        			+	"<span class='replyText' id='replyContent'>" + this.cr_content + "</span></p>"
				        			+	"<div style='float:right; margin-top:10px;'>"
				        			+	"<button class='ws-btn-thumbs-up' id='ws-cnt-tup' style='margin-left:10px;'><i class='far fa-thumbs-up' aria-hidden='true' ></i> "+ this.cr_like +"</button>"
				        			+	"<button class='ws-btn-thumbs-down' id='ws-cnt-tdn'style='margin-left:10px;'><i class='far fa-thumbs-down' aria-hidden='true' ></i> " +  this.cr_dislike + "</button>"
				        			+	"<button class='ws-btn-warning' id='ws-cnt-warning'style='margin-left:10px;'><i class='fa fa-exclamation-triangle' aria-hidden='true'></i> 신고 </button>"
				        			+	"<button type='button' id='btn-hjs-2' style='margin-left:10px;' class='btn btn-xs btn-success modifyModal' data-toggle='modal' data-target='#modifyModal' style='float:right;''>댓글 수정</button></div>"
				        			+	"</div></div></li>";
			                	}
			                   });
			             }
						
						if(result == 10)
							$(".rate-star").html(arr1[10]);
						else if(result >= 9.0 && result <= 9.9)
							$(".rate-star").html(arr1[9]);
						else if(result >= 8.0 && result <= 8.9)
							$(".rate-star").html(arr1[8]);
						else if(result >= 7.0 && result <= 7.9)
							$(".rate-star").html(arr1[7]);
						else if(result >= 6.0 && result <= 6.9)
							$(".rate-star").html(arr1[6]);
						else if(result >= 5.0 && result <= 5.9)
							$(".rate-star").html(arr1[5]);
						else if(result >= 4.0 && result <= 4.9)
							$(".rate-star").html(arr1[4]);
						else if(result >= 3.0 && result <= 3.9)
							$(".rate-star").html(arr1[3]);
						else if(result >= 2.0 && result <= 2.9)
							$(".rate-star").html(arr1[2]);
						else if(result >= 0.1 && result < 2)
							$(".rate-star").html(arr1[1]);
						else
							$(".rate-star").html(arr1[0]);
						
						$("#replies").html(str);
						$(".rv").html(total + " Reviews");
						$(".scorediv").html(result);
						printPageNumbers(data.pageMaker);
			        });
			    }
				
			    function printPageNumbers(pageMaker) {
			        var str = "";
			        if (pageMaker.prev) {
			            str += "<li><a href='"+(pageMaker.startPage-1)+"'>이전</a></li>";
			        }
			        for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			            var strCalss = pageMaker.criteria.page == i ? 'class=active' : '';
			            str += "<li "+strCalss+"><a href='"+i+"'>"+i+"</a></li>";
			        }
			        if (pageMaker.next) {
			            str += "<li><a href='"+(pageMaker.endPage + 1)+"'>다음</a></li>";
			        }
			        $(".pagination-sm").html(str);
			    }
			    
			    $(".pagination").on("click", "li a", function (event) {
			        event.preventDefault();
			        replyPageNum = $(this).attr("href");
			        getRepliesPaging(replyPageNum);
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
<div class="buster-light" style="margin-top:150px;">
<section class="section">
<!-- 지역 영화관 선택 -->	
<form class="cinema_select" name="frm1">
<h1 style="margin-bottom:20px;"> 극장정보 </h1>
<select id="brand" name="brand" size="3" onChange="LocalList()">
	<option value="CGV"> CGV </option>
	<option value="롯데시네마"> 롯데시네마 </option>
	<option value="메가박스"> 메가박스 </option>
</select>

<select id="local" name="local" size="8"  onChange="LocalName()">
	<option value="선택"> 극장을 선택해주세요. </option>
</select>

<select id="local_2" name="local_2" size="8" onChange = "getName()">
</select>

<select id="cname" name="cname" size="8" onChange="getCineInfo()">
</select>

</form>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->

<!-- 영화관 정보 시작 -->
<div class="cinema_info" >
	<input type="hidden" id="cinecode"value=""/>
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
									<div id="review" class="review">
											<div style="display:none;">
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
														<i class="fas fa-star fa-1x"></i> <i
															class="fas fa-star fa-1x"></i> <i
															class="fas fa-star fa-1x"></i> <i
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
														<i class="fas fa-star fa-1x"></i> <i
															class="fas fa-star fa-1x"></i> <i
															class="fas fa-star fa-1x"></i> <i
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
														<i class="fas fa-star fa-1x"></i> <i
															class="fas fa-star fa-1x"></i> <i
															class="fas fa-star fa-1x"></i> <i
															class="fas fa-star-half-alt fa-1x"></i> <i
															class="far fa-star fa-1x"></i>
													</div>
												</div>
												</div>
												<hr class="mv-user-review-hr">
												<div class="blockbuster-rate" style="margin-top:20px; margin-bottom:30px;">
													<h1 style="text-align:left;">영화관 평점</h1>
													<div class="movie-rate" style="margin:auto;">
														<div class="rate">
															<!-- <i class="fas fa-star fa-3x"></i> -->
															<p>
																<span class="scorediv"> 0 </span> <span style="font-size:15px;">/10</span><br> 
																<span class="rv">
																	
																</span>
															</p>
														</div>
														<div class="rate-star" width="600px">
															<i class='far fa-star fa-3x'></i>
															<i class='far fa-star fa-3x'></i>
															<i class='far fa-star fa-3x'></i>
															<i class='far fa-star fa-3x'></i>
															<i class='far fa-star fa-3x'></i>
														</div>
													</div>
												</div>

												<hr>

												<div class="review-write" style="text-align:center;">
													<h3>리뷰 등록</h3>
													<div class="review-write-star">
														<fieldset class="rating">
															<input type="radio" id="star5" name="rating" value="10" /> <label class="full" for="star5" title="10"></label> 
															<input type="radio" id="star4half" name="rating" value="9"/> <label class="half" for="star4half" title="9"></label> 
															<input type="radio" id="star4" name="rating" value="8"/> <label class="full" for="star4" title="8"></label> 
															<input type="radio" id="star3half" name="rating" value="7"/><label class="half" for="star3half" title="7"></label> 
															<input type="radio" id="star3" name="rating" value="6"/> <label class="full" for="star3" title="6"></label> 
															<input type="radio" id="star2half" name="rating" value="5" /> <label class="half" for="star2half" title="5"></label> 
															<input type="radio" id="star2" name="rating" value="4"/> <label class="full" for="star2" title="4"></label> 
															<input type="radio" id="star1half" name="rating" value="3"/><label class="half" for="star1half" title="3"></label> 
															<input type="radio" id="star1" name="rating" value="2"/><label class="full" for="star1" title="2"></label> 
															<input type="radio" id="starhalf" name="rating" value="1"/><label class="half" for="starhalf" title="1"></label>
														</fieldset>
													</div>
													<div class="review-write-input">
														<textarea rows="3" id="newReplyText" maxlength="300" name="replyText" placeholder="댓글 내용을 입력해주세요"></textarea>
													</div>
													<div class="review-write-button">
														<button class="btn" id="btn-hjs">등록</button>
													</div>
													<hr class="mv-user-review-hr">
												</div>
												
												<div class="content-wrapper">		
													<section>
											            <div class="modal fade" id="modifyModal" role="dialog">
											                <div class="modal-dialog" style="margin-top:100px;">
											                    <div class="modal-content">
											                        <div class="modal-header">
											                            <h4 class="modal-title">댓글 수정창</h4>
											                        </div>
											                        
											                        <div class="modal-body">
												                        <div class="form-group">
												                            <label for="replyNo" style="margin-bottom:10px;"><strong>댓글 번호</strong></label>
												                            <input class="form-control" id="replyNo" name="replyNo" readonly>
												                        </div>
											                        
											                            <div class="form-group">
											                                <label for="replyText" style="margin-bottom:10px;"><strong>댓글 내용</strong></label>
											                                <textarea class="form-control" id="replyText" name="replyText" placeholder="댓글 내용을 입력해주세요" style="resize:none; height:100px;"></textarea>
											                            </div>
											
											                        </div>
											                        
											                        <div class="modal-footer">
											                            <button type="button" id='btn-hjs' class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
											                            <button type="button" id='btn-hjs' class="btn btn-success modalModBtn">수정</button>
											                            <button type="button" id='btn-hjs' class="btn btn-danger modalDelBtn" data-dismiss="modal">삭제 </button>
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

