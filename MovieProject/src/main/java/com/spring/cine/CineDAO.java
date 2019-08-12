package com.spring.cine;

import java.util.List;

public interface CineDAO {

	public List<CineVO> getLocalName(CineVO cineVO);
	
	public List<CineVO> getName(CineVO cineVO);
	
	public CineVO getCineInfo(CineVO cineVO);
}
