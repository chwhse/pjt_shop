package com.dgit.service;

import java.util.List;

import com.dgit.domain.ReviewsVO;
import com.dgit.domain.SearchCriteria;

public interface ReviewsService {
	
	public List<ReviewsVO> reviewsListAll() throws Exception;
	public List<ReviewsVO> reviewsSelectByCode(String code) throws Exception;
	public List<ReviewsVO> reviewsSelectById(String id) throws Exception;
	public void reviewsInsert(ReviewsVO vo) throws Exception;
	public ReviewsVO reviewsSelectByNo(int no) throws Exception;
	public void reviewsDelete(int rno, int ono) throws Exception;
	public void reviewsUpdate(ReviewsVO vo) throws Exception;

	public List<ReviewsVO> listSearch(SearchCriteria cri) throws Exception;
	public int searchCount(SearchCriteria cri) throws Exception;
}
