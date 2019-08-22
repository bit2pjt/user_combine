package com.spring.ticketing;

import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
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
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.*;
import com.google.gson.stream.*;

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
			
			
			Document doc2 = Jsoup.connect(targetUrl)
					.ignoreContentType(true)
					.get();
			
//			JsonReader jr = new JsonReader(new StringReader(doc));
//			jr.setLenient(true);
//			JsonArray jar =jr.beginArray();
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
			    	//System.out.println("하나의 cineVO에는 다음의 값들이 담김"+into);
			    	
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
			    	//System.out.println("극장 "+into.getCineName()+"에는 다음과 같은 상영관 정보가 담김"+into.getScreenInfos());
			    		
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
	//3사 링크
	
	
	@Override
	public String linkToCGV(String day, String cinema, String title, String startTime) {
		
		// 날짜는 중간에 구분자 없이 연속되도록.
		String formedDay =day.replace("-", "");
		String formedTime = startTime.replace(":", "");
		// 우선은 소수의 표본으로만 진행을 해보자. 	
		HashMap<String, String> cgvCineEntries = DataSheet.getCGV();
		
		String pureCineName = cinema.substring(4);
		System.out.println("순수 극장명 추출"+pureCineName);
		
		String cgvCineCode = cgvCineEntries.get(pureCineName);
		System.out.println("추출된 cgv 상영관 코드 "+cgvCineCode);
		
		
		String targetUrl = "http://www.cgv.co.kr/common/showtimes/iframeTheater.aspx?areacode=01&theatercode="+cgvCineCode+"&date="+formedDay;
		try {
			Document doc = Jsoup.connect(targetUrl).get();
			//System.out.println("겟챠"+doc);
			
			//제목의 수가 상영수일 수 가 없다. 어쩌지? titles 리스트에서 우선 몇 번째 인덱스가 일치하는 값인지 찾은 후, 해당 인덱스를 :child(n)으로 붙여주면 될거같다.
			List<String> titles = doc.select(".info-movie").select("a").select("strong").eachText();
			
			int index=0;
			for(int i=0;i<titles.size();i++) {
				if(titles.get(i).equals(title)) {
					System.out.println(i+"번째 인덱스가 "+title+" 과 제목이 일치. 해당 index를 저장");
					index = i;
				}
			}
			
			//아래의 둘은 언제나 같은 인덱스에 같은 정보가 들어간다. 위의 정보를 토대로 올바르게 접근했다면, 
			Element cineSchedules	= doc.select(".sect-showtimes").select("ul").select("li").select(".col-times").get(index);	//한 단계씩 들어가보자. get에서 한 번 끊어 담고 다시 끄집어 내야하나??
			List<String> links		= cineSchedules.select(".info-timetable").select("ul").select("li").select("a").eachAttr("href");
			List<String> showTime 	= cineSchedules.select(".info-timetable").select("ul").select("li").select("a").eachAttr("data-playstarttime");
					
			System.out.println("상영시간은 "+showTime);
			System.out.println("해당 링크는 "+links);
		
			//인덱스 순서대로 해쉬맵에 집어넣자
			HashMap<String, String> hm = new HashMap<String, String>();
			
			for(int i=0;i<showTime.size();i++) {
				hm.put(showTime.get(i), links.get(i));
			}
			
			System.out.println("입력될 시작시간 확인 "+formedTime);
			String result = "http://www.cgv.co.kr/"+hm.get(formedTime);
			System.out.println("최종결과 URL은 다음과 같다"+result);
			
			return result;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//2. url 완성
		String returnUrl ="뭔가 실행이 안될 때 나오는 문장";
		//3. 완성된 url을 반환. 연결처리는 화면에서 javaScript로 처리한다.
		return returnUrl;
	}

	@Override
	public String linkToLotte(String day, String cinema, String title, String startTime) {
		
		String targetUrl ="http://www.lottecinema.co.kr/LCHS/Contents/Cinema/Cinema-Detail.aspx?divisionCode=1&detailDivisionCode=1&cinemaID=9056";
		
		HashMap<String, String> megaCineList = DataSheet.getLotte();
			
		String result= 	"http://www.lottecinema.co.kr/LCHS/"
						+ "Contents/Cinema/Cinema-Detail.aspx?cinemaID="
						+megaCineList.get(cinema.substring(6));
		return result;
	
		//만약, 좌석예약까지 가고싶다면, selenium 라이브러리를 사용해야 한다. 
	
	}

	
	@Override
	public String linkToMegaBox(String day, String cinema, String title, String startTime, String initDay) {
		
		int formedDay =Integer.parseInt(day.replace("-", ""));
		int formedInitDay =Integer.parseInt(initDay.replace("-", ""));
		int paging =formedDay - formedInitDay; //메가박스는 페이징으로 날짜를 구분. 0이 항상 오늘이므로, 선택일 - 오늘을 구하면 페이징처리 가능
		
		System.out.println("숫자로 형변환된 날짜는 "+formedDay);
		
		//1. 상영관 이름을 단서로 극장코드부터 구하자.
		HashMap<String, String> megaCineList = DataSheet.getMagaBox();
		
		//2. cinema에서 브랜드 명을 빼주자
		String pureCineName = cinema.substring(5);
		System.out.println("순수 극장명 추출"+pureCineName);//확인
		
		//3. 추출된 이름을 기준으로 메가박스의 데이터 검색.
		String cgvCineCode = megaCineList.get(pureCineName);
		System.out.println("추출된 MegaBox 상영관 코드 "+cgvCineCode);
		
		//4. 상영관코드를 단서로 핵심 페이지 접근
		String targetUrl= "http://www.megabox.co.kr/?menuId=theater-detail&region=10&cinema="+cgvCineCode;
				
				//"http://www.megabox.co.kr/pages/theater/Theater_Schedule.jsp?count="+paging+"&cinema="+cgvCineCode;
		// * 메가박스는 오늘을 0으로 페이징으로 날짜를 구분한다. 그렇다면 선택날짜 - 시작날짜를 하면 페이징을 구할 수 있다.
		return targetUrl;
		//5. 크롤링 시작
//		try {
//			Document doc = Jsoup.connect(targetUrl).get();
//			System.out.println("메가박스 핵심페이지는"+doc);
//		
//		//6. 제목을 담고있는 패턴을 추출하자. 제목이 몇 번째에 놓여있는지 알아낸다면, 동일한 위치에서 상영정보와 링크를 추출할 수 있다.	
//			List<String> titles = doc.select(".movie_time_table").select("tr").select("th").select("div").select("strong").select("a").eachText();
//			System.out.println("제목 목록은 "+titles);
//		
//		//7. 화면에서 긁어온 제목과 일치하는 내용의 index 번호를 구해주자.	
//			int index =titles.indexOf(title);
//			
//		//8. 인덱스를 단서로, 해당 영화의 상영정보를 가져오자.
//			
//			
//			
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		
	}

	@Override
	public OutterRateVO getOutterRate(String name) {
		try {
		OutterRateVO orVO = new OutterRateVO();
			
		//1. 네이버
		String naverUrl ="https://movie.naver.com/movie/search/result.nhn?query="+name+"&section=all&ie=utf8";
		Document naverDoc = Jsoup.connect(naverUrl).get();
		
			String naverStar =naverDoc.select(".view_star").get(0).attr("style");
			orVO.setNaver(naverStar.substring(6, 8)+"%");
			System.out.println("네이버는 "+naverStar.substring(6, 8)+"%");
			
		//2. 다음
		String daumUrl ="https://search.daum.net/search?q="+name+"&w=tot&DA=S43";
		Document daumDoc = Jsoup.connect(daumUrl).get();
	
			String daumUrl2 = daumDoc.select(".rate").select("a").attr("href");
			Document daumDoc2 = Jsoup.connect(daumUrl2).get();//System.out.println("다음평점은 "+daumStar);
			String daumStar1	= daumDoc2.select(".tit_movie").select(".info_menu").select("span").get(2).text();
			//daumStar	+= daumDoc2.select(".tit_movie").select(".info_menu").select("span").get(3).text();
			String daumStar2	= daumDoc2.select(".tit_movie").select(".info_menu").select("span").get(4).text();
			int ds1 = Integer.parseInt(daumStar1)*10;
			int ds2 = Integer.parseInt(daumStar2);
			
			String daumStar = ds1+ds2+"%";
			
			System.out.println("다음 평점은 "+daumStar);
			
			orVO.setDaum(daumStar);
		
		//3. cgv
		String cgvUrl ="http://www.cgv.co.kr/search/?query="+name;
		Document cgvDoc = Jsoup.connect(cgvUrl).get();
			String cgvUrl2 ="http://www.cgv.co.kr"+ cgvDoc.select(".sect-chart").select(".box-image").select("a").attr("href");
			
			Document cgvDoc2 = Jsoup.connect(cgvUrl2).get();
			
			try {
			String cgvStar = cgvDoc2.select(".egg-gage").select(".percent").get(0).text();
			System.out.println("시지비는 "+cgvStar);
			orVO.setCgv(cgvStar);
			}catch(IndexOutOfBoundsException e) {
				System.out.println("검색결과가 없는 경우 IOE가 나온다.");
			orVO.setCgv("00%");
			}
			
			return orVO;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("오류로 정상수행 안됐을 때 나오는 구문 : 외부사이트 평점담기");
		return null;
	}

	
	
			

}
