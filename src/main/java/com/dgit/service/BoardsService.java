package com.dgit.service;

import java.util.List;

import com.dgit.domain.BoardsVO;

public interface BoardsService {
	
	public List<BoardsVO> boardsListAll() throws Exception;
	public int getMaxBno() throws Exception;
	
}
