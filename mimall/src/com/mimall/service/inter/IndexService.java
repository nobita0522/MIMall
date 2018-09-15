package com.mimall.service.inter;

import java.util.List;

import com.mimall.vo.Kind;
import com.mimall.vo.Product;
import com.page.PageInfo;

public interface IndexService {
	
	//通过Category ID 获取Kind
	public List<Kind> getKindByCid(Integer Cid);
	
	//通过Kind ID 获取Product
	public List<Product> getProductByKid(Integer Kid);
	
	//通过Name 获取Kind
	public List<Product> getProductByKindName(String name);
	
	//通过Name 获取product
	public List<Product> getProductByName(String name);
	
	public List<Product> getPageByQuery(String name , PageInfo pageInfo);
	
	public int getAllCountByName(String name);

}
