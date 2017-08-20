package com.dgit.controller;

import java.sql.Date;
import java.util.List;

import org.apache.commons.lang.time.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.BoardsVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.BoardsService;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;


@RestController
@RequestMapping("/boards/rest/*")
public class BoardsRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardsRestController.class);
	
	@Autowired
	BoardsService service;
	
	@RequestMapping(value = "listPage", method = RequestMethod.GET)
	public ResponseEntity<List<BoardsVO>> listPageGetRest() throws Exception{
		
		ResponseEntity<List<BoardsVO>> entity = null;
		List<BoardsVO> bvo = service.boardsListAll();
		
		try{
			entity = new ResponseEntity<List<BoardsVO>>(bvo, HttpStatus.OK);

		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST); // 400 error
		}
		return entity;
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String registerGetRest() throws Exception{
		return "boards/register";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPostRest(BoardsVO vo) throws Exception{
		logger.info("=============Register Post=============");
		
		service.boardsInsert(vo);
		logger.info(vo.toString());
		return "redirect:listPage";
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String readGetRest(int bno, Model model, @ModelAttribute("cri")SearchCriteria cri, boolean isModify) throws Exception{
		BoardsVO vo = service.boardsSelectByNo(bno);
		
		if(isModify != true){
			service.setReadCnt(bno);
			service.boardsUpdate(vo);
		}
		
		model.addAttribute("board", vo);
		return "boards/read";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String deleteGetRest(int bno) throws Exception{
		logger.info("=============delete DELETE=============");
		service.boardsDelete(bno);
		
		return "redirect:listPage";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyGetRest(int bno,Model model) throws Exception{
		BoardsVO vo = service.boardsSelectByNo(bno);
		
		model.addAttribute("board", vo);
		return "boards/modify";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPostRest(BoardsVO vo,SearchCriteria cri,RedirectAttributes rttr) 	throws Exception{
		
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
