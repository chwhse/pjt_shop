package com.dgit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.GoodsVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.ReviewsVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.GoodsService;
import com.dgit.service.ReviewsService;
import com.dgit.util.MediaUtils;
import com.dgit.util.UploadFileUtils;
@Controller
@RequestMapping("/goods/*")
public class GoodsController {
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	@Autowired
	GoodsService service;
	@Autowired
	ReviewsService rservice;
	
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
	    	 if(filename.trim().length()!=0){
		         String formatName = filename.substring(filename.lastIndexOf(".") + 1);
		         MediaType mType = MediaUtils.getMediaType(formatName);
		         
		         header.setContentType(mType);
	    	 }
	         File file= new File(uploadPath+"/"+filename);
			 if(!file.exists()){
				 in = new FileInputStream(uploadPath + "/fileNotFound.jpg");
			 }else{
				 System.out.println("파일있음");
				 in = new FileInputStream(uploadPath + "/" + filename);
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
	
	@RequestMapping(value = "listPage4admin", method = RequestMethod.GET)
	public String listPage4AdminGET(@ModelAttribute("cri")SearchCriteria cri,Model model) throws Exception {
		logger.info("=============listPage4Admin GET=============");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.searchCount4Admin(cri));
		model.addAttribute("pageMaker",pageMaker);
		
		model.addAttribute("list", service.listSearch4Admin(cri) );
		
		
		return "goods/listPage4admin";
	}
	@RequestMapping(value = "listPage", method = RequestMethod.GET)
	public String listPageGET(@ModelAttribute("cri")SearchCriteria cri,Model model) throws Exception {
		logger.info("=============listPage GET=============");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.searchCount(cri));
		model.addAttribute("pageMaker",pageMaker);
		
		model.addAttribute("list", service.listSearch(cri) );
		
		
		return "goods/listPage";
	}
	

	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String registerGET(Model model) throws Exception{
		logger.info("=============Register GET=============");
		model.addAttribute("gcategorylist",service.getAllGoodsCategory());
		for(String gcategory: service.getAllGoodsCategory()){
			logger.info("목록:"+gcategory.toString());
		}
		return "goods/register";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(GoodsVO vo, MultipartHttpServletRequest mreq) throws Exception{
		logger.info("=============Register POST=============");
		
		MultipartFile file = mreq.getFile("gtitleimgfile");
		if(file != null && file.getSize() > 0){
			logger.info(" gtitleimgfile : " + file.getOriginalFilename());
			vo.setGtitleimg(registerImg(file, 300));
		}
		
		List<MultipartFile> filelist = mreq.getFiles("gdetailimgfile");
		List<String> list = new ArrayList<>();
		if(filelist != null && filelist.size() > 0){
			for(MultipartFile item : filelist){
				logger.info(" gdetailimgfile : " + item.getOriginalFilename());
				list.add(registerImg(item, 300));
			}
		}
		vo.setGdetailimg(list);
		logger.info("인서트전"+vo.toString());
		
		service.goodsInsert(vo);
		logger.info(vo.toString());
		return "redirect:listPage";
	}
	
	private String registerImg(MultipartFile file,int size) throws IOException{
		logger.info("filename : " + file.getOriginalFilename());
		String thumb = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(),file.getBytes(),size);
		return thumb;
	}
	
	
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String readGET(String gcode, Model model, @ModelAttribute("cri")SearchCriteria cri) throws Exception{
		logger.info("=============read GET=============");
		GoodsVO vo = service.goodsSelectByCode(gcode);
		logger.info("===GoodVO:"+vo.toString());
		List<ReviewsVO> rlist = rservice.reviewsSelectByCode(gcode);
		logger.info("===reviewsize:"+rlist.size());
		model.addAttribute("reviewslist", rlist);
		model.addAttribute("good", vo);
		return "goods/read";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String deleteGET(String gcode) throws Exception{
		logger.info("=============delete DELETE=============");
		service.goodsDelete(gcode);
		
		return "redirect:listPage";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyGET(String gcode,Model model) throws Exception{
		GoodsVO vo = service.goodsSelectByCode(gcode);
		model.addAttribute("gcategorylist",service.getAllGoodsCategory());
		model.addAttribute("good", vo);
		return "goods/modify";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(String[] deletefiles,
							 MultipartHttpServletRequest mreq,
							 GoodsVO vo, SearchCriteria cri,RedirectAttributes rttr) 	throws Exception{
		
		logger.info("=============modify Post=============");
		logger.info("goodVO:"+vo.toString());
		
		
		
		List<MultipartFile> filelist = mreq.getFiles("modImgFiles");
		for(String file : deletefiles){
			if(file.trim().length()>0){
		    	 logger.info("del91:"+deletefiles.length);
		    		// 상세 이미지 지우고
		    		 logger.info("del92:"+file);
		    		 UploadFileUtils.deletefile2(uploadPath, file);
		    }
		}
	     
		List<String> list = new ArrayList<>();
		if(filelist != null && filelist.size() > 0){
			for(MultipartFile file : filelist){
				logger.info(" gdetailimgfile : " + file.getOriginalFilename());
				if(file.getSize()==0)
		        	 continue;
				// 상세 이미지 넣기
		         String thumb = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes(), 300);
		      
		         list.add(thumb);
			}
		}
		vo.setGdetailimg(list);
		System.out.println("리스트:"+vo.getGdetailimg());
		
		service.goodsUpdate(vo, deletefiles);
		//경로설정댐
	
	    MultipartFile file = mreq.getFile("modTitleImgFile");
		if(file != null && file.getSize() > 0){
				logger.info(" gtitleimgfile : " + file.getOriginalFilename());
				// 타이틀이미지 지우고
				if(vo.getGtitleimg()!=null){
					UploadFileUtils.deletefileWithPath(uploadPath,vo.getGtitleimg());
				}
				// 넣기
				vo.setGtitleimg(registerImg(file, 300));
		}
		
		
	    rttr.addAttribute("gcode", vo.getGcode());
	    rttr.addAttribute("page", cri.getPage());
	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:read";
		
	}
}
