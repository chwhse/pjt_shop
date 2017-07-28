package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.CommentsVO;
import com.dgit.domain.Criteria;

public interface CommentsDAO {
	public CommentsVO commentsSelectByCno(int cno) throws Exception;

	public CommentsVO latestCommentsSelectByRno(int rno) throws Exception;
	
	public List<CommentsVO> list(int rno) throws Exception;
	
	public void add(CommentsVO vo) throws Exception;
	
	public void modify(CommentsVO vo) throws Exception;
	
	public void remove(int no) throws Exception;
	
	public int count(int no) throws Exception;
	
	public int getRno(int no) throws Exception;
}
