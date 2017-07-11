package com.dgit.service;

import java.util.List;

import com.dgit.domain.BoardsVO;

public interface BoardsService {
	
	public List<BoardsVO> boardsListAll() throws Exception;
	public void boardsInsert(BoardsVO vo) throws Exception;
	public BoardsVO boardsSelectByNo(int no) throws Exception;
	public void boardsDelete(int no) throws Exception;
	public void boardsUpdate(BoardsVO vo) throws Exception;
	
}
