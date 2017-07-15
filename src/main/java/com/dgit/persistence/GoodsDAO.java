package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.GoodsVO;
import com.dgit.domain.SearchCriteria;


public interface GoodsDAO {
	public List<GoodsVO> goodsListAll() throws Exception;
	public String getMaxGcode() throws Exception;
	public void goodsInsert(GoodsVO vo) throws Exception;
	public void goodsDetailInsert(GoodsVO vo) throws Exception;
	public GoodsVO goodsSelectByCode(String code) throws Exception;
	public void goodsDelete(int no) throws Exception;
	public void goodsDetailDelete(int no) throws Exception;
	public void goodsUpdate(GoodsVO vo) throws Exception;
	public void goodsDetailUpdate(GoodsVO vo) throws Exception;
	
	public int searchCount(SearchCriteria cri) throws Exception;
	
}
