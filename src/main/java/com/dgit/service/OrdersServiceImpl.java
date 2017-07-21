package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.OrdersVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.persistence.OrdersDAO;

@Service
public class OrdersServiceImpl implements OrdersService {
	
	@Autowired
	private OrdersDAO dao;

	@Override
	public List<OrdersVO> ordersListAll() throws Exception {
		return dao.ordersListAll();
	}

	@Override
	public void createShoppingBag(OrdersVO vo) throws Exception {
		vo.setOcode(dao.getMaxOcode());
		dao.createShoppingBag(vo);
	}

	@Override
	public List<OrdersVO> ordersSelectByCode(String code) throws Exception {
		return dao.ordersSelectByCode(code);
	}
	
	@Override
	public OrdersVO ordersSelectByNo(int no) throws Exception {
		return dao.ordersSelectByNo(no);
	}

	@Override
	public void ordersTotalDelete(String code) throws Exception {
		dao.ordersTotalDelete(code);
	}
	@Override
	public void ordersEachDelete(String code) throws Exception {
		dao.ordersEachDelete(code);
	}

	@Override
	public void ordersTotalUpdate(OrdersVO vo) throws Exception {
		dao.ordersTotalUpdate(vo);
	}
	@Override
	public void ordersEachUpdate(OrdersVO vo) throws Exception {
		dao.ordersEachUpdate(vo);
	}

	@Override
	public List<OrdersVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int searchCount(SearchCriteria cri) throws Exception {
		return dao.searchCount(cri);
	}
	
}
