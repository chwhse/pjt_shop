package com.dgit.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.BoardsVO;
import com.dgit.service.BoardsService;


@Controller
@RequestMapping("/boards/*")
public class BoardsController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardsController.class);
	
	@Autowired
	BoardsService service;
	
	@RequestMapping(value = "listPage", method = RequestMethod.GET)
	public String home(Model model) throws Exception {
		model.addAttribute("list", service.boardsListAll() );
		
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
	public String read(int no, Model model) throws Exception{
		BoardsVO vo = service.boardsSelectByNo(no);
		
		model.addAttribute("board", vo);
		return "boards/read";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(int no) throws Exception{
		service.boardsDelete(no);
		
		return "redirect:listPage";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyGET(int no,Model model) throws Exception{
		BoardsVO vo = service.boardsSelectByNo(no);
		
		model.addAttribute("board", vo);
		return "boards/modify";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(BoardsVO vo, RedirectAttributes rttr) 	throws Exception{
		
		System.out.println("=======MOD POST========");
		System.out.println("bvo:"+vo.toString());
		service.boardsUpdate(vo);
		
		rttr.addAttribute("no", vo.getBno());
		System.out.println("no:"+vo.getBno());
		return "redirect:read";
		
	}
}
