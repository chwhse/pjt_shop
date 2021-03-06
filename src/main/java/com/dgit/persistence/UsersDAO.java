package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.UsersVO;

public interface UsersDAO {
	public UsersVO usersSelectByid(String uid) throws Exception;
	public void usersInsert(UsersVO vo) throws Exception;
	public List<UsersVO> usersListAll() throws Exception;
	public void usersDelete(String uid) throws Exception;
	public void usersUpdate(UsersVO vo) throws Exception;
	public UsersVO login(String uid, String upw) throws Exception;
	public String idDuCheck(String uid) throws Exception;
	
}
