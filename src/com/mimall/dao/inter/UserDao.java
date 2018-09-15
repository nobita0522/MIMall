package com.mimall.dao.inter;

import com.mimall.vo.Users;

public interface UserDao {
	
	public int addUser(Users user) throws Exception ;
	public int updateUser(Users user) throws Exception ;
	public int deleteUser(Users user) throws Exception ;
	public Users queryUserById(int id) throws Exception ;
	public Users queryUserByName(Users user) throws Exception ;
}
