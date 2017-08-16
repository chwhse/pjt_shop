package com.dgit.service;

import java.util.List;

import com.dgit.domain.GoodsVO;
import com.dgit.domain.SearchCriteria;

public interface GoodsService {
	
	public List<GoodsVO> listSearch4Admin(SearchCriteria cri) throws Exception;
	public List<String> getAllGoodsCategory() throws Exception;
	public void goodsInsert(GoodsVO vo) throws Exception;
	
	public GoodsVO goodsSelectByCode(String code) throws Exception;
	
	public void goodsDelete(String code) throws Exception;
	public void goodsUpdate(GoodsVO vo, String[] delFiles) throws Exception;
	
	public List<GoodsVO> listSearch(SearchCriteria cri) throws Exception;
	public int searchCount(SearchCriteria cri) throws Exception;
	public int searchCount4Admin(SearchCriteria cri) throws Exception;
	
	public void goodsCategoryInsert(String gcategory) throws Exception;
	public void goodsCategoryDelete(String gcategory) throws Exception;
}
