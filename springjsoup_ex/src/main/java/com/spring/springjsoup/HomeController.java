package com.spring.springjsoup;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Locale;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "home";
	}
	
	@RequestMapping(value = "/crawl.do", method = RequestMethod.GET)
	public ModelAndView crawl(ModelAndView model) {
		// Jsoup : https://jsoup.org/
		// Jsoup를 이용해서 네이버 스포츠 해외 축구 크롤링
		//String url = "https://sports.news.naver.com/wfootball/index.nhn";
		// CGV 영화 시간표
		String url = "http://www.cgv.co.kr/common/showtimes/iframeTheater.aspx";
        Document doc = null;
         
        try {
            doc = Jsoup.connect(url).get();
        } catch (IOException e) {
            e.printStackTrace();
        }
         
        // 주요 뉴스로 나오는 태그를 찾아서 가져오도록 한다.
        Elements element = doc.select("div.home_news");
         
        // 1. 헤더 부분의 제목을 가져온다.
        String title = element.select("h2").text().substring(0, 4);
        
        System.out.println("============================================================");
        System.out.println(title);
        System.out.println("============================================================");
        
       
        ArrayList<String> list_text = new ArrayList<String>(); 
        ArrayList<String> list_link = new ArrayList<String>(); 
        
        // 2. 하위 뉴스 기사들을 for문 돌면서 출력
        for(Element el : element.select("li")) { 
        	String text = el.text().toString();
        	//String text = el.select("a").attr("title");
        	String link = "https://sports.news.naver.com" + el.select("a").attr("href");
            System.out.println(text);
            System.out.println(link);
            System.out.println("--------------------------------------------------------");
            list_text.add(text);
            list_link.add(link);
        }  
		
        model.addObject("title", title);
        model.addObject("list_text", list_text);
        model.addObject("list_link", list_link);
        model.setViewName("crawl");
        
		return model;
	}
}