package com.spring.mypage;
/**
* @Class Name : FolFolDTO.java
* @Description : 팔로잉팔로워정보 가져오기 위한 DTO
* @Modification Information
* @
* @  수정일     	  수정자                 수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.08.01     김상필                최초생성
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/

import lombok.Data;

@Data
public class FolFolDTO {

	private int id;				//멤버ID(회원 식별 번호)
	private String m_nickname;	//닉네임
	private int mf_ing;
	private int mf_wer;
	
}

