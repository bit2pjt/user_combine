package com.spring.cine;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CineController {

	@Autowired
	CineService cineService;
	
	@RequestMapping(value="/cinemaList", method=RequestMethod.GET)
	public String cinemaList(){
		
		return "event/cinemaList";
	}
	
	@ResponseBody
	@RequestMapping(value="/cineLocal", method=RequestMethod.GET)
	public List<String> cineLocal(@RequestParam("cc_brand") String cc_brand, @RequestParam("cc_localnum") int cc_localnum) {
		CineVO cineVO = new CineVO();
		cineVO.setCC_BRAND(cc_brand);
		cineVO.setCC_LOCALNUM(cc_localnum);;
		
		List<String> list = cineService.getLocalName(cineVO);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/cineName", method=RequestMethod.GET)
	public List<String> cineName(@RequestParam("cc_brand") String cc_brand, @RequestParam("cc_localnum") int cc_localnum ,@RequestParam("cc_local_name") String cc_local_name) {
		CineVO cineVO = new CineVO();
		cineVO.setCC_BRAND(cc_brand);
		cineVO.setCC_LOCALNUM(cc_localnum);
		cineVO.setCC_LOCAL_NAME(cc_local_name);
		List<String> list = cineService.getName(cineVO);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/getCineInfo", method=RequestMethod.GET)
	public CineVO getCineInfo(@RequestParam("cc_brand") String cc_brand, @RequestParam("cc_localnum") int cc_localnum 
			,@RequestParam("cc_local_name") String cc_local_name, @RequestParam("cc_name") String cc_name) {
		CineVO cineVO = new CineVO();
		cineVO.setCC_BRAND(cc_brand);
		cineVO.setCC_LOCALNUM(cc_localnum);
		cineVO.setCC_LOCAL_NAME(cc_local_name);
		cineVO.setCC_NAME(cc_name);
		CineVO list = cineService.getCineInfo(cineVO);
		
		return list;
	}
}
