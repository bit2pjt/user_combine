package com.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Movie_InfoVO {


	private int mi_code;		//영화 코드
	private String mi_ktitle;	//영화이름
	private String mi_etitle;	//영화이름eng
	private String mi_director;	//감독이름
	private String mi_poster;	//포스터
	private Date mi_releaseday;	//개봉일
	private String mi_ccode;	//국가명
	private String mi_actor;	//배우
	private String mi_story;	//줄거리
	private String mi_teaser;	//티저
	private String grade_code;	//심의등급
	private String mi_gcode;	//장르
	
}
