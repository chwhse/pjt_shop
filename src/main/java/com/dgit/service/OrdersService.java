package com.dgit.service;

import java.util.List;

import com.dgit.domain.OrdersVO;
import com.dgit.domain.SearchCriteria;

public interface OrdersService {
	
	public List<OrdersVO> ordersListAll() throws Exception;
	public String createShoppingBag(OrdersVO vo)throws Exception;
	public void insertShoppingBag(OrdersVO vo)throws Exception;
	public List<OrdersVO> ordersSelectById(String id) throws Exception;
	public List<OrdersVO> ordersSelectById4ShoppingCart(String id) throws Exception;
	public List<OrdersVO> ordersSelectById4Review(String id) throws Exception;
	public List<OrdersVO> ordersSelectById4MyPage(String id) throws Exception;
	public List<OrdersVO> ordersSelectByCode(String code) throws Exception;
	public OrdersVO ordersSelectByNo(int no) throws Exception;
	public void ordersEachUpdate(OrdersVO vo) throws Exception;
	public void ordersUpdateWithTotalPriceByCode(OrdersVO vo) throws Exception;
	public void ordersComplete(OrdersVO vo) throws Exception;
	public void ordersCancelByCode(String ocode) throws Exception;
	public void ordersSuccessByCode(String ocode) throws Exception;
	public void ordersRemoveByNo(int no) throws Exception;
	public void ordersCancelByNo(int no) throws Exception;
	public void ordersSuccessByNo(int no) throws Exception;
	
	public int searchCount(SearchCriteria cri) throws Exception;
	public List<OrdersVO> listSearch(SearchCriteria cri) throws Exception;
	public List<OrdersVO> listSearchWithoutShoppingCart(SearchCriteria cri) throws Exception;
	}
