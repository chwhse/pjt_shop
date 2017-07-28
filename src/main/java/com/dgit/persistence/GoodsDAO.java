package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.GoodsVO;
import com.dgit.domain.SearchCriteria;


public interface GoodsDAO {
	public List<GoodsVO> listSearch4Admin(SearchCriteria cri) throws Exception;
	public List<String> getAllGoodsCategory() throws Exception;
	public String getMaxGcodePlus1(GoodsVO vo) throws Exception;
	public String getMaxGcodeByCategory(String gcategory) throws Exception;
	public void goodsInsert(GoodsVO vo) throws Exception;
	public void goodsDetailInsert(GoodsVO vo) throws Exception;
	public void goodsStockInsert(GoodsVO vo) throws Exception;
	public void goodsCategoryInsert(String gcategory) throws Exception;
	
	public GoodsVO goodsSelectByCode(String code) throws Exception;
	public List<GoodsVO> goodsSelectByUid(String code) throws Exception;	
	
	public void goodsDelete(String code) throws Exception;
	public void goodsDetailDelete(String code) throws Exception;
	public void goodsStockDelete(String code) throws Exception;
	public void goodsCategoryDelete(String gcategory) throws Exception;
	public void goodsUpdate(GoodsVO vo) throws Exception;
	public void goodsDetailUpdate(GoodsVO vo) throws Exception;
	public void goodsStockUpdate(GoodsVO vo) throws Exception;
	
	public int searchCount(SearchCriteria cri) throws Exception;
	public int searchCount4Admin(SearchCriteria cri) throws Exception;
	public List<GoodsVO> listSearch(SearchCriteria cri) throws Exception;
	
	public void addAttach(String gdetailimg, String code) throws Exception;
	public List<String> getAttach(String code) throws Exception;
	public void deleteAttachByGdetailimg(String code, String gdetailimg) throws Exception;
	public void deleteAttachByCode(String code) throws Exception;
}
