package com.dgit.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.UsersVO;
import com.dgit.service.UsersService;

@Controller
@RequestMapping("/users")
public class UsersController {
	private static final Logger logger = 
			LoggerFactory.getLogger(UsersController.class);

	@Autowired
	private UsersService service;
	
	@RequestMapping(value="/joinForm", method=RequestMethod.GET)
	public void JoinFormGET(){
	}
	@Transactional
	@RequestMapping(value="/joinForm", method=RequestMethod.POST)
	public String JoinFormPOST(UsersVO vo, Model model, RedirectAttributes rttr) throws Exception{
		logger.info("======================JOIN POST=====================");
		service.usersInsert(vo);
		

		logger.info(vo.toString());
		model.addAttribute("loginVO", vo);
		return "redirect:/boards/listPage";
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
		logger.info("=======로그아웃=======");
		session.removeAttribute("login");
		session.invalidate();
	}
}
