package com.spring.cine;

import java.util.List;

public interface CineService {
	public List<String> getLocalName(CineVO cineVO);
	
	public List<String> getName(CineVO cineVO);
	
	public CineVO getCineInfo(CineVO cineVO);
	
	public int getUser(String email);
}
