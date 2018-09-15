package com.mimall.service.impl;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.jdt.internal.compiler.batch.Main;

import com.mimall.dao.impl.CategoryDaoImpl;
import com.mimall.dao.inter.CategoryDao;
import com.mimall.vo.Category;
import com.page.PageInfo;



import com.mimall.service.inter.CategoryService;

public class CategoryServiceImpl implements CategoryService {

	private CategoryDao dao;

	public CategoryServiceImpl() {
		dao = new CategoryDaoImpl();
	}

	@Override
	public int addCategory(Category category) throws Exception {

		int count = dao.addCategory(category);
		return count;
	}

	@Override
	public List<Category> getAllCategorys() throws Exception {
		List<Category> list = null;

		String sql = "select * from category  order by cid asc";
		list = dao.getPageByQuery(sql);
		return list;
	}

	// 删除单个一级商品种类
	public int deleteCategoryById(String cid) throws Exception {
         
		Category category = new Category();
		category.setCid(Integer.parseInt(cid));
		 System.out.println(category.getCid()+"nihao");
		int count = dao.deleteCategory(category);
		
		return count;
	}

	// 查1
	public Category getCategoryById(int cid) throws Exception {

		Category category = null;
		
		category = dao.getCategoryById(cid);
		return category;
	}

	// 修改
	public int updateCategory(Category category) throws Exception {
		int count = dao.updateCategory(category);
		return count;
	}

	// 查询所有后分页
	public List<Category> getAllByPage(PageInfo pageInfo) throws Exception {

		String sql = "select * from (select c.*,rownum r from category c  order by cid asc) where r>="
				+ pageInfo.getBegin() + " and r<=" + pageInfo.getEnd();
		System.out.println(sql);

		List<Category> list = null;

		list = dao.getPageByQuery(sql);
		return list;
	}

	

	// 查询总共有多少条记录
	public int getTotalRecordCount() throws Exception {
		int totalRecordCount = -1;

		String sql = "select count(*) from category";
		totalRecordCount = dao.getTotalRecordCount(sql);
		return totalRecordCount;
	}

	// 根据条件查询 然后分页
	public List<Category> getPageByQuery(Category category, PageInfo pageInfo)
			throws Exception {

		List<Category> list = null;
		

		// String sql =
		// "select * from (select c.*,rownum r from category c where 1=1 and cname='商品种类名称' or cdesc like '%111%') where r>=11 and r<=15"

		StringBuffer sb = new StringBuffer(
				"select * from (select c.*,rownum r from category c where 1=1");

		String cname = category.getCname();
		String cdesc = category.getCdesc();

		if (cname != null && !cname.trim().equals("")) {

			sb.append(" and cname='");
			sb.append(cname);
			sb.append("'");
		}

		if (cdesc != null && !cdesc.trim().equals("")) {
			sb.append(" or cdesc like '%");
			sb.append(cdesc);
			sb.append("%'");
		}
		
		sb.append(" order by cid asc) where r>=");
		sb.append(pageInfo.getBegin());
		sb.append(" and r<=");
		sb.append(pageInfo.getEnd());
		
		String sql = sb.toString();
		System.out.println(sql);

		list = dao.getPageByQuery(sql);
		return list;
	}
	
	
	
	//根据条件查询 总共有多少条记录
	public int getTotalRecordCount(Category category) throws Exception{
		
		
		int totalRecordCount = -1;

		StringBuffer sb = new StringBuffer("select count(*) from category where 1=1");
		
		String cname = category.getCname();
		String cdesc = category.getCdesc();

		if (cname != null && !cname.trim().equals("")) {

			sb.append(" and cname='");
			sb.append(cname);
			sb.append("'");
		}

		if (cdesc != null && !cdesc.trim().equals("")) {
			sb.append(" or cdesc like '%");
			sb.append(cdesc);
			sb.append("%'");
		}
		
		String sql = sb.toString();
		totalRecordCount = dao.getTotalRecordCount(sql);
		return totalRecordCount;
	}

	
	public Category getcategoryidbyname(String searchname){
	
		
	
		String sql = "select *from category where cname='"+searchname+"'";
		System.out.println(sql);
		Category category=new Category();
		CategoryDao dao=new CategoryDaoImpl();
		try {
			category=dao.getcategoryidbyname(sql);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return category;
	}

	
	
	   
	
	
}
