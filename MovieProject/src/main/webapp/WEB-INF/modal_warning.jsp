<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*,java.text.*" %>
<!--
	/**
	* @Class Name : modal_warning.jsp
	* @Description : 신고하기 모달
	* @Modification Information
	* @
	* @  수정일        수정자              수정내용
	* @ ---------   ---------   -------------------------------
	* @ 2019.08.12   한유진			최초생성
	* @author bit 2조
	* @since 2019. 07.01
	* @version 1.0
	* @see
	*
	*  Copyright (C) by Bit All right reserved.
	*/
	-->

<script>
$(function() {
	var session = "${sessionyn}";
	var warn = $("#modal-warning-btn");
	
	warn.on("click", function() {
		
			if (session == "") {
				alert("로그인 하셔야 이용하실수 있습니다.");
				location.href = "index";
				return false;
			}
			<%
			String warn_type = request.getParameter("warn_type");
			int no = Integer.parseInt(request.getParameter("no"));
			System.out.println("warn_type = " + warn_type);
			String result="";
			
			if(warn_type.equals("bf")){
				result = "boardFreeWarn";
			}else if(warn_type.equals("bfr")){
				result = "BFReplyWarn";
			}
			%>
			var no = <%=no %>;
			var warn_content = document.getElementById("warncontent").value.trim();
			if (warn_content.length == 0) {
				alert("신고사유를 입력해주세요.");
				return false;
			}
			$.ajax({
				url : "<%=result%>",
				data : {
					no : no,
					warncontent : warn_content
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
			var modal = document.getElementById("warning-modal");
			modal.style.display = "none";
			$('.modal-backdrop').remove();
		});
	});
</script>
 		
<!-- start | modal -->
<div class="modal fade" id="warning-modal" role="dialog">
	<div class="modal-dialog" style="margin-top: 100px;">
		<div class="modal-content">
			<a data-dismiss="modal"
				style="font-weight: bold; float: right; margin-right: 10px; font-size: 30px;">x</a>
			<!-- start | modal-header -->
			<div class="modal-header">
				<h4 class="modal-warning-title">신고하기</h4>
			</div>
			<!-- end | modal-header -->
			<!-- start | modal-body -->
			<div class="modal-body">
				<textarea id="warncontent" name="warncontent"
					style="resize: none; width: 100%; height: 200px;"></textarea>
			</div>
			<!-- end | modal-body -->
			<!-- start | modal-footer -->
			<div class="modal-footer">
				<button type="button" id="modal-warning-btn"
					class="btn btn-default pull-left" data-dismiss="modal">신고하기</button>
			</div>
			<!-- end | modal-footer -->
		</div>
	</div>
</div>
<!-- end | modal -->