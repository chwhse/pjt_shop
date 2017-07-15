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

import com.dgit.domain.GoodsVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.GoodsService;
@Controller
@RequestMapping("/goods/*")
public class GoodsController {
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	@Autowired
	GoodsService service;
	
	@RequestMapping(value = "listPage", method = RequestMethod.GET)
	public String listPageGET(@ModelAttribute("cri")SearchCriteria cri,Model model) throws Exception {
		model.addAttribute("list", service.goodsListAll() );
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.searchCount(cri));
		model.addAttribute("pageMaker",pageMaker);
		
		return "goods/listPage";
	}
	

	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String registerGET() throws Exception{
		return "goods/register";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(GoodsVO vo) throws Exception{
		logger.info("=============Register Post=============");
		
		service.goodsInsert(vo);
		logger.info(vo.toString());
		return "redirect:listPage";
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String readGET(String gcode, Model model, @ModelAttribute("cri")SearchCriteria cri, boolean isModify) throws Exception{
		GoodsVO vo = service.goodsSelectByNo(gcode);
		
		if(isModify != true){
			service.setReadCnt(gcode);
			service.goodsUpdate(vo);
		}
		
		model.addAttribute("board", vo);
		return "goods/read";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String deleteGET(String gcode) throws Exception{
		logger.info("=============delete DELETE=============");
		service.goodsDelete(gcode);
		
		return "redirect:listPage";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyGET(String gcode,Model model) throws Exception{
		GoodsVO vo = service.goodsSelectByNo(gcode);
		
		model.addAttribute("board", vo);
		return "goods/modify";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(GoodsVO vo,SearchCriteria cri,RedirectAttributes rttr) 	throws Exception{
		
		logger.info("=============modify Post=============");
		logger.info("boardVO:"+vo.toString());
		service.goodsUpdate(vo);
		
		rttr.addAttribute("isModify",true);
	    rttr.addAttribute("gcode", vo.getGcode());
	    rttr.addAttribute("page", cri.getPage());
	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:read";
		
	}
}
