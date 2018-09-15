package com.mimall.service.inter;

import java.util.List;

import com.mimall.vo.Category;
import com.mimall.vo.Kind;
import com.page.PageInfo;

public interface KindService {

	//添加
	public int addCategory2(Kind category) throws Exception;
	//查询一级商品种类下的二级商品种类
	public int getCategory2SumByCategory1(int cid) throws Exception;
	public List<Kind> getAllCategory2ByCategory1(int cid) throws Exception;
	//查1
	public Kind getCategoryById(int cid) throws Exception;

	//根据商品种类名字得到Category2
	public Kind getCategoryByName(String cname) throws Exception;
	//查询指定二级种类的父亲一级种类的cid  
	//形参: cid 二级种类的cid
	//返回值: 所属一级种类的cid
	public int getParentCategoryById(int cid) throws Exception;
	
	public List<Kind> getAllByPage(PageInfo pageInfo)throws Exception;
	public int getTotalRecordCount() throws Exception;

	public List<Kind> getPageByQuery(Kind category2, PageInfo pageInfo)throws Exception;
	
	
	public int updatekind(Kind category2) throws Exception;
	public int deletekindById(String kid) throws Exception;
}
