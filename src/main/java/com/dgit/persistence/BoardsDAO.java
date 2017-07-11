package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.BoardsVO;


public interface BoardsDAO {
	
	public List<BoardsVO> boardsListAll() throws Exception;
	public int getMaxBno() throws Exception;
	public void boardsInsert(BoardsVO vo);
	public BoardsVO boardsSelectByNo(int no) throws Exception;
	public void boardsDelete(int no) throws Exception;
	public void boardsUpdate(BoardsVO vo) throws Exception;
	
}
