package com.dgit.persistence;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dgit.domain.GoodsVO;
import com.dgit.domain.SearchCriteria;

@Repository
public class GoodsDAOImpl implements GoodsDAO {
	@Inject
	private SqlSession session;
	private static String namespace = "com.dgit.persistence.GoodsDAO";
	
	@Override
	public List<GoodsVO> goodsListAll() throws Exception {
		return session.selectList(namespace+".goodsListAll");
	}

	@Override
	public String getMaxGcode() throws Exception {
		return session.selectOne(namespace+".getMaxGcode");
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
	public GoodsVO goodsSelectByCode(String code) throws Exception {
		return session.selectOne(namespace+".goodsSelectByCode", code);
	}

	@Override
	public void goodsDelete(int no) throws Exception {
		session.delete(namespace+".boardsDelete", no);
	}

	@Override
	public void goodsDetailDelete(int no) throws Exception {
		session.delete(namespace+".goodsDetailDelete", no);
	}

	@Override
	public void goodsUpdate(GoodsVO vo) throws Exception {
		session.update(namespace+".boardsUpdate", vo);
	}

	@Override
	public void goodsDetailUpdate(GoodsVO vo) throws Exception {
		session.update(namespace+".goodsDetailUpdate", vo);
	}

	@Override
	public int searchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace+".searchCount",cri);
	}

}
