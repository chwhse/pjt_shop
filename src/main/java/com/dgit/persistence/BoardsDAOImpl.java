package com.dgit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dgit.domain.BoardsVO;

@Repository
public class BoardsDAOImpl implements BoardsDAO {
	@Inject
	private SqlSession session;
	private static String namespace = "com.dgit.persistence.BoardsDAO";
	

	@Override
	public List<BoardsVO> boardsListAll() throws Exception {
		return session.selectList(namespace+".boardsListAll");
	}

	@Override
	public int getMaxBno() throws Exception {
		return session.selectOne(namespace+".getMaxBno");
	}

	@Override
	public void boardsInsert(BoardsVO vo) {
		session.insert(namespace+".boardsInsert", vo);
	}
	@Override
	public BoardsVO boardsSelectByNo(int no) throws Exception {
		return session.selectOne(namespace+".boardsSelectByNo", no);
	}

	@Override
	public void boardsDelete(int no) throws Exception {
		session.delete(namespace+".boardsDelete", no);
	}

	@Override
	public void boardsUpdate(BoardsVO vo) throws Exception {
		session.update(namespace+".boardsUpdate", vo);
	}


}
