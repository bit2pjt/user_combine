package com.spring.ticketing;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.concurrent.TimeUnit;

import org.json.JSONArray;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service("ticketingService")
public class TicketingServiceImpl implements TicketingService {

	@Override
	public void getMovieListFromNaver() {
		
		
		//1. Jsoup�� �̿��� 
		String custom_header = 
				"?ISNormal=3y+GIXzg3xKpOjlKjH8+Fg==" + 
				"&Language=zqWM417GS6dxQ7CIf65+iA==" + 
				"&REQSITE=x02PG4EcdFrHKluSEQQh4A==" + 
				"&Screen_Rating_Cd=nG6tVgEQPGU2GvOIdnwTjg=="
				;
		
		String targetUrl = "http://ticket.cgv.co.kr/Reservation/Reservation.aspx?MOVIE_CD=20020129&MOVIE_CD_GROUP=20020129&PLAY_YMD=&THEATER_CD=&PLAY_NUM=&PLAY_START_TM=&AREA_CD=&SCREEN_CD=&THIRD_ITEM=";//+custom_header;
		
		try {
			Document doc = Jsoup.connect(targetUrl)
							.get();
						
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void getMovieListViaSelenium() {
		
		System.setProperty("webdriver.chrome.driver", "c:\\selenium\\chromedriver.exe");	//guava가 반드시 필요하다
		WebDriver chrome = new ChromeDriver();
		chrome.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
		
		String url = "http://www.cgv.co.kr/ticket/";
		chrome.get(url);
		
		WebElement el = chrome.findElement(By.className("text"));
		
	}

	@Override
	public ArrayList<TicketingVO> getAccessViaMaxmovie() {
		// TODO Auto-generated method stub
String targetUrl = "https://ticket.maxmovie.com/Movie/Play?playType=G&sortType=R";
		
		try {
			//1. 
			Document doc = Jsoup.connect(targetUrl).get();
			//System.out.println("��ȯ���� "+doc); //DOM의 전문을 볼 때 주석을 풀고 확인
			
			//2. 
			
			ArrayList<TicketingVO> ticketingBaseData = new ArrayList<TicketingVO>();
			
			//
			ArrayList<String> movieCode = (ArrayList<String>) doc.select(".currbox > .currlist").select(".curclass").select("a").eachAttr("href");
			ArrayList<String> movieTitle = (ArrayList<String>) doc.select(".currbox > .currlist").select(".curclass").select("a").eachText();
			ArrayList<String> movieReservRate = (ArrayList<String>) doc.select(".currbox > .currlist").select(".cstar").select(".crbar").eachText();
			ArrayList<String> movieRate = (ArrayList<String>) doc.select(".currbox > .currlist").select(".cstar").select(".crba").eachText();
			
			//3. 
			for(int i=0;i<movieCode.size();i++) {
				movieCode.set(i,movieCode.get(i).substring(25));
			}
			System.out.println("영화 고유코드배열 ="+movieCode);
			System.out.println("영화제목 배열 ="+movieTitle);
			System.out.println("예매율 배열 ="+movieRate);
			
			//4. 동일한 인덱스는 동일한 영화를 가르킨다. 반복문으로 각 인덱스를 꺼내서 하나의 VO에 옮겨담는다. 
			for(int i=0;i<movieReservRate.size();i++) {
				TicketingVO datas = new TicketingVO();
				datas.setCode(movieCode.get(i));
				datas.setTitle(movieTitle.get(i));
				datas.setReserveRate(movieReservRate.get(i));
				datas.setRate(movieRate.get(i));
				
				ticketingBaseData.add(datas);
			}
			
			System.out.println("TicketingVO에 배열들을 옮겨담음");
			for(int i=0;i<ticketingBaseData.size();i++) {
				System.out.println(i+"번 VO의 값은 : "+ticketingBaseData.get(i));
			}
		
			return ticketingBaseData;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		System.out.println("에러 발생으로 구문수행이 되지 않음.");
		return null;
		
	}

	@Override
	public MovieDetailVO getDetailViaMaxmovie(String mvCode) {
	String targetUrl = "https://ticket.maxmovie.com/Max/Movie?m_id="+mvCode;	
	try {
		String doc = Jsoup.connect(targetUrl)
				.ignoreContentType(true)
				.execute().body();
		System.out.println("doc? "+doc);
		
		
		Gson gson = new Gson(); 
		String json = doc;
		Map<String, HashSet<String>> map = new HashMap<String, HashSet<String>>();
		map = gson.fromJson(json, map.getClass());
		Map<String, String> innerData =(Map<String, String>) map.get("Data");
		
		System.out.println("innerData는 = "+innerData.get("Name"));
		
		
		MovieDetailVO md = new MovieDetailVO();
		
		md.setName(innerData.get("Name"));
		md.setNameEn(innerData.get("NameEn"));
		md.setPosterImage(innerData.get("PosterImage"));
		//md.setRunningTime((String)innerData.get("RunningTime")); 
		md.setOpendateLast(innerData.get("OpendateLast"));
		md.setGenre(innerData.get("Genre"));
		md.setGrade(innerData.get("Grade"));
		
		
				
		System.out.println("MDVO의 값은 "+md);
		
		return md;
		
		
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	System.out.println("뭔가 잘못되서 null값이 나가는중");
	return null;
	} 
	
	
	
	@Override
	public ArrayList<CineInfoVO> getCineListViaMaxmovie(String mvCode, String today) {	//날짜변수도 받도록 추가해야하는데...
		
		String targetUrl = "https://ticket.maxmovie.com/Max/PlaySchedule?T_ID=&M_ID="+mvCode+"&playdate="+today;	
		ArrayList<CineInfoVO> cineMeta = new ArrayList<CineInfoVO>();
		
		try {
			String doc = Jsoup.connect(targetUrl)
					.ignoreContentType(true)
					.execute().body();
			
				//1. 파싱 시작. 단, 긁어올 때 빈칸 등에 의해 일부 데이터가 읽어와지지 않는다. 다행히 영화 '사자'는 전부 가져와지므로 해당 영화를 기준으로 작업을 진행하고 향후 수정하자
				JsonParser parser = new JsonParser();
			    JsonObject JOdoc = (JsonObject) parser.parse(doc);	//string이 JO로 변환되었다.
			   			    
			    JsonArray data = JOdoc.getAsJsonArray("Data");		//유효 데이터가 시작되는 Data를 JA로 꺼냈다. 각 인덱스에는 극장별 정보가 담겨있다.
			    System.out.println("trade parsing = "+data);
			   
			    //2. Data를 순회하며 데이터 세팅
			    for(int i=0;i<data.size();i++) {
			    	//하나의 인덱스 = 하나의 극장에 담긴 모든 정보 추출
			    	CineInfoVO into = new CineInfoVO();			//하나의 극장정보는 모두 cineVO에 담길 것이다.
			    	JsonObject cine =(JsonObject) data.get(i);//극장 n이 튀어나왔다.
			    	
			    	String t_id =cine.get("T_ID").getAsString();
			    	String cineName =cine.get("Name").getAsString(); 
			    	String agc =cine.get("AreaGroupCode").getAsString(); 
			    	String aic =cine.get("AreaItemCode").getAsString(); 
			    	String supplier =cine.get("SupplierType").getAsString(); 
			    	into.setT_id(t_id);
			    	into.setCineName(cineName);
			    	into.setAgc(agc);
			    	into.setAic(aic);
			    	into.setSupplierType(supplier);
			    	
			    	//하나의 정보를 담고있는 정보들은 모두 적재가 완료되었다.
			    	System.out.println("하나의 cineVO에는 다음의 값들이 담김"+into);
			    	
			    	//Lv2 작업 시작
			    	List<ScreenInfoVO> screenInfos = new ArrayList<ScreenInfoVO>();
			    	JsonArray jaLv2 =cine.getAsJsonArray("ScreenInfos");
			    	// 상영관은 관별로 정보가 담겨있다.
			    		for(int j=0;j<jaLv2.size();j++) {
			    			ScreenInfoVO sivo = new ScreenInfoVO();
			    			//JsonArray si = cine.getAsJsonArray("ScreenInfos");
			    			JsonObject screen = (JsonObject) jaLv2.get(j);
			    			String code = screen.get("Code").getAsString();
			    			String name = screen.get("Name").getAsString();
			    			String ptn	= screen.get("PlayTypeName").getAsString();
			    			sivo.setCode(code);
			    			sivo.setScreenName(name);
			    			sivo.setPlayTypeName(ptn);
			    			
			    			List<ShowInfoVO> showInfo = new ArrayList<ShowInfoVO>();
			    			JsonArray jaLv3 = screen.getAsJsonArray("ScheduleInfos");
			    			//Lv3 시작
			    				for(int k=0;k<jaLv3.size();k++) {
			    					ShowInfoVO showVO = new ShowInfoVO();
			    					JsonObject show = (JsonObject) jaLv3.get(k);
			    					int seq = show.get("Seq").getAsInt();
			    					int playSeq = show.get("PlaySeq").getAsInt();
			    					String pd = show.get("PlayDate").getAsString();
			    					String pn = show.get("PlayNo").getAsString();
			    					String pst = show.get("PlayStartTime").getAsString();
			    					String pet = show.get("PlayEndTime").getAsString();
			    					showVO.setSeq(seq);
			    					showVO.setPlaySeq(playSeq);
			    					showVO.setPlayDate(pd);
			    					showVO.setPlayNo(pn);
			    					showVO.setPlayStartTime(pst);
			    					showVO.setPlayEndTime(pet);
			    					
			    					showInfo.add(showVO);
			    				}
			    			sivo.setScheduleInfos(showInfo);
			    			//scree.get("ScheduleInfos").getAsJsonArray();
			    			//System.out.println("상영정보 정상적으로 담겼는지 확인 :"+sivo.getScheduleInfos());
			    		
			    			// Lv3까지 모두 담는다.
			    			screenInfos.add(sivo);
			    			
			    		}
			    	into.setScreenInfos(screenInfos);
			    	System.out.println("극장 "+into.getCineName()+"에는 다음과 같은 상영관 정보가 담김"+into.getScreenInfos());
			    		
			    	cineMeta.add(into);
			    	
			    }
			    
			 //   System.out.println(data.get(0));	
			       
			return cineMeta;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		System.out.println("몬가 문제가 잇어서 구문이 안 돌아감");
		return cineMeta;
		
		
		
	}

	
	
			

}
