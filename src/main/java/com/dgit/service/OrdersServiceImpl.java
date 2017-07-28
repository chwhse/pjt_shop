package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.GoodsVO;
import com.dgit.domain.OrdersVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.persistence.GoodsDAO;
import com.dgit.persistence.OrdersDAO;

@Service
public class OrdersServiceImpl implements OrdersService {
	
	@Autowired
	private OrdersDAO dao;
	@Autowired
	private GoodsDAO gdao;

	@Override
	public List<OrdersVO> ordersListAll() throws Exception {
		return dao.ordersListAll();
	}
	@Override
	public String createShoppingBag(OrdersVO vo) throws Exception {
		vo.setOcode(dao.getMaxOcode(vo.getUid()));
		System.out.println("ocode:"+vo.getOcode());
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
	public List<OrdersVO> ordersSelectById4Review(String id) throws Exception {
		return dao.ordersSelectByIdWithOcondition1(id,1);
	}
	@Override
	public List<OrdersVO> ordersSelectById4MyPage(String id) throws Exception {
		return dao.ordersSelectByIdWithOcondition1(id,1-1);
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
		/*재고 +1*/
		List<OrdersVO> olist = dao.ordersSelectByCode(ocode);
		
		for(OrdersVO ovo : olist){
			GoodsVO gvo = new GoodsVO();
			gvo.setGcode(ovo.getGoods().getGcode());
			gvo.setGstock(ovo.getGoods().getGstock()+1);
			gdao.goodsStockUpdate(gvo);
			
		}
		
		OrdersVO vo = new OrdersVO();
		vo.setOcode(ocode);
		vo.setOcondition(-1);
		
		dao.ordersEachUpdate(vo);
	}
	@Override
	public void ordersRemoveByNo(int no) throws Exception {
		OrdersVO ovo = dao.ordersSelectByNo(no);
		GoodsVO gvo = new GoodsVO();
		gvo.setGcode(ovo.getGoods().getGcode());
		gvo.setGstock(ovo.getGoods().getGstock()+1);
		gdao.goodsStockUpdate(gvo);
		
		dao.ordersDeleteByNo(no);
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
