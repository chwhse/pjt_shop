package com.dgit.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

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

@Controller
@RequestMapping("/orders/*")
@SessionAttributes("ocode")
public class OrdersController {
		
	private static final Logger logger = LoggerFactory.getLogger(OrdersController.class);
	
	@Autowired
	OrdersService service;
	@Autowired
	GoodsService gservice;
	
	@Resource(name="uploadPath")// id로(DI) 주입받을때사용
	private String uploadPath;
	
	
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
	
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public String listPageGET(@ModelAttribute("cri")SearchCriteria cri,Model model) throws Exception {
		model.addAttribute("list", service.listSearchWithoutShoppingCart(cri) );
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.searchCount(cri));
		model.addAttribute("pageMaker",pageMaker);
		
		return "orders/listPage";
	}
	
/*	@RequestMapping(value ="/shoppingCart", method = RequestMethod.GET)
	public String shoppingCartGET(Model model,
								  HttpSession session,
								  HttpServletResponse response) throws Exception {
		
		logger.info("=============shoppingCart GET=============");
		
		
		String uid = (String) session.getAttribute("login");
		if(uid == null){
			response.sendRedirect("/users/login");
		}
		List<OrdersVO> list = new ArrayList<>();
		OrdersVO vo = new OrdersVO();
		vo.setUid(uid);
		// 장바구니 조회 후 가져오기
		 list = service.ordersSelectById4ShoppingCart(uid); 
		if(list.isEmpty()){
			return "orders/shoppingCart";
		}
		
		vo.setOcode(list.get(0).getOcode());
		
		list = service.ordersSelectByCode(vo.getOcode());
		int totalPrice = 0;
		for(OrdersVO ovo : list){
			System.out.println("넣은후 확인:"+ovo.toString());
			if(ovo.getGoods()!=null){
				totalPrice += ovo.getGoods().getGprice()*ovo.getOquantity();
				System.out.println(totalPrice+"->총합");
			}
		}
		vo.setOtotalprice(totalPrice);
		service.ordersUpdateWithTotalPriceByCode(vo);
		list = service.ordersSelectByCode(vo.getOcode());
		model.addAttribute("list", list);
		logger.info("총합:"+list.get(0).getOtotalprice());
		
		return "orders/shoppingCart";
	}*/
	
	
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
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyGET(String ocode,Model model) throws Exception{
		List<OrdersVO> vo  = service.ordersSelectByCode(ocode);
		
		model.addAttribute("list", vo);
		return "orders/modify";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(OrdersVO vo,SearchCriteria cri,RedirectAttributes rttr) 	throws Exception{
		
		logger.info("=============modify Post=============");
		logger.info("orderVO:"+vo.toString());
		service.ordersEachUpdate(vo);
		
	    rttr.addAttribute("ocode", vo.getOcode());
	    rttr.addAttribute("page", cri.getPage());
	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:read";
		
	}
	
		@ResponseBody
	   @RequestMapping(value = "displayFile") // displayFile?filename=##############.jpg
	   public ResponseEntity<byte[]> displayFile(String filename) throws IOException {
	      ResponseEntity<byte[]> entity = null;

	      InputStream in = null;

	      logger.info("======파일이름 : " + filename);
	      
	      try {
	    	 HttpHeaders header = new HttpHeaders();
	    	 if(filename.trim().length()>0){
		         String formatName = filename.substring(filename.lastIndexOf(".") + 1);
		         MediaType mType = MediaUtils.getMediaType(formatName);
		         
		         header.setContentType(mType);
		         
		         File file= new File(uploadPath+"/"+filename);
		         if(file.exists() && filename.length()>0){
					 System.out.println("파일있음,"+uploadPath + "/" + filename);
					  
					 in = new FileInputStream(uploadPath + "/" + filename);
				 }else{
					 in = new FileInputStream(uploadPath + "/fileNotFound.jpg");
				 }
	    	 }	         
			else{
				 in = new FileInputStream(uploadPath + "/fileNotFound.jpg");
			 }
	         entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), header, HttpStatus.CREATED);
	      } catch (Exception e) {
	    	  e.printStackTrace();
	    	  entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);

		  } finally {
			  in.close();
	      }
	      return entity;
	}
}