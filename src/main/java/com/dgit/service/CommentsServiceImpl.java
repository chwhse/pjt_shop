package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.CommentsVO;
import com.dgit.domain.Criteria;
import com.dgit.persistence.CommentsDAO;
import com.dgit.persistence.ReviewsDAO;

@Service
public class CommentsServiceImpl implements CommentsService {
	@Autowired
	private CommentsDAO dao;

	@Override
	public CommentsVO commentsSelectByCno(int cno) throws Exception {
		return dao.commentsSelectByCno(cno);
	}
	@Override
	public CommentsVO latestCommentsSelectByRno(int rno) throws Exception{
		return dao.latestCommentsSelectByRno(rno);
	}

	@Override
	public List<CommentsVO> list(int rno) throws Exception {
		return dao.list(rno);
	}


	@Override
	public void addComment(CommentsVO vo) throws Exception {
		dao.add(vo);
	}

	@Override
	public void modifyComment(CommentsVO vo) throws Exception {
		dao.modify(vo);
	}

	@Override
	public void removeComment(int no) throws Exception {
		dao.remove(no);
	}
	@Override
	public int count(int no) throws Exception {
		return dao.count(no);
	}

	@Override
	public int getRno(int no) throws Exception {
		return dao.getRno(no);
	}


}
