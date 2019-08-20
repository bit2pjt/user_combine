<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
/**
* @Class Name : mmlMemberList.jsp
* @Description : 나영리 멤버 리스트
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
<link rel="stylesheet" href="<c:url value="/resources/css/sp_style.css" />">

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
                <div class="flex-it share-tag" style="width:1258px; float:left;">
                        <div class="social-link" style="width:1258px; display:flex;">
                       
                            <div style="flex:2;">
                                <img src="<c:url value="/resources/images/sp_image/dog.jfif"/>"  class="profile_img">
                           &nbsp;&nbsp; <img class="crown" src="<c:url value="/resources/images/sp_image/crown.png"/>">&nbsp;<h2 style="display:inline">${follower.m_nickname}</h2>
                            </div>
                           
                            <div style="flex:2;"> 
                          
                            <h4 style="display:inline; color: lightcoral" >${follower.m_follower }</h4>&nbsp;&nbsp;&nbsp;&nbsp;<h4 style="display:inline">Followers</h4> 
                          
							&nbsp;&nbsp;&nbsp;&nbsp; <h4 style="display:inline; color: lightcoral">${follower.m_following } &nbsp;&nbsp;&nbsp;  </h4><h4 style="display:inline">Followings</h4>
                            
                            </div>
                            
                        </div>
                    </div>
                   
                    <div class="blog-detail-ct">
                    <div class="flex-it share-tag" style="width:1258px;">
                        </div>
                        </div>
                    
				




				<div class="row1">
				<div id="contents">
				<div id="js-load" class="main">
	
	<c:forEach var="mml3" items="${requestScope.mmlList3 }">
	<li class="js-load">
	<div class="sp_col-md-41" id="js-load">
							<div class="card" OnClick="location.href ='mmlGet?mml_num=${mml3.mml_num} '" style="cursor:pointer;">
									<img class="card-img" src="<c:url value="/resources/images/sp_image/${mml3.mml_poster }"/>" alt="header" />
									<div class="card-info">
										<div class="card-ho"></div>
											<div class="ho-info" style="float:left;">									
												<h1 style="text-align: left; font-size:25px">${mml3.mml_title }</h1>
												<div style="float:left;"><img class="mml_crown" src="<c:url value="/resources/images/sp_image/crown.png"/>">&nbsp;
												<h3 style="display:inline; text-align:left" class="card-author" style="display:inline">${mml3.m_nickname }</h3>
												</div><br>
													<span style="color:red"><i class="fas fa-heart"></i></span>&nbsp;${mml3.mml_like }&nbsp;<i class="far fa-eye"></i>&nbsp;${mml3.mml_view_count }&nbsp;
									
									</div>
									
									</div>
								  </div>
					</div>
					</li>
					</c:forEach>
							
				
						
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