package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dgit.domain.GoodsVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.persistence.GoodsDAO;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsDAO dao;
	
	@Override
	public List<GoodsVO> listSearch4Admin(SearchCriteria cri) throws Exception {
		return dao.listSearch4Admin(cri);
	}
	
	@Transactional
	@Override
	public void goodsInsert(GoodsVO vo) throws Exception {
		//현재 카테고리 최대값에서 +1처리
		vo.setGcode(dao.getMaxGcodePlus1(vo));
		dao.goodsInsert(vo);
		dao.goodsDetailInsert(vo);
		dao.goodsStockInsert(vo);
		if(vo.getGdetailimg() != null){//보호처리
       	 for(String gdetailimg : vo.getGdetailimg()){
                dao.addAttach(gdetailimg, vo.getGcode());
             }
        }
		System.out.println("상품 vo : "+vo.toString());
	}

	@Override
	public GoodsVO goodsSelectByCode(String code) throws Exception {
		GoodsVO vo = dao.goodsSelectByCode(code);/*여러개 상세이미지 중 하나만 출력*/
		List<String> list = dao.getAttach(code); 
		if(list.size()>0){
			vo.setGdetailimg(list);/*여러개 세팅*/
		}
		return vo;
	}
	

	@Override
	public void goodsDelete(String code) throws Exception {
		dao.goodsDelete(code);
		dao.goodsDetailDelete(code);
		dao.goodsStockDelete(code);
		dao.deleteAttachByCode(code);
	}

	@Transactional /*내가넣음*/
	@Override
	public void goodsUpdate(GoodsVO vo, String[] delFiles) throws Exception {

		if(delFiles.length > 0 ){ // db에서 지울파일을 찾아서 지움
			for(String file: delFiles){
				dao.deleteAttachByGdetailimg(vo.getGcode(), file);
			}
		}
		if(vo.getGdetailimg() == null)//보호처리
			return;
		
		for(String detailimg : vo.getGdetailimg()){//추가된 파일은  db에 넣어줌		
			dao.addAttach(detailimg, vo.getGcode());
		}
		
		dao.goodsUpdate(vo);
		dao.goodsDetailUpdate(vo);
		dao.goodsStockUpdate(vo);
	}


	@Override
	public List<String> getAllGoodsCategory() throws Exception {
		return dao.getAllGoodsCategory();
	}
	
	@Override
	public void goodsCategoryInsert(String gcategory) throws Exception {
		dao.goodsCategoryInsert(gcategory);
	}

	@Override
	public void goodsCategoryDelete(String gcategory) throws Exception {
		dao.goodsCategoryDelete(gcategory);
	}

	@Override
	public int searchCount(SearchCriteria cri) throws Exception {
		return dao.searchCount(cri);
	}
	@Override
	public int searchCount4Admin(SearchCriteria cri) throws Exception {
		return dao.searchCount4Admin(cri);
	}

	@Override
	public List<GoodsVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}
}
