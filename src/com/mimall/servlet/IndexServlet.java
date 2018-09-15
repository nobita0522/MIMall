package com.mimall.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.core.ApplicationContext;

import com.google.gson.Gson;
import com.mimall.dao.impl.CategoryDaoImpl;
import com.mimall.dao.inter.CategoryDao;
import com.mimall.service.impl.CategoryServiceImpl;
import com.mimall.service.impl.IndexServiceImpl;
import com.mimall.service.inter.CategoryService;
import com.mimall.service.inter.IndexService;
import com.mimall.vo.Category;
import com.mimall.vo.Kind;
import com.mimall.vo.Product;

public class IndexServlet extends HttpServlet {
	private ServletContext application;
	
	
	@Override
	public void init() throws ServletException {
		application = getServletContext();	
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		if(action == null ){
			getAllCategory();
			getAllXiaoMIPhone();
			getKindByCid();
			response.sendRedirect("index.jsp");
		}else if(action.equals("getKindByCid")){

		}else if(action.equals("kind")){
			
		}
	
	}
	
	
	private void getKindByCid(){
		List<Category> allCategoryList = (List<Category>) application.getAttribute("allCategoryList");
		for(Category category:allCategoryList){
			ArrayList allProductList= new ArrayList();
			ArrayList<Kind> kindlist = (ArrayList<Kind>) new IndexServiceImpl().getKindByCid(category.getCid());			
			for(int i=0; i<kindlist.size(); i++){
				ArrayList<Product> productList = (ArrayList<Product>) new IndexServiceImpl().getProductByKid(kindlist.get(i).getCid());
				for(Product product:productList){
					if(product.getONSALE()==1){						
						allProductList.add(product);
					}
				}
			}
			application.setAttribute("category"+category.getCid(), allProductList);		
		}
			

	}
	
	
	
	
	private void getAllCategory(){
		CategoryService categoryService = new CategoryServiceImpl();
		List<Category> allCategoryList = null;
		try {
			allCategoryList = categoryService.getAllCategorys();
		} catch (Exception e) {
			e.printStackTrace();
		}
		application.setAttribute("allCategoryList", allCategoryList);	
	}
	
	//获取所有    小米手机    临时用
	private void getAllXiaoMIPhone(){
		IndexService indexService = new IndexServiceImpl();		
		List<Product> xiaoMiPhone = indexService.getProductByKindName("小米手机");		
		application.setAttribute("xiaoMiPhone", xiaoMiPhone);	
	}

}
