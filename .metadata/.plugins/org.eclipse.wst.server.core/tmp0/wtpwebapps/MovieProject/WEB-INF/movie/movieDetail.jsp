<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--
/**
* @Class Name :  movieDetail.jsp
* @Description : 영화 세부정보
* @Modification Information
* @
* @  수정일      수정자              수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.03     한유진      최초생성
* @ 2019.07.09     한유진      jsp로 변경
* @ 2019.07.15     한유진      7/12 회의결과 수정
* @ 2019.07.22     한유진    	 header, footer 수정(1,2 버전으로 변경)
*
* @author BIT 116기 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by bit 2조 All right reserved.
*/
-->
<%@ include file="../header1.jsp"%>
	<link rel="stylesheet" href="<c:url value="/resources/css/yj_style.css" />">
<%@ include file="../header2.jsp" %>

<div class="buster-light">
	<div class="hero mv-single-hero">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<!-- <h1> movie listing - list</h1>
				<ul class="breadcumb">
					<li class="active"><a href="#">Home</a></li>
					<li> <span class="ion-ios-arrow-right"></span> movie listing</li>
				</ul> -->
				</div>
			</div>
		</div>
	</div>
	<div class="page-single movie-single movie-single2 movie_single">
		<div class="container">
			<div class="row ipad-width2">
				<div class="col-md-4 col-xs-12">
					<div class="movie-info">
						<div class="movie-title-top1">
							<h2 class="bd-hd">
								${movieInfoVO.mi_ktitle}<span>2015</span>
							</h2>
							<br>
							<h3>${movieInfoVO.mi_etitle}</h3>
							<br>
						</div>
					</div>
					<div class="movie-img" >
						<img src="${movieInfoVO.mi_poster}" alt="포스터" style="float:right">
					</div>
				</div>
				<div class="col-md-8 col-sm-12 col-xs-12">
					<div class="movie-single-ct main-content">
						<div class="movie-info">
							<div class="movie-title-top2">
								<h1 class="bd-hd">
									${movieInfoVO.mi_ktitle} 
									<span><fmt:formatDate value="${movieInfoVO.mi_releaseday}" pattern="yyyy"/></span>
								</h1>
								<h5>${movieInfoVO.mi_etitle}</h5>
								<br>
							</div>
							<table>
								<tr>
									<td width="100px">심의등급 </td>
									<td><span>${movieInfoVO.grade_code}</span></td>
								</tr>
								<tr>
									<td>감독 </td>
									<td><span>${movieInfoVO.mi_director}</span></td>
								</tr>
								<tr>
									<td>배우 </td>
									<td><span>${movieInfoVO.mi_actor}</span></td>
								</tr>
								<tr>
									<td>장르 </td>
									<td><span>${movieInfoVO.mi_gcode}</span></td>
								</tr>
								<tr>
									<td>상영시간 </td>
									<td><span>${movieInfoVO.mi_time}</span></td>
								</tr>
								<tr>
									<td>제작국가 </td>
									<td><span>${movieInfoVO.mi_ccode}</span></td>
								</tr>
							</table>
						</div>
						<div class="movie-tabs">
							<div class="tabs" style="margin-top:10px;">
								<ul class="tab-links tabs-mv">
									&nbsp;
									<li class="active"><a href="#story"> 줄거리 </a></li>
									<li><a href="#video">관련영상</a></li>
									<li><a href="#review"> 리뷰 </a></li>
									<!-- <li><a href="#3rate"> 3사 평점 </a></li> -->
									<li><a href="#" id="btn-hjs-1">예매 정보</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-12 col-xs-12">
					<div class="movie-single-ct main-content">
						<div class="movie-tabs col-md-12">
							<div class="tabs">
								
									<div class="tab-content">
										<!-- start | 줄거리 -->
										<div id="story" class="tab active">
											<div class="row">
												<div class="story-content">
												<pre style="word-break:break-all; text-align:left; width:90%; margin:auto;">${movieInfoVO.mi_story}</pre>	
												</div>
											</div>
										</div>
										<!-- end | 줄거리 -->
										<!-- start | 비디오 -->
										<div id="video" class="tab">
											<div class="row">
												<div class="title-hd-sm">
													<h3>
														관련 동영상
													</h3>
												</div>
												<div class="mvsingle-item media-item">
													<c:forEach items="${movieCrawl}" var="MovieCrawl" varStatus="status">
														<c:if test="${ MovieCrawl.thumnail != null}">
															<div class="vd-item">
																<div class="vd-it">
																	<img class="vd-img"
																		src="${MovieCrawl.thumnail}" alt="">
																	<a class="fancybox-media hvr-grow" href="${MovieCrawl.movieURL}"></a>
																</div>
																<div class="vd-infor">
																	<h6>
																		<a href="#"> ${MovieCrawl.movieTitle}</a>
																	</h6>
																	<p class="time">${MovieCrawl.movieTime}</p>
																</div>
															</div>
														</c:if>
													</c:forEach>
													
												</div>
											</div>
										</div>
										<!-- end | 비디오 -->
										<!-- start | 리뷰 -->
	
										<div id="review" class="tab review">
											<div class="row">
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
													<h1 style="text-align:left;">블록버스터 평점</h1>
													<div class="movie-rate" style="margin:auto;">
														<div class="rate">
															<!-- <i class="fas fa-star fa-3x"></i> -->
															<p>
																<span class="scorediv"> 0 </span> <span style="font-size:15px;">/10</span><br> 
																<span class="rv"></span>
															</p>
														</div>
														<div class="rate-star" width="600px">
															
														</div>
													</div>
												</div>

												<hr>

												<div class="review-write">
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
										</div>
									</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script>
	var replyPageNum = 1;
    var mi_code = "${movieInfoVO.mi_code}";
    //getReplies();
    getRepliesPaging(replyPageNum);
	
    $("#btn-hjs").on("click", function () {
    	var session = "${sessionyn}";
        var replyText = $("#newReplyText");
        var mr_content = replyText.val();
        var mr_score = $(".review-write-star input[type='radio']:checked").val();
        
        if( session == "") {
		 	alert("로그인 하셔야 이용하실수 있습니다.");
		 	location.href="index";
		 	return false;
		}
        
        if(mr_content == "") {
        	alert("댓글 내용을 입력해주세요!");
        	return false;
        }
        
       
        if(typeof(mr_score) == "undefined") {
        	alert("별점을 선택해주세요!");
        	return false;
        }
        
        $.ajax({
            type : "post",
            url : "/movie/replies/info/",
            headers : {
                "Content-type" : "application/json",
                "X-HTTP-Method-Override" : "POST"
            },
            dataType : "text",
            data : JSON.stringify({
            	mi_code : mi_code,
            	mr_content : mr_content,
            	mr_score : mr_score
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
        var mr_code = reply.attr("data-replyNo"); // 댓글의 번호
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
 			url:"MovieReplyReco",
 			data: {mr_code: mr_code, type: 1},
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
        var mr_code = reply.attr("data-replyNo"); // 댓글의 번호
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
 			url:"MovieReplyReco",
 			data: {mr_code: mr_code, type: 0},
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
        var mr_code = reply.attr("data-replyNo"); // 댓글의 번호
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
 			url:"MovieReplyWarn",
 			data: {mr_code: mr_code},
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
        var mr_code = $("#replyNo").val();
        $.ajax({
            type : "delete",
            url : "/movie/replies/info/" + mr_code,
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
        var mr_code = reply.find("#replyNo").val();
        var mr_content = reply.find("#replyText").val();
        $.ajax({
            type : "put",
            url : "/movie/replies/info/" + mr_code,
            headers : {
                "Content-type" : "application/json",
                "X-HTTP-Method-Override" : "PUT"
            },
            data : JSON.stringify(
                {mr_content : mr_content}
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
        $.getJSON("/movie/replies/info/" + mi_code + "/" + page, function (data) {
        	var scoreTotal = data.scoreTotal;
			var total = data.pageMaker.totalCount;
			var result = 0;
			
			if(total != 0)
				result = (scoreTotal/total).toFixed(1);
			
			var str = "";
			if(data.replies == "") {
           		str += "<li style='text-align:center'> <h4>등록된 댓글이 없습니다.</h4> </li>";	
			}else {
                $(data.replies).each(function () {
                	if(this.id != id) {
                		str += "<li data-replyNo='" + this.mr_code + "' class='replyLi'>"
	        	   		+	"<div class='mv-user-review-item' style='width:100%;'>"
	        	 		+	"<div class='user-rate movie-rate movie-rate2' id='star-hjs'>"
	        			+	arr[this.mr_score] + "<span id='star-score'>" + this.mr_score + "</span></div>" 
	        			+	"<div class='user-info' style='width:75%; margin-left:30px;'>"
	        			+	"<p> <span style='float:left; font-size:15px;'><strong>"+ this.nickname +"</strong></span> <span style='float:right;'><strong>" + this.mr_write_date + "</strong></span> <br>"
	        			+	"<span class='replyText' id='replyContent'>" + this.mr_content + "</span></p>"
	        			+	"<div style='float:right; margin-top:10px;'>"
	        			+	"<button class='ws-btn-thumbs-up' id='ws-cnt-tup' style='margin-left:10px;'><i class='far fa-thumbs-up' aria-hidden='true'></i> "+ this.mr_like +"</button>"
	        			+	"<button class='ws-btn-thumbs-down' id='ws-cnt-tdn' style='margin-left:10px;'><i class='far fa-thumbs-down' aria-hidden='true' ></i> " +  this.mr_dislike + "</button>"
	        			+	"<button class='ws-btn-warning' id='ws-cnt-warning' style='margin-left:10px;'><i class='fa fa-exclamation-triangle' aria-hidden='true'></i> 신고 </button>"
	        			+	"</div></div></div></li>";
                	}else {
                		str += "<li data-replyNo='" + this.mr_code + "' class='replyLi'>"
	        	   		+	"<div class='mv-user-review-item' align='center' style='width:100%;'>"
	        	 		+	"<div class='user-rate movie-rate movie-rate2' id='star-hjs'>"
	        			+	arr[this.mr_score] + "<span id='star-score'>" + this.mr_score + "</span></div>" 
	        			+	"<div class='user-info' style='width:75%; margin-left:30px;'>"
	        			+	"<p> <span style='float:left; font-size:15px;'><strong>"+ this.nickname +"</strong></span> <span style='float:right;'><strong>" + this.mr_write_date + "</strong></span> <br>"
	        			+	"<span class='replyText' id='replyContent'>" + this.mr_content + "</span></p>"
	        			+	"<div style='float:right; margin-top:10px;'>"
	        			+	"<button class='ws-btn-thumbs-up' id='ws-cnt-tup' style='margin-left:10px;'><i class='far fa-thumbs-up' aria-hidden='true' ></i> "+ this.mr_like +"</button>"
	        			+	"<button class='ws-btn-thumbs-down' id='ws-cnt-tdn'style='margin-left:10px;'><i class='far fa-thumbs-down' aria-hidden='true' ></i> " +  this.mr_dislike + "</button>"
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
    
	var formObj = $("form[role='form']");
 	
 	$(".listBtn").on("click", function () {
        formObj.attr("action", "/movie/boardFreeListP");
        formObj.attr("method", "get");
        formObj.submit();
    });
	
</script>
<%@ include file="../footer1.jsp"%>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<%@ include file="../footer2.jsp"%>

