package com.mimall.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mimall.service.impl.KindServiceImpl;
import com.mimall.service.impl.ProductServiceImpl;
import com.mimall.service.impl.UserServiceImpl;
import com.mimall.service.inter.KindService;
import com.mimall.service.inter.UserService;
import com.mimall.util.ProductDictionary;
import com.mimall.vo.Kind;
import com.mimall.vo.Product;
import com.mimall.vo.Users;
import com.page.PageInfo;

public class UserServlet extends HttpServlet {
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>");
		String action = request.getParameter("action");
		if("getAllByPage".equals(action)) {
			System.out.println("action>>"+action);
			this.getAllUsers(request, response);
		}else if("userLock".equals(action)) {
			
		}else if("userUnlock".equals(action)) {
			
		}else if("userManage".equals(action)) {
			
		}else if("userManaged".equals(action)) {
			
		}
	}
	
	
	private void getAllUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String target = request.getParameter("target");
		
		// 一.填充数据
		String requestPage = request.getParameter("requestPage");
		System.out.println(requestPage);
		// 二.调用业务逻辑
		PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));

		// 查询总共有多少条记录
		UserService service = new UserServiceImpl();

		int totalRecordSum;
		try {
			totalRecordSum = service.getTotalRecordSum();
			
			pageInfo.setTotalRecordCount(totalRecordSum);

			UserService service2 = new UserServiceImpl();

			List<Users> list = service2.getAllByPage(pageInfo);
			System.out.println(">>product总页数"+pageInfo.getTotalPageCount());
			target = "/WEB-INF/jsp/admin/Users/" + target + ".jsp";
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
	
	
	public void userLock(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		// 一.填充数据
		String pid = request.getParameter("uuid");

		// 二.调用业务逻辑
		UserServiceImpl service = new UserServiceImpl();

		/*try {
			service.productUp(Integer.parseInt(pid));
			request.setAttribute("msg", "编号为" + pid +"的商品上架成功!");

			this.getPageByQuery(request, response);
		} catch (Exception e) {
			target = "/WEN-INF/msg.jsp";
			e.printStackTrace();
			request.getRequestDispatcher(target).forward(request, response);
		}*/

		

	}
	
	public void productDown(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String target = "";
		// 一.填充数据
		String pid = request.getParameter("pid");

		// 二.调用业务逻辑
		/*ProductServiceImpl service = new ProductServiceImpl();

		try {
			service.productDown(Integer.parseInt(pid));
			request.setAttribute("msg", "编号为" + pid +"的商品下架成功!");

			this.getPageByQuery(request, response);
		} catch (Exception e) {
			target = "/WEN-INF/msg.jsp";
			e.printStackTrace();
			request.getRequestDispatcher(target).forward(request, response);
		}
*/
		

	}
	

}
