package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.ReviewsVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.persistence.ReviewsDAO;

@Service
public class ReviewsServiceImpl implements ReviewsService {
	
	@Autowired
	private ReviewsDAO dao;
	
	@Override
	public List<ReviewsVO> reviewsListAll() throws Exception {
		return dao.reviewsListAll();
	}
	@Override
	public List<ReviewsVO> reviewsSelectByCode(String code) throws Exception {
		return dao.reviewsSelectByCode(code);
	}

	@Override
	public void reviewsInsert(ReviewsVO vo) throws Exception {
		vo.setRno(dao.getMaxRno());
		vo.setRisexist(1);
		
		dao.reviewsInsert(vo);
	}

	@Override
	public ReviewsVO reviewsSelectByNo(int no) throws Exception {
		return dao.reviewsSelectByNo(no);
	}

	@Override
	public void reviewsDelete(int no) throws Exception {
		dao.reviewsDelete(no);
	}

	@Override
	public void reviewsUpdate(ReviewsVO vo) throws Exception {
		dao.reviewsUpdate(vo);
	}

	@Override
	public int searchCount(SearchCriteria cri) throws Exception {
		return dao.searchCount(cri);
	}

	@Override
	public List<ReviewsVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}
}
