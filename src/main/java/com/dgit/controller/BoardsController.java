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

import com.dgit.domain.BoardsVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.BoardsService;


@Controller
@RequestMapping("/boards/*")
public class BoardsController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardsController.class);
	
	@Autowired
	BoardsService service;
	
	@RequestMapping(value = "listPage", method = RequestMethod.GET)
	public String listPageGET(@ModelAttribute("cri")SearchCriteria cri,Model model) throws Exception {
		model.addAttribute("list", service.listSearch(cri) );
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.searchCount(cri));
		model.addAttribute("pageMaker",pageMaker);
		
		return "boards/listPage";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String registerGET() throws Exception{
		return "boards/register";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(BoardsVO vo) throws Exception{
		logger.info("=============Register Post=============");
		
		service.boardsInsert(vo);
		logger.info(vo.toString());
		return "redirect:listPage";
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String readGET(int bno, Model model, @ModelAttribute("cri")SearchCriteria cri, boolean isModify) throws Exception{
		BoardsVO vo = service.boardsSelectByNo(bno);
		
		if(isModify != true){
			service.setReadCnt(bno);
			service.boardsUpdate(vo);
		}
		
		model.addAttribute("board", vo);
		return "boards/read";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String deleteGET(int bno) throws Exception{
		logger.info("=============delete DELETE=============");
		service.boardsDelete(bno);
		
		return "redirect:listPage";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyGET(int bno,Model model) throws Exception{
		BoardsVO vo = service.boardsSelectByNo(bno);
		
		model.addAttribute("board", vo);
		return "boards/modify";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(BoardsVO vo,SearchCriteria cri,RedirectAttributes rttr) 	throws Exception{
		
		logger.info("=============modify Post=============");
		logger.info("boardVO:"+vo.toString());
		service.boardsUpdate(vo);
		
		rttr.addAttribute("isModify",true);
	    rttr.addAttribute("bno", vo.getBno());
	    rttr.addAttribute("page", cri.getPage());
	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:read";
		
	}
}
