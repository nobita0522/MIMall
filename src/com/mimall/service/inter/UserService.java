package com.mimall.service.inter;

import com.mimall.vo.Users;

public interface UserService {
	public int createUser(Users user)  throws Exception;
	public Users queryUser(Users user)  throws Exception ;
	
}
