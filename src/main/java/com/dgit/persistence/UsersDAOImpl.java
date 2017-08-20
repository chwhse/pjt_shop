package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.UsersVO;

@Repository
public class UsersDAOImpl implements UsersDAO {

	@Autowired
	private SqlSession session;
	
	private static final String namespace = "com.dgit.persistence.UsersDAO";
	
	@Override
	public UsersVO usersSelectByid(String uid) throws Exception {
		return session.selectOne(namespace+".usersSelectByid", uid);
	}

	@Override
	public void usersInsert(UsersVO vo) throws Exception {
		session.insert(namespace+".usersInsert", vo);
	}
	@Override
	public List<UsersVO> usersListAll() throws Exception {
		return session.selectList(namespace+".usersListAll");
	}

	@Override
	public void usersDelete(String uid) throws Exception {
		session.delete(namespace+".usersDelete", uid);
	}

	@Override
	public void usersUpdate(UsersVO vo) throws Exception {
		session.update(namespace+".usersUpdate", vo);
	}

	@Override
	public UsersVO login(String uid, String upw) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("uid", uid);
		map.put("upw", upw);
		return session.selectOne(namespace+".login", map);
	}	
	
	@Override
	public String idDuCheck(String uid) throws Exception {
		return session.selectOne(namespace+".idDuCheck", uid);
	}

}
