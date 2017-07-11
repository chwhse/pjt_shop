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

}
