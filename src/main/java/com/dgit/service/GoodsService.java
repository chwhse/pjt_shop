package com.dgit.service;

import java.util.List;

import com.dgit.domain.GoodsVO;
import com.dgit.domain.SearchCriteria;

public interface GoodsService {
	
	public List<GoodsVO> goodsListAll() throws Exception;
	public void goodsInsert(GoodsVO vo) throws Exception;
	public GoodsVO goodsSelectByCode(String code) throws Exception;
	public void goodsDelete(int no) throws Exception;
	public void goodsUpdate(GoodsVO vo) throws Exception;
	
	public int searchCount(SearchCriteria cri) throws Exception;
	
}
