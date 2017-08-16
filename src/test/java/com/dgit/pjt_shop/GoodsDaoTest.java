package com.dgit.pjt_shop;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.BoardsVO;
import com.dgit.domain.Criteria;
import com.dgit.domain.GoodsVO;
import com.dgit.domain.SearchCriteria;
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
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		cri.setPerPageNum(16);
		List<GoodsVO> list = dao.listSearch(cri);
		
		for(GoodsVO vo : list){
			System.out.println(vo.getGcategory()+":"+vo.getGname());
		}
	}
/*	@Test
	public void testMaxGcode()throws Exception{
		System.out.println("@!!!!!!!!!###################");
		System.out.println("카테고리뽑기 "+dao.getMaxGcodeByCategory("machine"));
		GoodsVO vo = new GoodsVO();
		vo.setGcategory("coffee");
		String maxGcode = dao.getMaxGcodePlus1(vo);
		System.out.println("맥스코드:"+maxGcode);
	}*/
/*	
	@Test
	public void testInsertGdetail()throws Exception{
		GoodsVO vo = new GoodsVO();
		vo.setGcode("c50009");
		vo.setGname("이름");
		vo.setGcategory("coffee");
		List<String> list = new ArrayList<>();
		list.add("바보");
		list.add("멍청이");
		vo.setGdetailimg(list);
		System.out.println("디테일이미지1:"+vo.toString());
		dao.goodsInsert(vo);
		System.out.println("디테일이미지2:"+vo.toString());
		dao.goodsDetailInsert(vo);
		
	}*/
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
