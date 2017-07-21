package com.dgit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dgit.domain.ReviewsVO;
import com.dgit.domain.SearchCriteria;

@Repository
public class ReviewsDAOImpl implements ReviewsDAO {
	@Inject
	private SqlSession session;
	private static String namespace = "com.dgit.persistence.ReviewsDAO";
	

	@Override
	public List<ReviewsVO> reviewsListAll() throws Exception {
		return session.selectList(namespace+".reviewsListAll");
	}

	@Override
	public int getMaxRno() throws Exception {
		return session.selectOne(namespace+".getMaxRno");
	}

	@Override
	public void reviewsInsert(ReviewsVO vo) {
		session.insert(namespace+".reviewsInsert", vo);
	}
	@Override
	public ReviewsVO reviewsSelectByNo(int no) throws Exception {
		return session.selectOne(namespace+".reviewsSelectByNo", no);
	}

	@Override
	public void reviewsDelete(int no) throws Exception {
		session.delete(namespace+".reviewsDelete", no);
	}

	@Override
	public void reviewsUpdate(ReviewsVO vo) throws Exception {
		session.update(namespace+".reviewsUpdate", vo);
	}

	@Override
	public int searchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace+".searchCount",cri);
	}
	@Override
	public List<ReviewsVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace+".listSearch", cri);
	}


}
