package com.mimall.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.page.PageInfo;
import com.mimall.service.impl.KindServiceImpl;
import com.mimall.service.impl.CategoryServiceImpl;
import com.mimall.service.impl.ProductServiceImpl;
import com.mimall.service.inter.KindService;
import com.mimall.service.inter.KindService;
import com.mimall.service.inter.CategoryService;
import com.mimall.service.inter.ProductService;
import com.mimall.util.ProductDictionary;
import com.mimall.vo.Category;
import com.mimall.vo.Kind;
import com.mimall.vo.Product;

public class ProductServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 分发请求
		String action = request.getParameter("action");

		if ("getAllCategoryForAddProduct".equals(action)) {
			this.getAllCategoryForAddProduct(request, response);
		}else if("getCategory2ByCategory1ForAddProduct".equals(action)){
			this.getCategory2ByCategory1ForAddProduct(request,response);
		}else if("add".equals(action)){
			this.add(request,response);
		}else if ("getAllByPage".equals(action)) {
			this.getAllByPage(request, response);
		}else if ("delete".equals(action)) {
			this.delete(request, response);
		}else if ("getPageByQuery".equals(action)) {
			this.getPageByQuery(request, response);
		}else if ("getOneForUpdate".equals(action)) {
			this.getOneForUpdate(request, response);
		}else if ("update".equals(action)) {
			this.update(request, response);
		}else if ("productUp".equals(action)) {
			this.productUp(request, response);
		}else if ("productDown".equals(action)) {
			this.productDown(request, response);
		}else if ("getOneForUpload".equals(action)) {
			this.getOneForUpload(request, response);
		}else if ("uploadImage".equals(action)) {
			this.uploadImage(request, response);
		}else if("details".equals(action)){
			this.showDetails(request, response);
		}
		
		

	}
	
	public void getAllCategoryForAddProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		
		CategoryService service = new CategoryServiceImpl();
		
		try {
			List<Category> list = service.getAllCategorys();
			
			request.setAttribute("list", list);
			
			target = "/WEB-INF/jsp/admin/product/addProduct.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", "查询一级商品种类失败!");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
		}
		//3.转发视图
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void getCategory2ByCategory1ForAddProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//设置服务器响应的数据类型  为application/json 
		response.setContentType("application/json");
		String target = "";
		
		//1.填充数据
		String category1Id = request.getParameter("category1Id");
		
		//2.调用业务逻辑
		
		KindService service = new KindServiceImpl();
		
		//3.输出
		PrintWriter out = response.getWriter();
		
		try {
			List<Kind> list = service.getAllCategory2ByCategory1(Integer.parseInt(category1Id));
			
			Gson gson = new Gson();
			
			String category2ListJson = gson.toJson(list);
			
			out.println(category2ListJson);
			
			out.flush();
			
			out.close();
		
		} catch (Exception e) {
			request.setAttribute("msg", "查询二级商品种类失败!");
			e.printStackTrace();
			target = "/WEB-INF/msg.jsp";
			//3.转发视图
			request.getRequestDispatcher(target).forward(request, response);
		}
		
	}
	
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";

		String FACTORYID = request.getParameter("FACTORYID");
		String PNAME = request.getParameter("PNAME");
		String PDESC = request.getParameter("PDESC");
		String INVENTORY = request.getParameter("INVENTORY");
		String ORIGINALPRICE = request.getParameter("ORIGINALPRICE");
		String NEWPRICE = request.getParameter("NEWPRICE");
		String PCOLOR = request.getParameter("PCOLOR");
		String VERSION = request.getParameter("VERSION");
		String ONSALE = request.getParameter("ONSALE");
		String KID = request.getParameter("KID");
		
			Product product = new Product();		
			product.setFACTORYID(FACTORYID);
			product.setPNAME(PNAME);
			product.setPDESC(PDESC);
			product.setPCOLOR(PCOLOR);
			product.setVERSION(VERSION);
			try {
				product.setINVENTORY(Integer.parseInt(INVENTORY));
				product.setORIGINALPRICE(Double.parseDouble(ORIGINALPRICE));
				product.setNEWPRICE(Double.parseDouble(NEWPRICE));
				product.setKID(Integer.parseInt(KID));
			} catch (NumberFormatException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				request.setAttribute("msg", "添加商品失败，格式错误");
			}
		//二.调用业务逻辑
		
		ProductService service = new ProductServiceImpl();
		try {
			service.addProduct(product);
			request.setAttribute("msg", "添加商品成功");
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
		}
		//三.转发视图
		target = "/WEB-INF/msg.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(target);
		
		rd.forward(request, response);
	}

	public void getAllByPage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String target = request.getParameter("target");
		
		// 一.填充数据
		String requestPage = request.getParameter("requestPage");
		System.out.println(requestPage);
		// 二.调用业务逻辑
		PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));

		// 查询总共有多少条记录
		ProductServiceImpl service1 = new ProductServiceImpl();

		int totalRecordSum;
		try {
			totalRecordSum = service1.getTotalRecordSum();
			
			pageInfo.setTotalRecordCount(totalRecordSum);

			ProductServiceImpl service2 = new ProductServiceImpl();

			List<Product> list = service2.getAllByPage(pageInfo);
			System.out.println(">>product总页数"+pageInfo.getTotalPageCount());
			target = "/WEB-INF/jsp/admin/product/" + target + ".jsp";
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
		}
		
		// 三.转发视图
	
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		// 一.填充数据
		String pid = request.getParameter("pid");
		System.out.println("********look here**********");
		// 二.调用业务逻辑
		System.out.println(pid);
		ProductServiceImpl service = new ProductServiceImpl();

		try {
			service.deleteProductById(pid);
			request.setAttribute("msg", "删除成功！");
			this.getPageByQuery(request, response);	
		} catch (Exception e) {
			request.setAttribute("msg", "删除失败！");
			target = "/WEB-INF/msg.jsp";
			e.printStackTrace();
			request.getRequestDispatcher(target).forward(request, response);
		}

		
		

	}
	
	public void getPageByQuery(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		
		String target = request.getParameter("target");
		// 一.填充数据
		String requestPage = request.getParameter("requestPage");

		System.out.println("requestPage=" + requestPage);
		if (requestPage == null) {
			requestPage = "1";
		}

		try {
			String searchCondition = request.getParameter("searchCondition").trim();
			System.out.println("searchCondition=" + searchCondition);
			// 二.调用业务逻辑
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));

			//按查询条件查询 计算查询结果总共有多少条记录
			ProductServiceImpl service1 = new ProductServiceImpl();

			Product product = new Product();
			
			//如果是按商品种类名称查询 需要把传过来的商品种类名称转换成Kid
			KindService service = new KindServiceImpl();
			
			Kind kind = service.getCategoryByName(searchCondition);
			if (searchCondition != null && !searchCondition.equals("")) {
				product.setPNAME(searchCondition);
				product.setPDESC(searchCondition);
				
				//如果是上下架页面的搜索  就按 上下架状态查询   而不是按店铺名称查询
				//其他页面(比如上传图片和管理商品的搜索框是按 店铺名称查询的)
				if("productMainUpDown".equals(target)){
					System.out.println("************look here***************");
					System.out.println(searchCondition);
					Integer onsale = ProductDictionary.onsaleStrToInt(searchCondition);
					product.setONSALE(onsale);
				}
				
				if(kind!=null){
					System.out.println("ProductServlet>>getPageByQuery>>kind is null:"+(kind==null));
					product.setKID(kind.getCid());
				}
				
			}

			int totalRecordSum = service1
					.getTotalRecordSumBySearchCondition(product);
			pageInfo.setTotalRecordCount(totalRecordSum);

			ProductServiceImpl service2 = new ProductServiceImpl();
			List<Product> list = service2.getPageByQuery(product, pageInfo);

			// 三.转发视图
			target = "/WEB-INF/jsp/admin/product/" + target + ".jsp";
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("searchCondition", searchCondition);
		}catch (Exception e) {
			
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
		}
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void getOneForUpdate(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String target = "";
		
		// 一.填充数据
		String pid = request.getParameter("pid");
		String requestPage = request.getParameter("requestPage");
		String searchCondition = request.getParameter("searchCondition");
		// 二.调用业务逻辑
		try {
			ProductServiceImpl service = new ProductServiceImpl();
			Product product = service.getProductById(pid);

			int kid = product.getKID();

			KindService categoryService2 = new KindServiceImpl();

			int parentCid = categoryService2.getParentCategoryById(kid);

			// 查询出所有的一级商品种类
			CategoryService categoryService = new CategoryServiceImpl();

			List<Category> categoryList = categoryService.getAllCategorys();
			// 三.转发视图
			target = "/WEB-INF/jsp/admin/product/updateProduct.jsp";
			request.setAttribute("product", product);
			request.setAttribute("categoryList", categoryList);
			request.setAttribute("parentCid", parentCid);
			request.setAttribute("target", request.getParameter("target"));
			request.setAttribute("requestPage", requestPage);
			request.setAttribute("searchCondition", searchCondition);
		} catch (Exception e) {
			
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
		}

		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String target = "";
		// 一.填充数据(接收数据)
		String PID = request.getParameter("PID");
		System.out.println("ProductServlet>>update>>PID:"+PID);
		String FACTORYID = request.getParameter("FACTORYID");
		String PNAME = request.getParameter("PNAME");
		String PDESC = request.getParameter("PDESC");
		String INVENTORY = request.getParameter("INVENTORY");
		String ORIGINALPRICE = request.getParameter("ORIGINALPRICE");
		String NEWPRICE = request.getParameter("NEWPRICE");
		String PCOLOR = request.getParameter("PCOLOR");
		String VERSION = request.getParameter("VERSION");
		String ONSALE = request.getParameter("ONSALE");
		String KID = request.getParameter("KID");
		

		// 二.调用业务逻辑
		Product product = null;
		try {
			product = new ProductServiceImpl().getProductById(PID);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}		
		product.setPID(Integer.parseInt(PID));
		product.setFACTORYID(FACTORYID);
		product.setPNAME(PNAME);
		product.setPDESC(PDESC);
		product.setINVENTORY(Integer.parseInt(INVENTORY));
		product.setORIGINALPRICE(Double.parseDouble(ORIGINALPRICE));
		product.setNEWPRICE(Double.parseDouble(NEWPRICE));
		product.setPCOLOR(PCOLOR);
		product.setVERSION(VERSION);
		product.setONSALE(Integer.parseInt(ONSALE));
		product.setKID(Integer.parseInt(KID));

		ProductService service = new ProductServiceImpl();
		try {
			service.updateProduct(product);
			request.setAttribute("msg", "修改成功！");
			// 三.转发视图
			this.getPageByQuery(request, response);
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", e.getMessage());
			e.printStackTrace();
		}
		
		
	}
	
	public void productUp(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		// 一.填充数据
		String pid = request.getParameter("pid");

		// 二.调用业务逻辑
		ProductServiceImpl service = new ProductServiceImpl();

		try {
			service.productUp(Integer.parseInt(pid));
			request.setAttribute("msg", "编号为" + pid +"的商品上架成功!");

			this.getPageByQuery(request, response);
		} catch (Exception e) {
			target = "/WEN-INF/msg.jsp";
			e.printStackTrace();
			request.getRequestDispatcher(target).forward(request, response);
		}

		

	}
	
	public void productDown(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		// 一.填充数据
		String pid = request.getParameter("pid");

		// 二.调用业务逻辑
		ProductServiceImpl service = new ProductServiceImpl();

		try {
			service.productDown(Integer.parseInt(pid));
			request.setAttribute("msg", "编号为" + pid +"的商品下架成功!");

			this.getPageByQuery(request, response);
		} catch (Exception e) {
			target = "/WEN-INF/msg.jsp";
			e.printStackTrace();
			request.getRequestDispatcher(target).forward(request, response);
		}

		

	}
	
	public void getOneForUpload(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String target = "";
		// 一.填充数据
		String pid = request.getParameter("pid");
		String requestPage = request.getParameter("requestPage");
		String searchCondition = request.getParameter("searchCondition");
		// 二.调用业务逻辑
		try {
			ProductServiceImpl service = new ProductServiceImpl();
			Product product = service.getProductById(pid);

			// 三.转发视图
			target = "/WEB-INF/jsp/admin/product/uploadProductImage.jsp";
			request.setAttribute("product", product);
			request.setAttribute("target", request.getParameter("target"));
			request.setAttribute("requestPage", requestPage);
			request.setAttribute("searchCondition", searchCondition);
		} catch (Exception e) {
			
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", "查询单一商品信息失败");
			e.printStackTrace();
		}

		request.getRequestDispatcher(target).forward(request, response);
	}
	
	public void uploadImage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String target = "/WEB-INF/msg.jsp";

		// 一.填充数据

		// 二.调用业务逻辑
		ServletConfig servletConfig = this.getServletConfig();
		String productListUploadPath = servletConfig
				.getInitParameter("productImageUploadPath");
		
		if(productListUploadPath==null||productListUploadPath.trim().equals("")){
			request.setAttribute("msg", "系统未指定上传路径");
			
		}else{
			ProductServiceImpl service = new ProductServiceImpl();
			try {
				service.upload(request, productListUploadPath);
				
				request.setAttribute("msg", "上传图片成功!");
			} catch (Exception e) {
				
				request.setAttribute("msg", e.getMessage());
				e.printStackTrace();
			}
		}

		

		// 三.转发视图
		
		request.getRequestDispatcher(target).forward(request, response);
	}
	
	
	private void showDetails(HttpServletRequest request, HttpServletResponse response){
		String pid = request.getParameter("product");
		String target = "/html/details.jsp";
		ProductService productService = new ProductServiceImpl();
		
		try {
			Product productById = productService.getProductById(pid);
			ArrayList<Product> allByName = (ArrayList<Product>)( new ProductServiceImpl().getAllByName(productById.getPNAME()));
			request.setAttribute("allByName", allByName);
			System.out.println(">>"+productById);
			request.getRequestDispatcher(target).forward(request, response);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
