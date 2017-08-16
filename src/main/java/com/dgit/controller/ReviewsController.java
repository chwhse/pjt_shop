package com.dgit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.CommentsVO;
import com.dgit.domain.GoodsVO;
import com.dgit.domain.OrdersVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.ReviewsVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.CommentsService;
import com.dgit.service.GoodsService;
import com.dgit.service.OrdersService;
import com.dgit.service.ReviewsService;


@Controller
@RequestMapping("/reviews/*")
public class ReviewsController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewsController.class);
	
	@Autowired
	ReviewsService service;
	@Autowired
	OrdersService oservice;
	@Autowired
	GoodsService gservice;
	@Autowired
	CommentsService cservice;
	
	
	@RequestMapping(value = "/addComment/{rno}/{ccontent}", method=RequestMethod.POST)
	public ResponseEntity<CommentsVO> addComment(@PathVariable("rno") int rno,@PathVariable("ccontent") String ccontent){
		ResponseEntity<CommentsVO> entity = null;
		
		logger.info("===============Add Comment POST===============");
		
		try{
			CommentsVO vo = new CommentsVO();
			vo.setRno(rno);
			vo.setCcontent(ccontent);
			cservice.addComment(vo);
			
			CommentsVO res_vo  = cservice.latestCommentsSelectByRno(rno);
			if(res_vo==null){
				System.out.println("널");
			};
			entity = new ResponseEntity<CommentsVO>(res_vo, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST); // 400 error
		}
		return entity;
	}
	
	@RequestMapping(value = "listPage", method = RequestMethod.GET)
	public String listPageGET(@ModelAttribute("cri")SearchCriteria cri,Model model) throws Exception {
		model.addAttribute("list", service.listSearch(cri) );
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.searchCount(cri));
		model.addAttribute("pageMaker",pageMaker);
		
		return "reviews/listPage";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String registerGET(Model model, 
								HttpSession session, 
								HttpServletResponse response, int ono) throws Exception{
		logger.info("=============Register Get=============");
		String uid = (String) session.getAttribute("login");
		if(uid == null){
			response.sendRedirect("/users/login");
		}
		if(ono>0){
			List<OrdersVO> list = new ArrayList<>();
			list.add(oservice.ordersSelectByNo(ono));
				model.addAttribute("orderslist", list);
		}else{
			List<OrdersVO> list = oservice.ordersSelectById4Review(uid);
			if(list.size()>0){
				model.addAttribute("orderslist", list);
			}
			System.out.println("리스트개수"+list.size());
		}
		
		
		
		
		return "reviews/register";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(ReviewsVO vo, String mygcode) throws Exception{
		logger.info("=============Register Post=============");
		
		GoodsVO gvo = gservice.goodsSelectByCode(mygcode);
		vo.setGoods(gvo);
		System.out.println("reviews:"+vo.getGoods().toString());
		service.reviewsInsert(vo);
		return "redirect:listPage";
	}
		
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String readGET(int rno, Model model, @ModelAttribute("cri")SearchCriteria cri, boolean isModify) throws Exception{
		ReviewsVO vo = service.reviewsSelectByNo(rno);
		System.out.println("reviewVO:"+vo.getGoods().getGname());
		model.addAttribute("review", vo);
		model.addAttribute("commentlist", cservice.list(rno));
		return "reviews/read";
	}
			
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String deleteGET(int rno, int ono) throws Exception{
		logger.info("=============delete DELETE=============");
		service.reviewsDelete(rno, ono);
		
		
		return "redirect:listPage";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyGET(int rno,Model model) throws Exception{
		ReviewsVO vo = service.reviewsSelectByNo(rno);
		
		model.addAttribute("review", vo);
		return "reviews/modify";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(ReviewsVO vo,SearchCriteria cri,RedirectAttributes rttr) throws Exception{
		
		logger.info("=============modify Post=============");
		logger.info("ReviewsVO:"+vo.toString());
		service.reviewsUpdate(vo);
		
	    rttr.addAttribute("rno", vo.getRno());
	    rttr.addAttribute("page", cri.getPage());
	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:read";
		
	}
}
