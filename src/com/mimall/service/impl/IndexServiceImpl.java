package com.mimall.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.mimall.dao.impl.KindDaoImpl;
import com.mimall.dao.impl.ProductDaoImpl;
import com.mimall.dao.inter.CategoryDao;
import com.mimall.dao.inter.KindDao;
import com.mimall.dao.inter.ProductDao;
import com.mimall.vo.Category;
import com.mimall.vo.Kind;
import com.mimall.vo.Product;
import com.page.PageInfo;

public class IndexServiceImpl implements com.mimall.service.inter.IndexService {
	private CategoryDao categoryDao;
	private KindDao kindDao;
	private ProductDao productDao;

	@Override
	public List<Kind> getKindByCid(Integer Cid) {
		kindDao = new KindDaoImpl();	
		List<Kind> list = new ArrayList<Kind>();
		String sql = "SELECT * FROM KIND WHERE CID = "+Cid+"ORDER BY KID";
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPerPageRecordCount(24);
		try {
			list = kindDao.getPageByQuery(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return list;
	}

	@Override
	public List<Product> getProductByKid(Integer Kid) {
		productDao = new ProductDaoImpl();	
		List<Product> list = new ArrayList<Product>();
		String sql = "SELECT * FROM PRODUCT WHERE KID = "+Kid+"ORDER BY PID DESC";
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPerPageRecordCount(24);
		try {
			list = productDao.getPageByQuery(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return list;
	}

	@Override
	public List<Product> getProductByKindName(String name) {
		productDao = new ProductDaoImpl();	
		List<Product> list = new ArrayList<Product>();
		String sql = "SELECT * FROM PRODUCT WHERE KID IN (SELECT KID FROM KIND WHERE KNAME LIKE '%"+name+"%  ORDER BY PID DESC')";
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPerPageRecordCount(24);
		try {
			list = productDao.getPageByQuery(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return list;
	
	}

	@Override
	public List<Product> getProductByName(String name) {
		productDao = new ProductDaoImpl();	
		List<Product> list = new ArrayList<Product>();
		String sql = "SELECT * FROM PRODUCT WHERE PNAME LIKE '%"+name+"% ORDER BY PID DESC')";
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPerPageRecordCount(24);
		try {
			list = productDao.getPageByQuery(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
		return list;
	}

}
