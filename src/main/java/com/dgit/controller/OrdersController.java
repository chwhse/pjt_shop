package com.dgit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	
	@RequestMapping(value = "listPage", method = RequestMethod.GET)
	public String listPageGET(@ModelAttribute("cri")SearchCriteria cri,Model model) throws Exception {
		model.addAttribute("list", service.listSearch(cri) );
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.searchCount(cri));
		model.addAttribute("pageMaker",pageMaker);
		
		return "orders/listPage";
	}
	
	
	
	@RequestMapping(value="/buy", method=RequestMethod.GET)
	public String buyGET(String gcode, Model model,
						HttpSession session,
						HttpServletResponse response) throws Exception{
		logger.info("=============buy GET=============");
		
		
		String uid = (String) session.getAttribute("login");
		if(uid == null){
			response.sendRedirect("/users/login");
		}
		
		/*// 여기 넘어오기전 상품 장바구니에db 담기 
		OrdersVO vo = new OrdersVO();
		vo.setGcode(gcode);
		vo.setUid(uid);
		service.createShoppingBag(vo);
		*/
		
		model.addAttribute("list", service.ordersSelectByCode("u00004"));
		logger.info("리스트 수:"+service.ordersSelectByCode("u00004"));
		model.addAttribute("good", gservice.goodsSelectByCode(gcode));
		
		return "orders/buy";
	}
	
	@RequestMapping(value="/buy", method=RequestMethod.POST)
	public String buyPOST(OrdersVO vo, Model model) throws Exception{
		logger.info("=============buy POST=============");
		
		
		// service.ordersEachInsert(vo);;
		List<OrdersVO> list = vo.getOrdersVOList();
		
		for(OrdersVO order : list){
			logger.info(order.toString());
		}
		return "redirect:listPage";
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String readGET(String ocode, Model model, @ModelAttribute("cri")SearchCriteria cri, boolean isModify) throws Exception{
		List<OrdersVO> vo = service.ordersSelectByCode(ocode);
		
		model.addAttribute("list", vo);
		return "orders/read";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String deleteGET(String ocode) throws Exception{
		logger.info("=============delete DELETE=============");
		service.ordersEachDelete(ocode);
		
		return "redirect:listPage";
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
	    	 if(filename.trim().length()!=0){
		         String formatName = filename.substring(filename.lastIndexOf(".") + 1);
		         MediaType mType = MediaUtils.getMediaType(formatName);
		         
		         header.setContentType(mType);
	    	 }
	         File file= new File(uploadPath+"/"+filename);
			 if(!file.exists()){
				 in = new FileInputStream(uploadPath + "/fileNotFound.jpg");
			 }else{
				 in = new FileInputStream(uploadPath + "/" + filename);
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