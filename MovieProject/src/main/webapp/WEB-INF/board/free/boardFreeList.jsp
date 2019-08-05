
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 1. header1.jsp : head  -->
<%@ include file="/WEB-INF/header1.jsp"%>
<!-- 해당 페이지의 커스텀 css 설정입니다. -->
<link rel="stylesheet" href="./resources/css/ws_personal.css?Ver=4">
<!-- 3. heaer2.jsp : header -->
<%@ include file="/WEB-INF/header2.jsp" %>


<!--  
* @Class Name : EgovSampleService.java
* @Description : EgovSampleService Class
* @Modification Information
* @
* @  수정일      			수정자 				             수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.2     이웅식                    			최초 생성
* @ 2019.07.22     한유진    	 header, footer 수정(1,2 버전으로 변경)
*
* @author BIT 116기 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by bit 2조 All right reserved.
*/-->

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
<center class="slider sliderv2">
	<div class="container">
		<div class="row">
	    	<div class="slider-single-item" >
	    		<!-- 낱장 슬라이더는 movie-item으로 분류되는듟 하다 -->
	    		<div class="movie-item"  >
	    			<div class="row">
	    				<h4>실시간 급상승 추천 게시물.</h4>
						<br>
						<table class="ws_table_best">
						<thead>	
						<!-- 2. 최초의 행. 열의 종류 구분 -->
							<tr>
								<th>제  목</th>
								<th>제  목</th>
							</tr>
						</thead>
						<!-- 향후 core jstl의 foreach로 게시글의 목록이 올 자리다 -->
						<tbody>
							<tr>
								<td>추천 수 n 이상의 게시물을 시간순서로 밀어내기. top10만 잘라내서 보여준다.</td>
								<td>고질라 결말해석[74]</td>
							</tr>
							<tr>
								<td>고질라 쿠키영상</td>
								<td>고질라 결말해석[74]</td>
							</tr>
							<tr>
								<td>고질라 쿠키영상</td>
								<td>고질라 결말해석[74]</td>
							</tr>
							<tr>
								<td>고질라 쿠키영상</td>
								<td>고질라 결말해석[74]</td>
							</tr>
							<tr>
								<td>고질라 쿠키영상</td>
								<td>고질라 결말해석[74]</td>
							</tr>
						</tbody>
						</table>
	   				 </div>	
	    		</div>
	    		<div class="movie-item">
	    			<div class="row">
	    				<h4>주간 베스트.</h4>
						<br>
						<table class="ws_table_best" >
						<thead>
						<!-- 2. 최초의 행. 열의 종류 구분 -->
							<tr>
								<th>제  목</th>
								<th>제  목</th>
							</tr>
						</thead>
						<!-- 향후 core jstl의 foreach로 게시글의 목록이 올 자리다 -->
						<tbody>
							<tr>
								<td>1주일 이내의 기간 중 가장 추천을 많이 받은 게시물 top 10</td>
								<td>고질라 결말해석[74]</td>
							</tr>
							<tr>
								<td>고질라 쿠키영상</td>
								<td>고질라 결말해석[74]</td>
							</tr>
							<tr>
								<td>고질라 쿠키영상</td>
								<td>고질라 결말해석[74]</td>
							</tr>
							<tr>
								<td>고질라 쿠키영상</td>
								<td>고질라 결말해석[74]</td>
							</tr>
							<tr>
								<td>고질라 쿠키영상</td>
								<td>고질라 결말해석[74]</td>
							</tr>
						</tbody>
					</table>
	    			</div>	
	    		</div>
	   			 <div class="movie-item">
	    			<div class="row">
	    			<h4>랜덤 베스트.</h4>
					<br>
						<table class="ws_table_best">
						<thead>
					<!-- 2. 최초의 행. 열의 종류 구분 -->
							<tr>
								<th>제  목</th>
								<th>제  목</th>
							</tr>
						</thead>
					<!-- 향후 core jstl의 foreach로 게시글의 목록이 올 자리다 -->
						<tbody>
							<tr>
								<td>추천 수 n 이상의 게시물을 중 무작위 게시글을 가져온다(6개월 이내??)</td>
								<td>고질라 결말해석[74]</td>
							</tr>
							<tr>
								<td>고질라 쿠키영상</td>
								<td>고질라 결말해석[74]</td>
							</tr>
							<tr>
								<td>고질라 쿠키영상</td>
								<td>고질라 결말해석[74]</td>
							</tr>
							<tr>
								<td>고질라 쿠키영상</td>
								<td>고질라 결말해석[74]</td>
							</tr>
							<tr>
								<td>고질라 쿠키영상</td>
								<td>고질라 결말해석[74]</td>
							</tr>
						</tbody>
					</table>
	    		</div>	
	    	</div>
	    </div>
	 </div>
	</div>
</center>


<!-- 바탕 : 메인 컨텐츠 시작 -->
<div class="buster-light">
	<div class="movie-items" style="margin-top: 100px;">
		<div class="container">
			<div class="row">
			<!-- listTable 배치 시작 -->
				<div>
					<div style="position:relative;top:50px">
						<button class="ws-btn-reddish-write" value="글쓰기" onClick="location.href='boardFreeWrite'"><i class="fa fa-pencil" aria-hidden="true"></i></button>
						<!-- 1. listTable 배치 -->
						<table class="ws_table">
						  <thead>
							<!-- 2. 최초의 행. 열의 종류 구분 -->
							<tr>
							  <th style="width:8%;">글번호</th>
							  <th style="width:7%;">카테고리</th>
							  <th style="width:45%;">제목</th>
							  <th style="width:10%;">작성자</th>
							  <th style="width:10%;">최근수정일</th>
							  <th style="width:10%;">조회수</th>
							  
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
								  <td style="word-break:break-all">${board.nickname}</td>
								  <td><fmt:formatDate value="${board.bf_update_date}" pattern="yyyy-MM-dd"/></td>
								  <td>${board.bf_view_counter}</td>
								  <td>모바일 글제목. </td>
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

