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
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.catalina.core.ApplicationContext;

import com.google.gson.Gson;
import com.mimall.dao.impl.CategoryDaoImpl;
import com.mimall.dao.inter.CategoryDao;
import com.mimall.service.impl.CategoryServiceImpl;
import com.mimall.service.impl.IndexServiceImpl;
import com.mimall.service.impl.ProductServiceImpl;
import com.mimall.service.inter.CategoryService;
import com.mimall.service.inter.IndexService;
import com.mimall.service.inter.ProductService;
import com.mimall.vo.Category;
import com.mimall.vo.Kind;
import com.mimall.vo.Product;
import com.page.PageInfo;

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
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
			application.setAttribute("basePath", basePath);
			getAllCategory();
			getAllXiaoMIPhone();
			getKindByCid();
			response.sendRedirect("index.jsp");
		}else if("search".equals(action)) {
			searchProduct(request, response);
		}
	
	}
	
	
	private void searchProduct(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String PNAME = request.getParameter("PNAME");
		String target = request.getParameter("target");
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));

		PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
		if(PNAME != null) {
			if(pageInfo == null) {
				pageInfo = new PageInfo(1,24);
				IndexService indexService = new IndexServiceImpl();
				int allCountByName = indexService.getAllCountByName(PNAME);
				pageInfo.setTotalRecordCount(allCountByName);
				System.out.println(">>pageinfo:"+pageInfo);
			}
			session.setAttribute("searchPageInfo", pageInfo);
			IndexService dao = new IndexServiceImpl();
			List<Product> searchList = null;
			try {
				searchList = dao.getPageByQuery(PNAME, pageInfo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			System.out.println(">>搜索列表"+searchList);
			session.setAttribute("searchList", searchList);
			try {
				String basePath = (String) application.getAttribute("basePath");
				response.sendRedirect(basePath+"html/"+target+".jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			System.out.println("搜索不能为空");
		}
	}
	
	
	private void getKindByCid(){
		List<Category> allCategoryList = (List<Category>) application.getAttribute("allCategoryList");
		for(Category category:allCategoryList){
			ArrayList allProductList= new ArrayList();
			ArrayList<Kind> kindlist = (ArrayList<Kind>)( new IndexServiceImpl().getKindByCid(category.getCid()));			
			for(int i=0; i<kindlist.size(); i++){
				ArrayList<Product> productList = (ArrayList<Product>) (new IndexServiceImpl().getProductByKid(kindlist.get(i).getCid()));
				for(Product product:productList){
					if(product.getONSALE()==1){						
						allProductList.add(product);
					}
				}
			}
			application.removeAttribute("category"+category.getCid());		
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
		System.out.println("xiaomiphone>>"+xiaoMiPhone);
		application.setAttribute("xiaoMiPhone", xiaoMiPhone);	
	}
	//获取所有    红米手机    临时用
	private void getAllHongMIPhone(){
		IndexService indexService = new IndexServiceImpl();		
		List<Product> hongMiPhone = indexService.getProductByKindName("小米手机");		
		System.out.println("xiaomiphone>>"+hongMiPhone);
		application.setAttribute("xiaoMiPhone", hongMiPhone);	
	}
	//获取所有    路由器    临时用
	private void getAllRouter(){
		IndexService indexService = new IndexServiceImpl();		
		List<Product> xiaoMiPhone = indexService.getProductByKindName("小米手机");		
		System.out.println("xiaomiphone>>"+xiaoMiPhone);
		application.setAttribute("xiaoMiPhone", xiaoMiPhone);	
	}
	//获取所有    电视    临时用
	private void getTV(){
		IndexService indexService = new IndexServiceImpl();		
		List<Product> xiaoMiPhone = indexService.getProductByKindName("小米手机");		
		System.out.println("xiaomiphone>>"+xiaoMiPhone);
		application.setAttribute("xiaoMiPhone", xiaoMiPhone);	
	}
	//获取所有    空调    临时用
	private void getAir(){
		IndexService indexService = new IndexServiceImpl();		
		List<Product> xiaoMiPhone = indexService.getProductByKindName("小米手机");		
		System.out.println("xiaomiphone>>"+xiaoMiPhone);
		application.setAttribute("xiaoMiPhone", xiaoMiPhone);	
	}

}
