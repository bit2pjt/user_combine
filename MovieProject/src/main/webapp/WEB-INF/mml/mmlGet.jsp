<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<%@ include file="../header.jsp"%>

<br>
<br>


<div class="buster-light">
        <!-- blog detail section-->
        <div class="page-single">
            <div class="container">
                <div class="row">
                  
       
                      
                        <div class="blog-detail-ct">
                                <div class="flex-it share-tag" style="width:1258px; float:left;">
                                        <div class="social-link"">
                                       
                                            <div style="flex:2;">
                                       
                                            <h1 class="mmlTitle">나영리 제목</h1>
                                            
                                            </div>
                                           
                                            <div style="flex:2;"> 
                                            <img src="<c:url value="/resources/images/sp_image/왕관.jpg"/>" width="80px" height="80px">
                                            <a href="#"><img src="<c:url value="/resources/images/sp_image/하트.jpg"/>"></a>
                                            <a href="mmlFollowList.do"><img src="<c:url value="/resources/images/sp_image/팔로워.jpg"/>"></a>
                                            <a href="#"><img src="<c:url value="/resources/images/sp_image/팔로잉.jpg"/>"></a>&nbsp;&nbsp;&nbsp;&nbsp;
                                            <a href="#"><img src="<c:url value="/resources/images/sp_image/신고.jpg"/>"></a>

                                            </div>
                                         
                                            <div class="right-it" style="flex:1;">
                                                <h4>nickname</h4>
                                            2019.07.04
                                               
                                            </div>
                                            
                                        </div>
                                    </div>
                         
                        
                            
                            <textarea style="width:1258px; height: 358px; font-size:20px;">나영리내용</textarea>    



                            <!-- share link -->
                            <a href="movieInfo.html"> <img src="<c:url value="/resources/images/sp_image/노트북.jpg"/>" alt="" width="185" height="284" ></a>
                            
                            <a href="movieInfo.html">  <img src="<c:url value="/resources/images/sp_image/타이타닉.jpeg"/>" alt="" width="185" height="284"></a>
                            
                            <div class="flex-it share-tag" style="width:1258px; float:left;">
                                </div>
          
                            <!-- comment items -->
                            <div class="comments">
                                <h4>04 Comments</h4>
                                <div class="cmt-item flex-it">
                                   
                                    <div class="author-infor">
                                        <div class="flex-it2">
                                            <h6><a href="#">Steve Perry</a></h6> <span class="time"> - 27 Mar 2017</span>
                                        </div>
                                        <p>Even though Journey's classic vocalist Steve Perry didn’t reunite with the band during their Rock Hall performance (to the dismay of hopeful fans), he did offer up a touching speech.</p>
                                        
                                    </div>
                                </div>
                                <div class="cmt-item flex-it">
                                   
                                    <div class="author-infor">
                                        <div class="flex-it2">
                                            <h6><a href="#">Joss Whedon</a></h6> <span class="time"> - 27 Mar 2017</span>
                                        </div>
                                        <p>Prince died not long after the 2016 Rock Hall ceremony, so this year's edition featured Lenny Kravitz and a full gospel choir performing a swamp-funk take on When Doves Cry.</p>
                                    </div>
                                </div>
                                <div class="cmt-item flex-it">
                                   
                                    <div class="author-infor">
                                        <div class="flex-it2">
                                            <h6><a href="#">Dave McNary</a></h6> <span class="time"> - 27 Mar 2017</span>
                                        </div>
                                        <p>What the fuck!!!!!!!!!!   Blue Sky Studios is one of the world’s leading digital animation movie studios and we are proud of their commitment to stay and grow in Connecticut.</p>
                                    </div>
                                </div>
                                <div class="cmt-item flex-it">
                                   
                                    <div class="author-infor">
                                        <div class="flex-it2">
                                            <h6><a href="#">Margot Robbie</a></h6> <span class="time"> - 27 Mar 2017</span>
                                        </div>
                                        <p>Joan Baez was the sharpest of the Rock Hall inductees, singing about deportees and talking social activism as well as joking about her age and the likelihood that a good portion of the Barclays. </p>
                                      
                                    </div>
                                </div>
                            </div>
                            <div class="comment-form">
                                <h4>Leave a comment</h4>
                                <form action="">
                                   
                                    <div class="row">
                                        <div class="col-md-12">
                                            <textarea name="message" id="" placeholder="Message"></textarea>
                                        </div>
                                    </div>
                                    <button class="submit2" type="button">등록</button>
                                </form>
                            </div>
                            <!-- comment form -->
                        </div>
             
                   
                </div>
            </div>
        </div>
        <!-- end of  blog detail section-->
                </div>
                
                <%@ include file="../footer.jsp"%>
</body>
</html>