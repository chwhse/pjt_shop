package com.dgit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
	public ResponseEntity<String> JoinFormRestPost(@RequestBody UsersVO vo) throws Exception{
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
	public ResponseEntity<Map<String, Object>> LoginRestPost(@RequestBody UsersVO vo) throws Exception{ //@RequestBody써줘야 VO안에 변수값 json으로 받음
		logger.info("=======LoginRestPost=======");
		logger.info(vo.toString());
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		String uid = vo.getUid();
		if(uid==null){
			uid="";
			System.out.println("들어온 uid key값 null");
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST); // 400 error
		}else{
			UsersVO uvo = service.login(vo.getUid(), vo.getUpw());

			Map<String, Object> map = new HashMap<>();
			map.put("user", uvo);
			
			try{
				if(uvo == null){
					// 회원가입을 한 적이 없으면, memberVO키가 없음
					// interceptor에서 memberVO키가 없으면 login화면으로 다시 가도록 처리
					System.out.println("회원없음.");
					map.put("success", false);
					entity = new ResponseEntity<Map<String, Object>>(map,HttpStatus.BAD_REQUEST); // 400 error
				}else{
					map.put("success", true);
					entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

				}
			}catch(Exception e){
				map.put("success", false);
				entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST); // 400 error
			}
		}
		return entity;
	}
	
	@RequestMapping(value="/listUser", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listUserRestGet() throws Exception{ 
		logger.info("=======listUserRestGet=======");
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> map = new HashMap<>();
		
		try{
			List<UsersVO> userslist = service.usersListAll();
			map.put("userlist", userslist);
			map.put("success", "true");
			System.out.println(map.toString());
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK); 
			
		}catch(Exception e){
			map.put("success", "false");
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.BAD_REQUEST); // 400 error
		}
		return entity;
	}
	
	@RequestMapping(value="/deleteUser", method=RequestMethod.POST)
	public ResponseEntity<String> deleteUserRestPost(String uid) throws Exception{ 
		logger.info("=======deleteUserRestPost=======");
		logger.info(uid.toString());
		
		ResponseEntity<String> entity = null;
		
		
		try{
			service.usersDelete(uid);
			entity = new ResponseEntity<String>("success", HttpStatus.OK); 
			
		}catch(Exception e){
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST); // 400 error
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
