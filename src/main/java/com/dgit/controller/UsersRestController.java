package com.dgit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.BoardsVO;
import com.dgit.domain.UsersVO;
import com.dgit.service.UsersService;

@RestController
@RequestMapping("/users/rest/*")
public class UsersRestController {
	private static final Logger logger = 
			LoggerFactory.getLogger(UsersRestController.class);

	@Autowired
	private UsersService service;
	

	@Transactional
	@RequestMapping(value="/joinForm", method=RequestMethod.POST)
	public ResponseEntity<String> JoinFormRestPost(UsersVO vo) throws Exception{
		logger.info("=========JoinFormRestPost========");
		
		logger.info(vo.toString());
		
		ResponseEntity<String> entity = null;
		try{
			if(vo.getUid()!=null){
				service.usersInsert(vo);
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			}else{
				entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
			}
		}catch(Exception e){
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
				
	}

	
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public ResponseEntity<UsersVO> LoginRestPost(UsersVO vo) throws Exception{
		logger.info("=======LoginRestPost=======");
		
		ResponseEntity<UsersVO> entity = null;
		
		String uid = vo.getUid();
		if(uid==null){
			uid="";
			System.out.println("들어온 uid key값 null");
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST); // 400 error
		}else{
			UsersVO uvo = service.login(vo.getUid(), vo.getUpw());
			System.out.println(uvo);
			
			try{
				if(uvo == null){
					// 회원가입을 한 적이 없으면, memberVO키가 없음
					// interceptor에서 memberVO키가 없으면 login화면으로 다시 가도록 처리
					System.out.println("회원없음.");
					entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST); // 400 error
				}else{
					entity = new ResponseEntity<UsersVO>(uvo, HttpStatus.OK);

				}
			}catch(Exception e){
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST); // 400 error
			}
		}
		
		
		
		
		return entity;
	}
	
	@RequestMapping(value="validateId", method=RequestMethod.GET)
	public ResponseEntity<String> ValidateIdRestGet(UsersVO vo) throws Exception{
		
		logger.info("=======ValidateIdRestGet======="+vo.getUid());
		
		String uid = vo.getUid();
		if(uid==null){
			uid="";
			System.out.println("들어온 uid key값 null");
		}else{
			uid = service.idDuCheck(uid);
			System.out.println("아이디 사용 가능.");
		}
		
		ResponseEntity<String> entity = null;
		try{
			if(uid!="" && uid == null){
				System.out.println("아이디 사용 가능.");
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			}else{
				entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);

			}
		}catch(Exception e){
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}	
	
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public void LogoutRestGet(HttpSession session){
		// 아직 안함.
		logger.info("=======LogoutRestGet=======");
		session.removeAttribute("login");
		session.invalidate();
	}
}
