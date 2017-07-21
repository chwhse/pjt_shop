package com.dgit.service;

import java.util.List;

import com.dgit.domain.OrdersVO;
import com.dgit.domain.SearchCriteria;

public interface OrdersService {
	
	public List<OrdersVO> ordersListAll() throws Exception;
	public void createShoppingBag(OrdersVO vo)throws Exception;
	public List<OrdersVO> ordersSelectByCode(String code) throws Exception;
	public OrdersVO ordersSelectByNo(int no) throws Exception;
	public void ordersTotalDelete(String code) throws Exception;
	public void ordersEachDelete(String code) throws Exception;
	public void ordersTotalUpdate(OrdersVO vo) throws Exception;
	public void ordersEachUpdate(OrdersVO vo) throws Exception;
	
	public int searchCount(SearchCriteria cri) throws Exception;
	public List<OrdersVO> listSearch(SearchCriteria cri) throws Exception;
	}
