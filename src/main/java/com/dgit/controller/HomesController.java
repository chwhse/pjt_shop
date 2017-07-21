package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/homes/*")
public class HomesController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomesController.class);
	
/*	@Autowired
	BoardsService service;
	*/
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String homeGET() throws Exception {
		
		return "homes/home";
	}
	@RequestMapping(value = "aboutus", method = RequestMethod.GET)
	public String aboutUsGET() throws Exception {
		
		return "homes/aboutus";
	}
}