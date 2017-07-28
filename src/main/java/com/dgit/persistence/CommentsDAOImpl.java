package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.CommentsVO;
import com.dgit.domain.Criteria;

@Repository
public class CommentsDAOImpl implements CommentsDAO {
	@Autowired
	private SqlSession session;

	private static final String namespace = "com.dgit.persistence.CommentsDAO";
	
	@Override
	public List<CommentsVO> list(int rno) throws Exception {
		return session.selectList(namespace+".list", rno);
	}
	
	@Override
	public CommentsVO commentsSelectByCno(int cno) throws Exception {
		return session.selectOne(namespace+".commentsSelectByCno", cno);
	}
	@Override
	public CommentsVO latestCommentsSelectByRno(int rno) throws Exception {
		return session.selectOne(namespace+".latestCommentsSelectByRno", rno);
	}

	@Override
	public void add(CommentsVO vo) throws Exception {
		session.insert(namespace+".add", vo);
	}

	@Override
	public void modify(CommentsVO vo) throws Exception {
		session.update(namespace+".modify", vo);
	}

	@Override
	public void remove(int no) throws Exception {
		session.delete(namespace+".remove", no);		
	}


	@Override
	public int count(int no) throws Exception {
		return session.selectOne(namespace+".count", no);
	}

	@Override
	public int getRno(int no) throws Exception {
		return session.selectOne(namespace+".getRno", no);
	}


}
