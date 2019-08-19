package com.spring.ticketing;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class DataSheet {
	
	public static HashMap<String, String> getCGV() {
		HashMap<String, String> result = new HashMap<String, String>();

		String targetUrl ="http://m.cgv.co.kr/Schedule/?tc=0001&t=T&ymd=20190813&src=";
		 try {
			Document doc = Jsoup.connect(targetUrl).get();
			//System.out.println("모바일 페이지에서 가쟈온 cgv의 doc"+doc);
			List<String> titles	= doc.select(".arealist_wrap").select("li").select("a").eachAttr("title");
			System.out.println("상영관 이름들은 "+titles);
			List<String> codes	= doc.select(".arealist_wrap").select("li").select("a").eachAttr("href");
			System.out.println("상영관 코드들은 "+codes);
			
			for(int i=0;i<codes.size();i++) {
						
				result.put(titles.get(i).substring(3), codes.get(i).substring(23, 27));
			}
			return result;
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//문장의 형식을 맞추기 위한 리턴문	
		 return result;
	}

	public static HashMap<String, String> getMagaBox() {
		HashMap<String, String> result = new HashMap<String, String>();
		String targetUrl ="http://www.megabox.co.kr/?menuId=theater-detail&region=10&cinema=1372";
		
		try {
			Document doc = Jsoup.connect(targetUrl).get();
		
			List<String> titles	= doc.select(".theater_menu_wrap").select("ul").select("li").select("ul").select("li").select("a").eachText();
			List<String> codes	= doc.select(".theater_menu_wrap").select("ul").select("li").select("ul").select("li").select("a").eachAttr("data-code");
		
			for(int i=0;i<codes.size();i++) {
				result.put(titles.get(i), codes.get(i));
			}
			return result;
			
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("문제발생으로 별다른 값이 없는 해쉬맵 반환되는 경우.");
		return result;
	}
	
	public static HashMap<String, String> getLotte() {
		HashMap<String, String> result = new HashMap<String, String>();
		String targetUrl ="http://www.lottecinema.co.kr/LCHS/Contents/Cinema/charlotte-special-cinema.aspx?divisionCode=2&screendivcd=300";
		
		try {
			Document doc = Jsoup.connect(targetUrl).get();
			
			List<String> hrefs = doc.select(".depth_03").select("ul").select("li").select("a").eachAttr("href");
			List<String> titles = doc.select(".depth_03").select("ul").select("li").select("a").eachText();
						
			for(int i=0;i < hrefs.size();i++) {
				String str = "";
				str = hrefs.get(i);
				str = str.substring(str.length()-4, str.length());
				
				//특수관은 3자리 이기 때문에, =000 형태가 담긴다. =을 제거해주자.
				str.replace("=", "");
				
				result.put(titles.get(i),str );
			}
			
			System.out.println("결과 데이터는 "+result);

			return result;
			
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("문제발생으로 별다른 값이 없는 해쉬맵 반환되는 경우.");
		return result;
	}
	
}//e_class
