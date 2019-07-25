<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int qna_no = Integer.parseInt(request.getParameter("qna_no"));
%>
<!--
/**
* @Class Name : one_get.jsp
* @Description : 1:1문의 상세
* @Modification Information
* @
* @  수정일               수정자                  수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.06         황진석                최초생성
* @ 2019.07.07  박현민       header, footer 수정   
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/
-->
<!-- 1. header1.jsp : head  -->
<%@ include file="../header1.jsp"%>
<!-- 2. 여기에 페이지별 css 추가해주세요 -->
<link rel="stylesheet" href="<c:url value="/resources/css/hjs.css" />">
<!-- 3. heaer2.jsp : header -->
<%@ include file="../header2.jsp"%>
<!-- 4. 여기에 페이지별 본문을 추가해주세요 -->
<br>
<div class="buster-light">
    <div class="page-single">
        <div class="container">
            <div class="row ipad-width2">
                <div class="col-md-3 col-sm-12 col-xs-12">
                    <div class="info">
                        <h2>
                            <strong>황진석 님</strong>
                        </h2>
                        <h3>
                            <strong>h10046245h@naver.com</strong>
                        </h3>
                    </div>
                    <div class="user-information-hjs">
                        <div class="user-fav">
                            <ul>
                                <li><a href="mypage.do">마이페이지</a></li>
                            </ul>
                            <ul>
                                <li>회원 정보</li>
                                <li><a href="pw_confirm.do">&nbsp;&nbsp;&nbsp;&nbsp;회원정보수정</a></li>
                                <li><a href="member_out.do">&nbsp;&nbsp;&nbsp;&nbsp;회원탈퇴</a></li>
                            </ul>
                            <ul>
                                <li>고객센터</li>
                                <li><a href="one_list.do">&nbsp;&nbsp;&nbsp;&nbsp;1:1
                                        문의내역</a></li>
                                <li><a href="faq.do">&nbsp;&nbsp;&nbsp;&nbsp;FAQ</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--  좌측 메뉴 끝 -->
                <div>
                    <div class="col-md-9 col-sm-12 col-xs-12">
                        <div class="info_update">
                            <h1>
                                <strong>1:1 문의내역</strong>
                            </h1>
                        </div>
                        <div>
                            <form>
                                <ul>
                                    <li class="tb_line">
                                        <div class="tb_th1">상담구분</div>
                                        <div class="tb_td1">
                                            <label for=""> <label
                                                class="fancy-radio custom-color-coral"> <input
                                                    name="one" type="radio" checked><span><i></i><b>영화
                                                            문의</b></span>
                                            </label> <label class="fancy-radio custom-color-coral"> <input
                                                    name="one" type="radio"><span><i></i><b>예매
                                                            문의</b> </span>
                                            </label> <label class="fancy-radio custom-color-coral"> <input
                                                    name="one" type="radio"><span><i></i><b>이벤트
                                                            문의</b></span>
                                            </label> <label class="fancy-radio custom-color-coral"> <input
                                                    name="one" type="radio"><span><i></i><b>회원정보
                                                            문의</b></span>
                                            </label> <label class="fancy-radio custom-color-coral"> <input
                                                    name="one" type="radio"><span><i></i><b>기타
                                                            문의</b></span>
                                            </label>
                                            </label>
                                        </div>
                                    </li>
                                    <li class="tb_line">
                                        <div class="tb_th1">닉네임</div>
                                        <div class="tb_td1">${requestScope.m_nickname }</div>
                                    </li>
                                    <li class="tb_line">
                                        <div class="tb_th1">제목</div>
                                        <div class="tb_td1">
                                            ${requestScope}</div>
                                    </li>
                                    <li class="tb_line">
                                        <div style="display: inline-block">
                                            <div class="tb_th1">내용</div>
                                            <div class="tb_td1">
                                                내용입니다.내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다
                                                내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다
                                                내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다
                                                내용입니다내용입니다내용입니다내용입니다내용입니다</div>
                                        </div>
                                    </li>
                                </ul>
                                <br>
                                <div class="btn_m">
                                    <input type="button" onClick="location.href='one_update.do?qna_no=<%=qna_no %>'"  class="btn-check-hjs" value="수정">
                                    &nbsp; <input type="reset" class="btn-check-hjs" value="삭제">
                                </div>
                                <br>
                            </form>
                        </div>
                        <br>
                        <br>
                        <!-- hm |관리자 답변 폼 -->
                        <div>
                            <form>
                                <ul>
                                    <li class="tb_line"></li>
                                    <li class="tb_line">
                                        <div class="tb_th1">답변일시</div>
                                        <div class="tb_td1">2019/07/19</div>
                                    </li>
                                    <li class="tb_line">
                                        <div style="display: inline-block">
                                            <div class="tb_th1">답변내용</div>
                                            <div class="tb_td1">
                                                내용입니다.내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다
                                                내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다
                                                내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다
                                                내용입니다내용입니다내용입니다내용입니다내용입니다</div>
                                        </div>
                                    </li>
                                </ul>
                                <br>
                                <div class="btn_m">
                                    <input type="button" onClick="location.href='one_list.do'"class="btn-check-hjs" value="> 목록으로 돌아가기">
                                </div>
                            </form>
                        </div>
                        <!--  hm |관리자 답변 폼  끝 -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- footer section-->
<!-- 5. footer1.jsp : footer -->
<%@ include file="../footer1.jsp"%>
<!-- 6. 페이지별 script 추가해 주세요. -->
<!-- 7. footer2.jsp : script -->
<%@ include file="../footer2.jsp"%>