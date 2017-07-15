package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.GoodsVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.persistence.GoodsDAO;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsDAO dao;
	
	@Override
	public List<GoodsVO> goodsListAll() throws Exception {
		return dao.goodsListAll();
	}

	@Override
	public void goodsInsert(GoodsVO vo) throws Exception {
		vo.setGcode(dao.getMaxGcode());
		dao.goodsInsert(vo);
		dao.goodsDetailInsert(vo);
	}

	@Override
	public GoodsVO goodsSelectByCode(String code) throws Exception {
		return dao.goodsSelectByCode(code);
	}

	@Override
	public void goodsDelete(int no) throws Exception {
		dao.goodsDelete(no);
		dao.goodsDetailDelete(no);
	}

	@Override
	public void goodsUpdate(GoodsVO vo) throws Exception {
		dao.goodsUpdate(vo);
		dao.goodsDetailUpdate(vo);
	}

	@Override
	public int searchCount(SearchCriteria cri) throws Exception {
		return dao.searchCount(cri);
	}

}
