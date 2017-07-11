package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.BoardsVO;


public interface BoardsDAO {
	
	public List<BoardsVO> boardsListAll() throws Exception;
	public int getMaxBno() throws Exception;
	
}
