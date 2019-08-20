<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


	
<!--
/**
* @Class Name : mmlGet.jsp
* @Description : 나영리 겟
* @Modification Information
* @
* @  수정일     		     수정자            		수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.09        김상필      		 	최초생성
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/
-->
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/header1.jsp"%>

<!-- 2. 여기에 페이지별 css 추가해주세요 -->

<link rel="stylesheet" href="./resources/css/sp_style.css">
<link rel="stylesheet" href="./resources/css/ws_personal.css?Ver=4">

<script src="https://kit.fontawesome.com/bb8498b585.js"></script>

<!-- 3. heaer2.jsp : header -->
<%@ include file="/WEB-INF//header2.jsp" %>


<%
	String email = (String) session.getAttribute("m_email");
	int vid = (int)request.getAttribute("vid");
%>
<input id="ws_email_session" type=hidden value=<c:out value="${m_email}"/>>
<input id="ws_id" type=hidden value=<c:out value="${member.id}"/>>
<input id="ws_mml_content_num" type=hidden value=<c:out value="${mml_content.mml_num}"/>>
<input id="ws_mmlGet_nickname" type=hidden value=<c:out value="${member.m_nickname}"/>>

<!-- 세션객체에서 id 추출 후, Javascript로 넘긴다. 왜 바로 못넘길까... -->

<br>
<br>
<div class="buster-light">
	<!-- blog detail section-->
	<div class="page-single">
		<div class="container">
			
			<div class="row">
			
				<div class="blog-detail-ct">
					<div class="flex-it share-tag" style="width: 100%; float: left;">
						<div class="social-link">

							<div style="flex: 2;">
								<h1 class="mmlTitle"><c:out value="${mml_content.mml_title}"/></h1> 
							</div>
							<div style=" flex: 2;">
								<a href="#">
									<img class="ws_memberService" id="ws_following" style="width:65px; height:65px;" src="<c:url value="/resources/images/sp_image/add-user.png"/>">
								</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span OnClick="location.href ='mmlFollowList?id=<c:out value="${member.id}"/>'">
									<h4 style="display:inline">Followers</h4>
									<h4 id="ws_follower_set" style="display:inline; color: lightcoral" >
										<!-- 팔로워 수가 들어올 자리지만, 이는 Ajax가 페이지 로딩이 끝난 후 채워준다. 변화가 잦은 영역이기 때문 -->
									</h4>
								</span>
								<div  class="" style="display:inline;">
									&nbsp;&nbsp;&nbsp;&nbsp;
									<i class="fas fa-heart getheart ws_memberService" id="ws_give_like"></i>
									&nbsp;
									<h4 id= "ws_like_set" style="display:inline; color: lightcoral" >
										<!-- 좋아요 수가 들어올 자리지만, 이는 Ajax가 페이지 로딩이 끝난 후 채워준다. 변화가 잦은 영역 -->
									</h4>
									&nbsp;&nbsp;
								</div>
								<a href="#">
									<img class="ws_memberService" id="ws_give_warning" style="width:45px; height:45px; margin-top:0px;" src="<c:url value="/resources/images/sp_image/warning.png"/>">
								</a>
								&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
							<div class="right-it" style="flex: 1; vertical-align:middle;">
								<h4>
									<c:out value="${member.m_nickname}"/>
								</h4>
								<c:set var="level" value="${member.m_level}"/>
									<c:choose>
						    			<c:when test="${level eq 'BRONZE'}">
        									<img class="crown" src="<c:url value="/resources/images/sp_image/helmet.png"/>">
    									</c:when>
										<c:when test="${level eq 'SILVER'}">
        									<img class="crown" src="<c:url value="/resources/images/sp_image/shield.png"/>">
    									</c:when>
										<c:otherwise>
        									<img class="crown" src="<c:url value="/resources/images/sp_image/crown.png"/>">
    									</c:otherwise>
									</c:choose>
								<!-- c:set은 짝짝이 태그 -->
								<fmt:formatDate pattern="yyyy-MM-dd" value=	"${mml_content.mml_write_date}"/>
							</div>
						</div>
					</div>
					
					<textarea style="width: 100%; height: 358px; font-size: 20px;" ><c:out value="${mml_content.mml_content}"/></textarea>

					<!-- share link -->
					<a href="/movie/movieDetail?mi_code=<c:out value="${mml_content.mi_code}"/> "> 
						<img src="<c:url value='${mml_content.mml_poster}'/>" alt="" width="185" height="284">
					</a> 
					<a href="#">
						<img src="<c:url value='${mml_content.mml_poster}'/>" alt="" width="185" height="284">
					</a>  
					<br>
					<div class="flex-it share-tag" style="width: 100%; float: left;"></div>
					
						
					<c:if test="${member.id eq vid}">
					<button class="submit2" type="button" data-toggle="modal" data-target="#CatModal-post-delete">삭제</button>
					<form action="/movie/mmlUpdate" method="get">			
						<button class="submit2" type="submit">수정</button> <!-- 이름은 맞는데 값은 모두 0&null -->
			
					</c:if>
			
					
						<input type="hidden" name="mml_num" value="<c:out value="${mml_content.mml_num}"/>">
						<input type="hidden" name="mml_title" value="<c:out value="${mml_content.mml_title}"/>">
						<input type="hidden" name="mml_content" value="<c:out value="${mml_content.mml_content}"/>">
						<input type="hidden" name="mi_code" value="<c:out value="${mml_content.mi_code}"/>">
					</form>			
					<br>
	 			</div>
	 		</div>
	 	<!-- 진석코드 -->
	 	<div class="row">
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
	 </div>
	 		
	 		
<!-- end of  blog detail section-->
<!-- 삭제 모달 : 게시글 -->		
		<div id="CatModal-post-delete" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">게시글 삭제</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
       <div class="modal-body">
          <p>게시글을 삭제하시겠습니까?</p>
       </div>
       <div class="modal-footer">
		<form action="/movie/mmlDelete" method="get">
			<button onclick="CatDelete()" type="submit" class="btn btn-primary">삭제하기</button>
       		<input type="hidden" name="mml_num" value="${mml_content.mml_num}"/>
        </form>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
       </div>
      </div>
    </div>
</div>

	<!-- 삭제 모달 : 댓글 -->		
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
</div>
<script type="text/javascript">

	function CatDelete() {
    
  	}
	function replydel() {
	    location.replace("mmlGet");
	  	}
	
	
	
	$(function(){
	    $('.ws-btn-thumbs-up').click(function(){
	       $('.ws-reply-msg').css('color', 'red');
	    	
	    
	    });
	});
	
	//페이지 로딩시 자동으로 시행되는 구문
	$(document).ready(function(){ 
		console.log('좋아요 수 갱신 시작');
		
		//1. 게시자의 팔로워 수 조회
		countFollower ($('#ws_id').val(), function(result) {
			  $('#ws_follower_set').html(result);
		 });
		
		//2. 게시글의 추천수 조회
		
		
		countLike ($('#ws_mml_content_num').val(), function(result){
			$('#ws_like_set').html(result);
			
		});
			
			
			
	});
	
	
</script>
<script>
	var replyPageNum = 1;
    var mml_reply_code = "${Mml_ReplyVO.mml_reply_code}";
    //getReplies();
    getRepliesPaging(replyPageNum);
  
    
    function getReplies() {
        $.getJSON("/movie/mmlreplies/all/" + mml_reply_code, function (data) {
            var str = "";
            if(data == "") {
            	str += "<li style='text-align:center'> <h4>등록된 댓글이 없습니다.</h4> </li>";	
            }else {
            	 $(data).each(function () {
                 	str +=	"<li data-replyNo='" + this.mml_reply_code + "' class='replyLi'>"
     					+	"No.<p class='replyRno' style='display:inline-block;'> " + data.length-- + "</p>"
                      	+	"<div class='replyDate'> <span class='replyWriter'> <strong>" +this.nickname + "</strong></span> <span style='float:right'><strong>등록일 : " + this.bfr_regdate + "</strong> </span>" + "</div><br>"
                        +	"<p class='replyText' style='word-break:break-all;'>" + this.mml_reply_content + "</p>"
                        +	"<button type='button' class='btn btn-xs btn-success modifyModal' data-value='"+this.mml_reply_code+"' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
                        +	"</li>"
                        +	"<hr/>";
                 });
            }
            $("#replies").html(str);
         });
    }
	
	
    $("#replyAddBtn").on("click", function (mml_num) {
    	var session = "${sessionyn}";
        var replyText = $("#newReplyText");
        var mml_reply_content = replyText.val();
        
       
		
       /*  if( session == "") {
		 	alert("로그인 하셔야 이용하실수 있습니다.");
		 	location.href="index";
		 	return false;
		} */
        
        if(mml_reply_content == "") {
        	alert("댓글 내용을 입력해주세요!");
        	return false;
        }
        
        $.ajax({
            type : "post",
            url : "/movie/mmlreplies/"+mml_num+"/1",
            headers : {
                "Content-type" : "application/json",
                "X-HTTP-Method-Override" : "POST"
            },
            dataType : "text",
            data : JSON.stringify({
            	mml_num : mml_num,
            	mml_reply_content : mml_reply_content
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
                    $("#modifyModal").removeClass("in");
                    $(".modal-backdrop").remove();
                    $("body").removeClass("modal-open");
                }
            }
        });

    });
    
    
	var total ="";
	var id = "${id}";
    function getRepliesPaging(page) {
        $.getJSON("/movie/getMmlReplies/" + 52 + "/" + 1, function (data) {
           var str = "";
           total = data.pageMaker.totalCount;
           total = total - (page-1)*10;
         
           if(data.replies == "") {
           		str += "<li style='text-align:center'> <h4>등록된 댓글이 없습니다.</h4> </li>";	
           }else {
                $(data.replies).each(function () {
                	if(this.id != id) {
                		str +=	"<li style='display:inline-block; width:100%;'data-replyNo='" + this.mml_repliy_code + "' class='replyLi'>"
                    	+	"<input type='hidden' value='" + this.id +"'/>"
         				+	"<p class='replyRno' style='display:inline-block;'> No. " + total-- + "</p>"
                        +	"<div class='replyDate'> <span class='replyWriter'> <strong>" +this.nickname + "</strong></span> <span style='float:right'><strong>등록일 : " + this.mml_reply_write_date + "</strong> </span>" + "</div><br>"
                        +	"<p class='replyText' style='word-break:break-all;'>" + this.mml_reply_content + "</p>"
                        +   "<button style='float:right' class='ws-btn-thumbs-down' id='reply-cnt-tdn'><i class='fa fa-thumbs-o-down' aria-hidden='true'></i> " + this.mml_reply_dislike + "</button>"
                        +	"<button style='float:right' class='ws-btn-thumbs-up' id='reply-cnt-tup'><i class='fa fa-thumbs-o-up' aria-hidden='true' ></i> "+ this.mml_reply_like + "</button>" 
                       	+	"<button style='float:right; margin-right:10px;' class='ws-btn-warning' id='ws-cnt-warning'><i class='fa fa-exclamation-triangle' aria-hidden='true'></i> 신고 </button>"
                        +	"</li>"
                        +	"<hr/>";
                	}else {
	                    str +=	"<li data-replyNo='" + this.mml_repliy_code + "' class='replyLi'>"
	                    	+	"<input type='hidden' value='" + this.id +"'/>"
	         				+	"<p class='replyRno' style='display:inline-block;'> No. " + total-- + "</p>"
	                        +	"<div class='replyDate'> <span class='replyWriter'> <strong>" +this.nickname + "</strong></span> <span style='float:right'><strong>등록일 : " + this.mml_reply_write_date + "</strong> </span>" + "</div><br>"
	                        +	"<p class='replyText' style='word-break:break-all; margin-bottom:20px;'>" + this.mml_reply_content + "</p>"
	                        +	"<button type='button' id='btn-hjs' class='btn btn-xs btn-success modifyModal' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
	                        +   "<button style='float:right' class='ws-btn-thumbs-down' id='reply-cnt-tdn'><i class='fa fa-thumbs-o-down' aria-hidden='true'></i> " + this.mml_reply_dislike + "</button>"
	                        +	"<button style='float:right' class='ws-btn-thumbs-up' id='reply-cnt-tup'><i class='fa fa-thumbs-o-up' aria-hidden='true' ></i> "+ this.mml_reply_like + "</button>" 
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


<%@ include file="../footer.jsp"%>
<script src="<c:url value="/resources/js/memberService.js" />"></script>
</html>