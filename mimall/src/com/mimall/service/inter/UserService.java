package com.mimall.service.inter;

import java.util.List;

import com.mimall.vo.Product;
import com.mimall.vo.Users;
import com.page.PageInfo;

public interface UserService {
	public int createUser(Users user)  throws Exception;
	public Users queryUser(Users user)  throws Exception ;
	public int lock(Users user)  throws Exception ;
	public int unlock(Users user)  throws Exception ;
	public int manage(Users user)  throws Exception ;
	public int managed(Users user)  throws Exception ;
	public List<Users> getPageByQuery(Users user, PageInfo pageInfo)  throws Exception ;
	public List<Users> getAllByPage(PageInfo pageInfo);
	public int getTotalRecordSum();
	
}
