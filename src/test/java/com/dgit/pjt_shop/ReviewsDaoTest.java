package com.dgit.pjt_shop;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.ReviewsVO;
import com.dgit.persistence.ReviewsDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})

public class ReviewsDaoTest {
	@Autowired
	private ReviewsDAO dao;
	
	@Test
	public void testListPage()throws Exception{
		
		List<ReviewsVO> list = dao.reviewsListAll();
		
		for(ReviewsVO vo : list){
			System.out.println(vo.getRno()+":"+vo.getRtitle());
		}
		
	}
	/*	
	@Test
	public void testInsertMember()throws Exception {
		BoardVO board = new BoardVO();
		board.setTitle("새로운 글을 넣습니다");
		board.setContent("새로운 글!!");
		board.setWriter("user00");
		ArrayList<String> list = new ArrayList<>();
		list.add("파일1");
		list.add("파일2");
		board.setFiles(list.toArray(new String[list.size()]));
		dao.create(board);
		
	}
	
	@Test
	public void testSelectMember()throws Exception {
		
		dao.read(2);
		
	
	}
	
	@Test
	public void testUpdateMember()throws Exception {
		BoardVO board = new BoardVO();
		board.setBno(2);
		board.setTitle("수정 글을 넣습니다");
		board.setContent("수정 글!!");
		board.setWriter("user22");
		dao.update(board);
	}
	*/
/*	
	@Test
	public void testDeleteMember()throws Exception {
		dao.delete(2);
		
		
	}
*/

}
