<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.spring.member.MemberVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
/**
* @Class Name : mmlFollowList.jsp
* @Description : 나영리 팔로워 리스트
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

<%@ include file="../header1.jsp"%>

<!-- 2. 여기에 페이지별 css 추가해주세요 -->

<link rel="stylesheet" href="./resources/css/sp_style.css">
<style>
.js-load {
    display: none;
}
.js-load.active {
    display: block;
}
.is_comp.js-load:after {
    display: block;
}
</style>


<script src="https://kit.fontawesome.com/bb8498b585.js"></script>


<!-- 3. heaer2.jsp : header -->
<%@ include file="../header2.jsp" %>

<br>
<br>

<br>
<br>


    	<div class="buster-light">

<!-- celebrity grid v2 section-->
<div class="page-single">
	<div class="container">
		<div class="row">
                <!-- followee의 정보 -->
                <div class="flex-it share-tag" style="width:100%; float:left;">
                        <div class="social-link" style="width:100%; display:flex;">
                       		<img src="./resources/images/sp_image/<c:out value="${followee.m_image}"/>" class="profile_img">&nbsp;
                           		<c:set var="level" value="${followee.m_level}"/>
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
                           	<a OnClick="location.href ='mmlMemberList?id=<c:out value="${followee.id}"/>'">  
                            	&nbsp;<h1 style="display:inline"><c:out value="${followee.m_nickname}"/></h1>
                        	</a>
                        <h1 style="display:inline">&nbsp;'s FollowList</h1>
                   	</div>      
 				</div>
                <div style="float:left;">
					<h1 style="display:inline">Followers : </h1> <h4 style="display:inline; color: lightcoral" > <c:out value="${followee.m_follower}"/> </h4>
				</div>
                <div class="blog-detail-ct">
                	<div class="flex-it share-tag" style="width:100%;"></div>
                </div>
                
                <!-- followers 정보 노출 시작 -->
                <div class="row1">
 	             <!-- 래퍼. sp_col-md-4부터 반복 시작 -->
 	             <!-- 예시 
 	               <div class="sp_col-md-4">
    	               <div class="blog-item-style-3" OnClick="location.href ='mmlMemberList'" style="padding-left:20px">
        	               <div class="blog-it-infor" style="vertical-align:middle">
            	               <img src="<c:url value="/resources/images/sp_image/dog.jfif"/>" class="profile_img" style="width:80px; height:80px;">
                	           <img class="mml_crown" src="<c:url value="/resources/images/sp_image/crown.png"/>">&nbsp;<h3 style="display:inline"><a href="blogdetail_light.html">nickname</a></h3>
                               <br>
                               <h1 style="display:inline">Followers : </h1><h4 style="display:inline; color: lightcoral" > 140  </h4>
                           </div>
                       </div>
                    </div>
                 	예시 끝 -->
                 	<div id="contents">
  					<div id="js-load" class="main">
    				<ul class="lists">
    				<c:choose>
    				<c:when test="${requestScope.followers.get(0).getId() == null}">
											<tr>
												<td colspan="4">팔로워가 없습니다.</td>
											</tr>
										</c:when>
    				<c:otherwise>
    				
                 	<c:forEach items="${followers}" var="follower">
                 
                 	<li class="js-load">
                 		<div class="sp_col-md-4">               	
                        	<div class="blog-item-style-3" OnClick="location.href ='mmlMemberList?id=<c:out value="${follower.id}"/>'" style="padding-left:20px">
                        		<div class="blog-it-infor" style="vertical-align:middle">
                        			<img src="./resources/images/sp_image/<c:out value="${follower.m_image}"/>" class="profile_img" style="width:80px; height:80px;">
                        				<c:set var="level" value="${follower.m_level}"/>
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
                        				&nbsp;<h3 style="display:inline"><a href="blogdetail_light.html"></a><c:out value="${follower.m_nickname}"/></h3>
                        				
                        				<br>
                        				<h1 style="display:inline">Followers : </h1><h4 style="display:inline; color: lightcoral" ><c:out value="${follower.m_follower}"/>   </h4>
                        			 </div>
                       			</div>
                    		</div>
                       </li>
                       
                        </c:forEach>
                        </c:otherwise>
                        </c:choose>
    					</ul>
                       </div>
                       </div>
    		
    		<!-- 위의 c:forEach는 아래의 코드를 참조함. -코드로 배우는 웹 프로젝트(?)
    		 	<c:forEach items="${followers}" var="follower">  			
                   	<c:out value="${board.bno}"/></td>
                   	<td><a class='move' href='<c:out value="${board.bno}"/>'>
                   	<c:out value="${board.title}"/></a></td>
                   	<td><c:out value="${board.writer}"/></td>
                   	<td><fmt:formatDate pattern="yyyy-MM-dd" value=	"${board.regdate}"/></td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd" value=	"${board.updateDate}"/></td>
                </c:forEach>   
            -->                       
                </div>	
                    <center>
                        <div id="js-btn-wrap" class="btn-wrap"> <a href="javascript:;" class="button">더보기</a> </div>
                        <!--  <button type="button" class="btn-check" OnClick="location.href = '#'"> 더보기 </button>-->
                    </center>

			<div class="col-md-3 col-xs-12 col-sm-12">
			</div>
		</div>
	</div>
</div>
<!-- end of celebrity grid v2 section-->
		</div>


<script>
$(window).on('load', function () {
    load('#js-load', '1');
    $("#js-btn-wrap .button").on("click", function () {
        load('#js-load', '1', '#js-btn-wrap');
    });
});

function load(id, cnt, btn) {
    var girls_list = id + " .js-load:not(.active)";
    var girls_length = $(girls_list).length;
    var girls_total_cnt;
    if (cnt < girls_length) {
        girls_total_cnt = cnt;
    } else {
       girls_total_cnt = girls_length;
        $('.button').hide()
    }
    $(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
}

</script>

<%@ include file="../footer.jsp"%>
</body>
</html>