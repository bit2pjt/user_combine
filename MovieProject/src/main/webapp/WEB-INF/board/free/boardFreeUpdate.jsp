
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../header.jsp" %>

	<link rel="stylesheet" href="../../resources/vendor/bootstrap-markdown/bootstrap-markdown.min.css">
	<link rel="stylesheet" href="../../resources/vendor/summernote/summernote.css">
	
	
	<link rel="stylesheet" href="../../resources/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../resources/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="../../resources/vendor/linearicons/style.css">
	<link rel="stylesheet" href="../../resources/vendor/metisMenu/metisMenu.css">
	


	<link rel="stylesheet" href="../../resources/css/ws_personal.css?ver=1">

<!--  
* @Class Name : EgovSampleService.java
* @Description : EgovSampleService Class
* @Modification Information
* @
* @  수정일      			수정자 				             수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.2     이웅식                    			최초 생성
*
* @author BIT 116기 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by bit 2조 All right reserved.
*/-->


<!-- 서머노트 웹에서 ... 끝-->
<body>
<div class="hero common-hero">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="hero-ct">
					<h1> 글 수정</h1>
					<ul class="breadcumb">
						<li class="active"><a href="#">커뮤니티</a></li>
						<li> <span class="ion-ios-arrow-right"></span> 자유 게시판</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="buster-light" style="min-height:1300px;">
	<!-- 글쓰기 폼의 시작.-->		
	<div class="movie-items">
		<div class="container">
		<div class="col-md-12">
	<form>
		<!--  1. 글쓰기 부분 전체를 감싸는 상자(writer-box)를 만든다  [19/07/03 border:1px solid black; 덜어냄. 더 깔끔하라고-->
		<div class="ws-writer-box">
			<div>
			&nbsp;&nbsp;<strong>분류</strong>
			&nbsp;&nbsp;
			<label class="fancy-radio custom-color-coral">
        		<input name="category" value="interpretation" type="radio" checked=""><span><i></i>결말해석</span>
        	</label>&nbsp;&nbsp;&nbsp;
			<label class="fancy-radio custom-color-coral">
        		<input name="category" value="argument" type="radio"><span><i></i>토론</span>
        	</label>&nbsp;&nbsp;&nbsp;
        	<label class="fancy-radio custom-color-coral">
        		<input name="category" value="chat" type="radio" ><span><i></i>잡담</span>
        	</label>&nbsp;&nbsp;&nbsp;
        	<label class="fancy-radio custom-color-coral">
        		<input name="category" value="humor" type="radio"><span><i></i>유머</span>
       	 	</label>
		</div>
			
			
			<!-- 2.상단부는 제목과 출처가 들어간다.  -->
			<div class="ws-top-writer">
				<br><br>
				<span><strong>&nbsp;&nbsp;제목 :&nbsp;&nbsp;&nbsp;&nbsp; </strong></span> <span>
				<!-- 밑줄만 나오는 style서식 -->
				
				
				
				<input class="post-title" name="bf_title" placeholder="제목을 적어주세요"></span> <span id="counter"></span><span>자 남음 </span>
				<br><br>
				<strong>&nbsp;&nbsp;출처 :&nbsp;&nbsp;&nbsp;&nbsp; </strong> 
				<span><input class="post-source" name="bf_source" placeholder="출처를 적어주세요"></span>
        
		<br>
		<br>
		<br>
			</div><!-- end of top-writer -->
			<!-- 3. 중상단은 텍스트로 고정된 공지사항이 자리잡는다. -->
			
		
		<br>
		<br>
		<!--  <textarea name="content" id="summernote" style="border:1 solid;width:100%"></textarea>-->
		
		<div class="summernote">Hello there,
						<br/>
						<p>The toolbar can be customized and it also supports various callbacks such as <code>oninit</code>, <code>onfocus</code>, <code>onpaste</code> and many more.</p>
						<p>Please try <b>paste some texts</b> here</p>
						
					</div>
		
		<br>
		<div class="ws-middle-top-writer">
				<br>
				&nbsp;&nbsp;<span style="color: #ff0000;"><strong>※</strong></span> <span style="color: #ff0000;">음란물 및 욕설</span><strong>이 포함된 게시글은  사전 경고 없이 즉시 게시글이 삭제될 수 있습니다.</strong><br>
				<br>
				&nbsp;&nbsp;<span style="color: #ff0000;"><strong>※</strong></span> <span style="color: #ff0000;">스포일러</span><strong>가 포함된 글은 반드시 말머리에 [스포일러]를 붙여주세요.</strong><br>
				<br>
				&nbsp;&nbsp;<span style="color: #ff0000;"><strong>※</strong></span> 기타 자세한 공지사항은 아래의 <span style="color: #ff0000;">통합공지</span><strong> 링크에서 확인할 수 있습니다.</strong><br>
				<a href="mypage/notice/list">&nbsp;&nbsp;--> 통합공지 페이지로 이동 </a>
				
			</div><!-- end of middle-top-writer -->
		
		
		
		
		
			<!-- 다홍색 단추를 가져오긴 했는데... 스타일만 가져오겠지? 기존의 것은 submit버튼의 양식 -->
			<!-- ticket의 단추 가져오기 실패. <a>에만 쓸 수 있는 스타일이다 -->	
			<center class="form-style-1" style="background-color:#FFFFFF;">
				<input type="button" class="submit" value="작성하기" style="background-color:#FF6F61;width:70px;margin:10px;" >
				<input type="button" class="submit" value=" 취 소 " style="background-color:#dcf836;color:#0b0b06;width:70px;margin:10px;">
			</center>
		
		

		
		</div><!-- end of writer-box  -->
	</form>
	</div>
	</div>
	</div>
	</div>
	<!-- end of buster-white -->
<!-- footer의 jquery 스크립트가 화면에 추가된 스크립트를 계속 초기화 시킨다(더욱 아랫줄에 있기 때문에) 그러므로 섬머노트가 있는 페이지는
	별도의 footer를 사용하도록 하자
	쓰이는  -->
<script src="../../resources/vendor/jquery/jquery.min.js"></script>
<script src="../../resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<script src="../../resources/vendor/metisMenu/metisMenu.js"></script>
<script src="../../resources/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="../../resources/vendor/summernote/summernote.min.js"></script>
<script src="../../resources/vendor/markdown/markdown.js"></script>
<script src="../../resources/vendor/to-markdown/to-markdown.js"></script>
<script src="../../resources/vendor/bootstrap-markdown/bootstrap-markdown.js"></script>
<script src="../../resources/vendor/common.js"></script>
<script>

     //n자 남음 구현
     $(function() {
         $('.post-title').keyup(function (e){
             var content = $(this).val();
             $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
             $('#counter').html(content.length + '/50');
         });
         $('.post-title').keyup();
   });

   
     
     $(function() {
  		// summernote editor
  		$('.summernote').summernote({
  			height: 300,
  			focus: true,
  			onpaste: function() {
  				alert('You have pasted something to the editor');
  			}
  		});
  		 $("button").attr("aria-expanded","true");
  	});
     
     
    
     
</script>


<%@include file="../../footer_bs_write.jsp" %>
