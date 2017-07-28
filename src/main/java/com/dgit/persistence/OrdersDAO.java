package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.OrdersVO;
import com.dgit.domain.SearchCriteria;

public interface OrdersDAO {
	public List<OrdersVO> ordersListAll() throws Exception;
	public String getMaxOcode(String id) throws Exception;
	public void insertShoppingBag(OrdersVO vo)throws Exception;
	public List<OrdersVO> ordersSelectByCode(String code) throws Exception;
	public List<OrdersVO> ordersSelectById(String id) throws Exception;
	public List<OrdersVO> ordersSelectByIdWithOcondition1(String id, int ocondition) throws Exception;
	public OrdersVO ordersSelectByNo(int no) throws Exception;
	public void ordersTotalUpdate(OrdersVO vo) throws Exception;
	public void oisbasketTotalUpdate(String ocode, boolean oisbasket) throws Exception;
	public void ordersEachUpdate(OrdersVO vo) throws Exception;
	public void ordersDeleteByNo(int no) throws Exception;
	
	public int searchCount(SearchCriteria cri) throws Exception;
	public List<OrdersVO> listSearch(SearchCriteria cri) throws Exception;
	
}
