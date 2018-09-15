package com.mimall.dao.inter;
import java.util.List;

import com.mimall.vo.*;
public interface ShoppingcartDao {
        List<shoppingcart> getshoppingcartinfo(String uuid) throws Exception;
        public void addintoshoppingcartinfo(String uuid,int pid,int cartcount) throws Exception;
        public void deleteshoppingcartByuuIdandpid(String uuid,int pid) throws Exception;
        public int getcartcountbyuuidandpid(String uuid,int pid) throws Exception;
   	 public void updatecartcountbypidanduuid(String uuid,int pid,int cartcount) throws Exception;
}
