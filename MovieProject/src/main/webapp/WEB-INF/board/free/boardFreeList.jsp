
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 1. header1.jsp : head  -->
<%@ include file="/WEB-INF/header1.jsp"%>
<!-- 해당 페이지의 커스텀 css 설정입니다. -->
<link rel="stylesheet" href="./resources/css/ws_personal.css?Ver=4">
<link rel="stylesheet" href="./resources/css/boardstyle.css">
<!-- 3. heaer2.jsp : header -->
<%@ include file="/WEB-INF/header2.jsp" %>


<!--  
* @Class Name : EgovSampleService.java
* @Description : EgovSampleService Class
* @Modification Information
* @
* @     수정일      	  수정자 				   수정내용
* @ -------------   ---------   -------------------------------
* @ 2019. 07. 02     이웅식                  최초 생성
* @ 2019. 07. 22     한유진    	 header, footer 수정(1,2 버전으로 변경)
* @ 2019. 08. 09	 한유진				     수정
*
* @author BIT 116기 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by bit 2조 All right reserved.
*/-->
<script>
$(function(){
	
	var tab_weekly = $("#weekly");
		tab_weekly.on("click", function(event) {
			event.preventDefault();
			$('#li1').attr('class','');
			$('#li2').attr('class','active');
			$('#li3').attr('class','');
			var test = 'test';
			$.ajax({
				url : "/movie/boardListWeekly",
				dataType : "json",
				type : "post",
				success : function(data) {
					$('#table-tbody').html('');
					$.each(data, function(index, item) {
						var formattedDate = new Date(data[index].bf_update_date); 
						var d = formattedDate.getDate(); 
						var m = formattedDate.getMonth(); 
						m += 1; // JavaScript months are 0-11 
						var y = formattedDate.getFullYear();

						$('#table-tbody').html(
								$('#table-tbody').html() + '<tr>'
								+ '<td style="width:8%;">'+(index+1)+'위</td>'
								+ '<td style="width:45%;"><a href="boardFreeGet?bno='
								+ data[index].bf_bno + '&bt=w">'
								+ data[index].bf_title
								+ '</a></td>'
								+ '<td style="width:15%;">'+data[index].nickname+'</td>'
								+ '<td style="width:15%;">'+y+'/'+m+'/'+d+'</td> '
				);
						
						/*
						<td style="width:8%;">[${status.index+1}위]&nbsp;</td>
								<td style="width:10%;">${board.bf_category}</td>
								<td style="width:45%;"><a href="boardFreeGet?bno=${boardListDaily[status.index].bf_bno}">${boardListDaily[status.index].bf_title}</a></td>
								<td style="width:15%;">${board.nickname}</td>
								<td style="width:15%;"><fmt:formatDate value="${board.bf_update_date}" pattern="yyyy/MM/dd"/></td>  
								*/
					});
				},
				error : function() {
					$('#table-tbody').html('<tr>' + '<td colspan=2>결과 없음<td>' + '<tr>');
				}
			});
		});
		var tab_daily = $("#daily");
		tab_daily.on("click", function(event) {
			event.preventDefault();
			$('#li1').attr('class','active');
			$('#li2').attr('class','');
			$('#li3').attr('class','');
			var test = 'test';
			$.ajax({
				url : "/movie/boardListDaily",
				dataType : "json",
				type : "post",
				success : function(data) {
					$('#table-tbody').html('');
					$.each(data, function(index, item) {
						/* var StartDate = $.fullCalendar.formatDate(start, 'yyyy/MM/dd'); */
						var formattedDate = new Date(data[index].bf_update_date); 
						var d = formattedDate.getDate(); 
						var m = formattedDate.getMonth(); 
						m += 1; // JavaScript months are 0-11 
						var y = formattedDate.getFullYear();

						$('#table-tbody').html(
								$('#table-tbody').html() + '<tr>'
										+ '<td style="width:8%;">'+(index+1)+'위</td>'
										+ '<td style="width:45%;"><a href="boardFreeGet?bno='
										+ data[index].bf_bno + '&bt=d">'
										+ data[index].bf_title
										+ '</a></td>'
										+ '<td style="width:15%;">'+data[index].nickname+'</td>'
										+ '<td style="width:15%;">'+y+'/'+m+'/'+d+'</td> '
						);
					});
				},
				error : function() {
					$('#table-tbody').html('<tr>' + '<td colspan=2>결과 없음<td>' + '<tr>');
				}
			});
		});
		var tab_monthly = $("#monthly");
		tab_monthly.on("click", function(event) {
			event.preventDefault();
			$('#li1').attr('class','');
			$('#li2').attr('class','');
			$('#li3').attr('class','active');
			var test = 'test';
			$.ajax({
				url : "/movie/boardListMonthly",
				dataType : "json",
				type : "post",
				success : function(data) {
					$('#table-tbody').html('');
					$.each(data, function(index, item) {
						var formattedDate = new Date(data[index].bf_update_date); 
						var d = formattedDate.getDate(); 
						var m = formattedDate.getMonth(); 
						m += 1; // JavaScript months are 0-11 
						var y = formattedDate.getFullYear();

						$('#table-tbody').html(
								$('#table-tbody').html() + '<tr>'
								+ '<td style="width:8%;">'+(index+1)+'위</td>'
								+ '<td style="width:45%;"><a href="boardFreeGet?bno='
								+ data[index].bf_bno + '&bt=m">'
								+ data[index].bf_title
								+ '</a></td>'
								+ '<td style="width:15%;">'+data[index].nickname+'</td>'
								+ '<td style="width:15%;">'+y+'/'+m+'/'+d+'</td> '
				);
					});
				},
				error : function() {
					$('#table-tbody').html('<tr>' + '<td colspan=2>결과 없음<td>' + '<tr>');
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
					<h1> 자유 게시판</h1>
					<ul class="breadcumb">
						<li class="active"><a href="#">커뮤니티</a></li>
						<li> <span class="ion-ios-arrow-right"></span> 자유 게시판</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 상단 베스트 게시물 슬라이더 -->

	<div class="container container_yj">
		<div class="row" >
			<div class="movie-single-ct main-content">
				<div class="movie-tabs">
					<div class="tabs">
						
						<ul class="tab-links tabs-mv tab_yj">
							<li id="li1" class="active"><div id="box1"><a class="tab_title" id="daily">Today</a></div></li>
							<li id="li2" ><div id="box2"><a class="tab_title" id="weekly">Weekly</a></div></li>
							<li id="li3" ><div id="box3"><a class="tab_title" id="monthly">Monthly</a></div></li>
						</ul>
					</div>
				</div>
				<table class="tab-table">
					<tbody id="table-tbody">
						<c:forEach items="${boardListDaily}" var="board" varStatus="status">
							<tr>
								<td style="width:8%;">${status.index+1}위</td>
								<td style="width:10%;">${board.bf_category}</td>
								<td style="width:45%;"><a href="boardFreeGet?bno=${board.bf_bno}">${board.bf_title}</a></td>
								<td style="width:15%;">${board.nickname}</td>
								<td style="width:15%;"><fmt:formatDate value="${board.bf_update_date}" pattern="yyyy/MM/dd"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>


<!-- 바탕 : 메인 컨텐츠 시작 -->
<div class="buster-light">
	<div class="movie-items">
		<div class="container">
			<div class="row">
			<!-- listTable 배치 시작 -->
				<div>
					<div style="position:relative;top:50px">
						<button style="width: 160px; height: 40px;" class="board_btn_right" value="글쓰기" onClick="location.href='boardFreeWrite'">글쓰기</button><!-- <i class="fa fa-pencil" aria-hidden="true"></i> -->
						<!-- 1. listTable 배치 -->
						<table class="ws_table">
						  <thead>
							<!-- 2. 최초의 행. 열의 종류 구분 -->
							<tr>
							  <th style="width:8%;border-right: 1px solid gray;">글번호</th>
							  <th style="width:7%;border-right: 1px solid gray; ">카테고리</th>
							  <th style="width:45%;border-right: 1px solid gray; ">제목</th>
							  <th style="width:10%;border-right: 1px solid gray;">작성자</th>
							  <th style="width:10%;border-right: 1px solid gray;">최근수정일</th>
							  <th style="width:10%;border-right: 1px solid gray;">조회수</th>
							  
							</tr>
						  </thead>
						 
						 <!-- 향후 core jstl의 foreach로 게시글의 목록이 올 자리다 -->
						  <tbody>
						   <!-- 3. 공지사항. strong으로 강조를 주며, 게시자의 아이디가 다홍색으로 처리된다. 항상 최상단 노출-->
							<tr class="notice">
							  <td><strong>02</strong></td>
							  <td><strong>공지</strong></td>
							  <td><strong>비속어 사용과 음란물 게시시 활동정지 처분합니다.</strong></td>
							  <td ><strong>admin01</strong></td>
							  <td ><strong>2011/04/25</strong></td>
							  <td><strong>84200</strong></td>
							  <td>모바일 글제목. </td>
							  </tr>
							<tr class="notice">
							  <td><strong>01</strong></td>
							  <td><strong>공지</strong></td>
							  <td><strong>정치글은 글삭제 대상입니다.</strong></td>
							  <td><strong>admin01</strong></td>
							  <td><strong>2011/07/25</strong></td>
							  <td><strong>16847</strong></td>
							  <td>모바일 글제목. </td>
							</tr>
							<!--4.  자유게시판 게시글의 나열 시작 -->
							<c:forEach items="${boardfree}" var="board" varStatus="status">
								<tr class="post">
								  <td>${pageMaker.totalCount - ((pageMaker.criteria.page-1) * pageMaker.criteria.perPageNum + status.index) }</td>
								  <td>${board.bf_category}</td>
								  <td><a href="boardFreeGet${pageMaker.makeSearch(pageMaker.criteria.page)}&bno=${board.bf_bno}">${board.bf_title}</a></td>
								  <td>${board.nickname}</td>
								  <td><fmt:formatDate value="${board.bf_update_date}" pattern="yyyy/MM/dd"/></td>
								  <td>${board.bf_view_counter}</td>
								  <td><a href="boardFreeGet${pageMaker.makeSearch(pageMaker.criteria.page)}&bno=${board.bf_bno}">${board.bf_title}</a></td>
								</tr>
							</c:forEach>
						  </tbody>
						</table>
						</div>
					</div>
				 </div>
				 
				  <!--TableList의 끝-->
				 <div class="box-footer">
                        <div class="text-center">
                            <form id="listPageForm">
                                <input type="hidden" name="page" value="${pageMaker.criteria.page}">
                                <input type="hidden" name="perPageNum" value="${pageMaker.criteria.perPageNum}">
                            </form>
                            <ul class="pagination">
                                <c:if test="${pageMaker.prev}">
                                    <li><a href="${pageMaker.startPage - 1}">이전</a></li>
                                </c:if>
                                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                                    <li <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
                                        <a href="${idx}">${idx}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                    <li><a href="${pageMaker.endPage + 1}">다음</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="box-footer" style="display:inline-block; width:100%; margin-left:25%;">
                        <div class="form-group col-sm-2">
                            <select class="form-control" name="searchType" id="searchType">
                                <option value="n" <c:out value="${searchCriteria.searchType == null ? 'selected' : ''}"/>>:::::: 선택 ::::::</option>
                                <option value="t" <c:out value="${searchCriteria.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
                                <option value="c" <c:out value="${searchCriteria.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
                                <option value="w" <c:out value="${searchCriteria.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
                                <option value="tc" <c:out value="${searchCriteria.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
                                <option value="cw" <c:out value="${searchCriteria.searchType eq 'cw' ? 'selected' : ''}"/>>내용+작성자</option>
                                <option value="tcw" <c:out value="${searchCriteria.searchType eq 'tcw' ? 'selected' : ''}"/>>제목+내용+작성자</option>
                            </select>
                        </div>
                         <div class="form-group col-sm-10" style="width:50%">
                            <span class="input-group" style="display:inline-block; width:100%;">
                                <input type="text" class="form-control" name="keyword" id="keywordInput" value="${searchCriteria.keyword}" placeholder="검색어" style="display:inline-block; width:50%">
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-primary btn-flat" id="btn-hjs">
                                        		 검색
                                    </button>
                                </span>
                            </span>
                        </div>
                    </div> 
				 <!--5. 검색바  구현부  -->
				 <!--  

					&nbsp;&nbsp;
					<span>
					<input class="list-search" type="text" placeholder="원하시는 내용을 입력하세요">
					</span>
					<span>
					<button class="ws-btn-reddish-search"><i class="fa fa-search" aria-hidden="true"></i></button>
					</span>
				</center>
				-->
				<!-- 6. 페이징 : 그대로 따옴 기초 탬플릿의 [ bloglist_ligth.html]  
            	<ul class="pagination">
            		<li class="icon-prev"><a href="#"><i class="ion-ios-arrow-left"></i></a></li>
            		<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">...</a></li>
					<li><a href="#">21</a></li>
					<li><a href="#">22</a></li>
					<li class="icon-next"><a href="#"><i class="ion-ios-arrow-right"></i></a></li>
            	</ul>
            	-->
			</div>
		</div>
	</div>
<script>
	$(".pagination li a").on("click", function (event) {
	    event.preventDefault();
	
	    var targetPage = $(this).attr("href");
	    var listPageForm = $("#listPageForm");
	    listPageForm.find("[name='page']").val(targetPage);
	    listPageForm.attr("action", "boardFreeListP").attr("method", "get");
	    listPageForm.submit();
	});
	

    $("#btn-hjs").on("click", function (event) {
        self.location =
            "boardFreeListP${pageMaker.makeQuery(1)}"
            + "&searchType=" + $("select option:selected").val()
            + "&keyword=" + encodeURIComponent($("#keywordInput").val());
    });
</script>
<!--list 페이지 구현의 몸통부 끝. 이하 footer 등-->

<!-- 5. footer1.jsp : footer -->
<%@ include file="/WEB-INF/footer1.jsp" %>
<!-- 6. 페이지별 script 추가 -->	
<!-- footer2.jsp : script -->
<%@ include file="/WEB-INF/footer2.jsp"%>

