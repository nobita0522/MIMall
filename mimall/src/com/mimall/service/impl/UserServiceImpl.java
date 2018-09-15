package com.mimall.service.impl;

import java.util.List;

import com.mimall.dao.impl.UserDaoimpl;
import com.mimall.dao.inter.UserDao;
import com.mimall.service.inter.UserService;
import com.mimall.vo.Product;
import com.mimall.vo.Users;
import com.page.PageInfo;

public class UserServiceImpl implements UserService {
	
	private UserDao dao;
	
	public UserServiceImpl() {
		dao = new UserDaoimpl();
	}

	/**
	 * 创建用户
	 */
	@Override
	public int createUser(Users user) throws Exception {
		int count =  dao.addUser(user);
		return count;	
	}
	
	/**
	 * 查询用户
	 */
	@Override
	public Users queryUser(Users user) throws Exception {
		Users newUser = new Users();
		newUser = dao.queryUserByName(user);
		return newUser;
	}

	

	@Override
	public List<Users> getPageByQuery(Users user, PageInfo pageInfo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Users> getAllByPage(PageInfo pageInfo) {
		String sql = "select * from (select u.*,rownum r from users u order by uuid asc) where r>="
				+ pageInfo.getBegin() + " and r<=" + pageInfo.getEnd();
		System.out.println(sql);
		List<Users> list = null;

		try {
			list = dao.getPageByQuery(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int getTotalRecordSum() {
		String sql = "select count(*) as totalRecordSum from users";
		int totalRecordSum = 0;

		try {
			totalRecordSum = dao.getTotalRecordCount(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return totalRecordSum;
	}

	@Override
	public int lock(Users user) throws Exception {
		
	
		
		return 0;
	}

	@Override
	public int unlock(Users user) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int manage(Users user) throws Exception {
		return 0;
	}

	@Override
	public int managed(Users user) throws Exception {
		return 0;
	}

}
