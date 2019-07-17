<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
/**
* @Class Name : mmlWrite.jsp
* @Description : 나영리 글쓰기
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
<br>
<br>


    <div class="buster-light" style="padding:75,600,75,600">
        <!-- 글쓰기 폼의 시작.-->
        <form>
            <!-- 1. 글쓰기 부분 전체를 감싸는 상자(writer-box)를 만든다 [19/07/03 border:1px solid black; 덜어냄. 더 깔끔하라고-->
            <div id="writer-box" style="padding:75,600,75,600">
                <!-- 2.상단부는 제목과 출처가 들어간다. -->
                <center>
                    <div id="top-writer" style="padding:75,600,75,600">
                        <br><br>
                        <span><strong>&nbsp;&nbsp;제목 :&nbsp;&nbsp;&nbsp;&nbsp; </strong></span> <span>
                            <!-- 밑줄만 나오는 style서식 -->
                            <input name="bf_title" style="width:850px;border-color:#999999; background-color:#FFFFFF; border-style:solid;
    border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-right-width:0px;
    color:#0000FF;" placeholder="제목을 적어주세요"></span> <span>00/50자 남음</span>
                        <br><br>

                        <br>
                        <br>
                        <br>
                    </div>
                </center><!-- end of top-writer -->
                <!-- 3. 중상단은 텍스트로 고정된 공지사항이 자리잡는다. -->
                <center>
     
               <strong style="vertical-align:top;">&nbsp;&nbsp;내용 :&nbsp;&nbsp;&nbsp;&nbsp; </strong>
                    <textarea style="border:1; width:900px; height:400px; display:inline-block;" placeholder="내용을 적어주세요"></textarea>
 </center>
                <br>
                <br>
                <center>
                    <div class="tab-content">
                        <div id="tab1" class="tab active">
                            <div class="row">

                                <div class="slick-multiItem">
                                    <div class="slide-it">
                                        <div class="movie-item">



                                            <img src="<c:url value="/resources/images/sp_image/노트북.jpg"/>" alt="" width="185" height="284">



                                        </div>

                                    </div>



                                    <div class="slide-it">
                                        <div class="movie-item">

                                            <a href="movieList.do"> </i>

                                                <img src="<c:url value="/resources/images/sp_image/mv-item1.jpg"/>" alt="" width="185" height="284">


                                                <i class="ion-android-arrow-dropright"></i>Add Movie</a>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>


                </center>


                <!-- 다홍색 단추를 가져오긴 했는데... 스타일만 가져오겠지? 기존의 것은 submit버튼의 양식 -->
                <!-- ticket의 단추 가져오기 실패. <a>에만 쓸 수 있는 스타일이다 -->
                <center class="form-style-1" style="background-color:#FFFFFF;">
         
                        <button type="button" class="btn-check" OnClick="location.href ='mmlList.do'">등록</button> &nbsp;
                        <button type="button" class="btn-check" OnClick="location.href ='mmlList.do'">취소</button>
                

                </center>
            </div>

    </div><!-- end of writer-box -->
    </form>
   
  

<%@ include file="../footer.jsp"%>
</body>
</html>