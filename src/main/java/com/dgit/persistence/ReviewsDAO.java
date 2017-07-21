package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.ReviewsVO;
import com.dgit.domain.SearchCriteria;


public interface ReviewsDAO {
	
	public List<ReviewsVO> reviewsListAll() throws Exception;
	public int getMaxRno() throws Exception;
	public ReviewsVO reviewsSelectByNo(int no) throws Exception;
	public void reviewsInsert(ReviewsVO vo);
	public void reviewsDelete(int no) throws Exception;
	public void reviewsUpdate(ReviewsVO vo) throws Exception;
	
	public int searchCount(SearchCriteria cri) throws Exception;
	public List<ReviewsVO> listSearch(SearchCriteria cri) throws Exception;
	
}
