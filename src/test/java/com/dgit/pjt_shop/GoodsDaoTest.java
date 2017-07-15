package com.dgit.pjt_shop;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.BoardsVO;
import com.dgit.domain.GoodsVO;
import com.dgit.persistence.BoardsDAO;
import com.dgit.persistence.GoodsDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class GoodsDaoTest {
	@Autowired
	private GoodsDAO dao;
	
	@Test
	public void testListPage()throws Exception{
		System.out.println("@!!!!!!!!!###################");
		List<GoodsVO> list = dao.goodsListAll();
		
		for(GoodsVO vo : list){
			System.out.println(vo.getGcategory()+":"+vo.getGname());
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
