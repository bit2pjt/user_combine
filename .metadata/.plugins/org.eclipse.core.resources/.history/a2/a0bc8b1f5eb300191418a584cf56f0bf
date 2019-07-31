package com.spring.mml;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Mml_PageServiceImpl implements Mml_PageService {
	private static final int displayRow = 4;
	
	private static final int pageCount = 3;
	
	@Autowired
	private Mml_PageMapper mml_PageMapper;
	
	@Override
	public Mml_PageResult paging(int page) throws Exception{
		
		int rowCount = mml_PageMapper.selectRowCount();
		
		Mml_PageDTO pageDTO = this.getPageDTO(page, rowCount, displayRow, pageCount);
		
		Mml_PageParam mml_PageParam = new Mml_PageParam();
		mml_PageParam.setDisplayRow(displayRow);
		mml_PageParam.setOffset(pageDTO.getOffset());

		List<Mml_ListDTO> Mml_PageList = mml_PageMapper.selectPageList(mml_PageParam);
		
		Mml_PageResult pageResult = new Mml_PageResult();
		
		pageResult.setPageDTO(pageDTO);
		pageResult.setPageList(Mml_PageList);
		
		return pageResult;
		
		
	}

	public Mml_PageDTO getPageDTO(int currentPage, int rowCount, int displayRow, int pageCount) throws Exception {
		
		int startPage;
		int endPage;
		int lastPage;
		int offset;
		
		startPage = (currentPage-1)/pageCount*pageCount+1;
		endPage=startPage+pageCount-1;
		offset=(currentPage-1)*displayRow;
		lastPage=(rowCount/displayRow)+1;
		
		if(rowCount%displayRow==0) {
			lastPage--;
		}
		
		if(endPage>lastPage) {
			endPage=lastPage;
		}
		
		Mml_PageDTO pageDTO = new Mml_PageDTO();
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setStartPage(startPage);
		pageDTO.setLastPage(lastPage);
		pageDTO.setPageCount(pageCount);
		pageDTO.setRowCount(rowCount);
		pageDTO.setDisplayRow(displayRow);
		pageDTO.setOffset(offset);
		
		return pageDTO;
	}

}
