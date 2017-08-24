package com.dgit.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.BoardsVO;
import com.dgit.domain.GoodsVO;
import com.dgit.domain.OrdersVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.GoodsService;
import com.dgit.service.OrdersService;
import com.dgit.util.MediaUtils;

import net.sf.json.JSONObject;


@RestController
@RequestMapping("/orders/rest/*")
public class OrdersRestController {
		
	private static final Logger logger = LoggerFactory.getLogger(OrdersRestController.class);
	
	@Autowired
	OrdersService service;
	@Autowired
	GoodsService gservice;
	
	
	@RequestMapping(value="/changeQtt", method=RequestMethod.POST)
	public ResponseEntity<String> changeQttRestPost(int ono,int oquantity,int gprice) throws Exception{ 
		logger.info("=======changeQttRestPost=======");
		ResponseEntity<String> entity = null;
		try{
			OrdersVO vo = service.ordersSelectByNo(ono);
			vo.setOquantity(oquantity);
			vo.setOtotalprice(gprice);
			service.ordersEachUpdate(vo);
			logger.info("order:"+service.ordersSelectByNo(ono).toString());
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> myPagePostRest(String uid,
														HttpSession session,
														HttpServletResponse response) throws Exception{
		logger.info("=============myPage PostRest=============");
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> map = new HashMap<>();
		try{
			if(uid == null){
				map.put("success", false);
			}else{
				System.out.println(service.ordersSelectById4MyPage(uid).size());
				map.put("orderlist",service.ordersSelectById4MyPage(uid));
				
				map.put("success", true);
				entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			}
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/shopcart", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> buyGetRest(@RequestBody Map<String, String> jsonStr){

        Map<String, String> maps = jsonStr;
        String uid = maps.get("uid");
        String gcode = maps.get("gcode");
		logger.info("=============shopcart POST Rest============="+uid+"gcode:"+gcode);
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> map = new HashMap<>();
		try{
/*			String uid = (String) session.getAttribute("login");
			System.out.println("--------------4");
			Enumeration se = session.getAttributeNames();
			while(se.hasMoreElements()){
				String getse = se.nextElement()+"";
				System.out.println("@@@Session:"+getse+":"+session.getAttribute(getse));
			} 세션 못 받음. ㅜ*/
			
			if(uid == null){
				System.out.println("아이디값 못 받음");
				map.put("success", false);
				entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
				return entity;
			}
			List<OrdersVO> list = new ArrayList<>();
			OrdersVO vo = new OrdersVO();
			vo.setUid(uid);
			// 장바구니 조회 후 가져오기 // oisbasket = true인 값 가져옴
			 list = service.ordersSelectById4ShoppingCart(uid); 
			if(list.isEmpty()){
				System.out.println("장바구니 비어서 다시 만듦");
				String newOcode = service.createShoppingBag(vo);
				vo.setOcode(newOcode);
				vo.setOisbasket(true);
			}else{
				System.out.println("오코드:"+list.get(0).getOcode());
				vo.setOcode(list.get(0).getOcode());
			}
			
			System.out.println("넣기전 ono 확인:"+vo.toString());
			if(gcode != null){
				vo.setGoods(gservice.goodsSelectByCode(gcode));
				vo.setOquantity(1);
				service.insertShoppingBag(vo);
			}
			
			list = service.ordersSelectByCode(vo.getOcode());
			int totalPrice = 0;
			for(OrdersVO ovo : list){
				System.out.println("넣은후 확인:"+ovo.toString());
				if(ovo.getGoods()!=null){
					totalPrice += ovo.getGoods().getGprice()*ovo.getOquantity();
				}
			}
			vo.setOtotalprice(totalPrice);
			System.out.println("order controller vo:"+vo.toString());
			service.ordersUpdateWithTotalPriceByCode(vo);
			
			
			list = service.ordersSelectById4ShoppingCart(uid);
			map.put("shopcartlist", list );
			
			map.put("success", true);
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/*public String buyGET(String mygcode, Model model,
						HttpSession session,
						HttpServletResponse response) throws Exception{
		logger.info("=============buy GET=============");
		
		
		*/
/*	
	@RequestMapping(value = "/changeQtt/{ono}/{oqtt}/{tPrice}", method=RequestMethod.POST)
	public ResponseEntity<String> changeQuantityPOST(@PathVariable("ono")int ono,
						@PathVariable("oqtt")int oqtt,@PathVariable("tPrice")int tPrice) throws Exception {
		ResponseEntity<String> entity = null;
		try{
			OrdersVO vo = service.ordersSelectByNo(ono);
			vo.setOquantity(oqtt);
			vo.setOtotalprice(tPrice);
			service.ordersEachUpdate(vo);
			logger.info("order:"+service.ordersSelectByNo(ono).toString());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>("FAIL",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/removeOrdr/{ono}", method=RequestMethod.POST)
	public ResponseEntity<Object> removeOrderPOST(@PathVariable("ono")int ono, HttpSession sess) throws Exception {
		ResponseEntity<Object> entity = null;
		try{
			service.ordersRemoveByNo(ono);
			
			entity = new ResponseEntity<Object>( ono, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>("FAIL",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/cancelOrdr/{ono}", method=RequestMethod.POST)
	public ResponseEntity<Object> cancelOrderPOST(@PathVariable("ono")int ono, HttpSession sess) throws Exception {
		ResponseEntity<Object> entity = null;
		try{
			service.ordersCancelByNo(ono);
			
			entity = new ResponseEntity<Object>( ono, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>("FAIL",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/successOrdr/{ono}", method=RequestMethod.POST)
	public ResponseEntity<Object> successOrderPOST(@PathVariable("ono")int ono, HttpSession sess) throws Exception {
		ResponseEntity<Object> entity = null;
		try{
			service.ordersSuccessByNo(ono);
			
			entity = new ResponseEntity<Object>( ono, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>("FAIL",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@Transactional
	@RequestMapping(value="/buy", method=RequestMethod.GET)
	public String buyGET(String mygcode, Model model,
						HttpSession session,
						HttpServletResponse response) throws Exception{
		logger.info("=============buy GET=============");
		
		
		String uid = (String) session.getAttribute("login");
		if(uid == null){
			response.sendRedirect("/users/login");
		}
		List<OrdersVO> list = new ArrayList<>();
		OrdersVO vo = new OrdersVO();
		vo.setUid(uid);
		// 장바구니 조회 후 가져오기 // oisbasket = true인 값 가져옴
		 list = service.ordersSelectById4ShoppingCart(uid); 
		if(list.isEmpty()){
			System.out.println("장바구니 비어서 다시 만듦");
			String newOcode = service.createShoppingBag(vo);
			vo.setOcode(newOcode);
			vo.setOisbasket(true);
		}else{
			System.out.println("오코드:"+list.get(0).getOcode());
			vo.setOcode(list.get(0).getOcode());
		}
		
		System.out.println("넣기전 ono 확인:"+vo.toString());
		if(mygcode != null){
			vo.setGoods(gservice.goodsSelectByCode(mygcode));
			vo.setOquantity(1);
			service.insertShoppingBag(vo);
		}
		
		list = service.ordersSelectByCode(vo.getOcode());
		int totalPrice = 0;
		for(OrdersVO ovo : list){
			System.out.println("넣은후 확인:"+ovo.toString());
			if(ovo.getGoods()!=null){
				totalPrice += ovo.getGoods().getGprice()*ovo.getOquantity();
			}
		}
		vo.setOtotalprice(totalPrice);
		System.out.println("order controller vo:"+vo.toString());
		service.ordersUpdateWithTotalPriceByCode(vo);
		
		
		list = service.ordersSelectById4ShoppingCart(uid);
		model.addAttribute("list", list);
		
		return "orders/shoppingCart";
	}
	
	@RequestMapping(value="/buy", method=RequestMethod.POST)
	public String buyPOST(String ocodes, Model model) throws Exception{
		logger.info("=============buy POST=============");
		logger.info("ocodes:"+ocodes);
		
		List<OrdersVO> list = service.ordersSelectByCode(ocodes);
		for(OrdersVO vo : list){
			logger.info(vo.toString());
			
			service.ordersComplete(vo);
		}
		return "orders/settle";
	}
	
	@RequestMapping(value="/cancel", method=RequestMethod.POST)
	public String cancelPOST(@ModelAttribute String ocode) throws Exception{
		logger.info("=========주문취소화면 POST=============");
		System.out.println("ocode:"+ocode);
		service.ordersCancelByCode(ocode);
		
		return "redirect:read";
	}
	@RequestMapping(value="/success", method=RequestMethod.POST)
	public String successPOST(@ModelAttribute String ocode) throws Exception{
		logger.info("=========주문 완료 POST=============");
		System.out.println("ocode:"+ocode);
		service.ordersSuccessByCode(ocode);
		
		return "redirect:read";
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String readGET(String ocode, Model model, @ModelAttribute("cri")SearchCriteria cri) throws Exception{
		logger.info("===========read  GET=============");
		List<OrdersVO> list = service.ordersSelectByCode(ocode);
		for(OrdersVO ovo : list){
			logger.info("vo:"+ovo.toString());
		}
		
		model.addAttribute("orderslist", list);
		return "orders/read";
	}
*/
}