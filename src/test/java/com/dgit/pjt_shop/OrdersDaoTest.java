package com.dgit.pjt_shop;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.GoodsVO;
import com.dgit.domain.OrdersVO;
import com.dgit.persistence.OrdersDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})

public class OrdersDaoTest {
	@Autowired
	private OrdersDAO dao;

/*
	@Test
	public void testListPage()throws Exception{
		
		List<OrdersVO> list = dao.ordersSelectByIdWithOcondition1("admin");
		for(OrdersVO vo : list){
			System.out.println("상품명:"+vo.getGoods().getGname()+"/ 구매일:"+vo.getOdate());
		}
		
	}*/
	@Test
	public void testUpdatOrder() throws Exception{
		OrdersVO vo = new OrdersVO();
		vo.setOisbasket(true);
		vo.setOcode("쀍쀍");
		vo.setOquantity(5);
		vo.setOtotalprice(175000);
		vo.setOcondition(0);
		vo.setOno(1);
		System.out.println(vo.toString());
		dao.ordersEachUpdate(vo);
		System.out.println(dao.ordersSelectByNo(1).toString());
	}
	
/*	@Test
	public void testinsertShoppingBag() throws Exception{
		OrdersVO order = new OrdersVO();
		
		GoodsVO good = new GoodsVO();
		
		good.setGcode("c90002");
		order.setGoods(good);
		order.setUid("admin");

		order.setOcode("ad00001");
		
		dao.insertShoppingBag(order);
	}*/
/*	@Test
	public void testOrdersSelectByCode() throws Exception{
		
		System.out.println("나와1");
		List<OrdersVO> vo = dao.ordersSelectByCode("u00004");
		System.out.println("사이즈"+vo.size());
		for(OrdersVO order : vo){
			System.out.println(order.toString());
			System.out.println("------------------");
		}
		
		System.out.println("나와2");
		System.out.println(vo.toString());
		
		
	}*/
	
	

	/*	
	@Test
	public void testInsertMember()throws Exception {
		OrderVO order = new OrderVO();
		order.setTitle("새로운 글을 넣습니다");
		order.setContent("새로운 글!!");
		order.setWriter("user00");
		ArrayList<String> list = new ArrayList<>();
		list.add("파일1");
		list.add("파일2");
		order.setFiles(list.toArray(new String[list.size()]));
		dao.create(order);
		
	}
	
	@Test
	public void testSelectMember()throws Exception {
		
		dao.read(2);
		
	
	}
	
	@Test
	public void testUpdateMember()throws Exception {
		OrderVO order = new OrderVO();
		order.setBno(2);
		order.setTitle("수정 글을 넣습니다");
		order.setContent("수정 글!!");
		order.setWriter("user22");
		dao.update(order);
	}
	*/
/*	
	@Test
	public void testDeleteMember()throws Exception {
		dao.delete(2);
		
		
	}
*/

}
