package com.dgit.pjt_shop;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.CommentsVO;
import com.dgit.domain.ReviewsVO;
import com.dgit.persistence.CommentsDAO;
import com.dgit.persistence.ReviewsDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})

public class ReviewsDaoTest {
	@Autowired
	private ReviewsDAO dao;
	@Autowired
	private CommentsDAO cdao;
	
	
	@Test
	public void testCommentInsert()throws Exception{
		
		
		dao.reviewsSelectByCode("c10001");
		
	}
	
/*	@Test
	public void testCommentInsert()throws Exception{
		CommentsVO vo = new CommentsVO();
		vo.setRno(1);
		vo.setCcontent("q바보");
		cdao.add(vo);
		
		System.out.println(cdao.commentsSelectByno(1));
	}*/
	
/*	@Test
	public void testListPage()throws Exception{
		
		List<ReviewsVO> list = dao.reviewsListAll();
		System.out.println("maxrno:"+dao.getMaxRno());
		
		for(ReviewsVO vo : list){
			System.out.println(vo.getRno()+":"+vo.getRtitle());
		}
		
		
	}*/
/*	
	@Test
	public void testInsertReview()throws Exception {
		ReviewsVO vo = new ReviewsVO();
		vo.setGcode("c10001");
		vo.setUid("admin");
		vo.setRtitle("후기테스트");
		vo.setRcontent("후기후기");
		vo.setRisexist(0);
		dao.reviewsInsert(vo);
		
	}*/
/*	
	
	@Test
	public void testUpdateReview()throws Exception {
		ReviewsVO vo = new ReviewsVO();
		vo.setRno(10);
		vo.setRisexist(-1);
		dao.reviewsUpdate(vo);
	}*/

/*
	@Test
	public void testDeleteReview()throws Exception {
		dao.reviewsDelete(10);
		
		
	}*/


}
