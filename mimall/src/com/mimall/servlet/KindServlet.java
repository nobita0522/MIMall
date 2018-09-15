package com.mimall.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mimall.service.impl.KindServiceImpl;
import com.mimall.service.impl.CategoryServiceImpl;
import com.mimall.service.inter.KindService;
import com.mimall.service.inter.CategoryService;
import com.mimall.vo.Category;
import com.mimall.vo.Kind;
import com.page.PageInfo;

public class KindServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//分发请求
		String action = request.getParameter("action");
		
		if("add".equals(action)){
			this.add(request, response);
		}else if("getAll".equals(action)){	
			this.getAll(request,response);
		}else if("delete".equals(action)){	
			this.delete(request,response);
		}else if("getOneForUpdate".equals(action)){	
			this.getOneForUpdate(request,response);
		}else if("update".equals(action)){	
			this.update(request,response);
		}else if("getAllByPage".equals(action)){	
			
			this.getAllByPage(request,response);
		}else if("getPageByQuery".equals(action)){	
			
			this.getPageByQuery(request,response);
		}else if(action.equals("getAllCategoryForAddKind")){
			this.getAllCategoryForAddKind(request, response);
		}
		

	}
	


	public void getAllCategoryForAddKind(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		//1.填充数据
		//2.调用业务逻辑
		CategoryService service = new CategoryServiceImpl();
		
		try {
			List<Category> list = service.getAllCategorys();
			
			request.setAttribute("list", list);
			
			target = "/WEB-INF/jsp/admin/kind/addKind.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", "查询一级商品种类失败!!");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void getMenuForFirstPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		//1.填充数据
		//2.调用业务逻辑
		CategoryService service = new CategoryServiceImpl();
		
		try {
			List<Category> list = service.getAllCategorys();
			
			request.setAttribute("list", list);
			
			target = "/WEB-INF/jsp/user/welcome.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", "查询一级商品种类失败!");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	
	
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		//一.填充数据
		String cname = request.getParameter("cname");
		String cdesc = request.getParameter("cdesc");
		String fid	= request.getParameter("fid");
		
		
		//二.调用业务逻辑
		Kind category = new Kind();
		category.setCname(cname);
		category.setCdesc(cdesc);
		category.setFid(Integer.parseInt(fid));
		
		KindService service = new KindServiceImpl();
		try {
			service.addCategory2(category);
			request.setAttribute("msg", "添加二级商品种类成功");
		} catch (Exception e) {
			request.setAttribute("msg", "添加二级商品种类失败");
			e.printStackTrace();
		}
		//三.转发视图
		target = "/WEB-INF/msg.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(target);
		
		rd.forward(request, response);
	}
	
	
	public void getAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String target = "";
		//1.填充数据
		//2.调用业务逻辑
		CategoryService service = new CategoryServiceImpl();
		
		try {
			List<Category> list = service.getAllCategorys();
			
			request.setAttribute("list", list);
			
			target = "/WEB-INF/jsp/admin/category/categoryMain.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", "閺屻儴顕楁稉锟界痪褍鏅㈤崫浣侯潚缁銇戠拹锟�!");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		//1.填充数据
		String kid = request.getParameter("cid");
		
		
		try {
			
			//先查询有没有对应的二级商品种类 如果有 不能删除
			KindService service = new KindServiceImpl();
			
			int count = service.getCategory2SumByCategory1(Integer.parseInt(kid));
			
			if(count>0){
				request.setAttribute("msg", "删除失败");
				request.setAttribute("msgDetail", "已找到子记录 请先删除子种类 再继续删除");
			}else{
				//2.调用业务逻辑
				KindService service2 = new KindServiceImpl();
				
				service2.deletekindById(kid);
				request.setAttribute("msg", "删除成功!!");
			}
		
			this.getPageByQuery(request, response);
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			target = "/WEB-INF/msg.jsp";
			e.printStackTrace();
			//3.转发视图
			request.getRequestDispatcher(target).forward(request, response);
		}
		
	}
	
	public void getOneForUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		//1.填充数据
		String cid = request.getParameter("cid");
		//2.调用业务逻辑
		KindService service = new KindServiceImpl();
		
		try {
			Kind category2 = service.getCategoryById(Integer.parseInt(cid));
			
			request.setAttribute("category2", category2);
			target = "/WEB-INF/jsp/admin/kind/updatekind.jsp";
		} catch (Exception e) {
			
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target= "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String target = "";
		//1.填充数据
		String kid = request.getParameter("kid");
		String cname = request.getParameter("cname");
		String cdesc = request.getParameter("cdesc");
		
		Kind category2 = new Kind();
		category2.setCid(Integer.parseInt(kid));
		category2.setCname(cname);
		category2.setCdesc(cdesc);
		//2.调用业务逻辑
		KindService service = new KindServiceImpl();
		try {
			service.updatekind(category2);
			request.setAttribute("msg", "修改一级商品种类成功!");
			this.getPageByQuery(request, response);
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
			//3.转发视图
			request.getRequestDispatcher(target).forward(request,response);
		}
		
	}
	
	public void getAllByPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
	//1.填充数据
		String requestPage = request.getParameter("requestPage");
		
		try {
			
			//查询一共多少条记录
			KindService service = new KindServiceImpl();
			
			int totalRecordCount = service.getTotalRecordCount();
			
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
			pageInfo.setTotalRecordCount(totalRecordCount);
			
			//2.调用业务逻辑
			KindService service2 = new KindServiceImpl();
			
			List<Kind> list = service2.getAllByPage(pageInfo);
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/admin/kind/kindMain.jsp";
		
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
		
	}
	
	public void getPageByQuery(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Category c=new Category();
		
		String target = "";
		//1.填充数据
		String searchCondition = request.getParameter("searchCondition");
		
	CategoryService category1=new CategoryServiceImpl();
	try {
		c=category1.getcategoryidbyname(searchCondition );
		
		
	} catch (Exception e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
		String requestPage = request.getParameter("requestPage");
		if(requestPage==null){
			
			requestPage = "1";
		}
		
		Kind category2 = new Kind();
		
		if(searchCondition!=null&&!searchCondition.equals("")){
		    category2.setCname(searchCondition);
			category2.setCdesc(searchCondition);
		
			if(c!=null){
				category2.setCid(c.getCid());
			}
			
		}
		
		try {
			
			
			//按照条件查询一共多少条记录
			KindService service = new KindServiceImpl();
			
			int totalRecordCount = service.getTotalRecordCount();
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
			pageInfo.setTotalRecordCount(totalRecordCount);
			//2.调用业务逻辑
			KindService service2 = new KindServiceImpl();
           
			List<Kind> list = service2.getPageByQuery(category2, pageInfo);
			
			
			request.setAttribute("list", list);
			request.setAttribute("searchCondition", searchCondition);
			request.setAttribute("pageInfo", pageInfo);
			target = "/WEB-INF/jsp/admin/kind/kindMain.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
		
	}
	
	

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}
	
	
	

}
