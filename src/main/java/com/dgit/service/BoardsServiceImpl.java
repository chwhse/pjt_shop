package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.BoardsVO;
import com.dgit.domain.Criteria;
import com.dgit.domain.SearchCriteria;
import com.dgit.persistence.BoardsDAO;

@Service
public class BoardsServiceImpl implements BoardsService {
	
	@Autowired
	private BoardsDAO dao;
	
	@Override
	public List<BoardsVO> boardsListAll() throws Exception {
		return dao.boardsListAll();
	}

	@Override
	public void boardsInsert(BoardsVO vo) throws Exception {
		vo.setBno(dao.getMaxBno());
		dao.boardsInsert(vo);
		dao.boardsContentInsert(vo);
	}

	@Override
	public BoardsVO boardsSelectByNo(int no) throws Exception {
		return dao.boardsSelectByNo(no);
	}

	@Override
	public void boardsDelete(int no) throws Exception {
		dao.boardsDelete(no);
		dao.boardsContentDelete(no);
	}

	@Override
	public void boardsUpdate(BoardsVO vo) throws Exception {
		dao.boardsUpdate(vo);
		dao.boardsContentUpdate(vo);
	}

	@Override
	public void setReadCnt(int no) throws Exception {
		dao.setReadCnt(no);
	}

	@Override
	public int searchCount(SearchCriteria cri) throws Exception {
		return dao.searchCount(cri);
	}

	@Override
	public List<BoardsVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}
}
