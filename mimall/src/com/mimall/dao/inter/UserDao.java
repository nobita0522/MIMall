package com.mimall.dao.inter;


import java.util.List;

import com.mimall.vo.Users;

public interface UserDao {
	
	public int addUser(Users user) throws Exception ;
	public int updateUser(Users user) throws Exception ;
	public Users queryUserById(int id) throws Exception ;
	public Users queryUserByName(Users user) throws Exception ;
	public List<Users> getPageByQuery(String sql) throws Exception ;
	public int getTotalRecordCount(String sql) throws Exception ;
}
