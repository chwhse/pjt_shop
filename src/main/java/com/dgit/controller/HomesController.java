package com.dgit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgit.domain.OrdersVO;
import com.dgit.domain.ReviewsVO;
import com.dgit.service.OrdersService;
import com.dgit.service.ReviewsService;
import com.dgit.util.MediaUtils;


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
	
	@Resource(name="uploadPath")// id로(DI) 주입받을때사용
	private String uploadPath;
	
	@ResponseBody
	   @RequestMapping(value = "displayFile") // displayFile?filename=##############.jpg
	   public ResponseEntity<byte[]> displayFile(String filename) throws IOException {
	      ResponseEntity<byte[]> entity = null;

	      InputStream in = null;

	      logger.info("======파일이름 : " + filename);
	      
	      try {
	    	 HttpHeaders header = new HttpHeaders();
	    	 if(filename.trim().length()>0){
		         String formatName = filename.substring(filename.lastIndexOf(".") + 1);
		         MediaType mType = MediaUtils.getMediaType(formatName);
		         
		         header.setContentType(mType);
		         
		         File file= new File(uploadPath+"/"+filename);
		         if(file.exists() && filename.length()>0){
					 System.out.println("파일있음,"+uploadPath + "/" + filename);
					  
					 in = new FileInputStream(uploadPath + "/" + filename);
				 }else{
					 in = new FileInputStream(uploadPath + "/fileNotFound.jpg");
				 }
	    	 }
	         else{
				 in = new FileInputStream(uploadPath + "/fileNotFound.jpg");
			 }
	         entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), header, HttpStatus.CREATED);
	      } catch (Exception e) {
	    	  e.printStackTrace();
	    	  entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);

		  } finally {
			  in.close();
	      }
	      return entity;
	}
	
	
	
	
}



