package com.dgit.service;

import java.util.Iterator;
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
		vo.setOisbasket(true);
		dao.insertShoppingBag(vo);
	}
	@Override
	public List<OrdersVO> ordersSelectById(String id) throws Exception {
		return dao.ordersSelectById(id);
	}
	@Override
	public List<OrdersVO> ordersSelectById4ShoppingCart(String id) throws Exception {
		List<OrdersVO> list = dao.ordersSelectById(id);
		for(Iterator<OrdersVO> iterator = list.iterator() ; iterator.hasNext(); ){
			OrdersVO ovo = iterator.next();
			if(ovo.isOisbasket()==false){
				iterator.remove();
			}
		}
		return list;
	}
	@Override
	public List<OrdersVO> ordersSelectById4Review(String id) throws Exception {
		List<OrdersVO> list = dao.ordersSelectByIdWithNoReview(id);
		for(Iterator<OrdersVO> iterator = list.iterator() ; iterator.hasNext(); ){
			OrdersVO ovo = iterator.next();
			if(ovo.getOcondition() != 1){
				iterator.remove();
			}
		}
		return list;
	}
	
	@Override
	public List<OrdersVO> ordersSelectById4MyPage(String id) throws Exception {
		
		List<OrdersVO> list = dao.ordersSelectById(id);
		for(Iterator<OrdersVO> iterator = list.iterator() ; iterator.hasNext(); ){
			OrdersVO ovo = iterator.next();
			if(ovo.getOcondition() == 0){
				iterator.remove();
			}
		}

		return list;
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
		OrdersVO ovo = new OrdersVO();
		ovo.setOcode(vo.getOcode());
	
		ovo.setOcondition(0);
		ovo.setOtotalprice(vo.getOtotalprice());
		
		ovo.setOisbasket(true);
		
		dao.ordersTotalUpdate(ovo);
	}
	@Override
	public void ordersComplete(OrdersVO vo) throws Exception {
		vo.setOisbasket(false);
/*		OrdersVO ovo = dao.ordersSelectByNo(vo.getOno());
 		System.out.println("gstock:"+ovo.getGoods().getGstock());
		System.out.println("oquantity:"+ovo.getOquantity());
		gvo.setGstock(ovo.getGoods().getGstock()-(ovo.getOquantity()));
		System.out.println("gstock:"+ovo.getGoods().getGstock());*/
		vo.setOcondition(-1);
		System.out.println("service ordersComplete"+vo.toString());
		dao.ordersEachUpdate(vo);
	}
	
	@Override
	public void ordersRemoveByNo(int no) throws Exception {
		OrdersVO ovo = dao.ordersSelectByNo(no);
		GoodsVO gvo = new GoodsVO();
		gvo.setGcode(ovo.getGoods().getGcode());
		gvo.setGstock(ovo.getGoods().getGstock()+ovo.getOquantity());
		gdao.goodsStockUpdate(gvo);
		
		dao.ordersDeleteByNo(no);
	}
	@Override
	public void ordersCancelByNo(int no) throws Exception {
		OrdersVO ovo = dao.ordersSelectByNo(no);
		GoodsVO gvo = new GoodsVO();
		gvo.setGcode(ovo.getGoods().getGcode());
		System.out.println("gstock:"+ovo.getGoods().getGstock());
		System.out.println("oquantity:"+ovo.getOquantity());
		gvo.setGstock(ovo.getGoods().getGstock()+ovo.getOquantity());
		System.out.println("gstock:"+ovo.getGoods().getGstock());
		gdao.goodsStockUpdate(gvo);
		
		ovo.setOcondition(-2);
		dao.ordersEachUpdate(ovo);
	}
	@Override
	public void ordersSuccessByNo(int no) throws Exception {
		OrdersVO ovo = dao.ordersSelectByNo(no);
		GoodsVO gvo = new GoodsVO();
		gvo.setGcode(ovo.getGoods().getGcode());
		System.out.println("gstock:"+ovo.getGoods().getGstock());
		System.out.println("oquantity:"+ovo.getOquantity());
		gvo.setGstock(ovo.getGoods().getGstock()-(ovo.getOquantity()));
		
		gdao.goodsStockUpdate(gvo);
		System.out.println("gstock:"+ovo.getGoods().getGstock());
		ovo.setOcondition(1);
		dao.ordersEachUpdate(ovo);
	}

	@Override
	public void ordersSuccessByCode(String ocode) throws Exception {
		/*재고 -qtt*/
		List<OrdersVO> olist = dao.ordersSelectByCode(ocode);
		
		for(OrdersVO ovo : olist){
			GoodsVO gvo = new GoodsVO();
			gvo.setGcode(ovo.getGoods().getGcode());
			gvo.setGstock(ovo.getGoods().getGstock()-(ovo.getOquantity()));
			gdao.goodsStockUpdate(gvo);
			
		}
		
		OrdersVO vo = new OrdersVO();
		vo.setOcode(ocode);
		vo.setOcondition(1);
		
		dao.ordersTotalUpdate(vo);
	}

	@Override
	public void ordersCancelByCode(String ocode) throws Exception {
		/*재고 +qtt*/
		List<OrdersVO> olist = dao.ordersSelectByCode(ocode);
		
		for(OrdersVO ovo : olist){
			GoodsVO gvo = new GoodsVO();
			gvo.setGcode(ovo.getGoods().getGcode());
			gvo.setGstock(ovo.getGoods().getGstock()+ovo.getOquantity());
			gdao.goodsStockUpdate(gvo);
			
		}
		
		OrdersVO vo = new OrdersVO();
		vo.setOcode(ocode);
		vo.setOcondition(-2);
		
		dao.ordersTotalUpdate(vo);
	}
	
	@Override
	public List<OrdersVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}
	@Override
	public List<OrdersVO> listSearchWithoutShoppingCart(SearchCriteria cri) throws Exception {
		List<OrdersVO> list =  dao.listSearchGroupbyOcode(cri);
		for(Iterator<OrdersVO> iterator = list.iterator() ; iterator.hasNext(); ){
			OrdersVO ovo = iterator.next();
			if(ovo.getOcondition() == 0){
				iterator.remove();
			}
		}
		return list;
	}

	@Override
	public int searchCount(SearchCriteria cri) throws Exception {
		return dao.searchCount(cri);
	}

	
}
