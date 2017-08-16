package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dgit.domain.BoardsVO;
import com.dgit.domain.GoodsVO;
import com.dgit.domain.SearchCriteria;

@Repository
public class GoodsDAOImpl implements GoodsDAO {
	@Inject
	private SqlSession session;
	private static String namespace = "com.dgit.persistence.GoodsDAO";
	
	@Override
	public List<GoodsVO> listSearch4Admin(SearchCriteria cri) throws Exception {
		return session.selectList(namespace+".listSearch4Admin", cri);
	}

	@Override
	public String getMaxGcodePlus1(GoodsVO vo) throws Exception {
		String gcategoryfl = vo.getGcategory().substring(0,1);//젤 첫 글자만 추출
		System.out.println("gcategoryfl:"+gcategoryfl);
		String maxGcode = getMaxGcodeByCategory(vo.getGcategory());
		System.out.println("maxGcode:"+maxGcode);
		Map<String, Object> map = new HashMap<>();
		map.put("gcategoryfl", gcategoryfl);
		map.put("gcode", maxGcode);
		return session.selectOne(namespace+".getMaxGcodePlus1", map);
	}
	
	@Override
	public String getMaxGcodeByCategory(String gcategory) throws Exception {
		String gcategoryfl = gcategory.substring(0,1);//젤 첫 글자만 추출
		return session.selectOne(namespace+".getMaxGcodeByCategory", gcategoryfl);
	}

	@Override
	public void goodsInsert(GoodsVO vo) throws Exception {
		session.insert(namespace+".goodsInsert", vo);
	}

	@Override
	public void goodsDetailInsert(GoodsVO vo) throws Exception {
		session.insert(namespace+".goodsDetailInsert", vo);
	}
	@Override
	public void goodsStockInsert(GoodsVO vo) throws Exception {
		session.insert(namespace+".goodsStockInsert", vo);
	}

	
	@Override
	public GoodsVO goodsSelectByCode(String code) throws Exception {
		return session.selectOne(namespace+".goodsSelectByCode", code);
	}
	
	

	@Override
	public void goodsDelete(String code) throws Exception {
		session.delete(namespace+".boardsDelete", code);
	}

	@Override
	public void goodsDetailDelete(String code) throws Exception {
		session.delete(namespace+".goodsDetailDelete", code);
	}
	@Override
	public void goodsStockDelete(String code) throws Exception {
		session.delete(namespace+".goodsStockDelete", code);
	}

	@Override
	public void goodsUpdate(GoodsVO vo) throws Exception {
		session.update(namespace+".goodsUpdate", vo);
	}

	@Override
	public void goodsDetailUpdate(GoodsVO vo) throws Exception {
		session.update(namespace+".goodsDetailUpdate", vo);
	}
	@Override
	public void goodsStockUpdate(GoodsVO vo) throws Exception {
		session.update(namespace+".goodsStockUpdate", vo);
	}



	@Override
	public void addAttach(String gdetailimg, String code) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("gcode", code);
		map.put("gdetailimg", gdetailimg);
		session.insert(namespace +".addAttach", map);
		
	}

	@Override
	public List<String> getAttach(String code) throws Exception {
		return session.selectList(namespace+".getAttach", code);
	}

	@Override
	public void deleteAttachByGdetailimg(String code, String gdetailimg) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("gcode", code);
		map.put("gdetailimg", gdetailimg);
		session.delete(namespace + ".deleteAttachByGdetailimg", map);
	}

	@Override
	public void deleteAttachByCode(String code) throws Exception {
		session.delete(namespace + ".deleteAttachByCode", code);
	}
	
	@Override
	public List<String> getAllGoodsCategory() throws Exception {
		return session.selectList(namespace+".getAllGoodsCategory");
	}
	
	@Override
	public void goodsCategoryInsert(String gcategory) throws Exception {
		session.insert(namespace+".goodsCategoryInsert", gcategory);
	}

	@Override
	public void goodsCategoryDelete(String gcategory) throws Exception {
		session.delete(namespace+".goodsCategoryDelete", gcategory);
	}

	
	
	
	@Override
	public int searchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace+".searchCount",cri);
	}
	@Override
	public int searchCount4Admin(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace+".searchCount4Admin",cri);
	}
	@Override
	public List<GoodsVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace+".listSearch", cri);
	}


}
