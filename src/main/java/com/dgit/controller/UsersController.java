package com.dgit.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgit.domain.UsersVO;
import com.dgit.service.UsersService;

@Controller
@RequestMapping("/users")
public class UsersController {
	private static final Logger logger = 
			LoggerFactory.getLogger(UsersController.class);

	@Autowired
	private UsersService service;
	
	// /user/login
	@RequestMapping(value="/bottsnippTest", method=RequestMethod.GET)
	public void getBottsnippTest(){
	}
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void getLogin(){
	}
	
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public void postLogin(UsersVO user, Model model) throws Exception{
		UsersVO vo = service.login(user.getUid(), user.getUpw());
		System.out.println(vo);
		
		if(vo == null){
			// 회원가입을 한 적이 없으면, memberVO키가 없음
			// interceptor에서 memberVO키가 없으면 login화면으로 다시 가도록 처리
			System.out.println("회원없음.");
			return;
		}
		model.addAttribute("loginVO", vo);
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public void logout(HttpSession session){
		session.removeAttribute("login");
		session.invalidate();
	}
}
