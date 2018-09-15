package com.mimall.dao.inter;

import java.util.List;

import com.mimall.vo.Category;
import com.mimall.vo.Kind;

public interface KindDao {

	//1.添加
	public int addCategory2(Kind category) throws Exception;
	
	//2.根据sql查询 总共有多少条记录
	public int getTotalRecordCount(String sql) throws Exception;
	
	//3.按SQL语句查
	public List<Kind> getPageByQuery(String sql) throws Exception;
	
	//4.查1
	public Kind getCategoryById(Integer cid) throws Exception;
	
	public int updatekind(Kind category2) throws Exception;
	
	public int deletekind(Kind category2) throws Exception;
}
