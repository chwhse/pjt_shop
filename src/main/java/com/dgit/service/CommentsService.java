package com.dgit.service;

import java.util.List;

import com.dgit.domain.CommentsVO;
import com.dgit.domain.Criteria;

public interface CommentsService {
	public CommentsVO commentsSelectByCno(int cno) throws Exception;
	
	public CommentsVO latestCommentsSelectByRno(int rno) throws Exception;
	
	public List<CommentsVO> list(int rno) throws Exception;
	
	public void addComment(CommentsVO vo) throws Exception;
	
	public void modifyComment(CommentsVO vo) throws Exception;
	
	public void removeComment(int no) throws Exception;
	
	public int count(int no) throws Exception;
	
	public int getRno(int no) throws Exception;
}
