package com.mimall.service.impl;

import com.mimall.dao.impl.UserDaoimpl;
import com.mimall.dao.inter.UserDao;
import com.mimall.service.inter.UserService;
import com.mimall.vo.Users;

public class UserServiceImpl implements UserService {
	
	private UserDao dao;
	
	public UserServiceImpl() {
		dao = new UserDaoimpl();
	}

	@Override
	public int createUser(Users user) throws Exception {
		int count =  dao.addUser(user);
		return count;
		
	}

	@Override
	public Users queryUser(Users user) throws Exception {
		Users newUser = new Users();
		newUser = dao.queryUserByName(user);
		return newUser;
	}

}
