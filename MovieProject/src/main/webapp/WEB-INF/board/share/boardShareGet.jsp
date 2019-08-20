<%@page import="com.spring.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 1. header1.jsp : head  -->
<%@ include file="/WEB-INF/header1.jsp"%>
<!-- 2. 여기에 페이지별 css 추가해주세요 -->
	<link rel="stylesheet" href="./resources/css/ws_personal.css?Ver=1.3">
	<link rel="stylesheet" href="./resources/css/boardstyle.css">

<!-- 3. heaer2.jsp : header -->
<%@ include file="/WEB-INF/header2.jsp" %>

<script>
window.onload = function(){
 	var slideIndex = 0;
 	showSlides();

 	function showSlides() {
 	    var i;
 	    var slides = document.getElementsByClassName("mySlides");
 	    var dots = document.getElementsByClassName("dot");
 	    for (i = 0; i < slides.length; i++) {
 	       slides[i].style.display = "none";  
 	    }
 	    slideIndex++;
 	    if (slideIndex > slides.length) {slideIndex = 1}    
 	    for (i = 0; i < dots.length; i++) {
 	        dots[i].className = dots[i].className.replace(" active", "");
 	    }
 	    slides[slideIndex-1].style.display = "block";  
 	    dots[slideIndex-1].className += " active";
 	    setTimeout(showSlides, 4000); // Change image every 2 seconds
 	}
 	}
 	
 	$(function() {
 		var session = "${sessionyn}";
 		var warn = $("#ws-cnt-warning");
 		var bs_bno = "${boardShareVO.bs_bno}";
 		
		// 신고버튼 눌렀을 때 
 		warn.on("click", function() {
 		 	if( session == "") {
 		 		alert("로그인 하셔야 이용하실수 있습니다.");
 		 		location.href="index";
 		 		return false;
 		 	}
 			$.ajax({
 				url:"boardShareWarn",
 				data: {bs_bno: bs_bno},
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
 	
	function updateContent(){
		location.href="boardShareUpdate?bno=${boardShareVO.bs_bno}";
	}
 	
 	function deleteContent() {
		var result = confirm("삭제하시겠습니까?");
 		
 		if(result == true) {
 			location.href="boardShareDelete?bno=${boardShareVO.bs_bno}";
 		}
 	}
</script>

<div class="hero common-hero">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="hero-ct">
					<h1> 나눔게시판</h1>
					<ul class="breadcumb">
						<li class="active"><a href="#">커뮤니티</a></li>
						<li> <span class="ion-ios-arrow-right"></span> 나눔게시판</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
		
	<div class="buster-light">
		<div class="movie-items">
<!-- blog detail section-->
<div class="container">
	<div class="col-md-12">
	<!-- 1. 글제목 자리 -->
		<div class="ws-post-get-title" >
			<h3> ${boardShareVO.bs_title }</h3>
		</div>
		<!-- 글제목 자리 끝 -->
		<!-- 2. 글정보+개인정보의 배치 -->
		<div class="ws-post-get-info">
				<div class="ws-post-get-info-profile">
					<%
							MemberVO memberVO = (MemberVO)request.getAttribute("memberVO");
							if (memberVO.getM_image() == null || memberVO.getM_image().equals("") || memberVO.getM_image().equals("null")) {
						%>
						<img src="resources/images/customs/ws_img/defaultprofile.PNG"
							style="width: 120px; height: 120px;">
						<%
							} else {
						%>
						<img src="./upload/${requestScope.memberVO.m_image }"
							style="width: 120px; height: 120px;">
						<%
							}
						%>
				</div>
				<div class="ws-post-get-info-inner">
					<div>작성자 : ${memberVO.m_nickname}</div>
					<div>작성일자 : <fmt:formatDate value="${boardShareVO.bs_reg_date}" pattern="yyyy-MM-dd"/></div>
					<div>수정일자 : <fmt:formatDate value="${boardShareVO.bs_update_date}" pattern="yyyy-MM-dd"/></div>
					<div>조회수 : ${boardShareVO.bs_view_counter}</div>
					<div>선호장르 : ${memberVO.m_favorite} </div>
				</div>
		</div>
		<!-- 글정보+개인정보의 배치 끝 -->
		<!-- 3. 글본문 자리 -->
		<div class="ws-post-get-content">
			${boardShareVO.bs_content }
		</div>
			<!-- 글본문 자리의 끝 -->
			<!-- 4. 글신고/글추천/글비추 자리 -->
		<center class="ws-post-get-buttons">
			<div style="float:left">
				<button class="ws-btn-warning" id="ws-cnt-warning"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i>신고 </button>
			</div>
			<span>
			<form role="form" method="post">
	        	<input type="hidden" name="bno" value="${boardShareVO.bs_bno}">
	            <input type="hidden" name="page" value="${searchCriteria.page}">
	            <input type="hidden" name="perPageNum" value="${searchCriteria.perPageNum}">
	            <input type="hidden" name="searchType" value="${searchCriteria.searchType}">
	            <input type="hidden" name="keyword" value="${searchCriteria.keyword}">
         	</form>
         	
			<c:if test="${id == boardShareVO.id }">
				<div style="float:right;">
					 <button style="width:100px; height: 40px;" id='btn-hjs' onclick="updateContent()">수정</button> 
					 <button style="width:100px; height: 40px;" id='btn-hjs' onclick="deleteContent()">삭제</button>
				</div>
			</c:if>
			 <button type="submit" id="btn-hjs" class="btn btn-primary listBtn" style="float:right; margin-right:7px; width:100px; height: 40px;">목록</button>
		</center>
		<span id="ws-content-msg"></span>
		<!-- 글신고/글추천/글비추 배치 끝 -->
		<!-- 5. 댓글 구현부의 시작 -->
	</div>
	
		<div class="ws-get-Rside">
				<div class="ws-side-best">
					<ul>
						<li>${bt_type } Best5</li>
						<c:forEach items="${boardListDaily}" var="board"
							varStatus="status" end="4">
							<li><a href="boardFreeGet?bno=${board.bf_bno}">${board.bf_title}</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="ws-get-mmlbest">
					<div class="ws-get-mmlbest-title">${memberVO.m_nickname} 님의
						가장 핫한 나영리</div>
					<div class="slideshow-container">
						<c:forEach items="${mmlTop3}" var="mml" varStatus="status">
							<div class="mySlides fade">
									<c:set var="poster_one" value="${fn:split(mml.mml_poster,',')}" />
									<img src="<c:url value="${poster_one[0] }"/>">
									<!-- 나영리 타이틀 -->
									제목 : ${mml.mml_title} <br>
									<!-- 나영리 좋아요수 -->
									좋아요수 : ${mml.mml_like}
							</div>
						</c:forEach>
					</div>
					<br>

					<div style="text-align: center">
					<c:forEach items="${mmlTop3}" var="mml" varStatus="status">
							<span class="dot"></span>
						</c:forEach>
					</div>
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
	                            <label for="replyNo" style="margin-bottom:10px;"><strong>댓글 번호</strong></label>
	                            <input class="form-control" id="replyNo" name="replyNo" readonly>
	                        </div>
                        
                            <div class="form-group">
                                <label for="replyText" style="margin-bottom:10px;"><strong>댓글 내용</strong></label>
                                <textarea class="form-control" id="replyText" name="replyText" placeholder="댓글 내용을 입력해주세요" style="resize:none; height:100px;"></textarea>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button style="width:100px;" type="button" id='btn-hjs' class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                            <button style="width:100px;" type="button" id='btn-hjs' class="btn btn-success modalModBtn" data-dismiss="modal">수정</button>
                            <button style="width:100px;" type="button" id='btn-hjs' class="btn btn-danger modalDelBtn" data-dismiss="modal">삭제 </button>
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
					<textarea class="form-control" id="newReplyText" name="replyText" placeholder="댓글 내용을 입력해주세요" style="resize:none; margin-top:20px; height:100px;"></textarea>
	 			</div>
				<div class="pull-right">
					<button style="width:160px;" type="button" id="replyAddBtn" class="btn btn-primary"> 댓글 등록</button>
				</div>
			</div>
		</div>
		
	</div>
</div>
</div>		
				
					<!-- comment form -->
				</div>
	
<!-- 5. footer1.jsp : footer -->
<%@ include file="/WEB-INF/footer1.jsp" %>
<script>
	var replyPageNum = 1;
    var bs_bno = "${boardShareVO.bs_bno}";
    
    getRepliesPaging(replyPageNum);
  
	
    $("#replyAddBtn").on("click", function () {
    	var session = "${sessionyn}";
        var replyText = $("#newReplyText");
        var bsr_content = replyText.val();
		
        if( session == "") {
		 	alert("로그인 하셔야 이용하실수 있습니다.");
		 	location.href="index";
		 	return false;
		}
        
        if(bsr_content == "") {
        	alert("댓글 내용을 입력해주세요!");
        	return false;
        }
        
        $.ajax({
            type : "post",
            url : "/movie/replies/bs/",
            headers : {
                "Content-type" : "application/json",
                "X-HTTP-Method-Override" : "POST"
            },
            dataType : "text",
            data : JSON.stringify({
            	bs_bno : bs_bno,
            	bsr_content : bsr_content
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
    
    $("#replies").on("click", ".replyLi .ws-btn-warning", function () { // 댓글의 수정 버튼 클릭시
    	var reply = $(this).parent(); // 댓글의 li
        var bsr_rno = reply.attr("data-replyNo"); // 댓글의 번호
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
 			url:"BSReplyWarn",
 			data: {bsr_rno: bsr_rno},
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
            url : "/movie/replies/bs/" + replyRno,
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
        var bsr_rno = reply.find("#replyNo").val();
        var bsr_content = reply.find("#replyText").val();
        $.ajax({
            type : "put",
            url : "/movie/replies/bs/" + bsr_rno,
            headers : {
                "Content-type" : "application/json",
                "X-HTTP-Method-Override" : "PUT"
            },
            data : JSON.stringify(
                {bsr_content : bsr_content}
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
        $.getJSON("/movie/replies/bs/" + bs_bno + "/" + page, function (data) {
           var str = "";
           total = data.pageMaker.totalCount;
           total = total - (page-1)*10;
           
           if(data.replies == "") {
           		str += "<li style='text-align:center'> <h4>등록된 댓글이 없습니다.</h4> </li>";	
           }else {
                $(data.replies).each(function () {
                	if(this.id != id) {
                		str +=	"<li style='display:inline-block; width:100%;'data-replyNo='" + this.bsr_rno + "' class='replyLi'>"
                    	+	"<input type='hidden' value='" + this.id +"'/>"
         				+	"<p class='replyRno' style='display:inline-block;'> No. " + total-- + "</p>"
                        +	"<div class='replyDate'> <span class='replyWriter'> <strong>" +this.nickname + "</strong></span> <span style='float:right'><strong>등록일 : " + this.bsr_regdate + "</strong> </span>" + "</div><br>"
                        +	"<p class='replyText' style='word-break:break-all;'>" + this.bsr_content + "</p>"
                       	+	"<button style='float:right; margin-right:10px;' class='ws-btn-warning' id='ws-cnt-warning'><i class='fa fa-exclamation-triangle' aria-hidden='true'></i> 신고 </button>"
                        +	"</li>"
                        +	"<hr/>";
                	}else {
	                    str +=	"<li data-replyNo='" + this.bsr_rno + "' class='replyLi'>"
	                    	+	"<input type='hidden' value='" + this.id +"'/>"
	         				+	"<p class='replyRno' style='display:inline-block;'> No. " + total-- + "</p>"
	                        +	"<div class='replyDate'> <span class='replyWriter'> <strong>" +this.nickname + "</strong></span> <span style='float:right'><strong>등록일 : " + this.bsr_regdate + "</strong> </span>" + "</div><br>"
	                        +	"<p class='replyText' style='word-break:break-all; margin-bottom:20px;'>" + this.bsr_content + "</p>"
	                        +	"<button type='button' id='btn-hjs' class='btn btn-xs btn-success modifyModal' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
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
	
	var formObj = $("form[role='form']");
 	
 	$(".listBtn").on("click", function () {
        formObj.attr("action", "/movie/boardShareListP");
        formObj.attr("method", "get");
        formObj.submit();
    });
</script>

<!-- 6. 페이지별 script 추가 -->

<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<!-- footer2.jsp : script -->
<%@ include file="/WEB-INF/footer2.jsp"%>