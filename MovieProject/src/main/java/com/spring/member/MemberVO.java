package com.spring.member;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
	private int id;				//硫ㅻ쾭ID(�쉶�썝 �떇蹂� 踰덊샇)
	private String m_nickname;	//�땳�꽕�엫
	private String m_image;		//�봽濡쒗븘�궗吏�
	private String m_email;		//�씠硫붿씪
	private String m_eagree;	//�씠硫붿씪 �닔�떊�룞�쓽
	private String m_sagree;	//sms �닔�떊�룞�쓽
	private String m_name;		//�씠由�
	private String m_phone;		//�쟾�솕踰덊샇
	private String m_cert;		//�씠硫붿씪 �씤利앹뿬遺�
	private String m_password;	//�뙣�뒪�썙�뱶
	private Date m_regdate;		//�쉶�썝媛��엯�씪
	private Date m_update_date;	//�쉶�썝�젙蹂� �닔�젙�씪
	private String m_deleteyn;	//�깉�눜�뿬遺�
	private int m_following;	//�뙏濡쒖엵�닔
	private int m_follower;		//�뙏濡쒖썙�닔
	private String m_level;		//�뿞釉붾읆 �벑湲�
	private String m_favorite;	//�꽑�샇�옣瑜�
	private String m_blacklist;	//釉붾옓由ъ뒪�듃 �뿬遺�
}

