package com.mimall.service.impl;

import java.util.List;

import com.mimall.dao.impl.ShoppingcartDaoImpl;
import com.mimall.dao.inter.ShoppingcartDao;
import com.mimall.service.inter.ShoppingcartService;
import com.mimall.vo.shoppingcart;

public class ShoppingcartServiceImpl implements ShoppingcartService{
		private ShoppingcartDao info;
	public ShoppingcartServiceImpl() {
		 info=new ShoppingcartDaoImpl();
	}	
	public List<shoppingcart> getshoppingcartinfo(String uuid) throws Exception{
		List<shoppingcart> cart=info.getshoppingcartinfo(uuid);
		
		return cart;
	}
	
	
	public void addintoshoppingcartinfo(String uuid,int pid,int cartcount) throws Exception{
		info.addintoshoppingcartinfo(uuid,pid,cartcount);
	}
	
	 public void deleteshoppingcartByuuIdandpid(String uuid,int pid) throws Exception{
		 info.deleteshoppingcartByuuIdandpid(uuid,pid);
	 }
	 
	 public int getcartcountbypidanduuid(String uuid,int pid) throws Exception{
		 int count=info.getcartcountbyuuidandpid(uuid, pid);
		 return count;
	 }
	 
	 public void updatecartcountbypidanduuid(String uuid,int pid,int cartcount) throws Exception{
		 info.updatecartcountbypidanduuid(uuid, pid, cartcount);
	 }
}
