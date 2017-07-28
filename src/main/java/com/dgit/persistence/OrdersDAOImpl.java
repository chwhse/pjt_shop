package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dgit.domain.OrdersVO;
import com.dgit.domain.SearchCriteria;

@Repository
public class OrdersDAOImpl implements OrdersDAO {
	
	@Inject
	private SqlSession session;
	private static String namespace = "com.dgit.persistence.OrdersDAO";
	
	@Override
	public List<OrdersVO> ordersListAll() throws Exception {
		return session.selectList(namespace+".ordersListAll");
	}

	@Override
	public String getMaxOcode(String id) throws Exception {
		return session.selectOne(namespace+".getMaxOcode", id);
	}


	@Override
	public List<OrdersVO> ordersSelectById(String id) throws Exception {
		return session.selectList(namespace+".ordersSelectById", id);
	}
	@Override
	public List<OrdersVO> ordersSelectByIdWithOcondition1(String id, int ocondtion) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("uid", id);
		map.put("ocondtion", ocondtion);
		return session.selectList(namespace+".ordersSelectByIdWithOcondition1", map);
	}
	@Override
	public List<OrdersVO> ordersSelectByCode(String code) throws Exception {
		return session.selectList(namespace+".ordersSelectByCode", code);
	}
	@Override
	public OrdersVO ordersSelectByNo(int no) throws Exception {
		return session.selectOne(namespace+".ordersSelectByNo", no);
	}

	@Override
	public int searchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace+".searchCount",cri);
	}

	@Override
	public List<OrdersVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace+".listSearch", cri);
	}

	@Override
	public void insertShoppingBag(OrdersVO vo) throws Exception {
		session.insert(namespace+".insertShoppingBag", vo);
	}

	@Override
	public void ordersTotalUpdate(OrdersVO vo) throws Exception {
		session.update(namespace+".ordersTotalUpdate", vo);
	}
	@Override
	public void oisbasketTotalUpdate(String ocode, boolean oisbasket) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("ocode", ocode);
		map.put("oisbasket", oisbasket);
		session.update(namespace+".oisbasketTotalUpdate", map);
	}

	@Override
	public void ordersEachUpdate(OrdersVO vo) throws Exception {
		session.update(namespace+".ordersEachUpdate", vo);
	}

	@Override
	public void ordersDeleteByNo(int no) throws Exception {
		System.out.println("++++++del------------");
		session.delete(namespace+".ordersDeleteByNo", no);
	}



}
