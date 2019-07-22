<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
/**
* @Class Name : mmlList.jsp
* @Description : 나영리 리스트
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


<!-- 3. heaer2.jsp : header -->
<%@ include file="../header2.jsp" %>

<br>
<br><br><br>

 <div class="flex-it share-tag" style="width:1258px; float:left;">
                                </div>

<div class="buster-light">

	<!-- celebrity grid v2 section-->
	<div class="page-single">
		<div class="container">
			<div class="row">
				<div style="display: flex">
					<div class="btn-group btn-group-lg mb-3" role="group"
						aria-label="Large button group" style="flex: 5">
						<button class="btn btn-secondary" type="button">최신순 보기</button>
						<button class="btn btn-secondary" type="button">추천순 보기</button>
					</div>
					<div style="flex: 2">
						<button type="button" class="btn-check" style="float:right"
							OnClick="location.href ='mmlWrite.do'">나영리 작성</button>
					</div>
				</div>
				<br>

<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item">
								<a class="page-link" href="#" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
								</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item">
								<a class="page-link" href="#" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
									<span class="sr-only">Next</span>
								</a>
							</li>
						</ul>
					</nav>




				<div class="row1">
	<div class="sp_col-md-41">
							<div class="card" OnClick="location.href ='mmlGet.do'" style="cursor:pointer;">
									<img class="card-img" src="<c:url value="/resources/images/sp_image/노트북.jpg"/>" alt="header" />
									<div class="card-info">
										<div class="card-ho"></div>
											<div class="ho-info" style="float:left;">									
												<h1 style="text-align: left;">mml_title</h1>
												<div style="float:left;"><img class="mml_crown" src="<c:url value="/resources/images/sp_image/crown.png"/>">&nbsp;<h3 style="display:inline; text-align:left" class="card-author" style="display:inline">ninkname</h3>
												</div><br>
													<span style="color:red"><i class="fas fa-heart"></i></span>&nbsp;15&nbsp;<i class="far fa-eye"></i>&nbsp;238&nbsp;
									
									</div>
									
									</div>
								  </div>
					</div>
						<div class="sp_col-md-41">
							<div class="card" OnClick="location.href ='mmlGet.do'" style="cursor:pointer;">
									<img class="card-img" src="<c:url value="/resources/images/sp_image/노트북.jpg"/>" alt="header" />
									<div class="card-info">
										<div class="card-ho"></div>
											<div class="ho-info" style="float:left;">									
												<h1 style="text-align: left;">mml_title</h1>
												<div style="float:left;"><img class="mml_crown" src="<c:url value="/resources/images/sp_image/crown.png"/>">&nbsp;<h3 style="display:inline; text-align:left" class="card-author" style="display:inline">ninkname</h3>
												</div><br>
													<span style="color:red"><i class="fas fa-heart"></i></span>&nbsp;15&nbsp;<i class="far fa-eye"></i>&nbsp;238&nbsp;
									
									</div>
									
									</div>
								  </div>
					</div>
						<div class="sp_col-md-41">
							<div class="card" OnClick="location.href ='mmlGet.do'" style="cursor:pointer;">
									<img class="card-img" src="<c:url value="/resources/images/sp_image/노트북.jpg"/>" alt="header" />
									<div class="card-info">
										<div class="card-ho"></div>
											<div class="ho-info" style="float:left;">									
												<h1 style="text-align: left;">mml_title</h1>
												<div style="float:left;"><img class="mml_crown" src="<c:url value="/resources/images/sp_image/crown.png"/>">&nbsp;<h3 style="display:inline; text-align:left" class="card-author" style="display:inline">ninkname</h3>
												</div><br>
													<span style="color:red"><i class="fas fa-heart"></i></span>&nbsp;15&nbsp;<i class="far fa-eye"></i>&nbsp;238&nbsp;
									
									</div>
									
									</div>
								  </div>
					</div>
						<div class="sp_col-md-41">
							<div class="card" OnClick="location.href ='mmlGet.do'" style="cursor:pointer;">
									<img class="card-img" src="<c:url value="/resources/images/sp_image/노트북.jpg"/>" alt="header" />
									<div class="card-info">
										<div class="card-ho"></div>
											<div class="ho-info" style="float:left;">									
												<h1 style="text-align: left;">mml_title</h1>
												<div style="float:left;"><img class="mml_crown" src="<c:url value="/resources/images/sp_image/crown.png"/>">&nbsp;<h3 style="display:inline; text-align:left" class="card-author" style="display:inline">ninkname</h3>
												</div><br>
													<span style="color:red"><i class="fas fa-heart"></i></span>&nbsp;15&nbsp;<i class="far fa-eye"></i>&nbsp;238&nbsp;
									
									</div>
									
									</div>
								  </div>
					</div>
						<div class="sp_col-md-41">
							<div class="card" OnClick="location.href ='mmlGet.do'" style="cursor:pointer;">
									<img class="card-img" src="<c:url value="/resources/images/sp_image/노트북.jpg"/>" alt="header" />
									<div class="card-info">
										<div class="card-ho"></div>
											<div class="ho-info" style="float:left;">									
												<h1 style="text-align: left;">mml_title</h1>
												<div style="float:left;"><img class="mml_crown" src="<c:url value="/resources/images/sp_image/crown.png"/>">&nbsp;<h3 style="display:inline; text-align:left" class="card-author" style="display:inline">ninkname</h3>
												</div><br>
													<span style="color:red"><i class="fas fa-heart"></i></span>&nbsp;15&nbsp;<i class="far fa-eye"></i>&nbsp;238&nbsp;
									
									</div>
									
									</div>
								  </div>
					</div>
						<div class="sp_col-md-41">
							<div class="card" OnClick="location.href ='mmlGet.do'" style="cursor:pointer;">
									<img class="card-img" src="<c:url value="/resources/images/sp_image/노트북.jpg"/>" alt="header" />
									<div class="card-info">
										<div class="card-ho"></div>
											<div class="ho-info" style="float:left;">									
												<h1 style="text-align: left;">mml_title</h1>
												<div style="float:left;"><img class="mml_crown" src="<c:url value="/resources/images/sp_image/crown.png"/>">&nbsp;<h3 style="display:inline; text-align:left" class="card-author" style="display:inline">ninkname</h3>
												</div><br>
													<span style="color:red"><i class="fas fa-heart"></i></span>&nbsp;15&nbsp;<i class="far fa-eye"></i>&nbsp;238&nbsp;
									
									</div>
									
									</div>
								  </div>
					</div>
						<div class="sp_col-md-41">
							<div class="card" OnClick="location.href ='mmlGet.do'" style="cursor:pointer;">
									<img class="card-img" src="<c:url value="/resources/images/sp_image/노트북.jpg"/>" alt="header" />
									<div class="card-info">
										<div class="card-ho"></div>
											<div class="ho-info" style="float:left;">									
												<h1 style="text-align: left;">mml_title</h1>
												<div style="float:left;"><img class="mml_crown" src="<c:url value="/resources/images/sp_image/crown.png"/>">&nbsp;<h3 style="display:inline; text-align:left" class="card-author" style="display:inline">ninkname</h3>
												</div><br>
													<span style="color:red"><i class="fas fa-heart"></i></span>&nbsp;15&nbsp;<i class="far fa-eye"></i>&nbsp;238&nbsp;
									
									</div>
									
									</div>
								  </div>
					</div>
						<div class="sp_col-md-41">
							<div class="card" OnClick="location.href ='mmlGet.do'" style="cursor:pointer;">
									<img class="card-img" src="<c:url value="/resources/images/sp_image/노트북.jpg"/>" alt="header" />
									<div class="card-info">
										<div class="card-ho"></div>
											<div class="ho-info" style="float:left;">									
												<h1 style="text-align: left;">mml_title</h1>
												<div style="float:left;"><img class="mml_crown" src="<c:url value="/resources/images/sp_image/crown.png"/>">&nbsp;<h3 style="display:inline; text-align:left" class="card-author" style="display:inline">ninkname</h3>
												</div><br>
													<span style="color:red"><i class="fas fa-heart"></i></span>&nbsp;15&nbsp;<i class="far fa-eye"></i>&nbsp;238&nbsp;
									
									</div>
									
									</div>
								  </div>
					</div>
						<div class="sp_col-md-41">
							<div class="card" OnClick="location.href ='mmlGet.do'" style="cursor:pointer;">
									<img class="card-img" src="<c:url value="/resources/images/sp_image/노트북.jpg"/>" alt="header" />
									<div class="card-info">
										<div class="card-ho"></div>
											<div class="ho-info" style="float:left;">									
												<h1 style="text-align: left;">mml_title</h1>
												<div style="float:left;"><img class="mml_crown" src="<c:url value="/resources/images/sp_image/crown.png"/>">&nbsp;<h3 style="display:inline; text-align:left" class="card-author" style="display:inline">ninkname</h3>
												</div><br>
													<span style="color:red"><i class="fas fa-heart"></i></span>&nbsp;15&nbsp;<i class="far fa-eye"></i>&nbsp;238&nbsp;
									
									</div>
									
									</div>
								  </div>
					</div>
						<div class="sp_col-md-41">
							<div class="card" OnClick="location.href ='mmlGet.do'" style="cursor:pointer;">
									<img class="card-img" src="<c:url value="/resources/images/sp_image/노트북.jpg"/>" alt="header" />
									<div class="card-info">
										<div class="card-ho"></div>
											<div class="ho-info" style="float:left;">									
												<h1 style="text-align: left;">mml_title</h1>
												<div style="float:left;"><img class="mml_crown" src="<c:url value="/resources/images/sp_image/crown.png"/>">&nbsp;<h3 style="display:inline; text-align:left" class="card-author" style="display:inline">ninkname</h3>
												</div><br>
													<span style="color:red"><i class="fas fa-heart"></i></span>&nbsp;15&nbsp;<i class="far fa-eye"></i>&nbsp;238&nbsp;
									
									</div>
									
									</div>
								  </div>
					</div>
						<div class="sp_col-md-41">
							<div class="card" OnClick="location.href ='mmlGet.do'" style="cursor:pointer;">
									<img class="card-img" src="<c:url value="/resources/images/sp_image/노트북.jpg"/>" alt="header" />
									<div class="card-info">
										<div class="card-ho"></div>
											<div class="ho-info" style="float:left;">									
												<h1 style="text-align: left;">mml_title</h1>
												<div style="float:left;"><img class="mml_crown" src="<c:url value="/resources/images/sp_image/crown.png"/>">&nbsp;<h3 style="display:inline; text-align:left" class="card-author" style="display:inline">ninkname</h3>
												</div><br>
													<span style="color:red"><i class="fas fa-heart"></i></span>&nbsp;15&nbsp;<i class="far fa-eye"></i>&nbsp;238&nbsp;
									
									</div>
									
									</div>
								  </div>
					</div>
						<div class="sp_col-md-41">
							<div class="card" OnClick="location.href ='mmlGet.do'" style="cursor:pointer;">
									<img class="card-img" src="<c:url value="/resources/images/sp_image/노트북.jpg"/>" alt="header" />
									<div class="card-info">
										<div class="card-ho"></div>
											<div class="ho-info" style="float:left;">									
												<h1 style="text-align: left;">mml_title</h1>
												<div style="float:left;"><img class="mml_crown" src="<c:url value="/resources/images/sp_image/crown.png"/>">&nbsp;<h3 style="display:inline; text-align:left" class="card-author" style="display:inline">ninkname</h3>
												</div><br>
													<span style="color:red"><i class="fas fa-heart"></i></span>&nbsp;15&nbsp;<i class="far fa-eye"></i>&nbsp;238&nbsp;
									
									</div>
									
									</div>
								  </div>
					</div>
						<div class="sp_col-md-41">
							<div class="card" OnClick="location.href ='mmlGet.do'" style="cursor:pointer;">
									<img class="card-img" src="<c:url value="/resources/images/sp_image/노트북.jpg"/>" alt="header" />
									<div class="card-info">
										<div class="card-ho"></div>
											<div class="ho-info" style="float:left;">									
												<h1 style="text-align: left;">mml_title</h1>
												<div style="float:left;"><img class="mml_crown" src="<c:url value="/resources/images/sp_image/crown.png"/>">&nbsp;<h3 style="display:inline; text-align:left" class="card-author" style="display:inline">ninkname</h3>
												</div><br>
													<span style="color:red"><i class="fas fa-heart"></i></span>&nbsp;15&nbsp;<i class="far fa-eye"></i>&nbsp;238&nbsp;
									
									</div>
									
									</div>
								  </div>
					</div>
						<div class="sp_col-md-41">
							<div class="card" OnClick="location.href ='mmlGet.do'" style="cursor:pointer;">
									<img class="card-img" src="<c:url value="/resources/images/sp_image/노트북.jpg"/>" alt="header" />
									<div class="card-info">
										<div class="card-ho"></div>
											<div class="ho-info" style="float:left;">									
												<h1 style="text-align: left;">mml_title</h1>
												<div style="float:left;"><img class="mml_crown" src="<c:url value="/resources/images/sp_image/crown.png"/>">&nbsp;<h3 style="display:inline; text-align:left" class="card-author" style="display:inline">ninkname</h3>
												</div><br>
													<span style="color:red"><i class="fas fa-heart"></i></span>&nbsp;15&nbsp;<i class="far fa-eye"></i>&nbsp;238&nbsp;
									
									</div>
									
									</div>
								  </div>
					</div>
						<div class="sp_col-md-41">
							<div class="card" OnClick="location.href ='mmlGet.do'" style="cursor:pointer;">
									<img class="card-img" src="<c:url value="/resources/images/sp_image/노트북.jpg"/>" alt="header" />
									<div class="card-info">
										<div class="card-ho"></div>
											<div class="ho-info" style="float:left;">									
												<h1 style="text-align: left;">mml_title</h1>
												<div style="float:left;"><img class="mml_crown" src="<c:url value="/resources/images/sp_image/crown.png"/>">&nbsp;<h3 style="display:inline; text-align:left" class="card-author" style="display:inline">ninkname</h3>
												</div><br>
													<span style="color:red"><i class="fas fa-heart"></i></span>&nbsp;15&nbsp;<i class="far fa-eye"></i>&nbsp;238&nbsp;
									
									</div>
									
									</div>
								  </div>
					</div>
						<div class="sp_col-md-41">
							<div class="card" OnClick="location.href ='mmlGet.do'" style="cursor:pointer;">
									<img class="card-img" src="<c:url value="/resources/images/sp_image/노트북.jpg"/>" alt="header" />
									<div class="card-info">
										<div class="card-ho"></div>
											<div class="ho-info" style="float:left;">									
												<h1 style="text-align: left;">mml_title</h1>
												<div style="float:left;"><img class="mml_crown" src="<c:url value="/resources/images/sp_image/crown.png"/>">&nbsp;<h3 style="display:inline; text-align:left" class="card-author" style="display:inline">ninkname</h3>
												</div><br>
													<span style="color:red"><i class="fas fa-heart"></i></span>&nbsp;15&nbsp;<i class="far fa-eye"></i>&nbsp;238&nbsp;
									
									</div>
									
									</div>
								  </div>
					</div>
					
				</div>

				
				<div class="col-md-3 col-xs-12 col-sm-12"></div>
			</div>
		</div>
	</div>
	<!-- end of celebrity grid v2 section-->
</div>

<%@ include file="../footer.jsp"%>
</body>
</html>