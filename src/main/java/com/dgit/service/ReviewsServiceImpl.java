package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.OrdersVO;
import com.dgit.domain.ReviewsVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.persistence.OrdersDAO;
import com.dgit.persistence.ReviewsDAO;

@Service
public class ReviewsServiceImpl implements ReviewsService {
	
	@Autowired
	private ReviewsDAO dao;
	@Autowired
	private OrdersDAO odao;
	
	@Override
	public List<ReviewsVO> reviewsListAll() throws Exception {
		return dao.reviewsListAll();
	}
	@Override
	public List<ReviewsVO> reviewsSelectByCode(String code) throws Exception {
		return dao.reviewsSelectByCode(code);
	}
	@Override
	public List<ReviewsVO> reviewsSelectById(String id) throws Exception {
		return dao.reviewsSelectById(id);
	}

	@Override
	public void reviewsInsert(ReviewsVO vo) throws Exception {
		int rno = dao.getMaxRno();
		vo.setRno(rno);
		
		dao.reviewsInsert(vo);
		OrdersVO ovo = new OrdersVO();
		ovo.setOno(vo.getOno());
		ovo.setRno(vo.getRno());
		ovo.setOcondition(1);
		ovo.setOtotalprice(-1);
		ovo.setOquantity(-1);
		ovo.setOisbasket(false);
		odao.ordersEachUpdate(ovo);
		
	}

	@Override
	public ReviewsVO reviewsSelectByNo(int no) throws Exception {
		return dao.reviewsSelectByNo(no);
	}

	@Override
	public void reviewsDelete(int rno, int ono) throws Exception {
		dao.reviewsDelete(rno);
		
		OrdersVO ovo = new OrdersVO();
		ovo.setOno(ono);
		ovo.setRno(0);
		ovo.setOcondition(1);
		ovo.setOtotalprice(-1);
		ovo.setOquantity(-1);
		ovo.setOisbasket(false);
		odao.ordersEachUpdate(ovo);
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
