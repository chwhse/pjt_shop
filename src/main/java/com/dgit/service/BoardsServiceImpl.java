package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.BoardsVO;
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
	public int getMaxBno() throws Exception {
		return dao.getMaxBno();
	}
}
