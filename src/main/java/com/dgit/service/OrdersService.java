package com.dgit.service;

import java.util.List;

import com.dgit.domain.OrdersVO;
import com.dgit.domain.SearchCriteria;

public interface OrdersService {
	
	public List<OrdersVO> ordersListAll() throws Exception;
	public String createShoppingBag(OrdersVO vo)throws Exception;
	public void insertShoppingBag(OrdersVO vo)throws Exception;
	public List<OrdersVO> ordersSelectById(String id) throws Exception;
	public List<OrdersVO> ordersSelectByIdWithOcondition1AndRisexist0(String id) throws Exception;
	public List<OrdersVO> ordersSelectByCode(String code) throws Exception;
	public OrdersVO ordersSelectByNo(int no) throws Exception;
	public void ordersEachUpdate(OrdersVO vo) throws Exception;
	public void ordersUpdateWithTotalPriceByCode(OrdersVO vo) throws Exception;
	public void ordersComplete(OrdersVO vo) throws Exception;
	public void ordersCancelByCode(String ocode) throws Exception;
	
	public int searchCount(SearchCriteria cri) throws Exception;
	public List<OrdersVO> listSearch(SearchCriteria cri) throws Exception;
	}
