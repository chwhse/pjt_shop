package com.dgit.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.service.OrdersService;


@Controller
@RequestMapping("/homes/*")
public class HomesController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomesController.class);
	
	@Autowired
	OrdersService oservice;
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String homeGET() throws Exception {
		
		return "homes/home";
	}
	@RequestMapping(value = "aboutUs", method = RequestMethod.GET)
	public String aboutUsGET() throws Exception {
		
		return "homes/aboutUs";
	} 
	@RequestMapping(value = "myPage", method = RequestMethod.GET)
	public String myPageGET(Model model, HttpSession session, 
							HttpServletResponse response) throws Exception{
		
		logger.info("=============myPage GET=============");
		
		String uid = (String) session.getAttribute("login");
		if(uid == null){
			response.sendRedirect("/users/login");
		}
		System.out.println(oservice.ordersSelectById4MyPage(uid).size());
		model.addAttribute("orderslist",oservice.ordersSelectById4MyPage(uid));
		return "homes/myPage";
	}
	
	
	
	
	
	
}



