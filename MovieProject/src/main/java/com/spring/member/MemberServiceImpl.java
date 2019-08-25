package com.spring.member;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;

import org.apache.ibatis.session.SqlSession;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.spring.movie.MovieCrawlVO;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service("memberService")
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	@Autowired
	private SqlSession sqlSession;

	@Setter(onMethod_ = { @Autowired })
	private MemberDAO memberDAOglobal;

	@Autowired
	private JavaMailSender mailSender;

	// 회원가입
	/**
	 * 회원가입
	 * 
	 * @param memberVO vo
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException
	 */
	@Override
	public int memberJoin(MemberVO vo) throws MessagingException, UnsupportedEncodingException {
		System.out
				.println("=============MemberServiceImpl.java - memberJoin() =====================\n memberVO : " + vo);
		vo.setM_cert("N");
		vo.setM_deleteyn("N");
		vo.setM_following(0);
		vo.setM_follower(0);
		vo.setM_level("BRONZE");
		vo.setM_blacklist("N");
		vo.setM_authkey("no");
		int result = memberDAOglobal.memberJoin(vo);
		System.out.println(
				"=============MemberServiceImpl.java - memberJoin() =====================\n memberDAOglobal.memberJoin(vo) : "
						+ result);
		int id = memberDAOglobal.getId(vo.getM_email(), vo.getM_password());
		vo.setId(id);
		// start | 메일인증 관련 부분
		System.out.println("MemberServiceImpl.java id = " + id);
		// 임의의 authkey 생성
		String m_authkey = new TempKey().getKey(50, false);
		System.out.println(m_authkey);
		vo.setM_authkey(m_authkey);
		memberDAOglobal.setAuthkey(vo);

		// mail 작성 관련
		MailUtils sendMail = new MailUtils(mailSender);

		sendMail.setSubject("[BlockBuster] 회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>").append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				.append("<a href='http://192.168.1.6:8080/movie/joinConfirm?id=").append(id).append("&m_email=")
				.append(vo.getM_email()).append("&m_authkey=").append(m_authkey)
				.append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("bit0hyj@gmail.com", "BlockBuster Admin");
		sendMail.setTo(vo.getM_email());
		sendMail.send();

		// end | 메일인증 관련 부분
		return result;
	}

	// 인증키 지우기(인증메일을 통해 인증성공시 인증키 지움)
	@Override
	public int deleteAuthkey(MemberVO vo) {
		vo.setM_authkey("no");
		int result = memberDAOglobal.setAuthkey(vo);
		return result;
	}

	// 인증키 가져오기
	@Override
	public String getAuthkey(int id) {
		String result = memberDAOglobal.getAuthkey(id);
		return result;
	}

	// 인증상태 변경
	@Override
	public int updateCert(MemberVO vo) {
		int result = memberDAOglobal.updateCert(vo);

		return result;
	}

	// 인증상태 가져오기
	@Override
	public String getCertById(int id) {
		String result = memberDAOglobal.getCertById(id);
		return result;
	}

	// 로그인시 유저정보 체크
	/**
	 * 로그인 시 회원 체크
	 * 
	 * @param email - 입력한 email
	 * @param pw    - 입력한 password
	 * @return 회원 여부 결과
	 */
	@Override
	public int userCheck(String email, String pw) {
		int x = -1;
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		MemberVO vo = memberDAO.userCheck(email);

		if (vo != null) {
			if (pw.equals(vo.getM_password()))
				x = 1; // 아이디/비밀번호 둘다 맞는경우
			else
				x = -1;// 아이디는 맞지만 비밀번호가 다른경우
		} else
			x = 0; // 회원이 아닌 경우
		return x;
	}

	// 인증상태 가져오기(로그인시)
	@Override
	public String getCert(String m_email, String m_password) {
		String result = memberDAOglobal.getCert(m_email, m_password);
		return result;
	}

	// 탈퇴여부 가져오기(로그인시)
	@Override
	public String getDeletestatus(String m_email, String m_password) {
		String result = memberDAOglobal.getDeletestatus(m_email, m_password);
		return result;
	}

	// 아이디 가져오기(로그인시)
	@Override
	public int getId(String m_email, String m_password) {

		return memberDAOglobal.getId(m_email, m_password);
	}

	// 아이디(이메일) 찾기
	@Override
	public String findEmail(MemberVO vo) {
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		String email = memberDAO.findEmail(vo);

		if (email != null) {
			return email;
		} else
			return "fail";

	}

	// 비밀번호 찾기 - 새로운 임시 비밀번호 발급
	@Override
	public String findPw(MemberVO vo) throws MessagingException, UnsupportedEncodingException {
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		MemberVO resultVO = memberDAO.findPw(vo);
		if (resultVO == null) {
			return "fail";
		} else {
			// start | 메일인증 관련 부분
			System.out.println("MemberServiceImpl.java - findPw() -id = " + resultVO.getId());
			// 임의의 authkey 생성
			String m_password = new TempKey().getKey(6, false);
			resultVO.setM_password(m_password);
			memberDAOglobal.updatePw(resultVO);

			// mail 작성 관련
			MailUtils sendMail = new MailUtils(mailSender);

			sendMail.setSubject("[BlockBuster] 임시 비밀번호 발급");
			sendMail.setText(new StringBuffer().append("<h1>[임시 비밀번호 발급]</h1>")
					.append("임시 비밀번호가 발급되었습니다. \n아래의 임시 비밀번호로 로그인 후 마이페이지에서 비밀번호를 변경해주세요. ")
					.append("\n" + resultVO.getM_password() + "\n").toString());
			sendMail.setFrom("bit0blockbuster@gmail.com", "BlockBuster Admin");
			sendMail.setTo(resultVO.getM_email());
			sendMail.send();

			// end | 메일인증 관련 부분
			return "success";
		}
	}

	// 이메일 중복체크
	/**
	 * 계정 중복확인
	 * 
	 * @param memberVO vo
	 */
	@Override
	public boolean emailOverlapChk(MemberVO vo) {
		if (memberDAOglobal.emailOverlapChk(vo.getM_email()) == 0) {
			System.out.println("일치하는 메일 없음");
			return true;
		} else {
			System.out.println("일치하는 메일 존재. 1 on n");
			return false;
		}
	}

	// 닉네임 중복체크
	/**
	 * 닉네임 중복확인
	 * 
	 * @param memberVO vo
	 */
	@Override
	public boolean nickOverlapChk(MemberVO vo) {
		if (memberDAOglobal.nickOverlapChk(vo.getM_nickname()) == 0) {
			System.out.println("일치하는 닉네임 = 사용 가능");
			return true;
		} else {
			System.out.println("일치하는 닉네임 존재. 1 on n");
			return false;
		}
	}

	
	@Override
	public List<MovieChartVO> getCGV() {
		String targetUrl  = "http://www.cgv.co.kr/movies/";
		List<String> thumnail = null;
		List<String> title = null;
		List<String> yema = null;
		List<MovieChartVO> list = new ArrayList<MovieChartVO>();

		try {
            Document doc = Jsoup.connect(targetUrl).get();
            thumnail = doc.select(".box-image").select("img").eachAttr("src");
            title = doc.select("div.box-contents > a > strong").eachText();
            yema = doc.select("div.box-contents > div.score > strong.percent > span").eachText();
            yema.add("0.4%");
            
            for(int i=0; i<7; i++) {
            	MovieChartVO vo = new MovieChartVO();
	        	vo.setThumnail(thumnail.get(i));
	        	vo.setMovieTitle(title.get(i));
	        	vo.setScore(yema.get(i));
	        	
	        	list.add(vo);
	        }
	        	
	      }catch (IOException e) {
            e.printStackTrace();
	      }
		
		return list;
	}

	@Override
	public List<MovieChartVO> getNaver() {
		String targetUrl  = "https://movie.naver.com/movie/running/current.nhn";
		List<String> thumnail = null;
		List<String> title = null;
		List<String> yema = null;
		List<String> star = null;
		List<MovieChartVO> list = new ArrayList<MovieChartVO>();

		try {
            Document doc = Jsoup.connect(targetUrl).get();
            thumnail = doc.select(".thumb").select("img").eachAttr("src");
            title = doc.select(".thumb").select("img").eachAttr("alt");
            yema = doc.select("dd.star > dl.info_exp > dd > div > span.num").eachText();
            star = doc.select("dd.star > dl.info_star > dd > div > a > span.num").eachText();
                      
            for(int i=0; i<8; i++) {
            	MovieChartVO vo = new MovieChartVO();
	        	vo.setThumnail(thumnail.get(i));
	        	vo.setMovieTitle(title.get(i));
	        	vo.setStar(star.get(i));
	        	vo.setScore(yema.get(i)+"%"); // 예매
	        		
	        	list.add(vo);
	        }
	        	
	      }catch (IOException e) {
            e.printStackTrace();
	      }
		
		return list;
	}

	@Override
	public List<MovieChartVO> getDaum() {
		String targetUrl  = "https://movie.daum.net/boxoffice/weekly";
		List<String> thumnail = null;
		List<String> title = null;
		List<String> yema = null;
		List<String> yema1 = null;
		List<MovieChartVO> list = new ArrayList<MovieChartVO>();
		
		try {
            Document doc = Jsoup.connect(targetUrl).get();
            thumnail = doc.select(".thumb_movie").select("img").eachAttr("src");
            title = doc.select(".thumb_movie").select("img").eachAttr("alt");
            yema = doc.select("span.wrap_grade.grade_netizen > span:nth-child(2)").eachText();
            yema1 = doc.select("span.wrap_grade.grade_netizen > span:nth-child(4)").eachText();
            List<String> star = new ArrayList<String>();
            
            for(int i=0; i<yema.size(); i++) {
            	yema.set(i,yema.get(i).substring(1));
            	yema1.set(i, yema1.get(i).substring(1));
            	star.add(yema.get(i)+"."+yema1.get(i));
            }
            
            for(int i=0; i<8; i++) {
            	MovieChartVO vo = new MovieChartVO();
	        	vo.setThumnail(thumnail.get(i));
	        	vo.setMovieTitle(title.get(i));
	        	vo.setStar(star.get(i));
	        		
	        	list.add(vo);
	        }
	        	
	      }catch (IOException e) {
            e.printStackTrace();
	      }
		
		return list;
	}
}