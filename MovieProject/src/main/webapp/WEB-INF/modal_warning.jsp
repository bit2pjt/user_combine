<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<!-- start | modal -->
						<div class="modal fade" id="warning-modal" role="dialog">
							<div class="modal-dialog" style="margin-top: 100px;">
								<div class="modal-content">
									<a data-dismiss="modal" style="font-weight: bold;float: right;margin-right: 10px;font-size: 30px;">x</a>
									<!-- start | modal-header -->
									<div class="modal-header">
										<h4 class="modal-warning-title">신고하기</h4>
									</div>
									<!-- end | modal-header -->
									<!-- start | modal-body -->
									<div class="modal-body">
										<textarea id="bf_warncontent" name="bf_warncontent" style="resize:none;width:100%;height:200px;"></textarea>
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