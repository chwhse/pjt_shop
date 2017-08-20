package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.UsersVO;
import com.dgit.persistence.UsersDAO;

@Service
public class UsersServiceImpl implements UsersService {
	
	@Autowired
	private UsersDAO dao;
	
	@Override
	public UsersVO usersSelectByid(String uid) throws Exception {
		return dao.usersSelectByid(uid);
	}

	@Override
	public void usersInsert(UsersVO vo) throws Exception {
		dao.usersInsert(vo);
		
	}
	@Override
	public List<UsersVO> usersListAll() throws Exception {
		return dao.usersListAll();
	}

	@Override
	public void usersDelete(String uid) throws Exception {
		dao.usersDelete(uid);
	}

	@Override
	public void usersUpdate(UsersVO vo) throws Exception {
		dao.usersUpdate(vo);
	}

	@Override
	public UsersVO login(String uid, String upw) throws Exception {
		return dao.login(uid, upw);
	}
	
	@Override
	public String idDuCheck(String uid) throws Exception {
		return dao.idDuCheck(uid);
	}

}
