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
	public String createShoppingBag(OrdersVO vo) throws Exception {
		vo.setOcode(dao.getMaxOcode(vo.getUid()));
		System.out.println("ocode:"+vo.getOcode());
		dao.createShoppingBag(vo);
		return dao.getMaxOcode(vo.getUid());
	}
	@Override
	public void insertShoppingBag(OrdersVO vo) throws Exception {
		vo.setOtotalprice(vo.getGoods().getGprice());
		dao.insertShoppingBag(vo);
	}
	@Override
	public List<OrdersVO> ordersSelectById(String id) throws Exception {
		return dao.ordersSelectById(id);
	}
	@Override
	public List<OrdersVO> ordersSelectByIdWithOcondition1AndRisexist0(String id) throws Exception {
		return dao.ordersSelectByIdWithOcondition1AndRisexist0(id);
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
	public void ordersEachUpdate(OrdersVO vo) throws Exception {
		dao.ordersEachUpdate(vo);
	}
	@Override
	public void ordersUpdateWithTotalPriceByCode(OrdersVO vo) throws Exception {
		dao.ordersTotalUpdate(vo);
	}
	@Override
	public void ordersComplete(OrdersVO vo) throws Exception {
		vo.setOisbasket(false);
		vo.getGoods().setGstock(vo.getGoods().getGstock()-1);
		vo.setOcondition(1);
		dao.ordersEachUpdate(vo);
	}
	@Override
	public void ordersCancelByCode(String ocode) throws Exception {
		OrdersVO vo = new OrdersVO();
		vo.setOcode(ocode);
		vo.setOcondition(-1);
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
