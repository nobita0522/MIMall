package com.mimall.service.inter;

import java.util.List;
import com.mimall.vo.*;
public interface ShoppingcartService {

	public List<shoppingcart> getshoppingcartinfo(String uuid) throws Exception;
	public void addintoshoppingcartinfo(String uuid,int pid,int cartcount) throws Exception;
	
    public void deleteshoppingcartByuuIdandpid(String uuid,int pid) throws Exception;
    
    public int getcartcountbypidanduuid(String uuid,int pid) throws Exception;
    
    public void updatecartcountbypidanduuid(String uuid,int pid,int cartcount) throws Exception;
}
