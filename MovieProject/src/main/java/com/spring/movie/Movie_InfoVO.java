package com.spring.movie;

import java.util.Date;

import lombok.Data;

@Data
public class Movie_InfoVO {

	private int mi_code;		//영화코드
	private String mi_ktitle;	//영화이름_한국어
	private String mi_etitle;	//영화이름_영어
	private String mi_director;	//영화감독
	private String mi_poster;	//포스터
	private Date mi_releaseday;	//영화개봉일
	private String mi_ccode;	//제작국가
	private String mi_actor;	//영화출연 배우
	private String mi_story;	//줄거리
	private String mi_teaser;	//티저영상 링크
	private String grade_code;	//심의등급
	private String mi_gcode;	//장르
}
