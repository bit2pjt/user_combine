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
<%@ include file="../header.jsp"%>

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
                                <img src="<c:url value="/resources/images/sp_image/개사진.jfif"/>" width="80px" height="80px">
                            <h1 style="display:inline">nickname</h1>
                            </div>
                           
                            <div style="flex:2;"> 
                            <img src="<c:url value="/resources/images/sp_image/왕관.jpg"/>" width="80px" height="80px">
                            <h1 style="display:inline">팔로워 </h1> <h4 style="display:inline; color: lightcoral" >140  </h4>
                            <h1 style="display:inline">팔로잉 </h1> <h4 style="display:inline; color: lightcoral">27  </h4>
                            
                            </div>
                            
                        </div>
                    </div>
                   
                    <div class="blog-detail-ct">
                    <div class="flex-it share-tag" style="width:1258px;">
                        </div>
                        </div>
                    
				
				<div class="row">
					
					<div class="sp_col-md-4">
							<div class="card" OnClick="location.href ='mmlGet.do'" style="cursor:pointer;">
									<img class="card-img" src="<c:url value="/resources/images/sp_image/노트북.jpg"/>" alt="header" style="width: 350px; height: 300px;" />
									<div class="card-info">
									<h1 class="card-title">mml_title</h1>
									<div class="card-icon">6</div>
									<p class="card-author">ninkname</p>
									<p class="card-stats">6 <img src="https://placehold.it/20" alt="hi" /> 6 <img src="https://placehold.it/20" alt="hi" /></p>
									</div>
								  </div>
					</div>
					<div class="sp_col-md-4">
							<div class="card" OnClick="location.href ='mmlGet.do'" style="cursor:pointer;">
									<img class="card-img" src="<c:url value="/resources/images/sp_image/타이타닉.jpeg"/>" alt="header"style="width: 350px; height: 300px;"/>
									<div class="card-info">
									<h1 class="card-title">mml_title</h1>
									<div class="card-icon">6</div>
									<p class="card-author">ninkname</p>
									<p class="card-stats">6 <img src="https://placehold.it/20" alt="hi" /> 6 <img src="https://placehold.it/20" alt="hi" /></p>
									</div>
								  </div>
					</div>
					<div class="sp_col-md-4">
							<div class="card" OnClick="location.href ='mmlGet.do'" style="cursor:pointer;">
									<img class="card-img" src="<c:url value="/resources/images/sp_image/히트.jpg"/>" alt="header" style="width: 350px; height: 300px;"/>
									<div class="card-info">
									<h1 class="card-title">mml_title</h1>
									<div class="card-icon">6</div>
									<p class="card-author">ninkname</p>
									<p class="card-stats">6 <img src="https://placehold.it/20" alt="hi" /> 6 <img src="https://placehold.it/20" alt="hi" /></p>
									</div>
								  </div>
					</div>

				</div>
				<div class="row">
					
						<div class="sp_col-md-4">
								<div class="card" OnClick="location.href ='mmlGet.do'" style="cursor:pointer;">
										<img class="card-img" src="https://placehold.it/350x300" alt="header" />
										<div class="card-info">
										<h1 class="card-title">mml_title</h1>
										<div class="card-icon">6</div>
										<p class="card-author">ninkname</p>
										<p class="card-stats">6 <img src="https://placehold.it/20" alt="hi" /> 6 <img src="https://placehold.it/20" alt="hi" /></p>
										</div>
									  </div>
						</div>
						<div class="sp_col-md-4">
								<div class="card" OnClick="location.href ='mmlGet.do'" style="cursor:pointer;">
										<img class="card-img" src="https://placehold.it/350x300" alt="header" />
										<div class="card-info">
										<h1 class="card-title">mml_title</h1>
										<div class="card-icon">6</div>
										<p class="card-author">ninkname</p>
										<p class="card-stats">6 <img src="https://placehold.it/20" alt="hi" /> 6 <img src="https://placehold.it/20" alt="hi" /></p>
										</div>
									  </div>
						</div>
						<div class="sp_col-md-4">
								<div class="card" OnClick="location.href ='mmlGet.do'" style="cursor:pointer;">
										<img class="card-img" src="https://placehold.it/350x300" alt="header" />
										<div class="card-info">
										<h1 class="card-title">mml_title</h1>
										<div class="card-icon">6</div>
										<p class="card-author">ninkname</p>
										<p class="card-stats">6 <img src="https://placehold.it/20" alt="hi" /> 6 <img src="https://placehold.it/20" alt="hi" /></p>
										</div>
									  </div>
						</div>
					</div>
					
                    <center>
                        
                        <button type="button" class="btn-check" OnClick="location.href = #"> 더보기 </button>
                    </center>

			<div class="col-md-3 col-xs-12 col-sm-12">
			</div>
		</div>
	</div>
</div>
<!-- end of celebrity grid v2 section-->
		</div>  



<%@ include file="../footer.jsp"%>
</body>
</html>