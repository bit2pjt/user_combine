
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 1. header1.jsp : head  -->
<%@ include file="/WEB-INF/header1.jsp"%>
<!-- 2. 여기에 페이지별 css 추가해주세요 -->
	<link rel="stylesheet" href="./resources/css/ws_personal.css?Ver=1.3">

<!-- 3. heaer2.jsp : header -->
<%@ include file="/WEB-INF/header2.jsp" %>

<script>
	/*
	var session = "${sessionyn}";

 	if( session == "") {
 		alert("로그인 하셔야 이용하실수 있습니다.");
 		location.href="index.do";
 	}
 	*/
 	$(function() {
 		var session = "${sessionyn}";
 		var reco = $("#ws-cnt-tup");
 		var deco = $("#ws-cnt-tdn");
 		var warn = $("#ws-cnt-warning");
 		var bno = "${boardFreeVO.bf_bno}";
 		
 		    
 		
 		reco.on("click", function() {
 		 	if( session == "") {
 		 		alert("로그인 하셔야 이용하실수 있습니다.");
 		 		location.href="index";
 		 		return false;
 		 	}
 			$.ajax({
 				url:"boardFreeReco",
 				data: {bf_bno: bno, type: 1},
 				dataType: "text",
 				type:"post",
 				success: function(data) {
 					if(data == "fail") {
 						alert("이미 추천/비추천을 누르셨습니다.");
 						return false;
 					}else {
 						reco.html("<i class='fa fa-thumbs-o-up' aria-hidden='true' ></i>  " + data);
 					}
 				},
 				error: function() {
 					alert("에러");
 				}
 			});
 		});
 		
 		deco.on("click", function() {
 		 	if( session == "") {
 		 		alert("로그인 하셔야 이용하실수 있습니다.");
 		 		location.href="index";
 		 		return false;
 		 	}
 			$.ajax({
 				url:"boardFreeReco",
 				data: {bf_bno: bno, type: 0},
 				dataType: "text",
 				type:"post",
 				success: function(data) {
 					if(data == "fail") {
 						alert("이미 추천/비추천을 누르셨습니다.");
 						return false;
 					}else {
 						deco.html("<i class='fa fa-thumbs-o-down' aria-hidden='true'></i>  " + data);
 					}
 				},
 				error: function() {
 					alert("에러");
 				}
 			});
 		});
 		
 		warn.on("click", function() {
 		 	if( session == "") {
 		 		alert("로그인 하셔야 이용하실수 있습니다.");
 		 		location.href="index";
 		 		return false;
 		 	}
 			$.ajax({
 				url:"boardFreeWarn",
 				data: {bf_bno: bno},
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
 		
 		
 		

 	});
</script>

<div class="hero common-hero">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="hero-ct">
					<h1> 자유게시판</h1>
					<ul class="breadcumb">
						<li class="active"><a href="#">커뮤니티</a></li>
						<li> <span class="ion-ios-arrow-right"></span> 자유게시판</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
		
	<div class="buster-light">
		<div class="movie-items">
		<!--  베스트 게시물 슬라이더 : 산만해. 우측 바가 더 깔끔할듯 하다 
			<div class="slider movie-items" style="padding:5px;height:140px;">
				<div class="container">
					<div class="row" style="margin:-40px;">
					<h3 style="top:15px;">베스트 게시물</h3>
						<div  class="slick-multiItemSlider" style="padding:5px;min-width:300px;">
	    					<span><a href="#">여초에서 난리난 고질라 쿠키영상1</a></span>
	    					<span>페북에서 난리난 고질라 쿠키영상2</span>
	    					<span>고질라 쿠키영상3</span>
	    					<span>고질라 쿠키영상4</span>
	    					<span>고질라 쿠키영상5</span>
	    					<span>고질라 쿠키영상6</span>
	    					<span>고질라 쿠키영상7</span>
	    					<span>고질라 쿠키영상8</span>
	    					<span>고질라 쿠키영상9</span>
	    					<span>고질라 쿠키영상10</span>
	    					<span>고질라 쿠키영상11</span>
	    					<span>고질라 쿠키영상12</span>
	    					<span>고질라 쿠키영상13</span>
	    					<span>고질라 쿠키영상14</span>
	    					<span>고질라 쿠키영상15</span>
	    					<span>고질라 쿠키영상16</span>
	    				</div>
	    			</div>
				</div>
			</div>
			-->
<!-- blog detail section-->
<div class="container">
	<div class="col-md-12">
	<!-- 1. 글제목 자리 -->
		<div class="ws-post-get-title" >
			<h3> ${boardFreeVO.bf_title }</h3>
		</div>
		<!-- 글제목 자리 끝 -->
		<!-- 2. 글정보+개인정보의 배치 -->
		<div class="ws-post-get-info">
				<div class="ws-post-get-info-profile">
					<img src="${memberVO.m_image}" alt="프로필사진">
				</div>
				<div class="ws-post-get-info-inner">
					<div>작성자 : ${memberVO.m_nickname}</div>
					<div>작성일자 : <fmt:formatDate value="${boardFreeVO.bf_reg_date}" pattern="yyyy-MM-dd"/></div>
					<div>수정일자 : <fmt:formatDate value="${boardFreeVO.bf_update_date}" pattern="yyyy-MM-dd"/></div>
					<div>조회수 : ${boardFreeVO.bf_view_counter}</div>
					<div>선호장르 : ${memberVO.m_favorite} </div>
				</div>
		</div>
		<!-- 글정보+개인정보의 배치 끝 -->
		<!-- 3. 글본문 자리 -->
		<div class="ws-post-get-content">
			${boardFreeVO.bf_content }
		</div>
			<!-- 글본문 자리의 끝 -->
			<!-- 4. 글신고/글추천/글비추 자리 -->
		<center class="ws-post-get-buttons">
			<div style="float:left">
				<button class="ws-btn-warning" id="ws-cnt-warning"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i>신고 </button>
			</div>
			<span>
				<button class="ws-btn-thumbs-up" id="ws-cnt-tup"><i class="fa fa-thumbs-o-up" aria-hidden="true" ></i> ${boardFreeVO.bf_recommend} </button> 
				<button class="ws-btn-thumbs-down" id="ws-cnt-tdn"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i> ${boardFreeVO.bf_decommend}</button>
			</span>
			<div style="float:right;">
				 <button class="ws-btn-update">수정</button> 
				 <button class="ws-btn-delete" data-toggle="modal" data-target="#CatModal-post-delete">삭제</button>
			</div>
		</center>
		<span id="ws-content-msg"></span>
		<!-- 글신고/글추천/글비추 배치 끝 -->
		<!-- 5. 댓글 구현부의 시작 -->
	</div>
	
		<div class="ws-get-Rside">
		<div class="ws-side-best" >
			<ul>
				<li >추천수 급상승 Best 10</li>
				<li >감자튀김 사서 갔다가 입뺀 당한 후기[487]</li>
				<li >개지리는 마술[4]</li>
				<li >글제목이 길어서 두툼하게 두 세줄이 되더라도 사이드바 너비는 지금이 적당한거같아</li>
				<li >글제목이 길어서 두툼하게 두 세줄이 되더라도 사이드바 너비는 지금이 적당한거같아</li>
				<li >글제목이 길어서 두툼하게 두 세줄이 되더라도 사이드바 너비는 지금이 적당한거같아</li>
				<li >글제목이 길어서 두툼하게 두 세줄이 되더라도 사이드바 너비는 지금이 적당한거같아</li>
				<li >글제목이 길어서 두툼하게 두 세줄이 되더라도 사이드바 너비는 지금이 적당한거같아</li>
				<li >글제목이 길어서 두툼하게 두 세줄이 되더라도 사이드바 너비는 지금이 적당한거같아</li>
				<li >글제목이 길어서 두툼하게 두 세줄이 되더라도 사이드바 너비는 지금이 적당한거같아</li>
			</ul>	
		</div>
		<div class="ws-get-mmlbest" >
			<div class="ws-get-mmlbest-title">
				김시덕이 님의 가장 핫한 나영리
			</div>
			<div class="ws-get-mmlbest-poster" >
				<img src="https://t1.daumcdn.net/movie/676b7dbf7a2cf721d01efc61708493080d2a9d8e" >
			</div>
			<div class="ws-get-mmlbest-title"> 
				여름 스릴러 추천
				<br>
				누적 추천수 : 48742
			</div>
		</div>
		
		<div class="ws-side-recomend">
			당신이 좋아할 수도 있는 나영리
			<img src="https://t1.daumcdn.net/cfile/tistory/999A89485C3193F72F">
			괴수물 덕후 모여봐라 <br>
			조회수 : 24232
			
		</div>
	</div>
		
		
		
	<div class="col-md-12">
		<br>
		<h4> Reply list </h4>
		<br>
		<!-- 댓글 시작과 끝에 파랗고 두꺼운 선. -->
		<div class="comments" style="border-width:3px 0px;border-style:solid;">
			<div class="ws-reply-buffer"></div>	
			<!-- 댓글2 -->
	<div class="content-wrapper">		
		<section class="content container-fluid">
            <div class="modal fade" id="modifyModal" role="dialog">
                <div class="modal-dialog" style="margin-top:100px;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">댓글 수정창</h4>
                        </div>
                        <div class="modal-body">
	                        <div class="form-group">
	                            <label for="replyNo"><strong>댓글 번호</strong></label>
	                            <input class="form-control" id="replyNo" name="replyNo" readonly>
	                        </div>
                        
                            <div class="form-group">
                                <label for="replyText" style="margin-bottom:20px;"><strong>댓글 내용</strong></label>
                                <textarea class="form-control" id="replyText" name="replyText" placeholder="댓글 내용을 입력해주세요" style="resize:none; height:100px;"></textarea>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                            <button type="button" class="btn btn-success modalModBtn" data-dismiss="modal">수정</button>
                            <button type="button" class="btn btn-danger modalDelBtn" data-dismiss="modal">삭제 </button>
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
		
		<div class="box-header with-border" style="margin-top:30px;">
			<h3 class="box-title">댓글 작성</h3>
			<div class="box-body">
				<div class="form-group">
					<textarea class="form-control" id="newReplyText" name="replyText" placeholder="댓글 내용을 입력해주세요" style="resize:none; margin-top:20px; height:200px;"></textarea>
	 			</div>
				<div class="pull-right">
					<button type="button" id="replyAddBtn" class="btn btn-primary"> 댓글 저장</button>
				</div>
			</div>
		</div>
		
	</div>
</div>
</div>		
				
					<!-- comment form -->
				</div>
	
<!-- end of  blog detail section-->
	
    <div id="CatModal-post-delete" class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">게시글 삭제</h5>
        </div>
       <div class="modal-body">
          <p>게시글을 삭제하시겠습니까?</p>
       </div>
       <div class="modal-footer">
          <button onclick="CatDelete()" type="button" class="btn btn-primary">삭제하기</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
       </div>
      </div>
    </div>

	<!-- 삭제 모달 : 댓글 
		<div id="CatModal-reply-delete" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">댓글 삭제</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
       <div class="modal-body">
          <p>댓글을 삭제하시겠습니까?</p>
       </div>
       <div class="modal-footer">
          <button onclick="replydel()" type="button" class="btn btn-primary">삭제하기</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
       </div>
      </div>
    </div>
	-->		

<!-- 5. footer1.jsp : footer -->
<%@ include file="/WEB-INF/footer1.jsp" %>
<script>
	var replyPageNum = 1;
    var bfr_bno = "${boardFreeVO.bf_bno}";
    //getReplies();
    getRepliesPaging(replyPageNum);
  
    /*
    function getReplies() {
        $.getJSON("/movie/replies/all/" + bfr_bno, function (data) {
            var str = "";
            if(data == "") {
            	str += "<li style='text-align:center'> <h4>등록된 댓글이 없습니다.</h4> </li>";	
            }else {
            	 $(data).each(function () {
                 	str +=	"<li data-replyNo='" + this.bfr_rno + "' class='replyLi'>"
     					+	"No.<p class='replyRno' style='display:inline-block;'> " + data.length-- + "</p>"
                      	+	"<div class='replyDate'> <span class='replyWriter'> <strong>" +this.nickname + "</strong></span> <span style='float:right'><strong>등록일 : " + this.bfr_regdate + "</strong> </span>" + "</div><br>"
                        +	"<p class='replyText' style='word-break:break-all;'>" + this.bfr_content + "</p>"
                        +	"<button type='button' class='btn btn-xs btn-success modifyModal' data-value='"+this.bfr_rno+"' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
                        +	"</li>"
                        +	"<hr/>";
                 });
            }
            $("#replies").html(str);
         });
    }
	*/
	
    $("#replyAddBtn").on("click", function () {
    	var session = "${sessionyn}";
        var replyText = $("#newReplyText");
        var bfr_content = replyText.val();
		
        if( session == "") {
		 	alert("로그인 하셔야 이용하실수 있습니다.");
		 	location.href="index";
		 	return false;
		}
        
        if(bfr_content == "") {
        	alert("댓글 내용을 입력해주세요!");
        	return false;
        }
        
        $.ajax({
            type : "post",
            url : "/movie/replies",
            headers : {
                "Content-type" : "application/json",
                "X-HTTP-Method-Override" : "POST"
            },
            dataType : "text",
            data : JSON.stringify({
            	bfr_bno : bfr_bno,
                bfr_content : bfr_content
            }),
            success : function (result) {
                if (result == "regSuccess") {
                    alert("댓글 등록 완료!");
                }
                //getReplies();
                getRepliesPaging(replyPageNum);
                replyText.val("");
            }
        });
    });
	
    $("#replies").on("click", ".replyLi button", function () { // 댓글의 수정 버튼 클릭시
        var reply = $(this).parent(); // 댓글의 li
        var replyNo = reply.attr("data-replyNo"); // 댓글의 번호
        var replyText = reply.find(".replyText").text(); //댓글의 내용
        $("#replyNo").val(replyNo); // 댓글 수정창의 댓글번호에 넣음
        $("#replyText").val(replyText); // 댓글 수정창의 댓글내용에 넣음

    });
    
    $()
    
    $("#replies").on("click", ".replyLi .ws-btn-thumbs-up", function () { // 댓글의 수정 버튼 클릭시
    	var reply = $(this).parent(); // 댓글의 li
        var bfr_rno = reply.attr("data-replyNo"); // 댓글의 번호
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
 			url:"BFReplyReco",
 			data: {bfr_rno: bfr_rno, type: 1},
 			dataType: "text",
 			type:"post",
 			success: function(data) {
 				if(data == "fail") {
 					alert("이미 추천/비추천을 누르셨습니다.");
 					return false;
 				}else {
 					present.html("<i class='fa fa-thumbs-o-up' aria-hidden='true' ></i>  " + data);
 				}
 			},
 			error: function() {
 				alert("에러");
 			}
 		});
 			
	});
    
    $("#replies").on("click", ".replyLi .ws-btn-thumbs-down", function () { // 댓글의 수정 버튼 클릭시
    	var reply = $(this).parent(); // 댓글의 li
        var bfr_rno = reply.attr("data-replyNo"); // 댓글의 번호
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
 			url:"BFReplyReco",
 			data: {bfr_rno: bfr_rno, type: 0},
 			dataType: "text",
 			type:"post",
 			success: function(data) {
 				if(data == "fail") {
 					alert("이미 추천/비추천을 누르셨습니다.");
 					return false;
 				}else {
 					present.html("<i class='fa fa-thumbs-o-down' aria-hidden='true'></i>  " + data);
 				}
 			},
 			error: function() {
 				alert("에러");
 			}
 		});
 			
	});
    
    $("#replies").on("click", ".replyLi .ws-btn-warning", function () { // 댓글의 수정 버튼 클릭시
    	var reply = $(this).parent(); // 댓글의 li
        var bfr_rno = reply.attr("data-replyNo"); // 댓글의 번호
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
 			url:"BFReplyWarn",
 			data: {bfr_rno: bfr_rno},
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

        var replyRno = $("#replyNo").val();
        
        $.ajax({
            type : "delete",
            url : "/movie/replies/" + replyRno,
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
        var bfr_rno = reply.find("#replyNo").val();
        var bfr_content = reply.find("#replyText").val();

        $.ajax({
            type : "put",
            url : "/movie/replies/" + bfr_rno,
            headers : {
                "Content-type" : "application/json",
                "X-HTTP-Method-Override" : "PUT"
            },
            data : JSON.stringify(
                {bfr_content : bfr_content}
            ),
            dataType : "text",
            success : function (result) {
                console.log("result : " + result);
                if (result == "modSuccess") {
                	//getReplies();
                	getRepliesPaging(replyPageNum);
                    alert("댓글 수정 완료!");
                    $("#modifyModal").modal("hide");
                    
                }
            }
        });

    });
    
    
	var total ="";
	var id = "${id}";
    function getRepliesPaging(page) {
        $.getJSON("/movie/replies/" + bfr_bno + "/" + page, function (data) {
           var str = "";
           total = data.pageMaker.totalCount;
           total = total - (page-1)*10;
           
           if(data == "") {
           		str += "<li style='text-align:center'> <h4>등록된 댓글이 없습니다.</h4> </li>";	
           }else {
                $(data.replies).each(function () {
                	if(this.id != id) {
                		str +=	"<li style='display:inline-block; width:100%;'data-replyNo='" + this.bfr_rno + "' class='replyLi'>"
                    	+	"<input type='hidden' value='" + this.id +"'/>"
         				+	"<p class='replyRno' style='display:inline-block;'> No. " + total-- + "</p>"
                        +	"<div class='replyDate'> <span class='replyWriter'> <strong>" +this.nickname + "</strong></span> <span style='float:right'><strong>등록일 : " + this.bfr_regdate + "</strong> </span>" + "</div><br>"
                        +	"<p class='replyText' style='word-break:break-all;'>" + this.bfr_content + "</p>"
                        +   "<button style='float:right' class='ws-btn-thumbs-down' id='reply-cnt-tdn'><i class='fa fa-thumbs-o-down' aria-hidden='true'></i> " + this.bfr_dislike + "</button>"
                        +	"<button style='float:right' class='ws-btn-thumbs-up' id='reply-cnt-tup'><i class='fa fa-thumbs-o-up' aria-hidden='true' ></i> "+ this.bfr_like + "</button>" 
                       	+	"<button style='float:right; margin-right:10px;' class='ws-btn-warning' id='ws-cnt-warning'><i class='fa fa-exclamation-triangle' aria-hidden='true'></i> 신고 </button>"
                        +	"</li>"
                        +	"<hr/>";
                	}else {
	                    str +=	"<li data-replyNo='" + this.bfr_rno + "' class='replyLi'>"
	                    	+	"<input type='hidden' value='" + this.id +"'/>"
	         				+	"<p class='replyRno' style='display:inline-block;'> No. " + total-- + "</p>"
	                        +	"<div class='replyDate'> <span class='replyWriter'> <strong>" +this.nickname + "</strong></span> <span style='float:right'><strong>등록일 : " + this.bfr_regdate + "</strong> </span>" + "</div><br>"
	                        +	"<p class='replyText' style='word-break:break-all;'>" + this.bfr_content + "</p>"
	                        +	"<button type='button' class='btn btn-xs btn-success modifyModal' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
	                        +   "<button style='float:right' class='ws-btn-thumbs-down' id='reply-cnt-tdn'><i class='fa fa-thumbs-o-down' aria-hidden='true'></i> " + this.bfr_dislike + "</button>"
	                        +	"<button style='float:right' class='ws-btn-thumbs-up' id='reply-cnt-tup'><i class='fa fa-thumbs-o-up' aria-hidden='true' ></i> "+ this.bfr_like + "</button>" 
	                       	+	"<button style='float:right; margin-right:10px;' class='ws-btn-warning' id='ws-cnt-warning'><i class='fa fa-exclamation-triangle' aria-hidden='true'></i> 신고 </button>"
	                        +	"</li>"
	                        +	"<hr/>";
                	}     
                   });
             }
             
           $("#replies").html(str);
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
	
</script>

<!-- 6. 페이지별 script 추가 -->

<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

<!-- footer2.jsp : script -->
<%@ include file="/WEB-INF/footer2.jsp"%>

