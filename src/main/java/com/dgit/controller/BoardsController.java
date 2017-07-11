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
	
}
