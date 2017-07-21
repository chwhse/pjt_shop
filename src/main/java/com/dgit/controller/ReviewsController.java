package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.PageMaker;
import com.dgit.domain.ReviewsVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.ReviewsService;


@Controller
@RequestMapping("/reviews/*")
public class ReviewsController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewsController.class);
	
	@Autowired
	ReviewsService service;
	
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
	public String registerGET() throws Exception{
		return "reviews/register";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(ReviewsVO vo) throws Exception{
		logger.info("=============Register Post=============");
		
		service.reviewsInsert(vo);
		logger.info(vo.toString());
		return "redirect:listPage";
	}
/*	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String readGET(int rno, Model model, @ModelAttribute("cri")SearchCriteria cri, boolean isModify) throws Exception{
		ReviewsVO vo = service.reviewsSelectByNo(rno);
		
			service.reviewsUpdate(vo);
		
		model.addAttribute("review", vo);
		return "reviews/read";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String deleteGET(int bno) throws Exception{
		logger.info("=============delete DELETE=============");
		service.reviewsDelete(bno);
		
		return "redirect:listPage";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyGET(int rno,Model model) throws Exception{
		ReviewsVO vo = service.reviewsSelectByNo(rno);
		
		model.addAttribute("review", vo);
		return "reviews/modify";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(ReviewsVO vo,SearchCriteria cri,RedirectAttributes rttr) 	throws Exception{
		
		logger.info("=============modify Post=============");
		logger.info("ReviewsVO:"+vo.toString());
		service.reviewsUpdate(vo);
		
	    rttr.addAttribute("rno", vo.getRno());
	    rttr.addAttribute("page", cri.getPage());
	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:read";
		
	}*/
}
