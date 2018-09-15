package com.mimall.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.mimall.service.impl.KindServiceImpl;
import com.mimall.service.impl.UserServiceImpl;
import com.mimall.service.inter.KindService;
import com.mimall.service.inter.UserService;
import com.mimall.vo.Kind;
import com.mimall.vo.Users;

public class LoginServlet extends HttpServlet {
	
	private HttpSession session;
	
	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
		
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession(); 
		request.setCharacterEncoding("utf-8");
		
		String action = request.getParameter("action");
		String username = request.getParameter("username");
		String password = request.getParameter("password");	
		String target = request.getParameter("target");	
		String from = request.getParameter("from");	
		System.out.println("action>>"+action+"；u>>"+username+"；p>>"+password+"；target>>"+target+"；from>>"+from);
					

			
		if(action == null && target == null){
			target="phonelogin";						
			target="/html/"+target+".jsp";			
			request.getRequestDispatcher(target).forward(request, response);
		}else if(action.equals("go")){
			target="/html/login.jsp";	
			request.getRequestDispatcher(target).forward(request, response);
		}else if(action.equals("login")){
			login(request, response);			
		}else if(action.equals("phonelogin")){
			phoneLogin(request, response);			
		}else if(action.equals("loginout")){
			loginout(request, response);
		}else if(action.equals("register")){
			target = action;
			target="/html/"+target+".jsp";			
			request.getRequestDispatcher(target).forward(request, response);
		}else if(action.equals("queryPhone")){
			System.out.println("queryPhone");
			queryPhone(request, response);
		}else if(action.equals("registerUser")){
			registerUser(request, response);
		}
		
	}
	
	
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{		
		
		String target = request.getParameter("from");
		String username = request.getParameter("username");
		String password = request.getParameter("password").trim();
		System.out.println("target >>"+target);
		/*target = target.substring(target.indexOf("/", 1));*/
		
		if(username != null && password != null && !username.trim().equals("") && !password.trim().equals("")){
			username = username.trim();
			password = password.trim();
			Users user = new Users();
			user.setUPHONE(username);
			user.setUUID(username);
			user.setUEMAIL(username);
			user.setUPASSWORD(password);
			
			UserService userservice = new UserServiceImpl();
				try {
					Users loginUser = userservice.queryUser(user);
					if(loginUser != null && loginUser.getUUID()!= null && loginUser.getULOCK()==1){
						session.setAttribute("user", loginUser);
					}else{						
						request.setAttribute("msg", "登录失败！");
						target = "/WEB-INF/msg.jsp";
						request.getRequestDispatcher(target).forward(request, response);
					}
				} catch (Exception e) {
					request.setAttribute("msg", "登录失败！");
					e.printStackTrace();
					target = "/WEB-INF/msg.jsp";
					e.printStackTrace();
					request.getRequestDispatcher(target).forward(request, response);
				}
			}
		/*request.getRequestDispatcher(target).forward(request, response);*/
		response.sendRedirect(target);
	}
	
	
	private void phoneLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String phoneNum = request.getParameter("phone");
		String target = request.getParameter("from");
		System.out.println(phoneNum);
		if(phoneNum != null && !phoneNum.trim().equals("")){
			phoneNum = phoneNum.trim();
			Users user = new Users();
			user.setUPHONE(phoneNum);
			user.setUNAME("小米用户"+phoneNum);
			UserService userservice = new UserServiceImpl();
				try {
					Users loginUser = userservice.queryUser(user);
					if(loginUser.getUUID() != null){
						System.out.println(loginUser);
						session.setAttribute("user", loginUser);
					}else{						
						int status =new UserServiceImpl().createUser(user);
						if(status != 0){
							System.out.println("创建新用户成功");
							loginUser = new UserServiceImpl().queryUser(user);
							session.setAttribute("user", loginUser);
						}else{
							System.out.println("创建新用户失败");
						}
						
					}
				} catch (Exception e) {
					request.setAttribute("msg", "登录失败！");
					e.printStackTrace();
					target = "/WEB-INF/msg.jsp";
					e.printStackTrace();
				}
			}
		/*request.getRequestDispatcher(target).forward(request, response);*/
		response.sendRedirect(target);
		
		
	}
	
	
	private void loginout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{		
		session.removeAttribute("user");
		String target = request.getParameter("target");
		response.sendRedirect(target);		
	}
	
	private void queryPhone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{		

		//设置服务器响应的数据类型  为application/json 
		response.setContentType("application/json");
		String target = "";
		
		//1.填充数据
		String phoneNum = request.getParameter("phone");
		System.out.println(phoneNum);
		//2.调用业务逻辑
		
		UserServiceImpl userService = new UserServiceImpl();
		
		//3.输出
		PrintWriter out = response.getWriter();
		
			if(phoneNum != null && !phoneNum.trim().equals("")){
				phoneNum = phoneNum.trim();
				Users user = new Users();
				user.setUPHONE(phoneNum);
				user.setUNAME("小米用户"+phoneNum);
				UserService userservice = new UserServiceImpl();
				Users loginUser = null;
				try {
					loginUser = userservice.queryUser(user);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(">>"+loginUser);
				Gson gson = new Gson();
				String userExist;
				if(loginUser != null){
					userExist = gson.toJson(loginUser);					
				}else{
					loginUser = new Users();
					userExist = gson.toJson(loginUser);										
				}
				
				out.println(userExist);				
				out.flush();				
				out.close();
			}
	}
	
	private void registerUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{	
		Users newUser = (Users) session.getAttribute("newUser");
		
		if(newUser == null){
			newUser = new Users();
		}
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String target = request.getParameter("target");
		
		if(phone != null){
			newUser.setUPHONE(phone);
			newUser.setUNAME("小米用户"+phone);
		}
		if(password != null){
			newUser.setUPASSWORD(password);
		}
		
		session.setAttribute("newUser", newUser);
		
		if(target.equals("success")){
			UserServiceImpl userService = new UserServiceImpl();
			try {
				int createUser = userService.createUser(newUser);
				if(createUser > 0){
					UserService userservice = new UserServiceImpl();
					Users loginUser = null;
					try {
						loginUser = userservice.queryUser(newUser);
						session.setAttribute("user", loginUser);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}else{
					System.out.println("注册失败");
				}
				
				
				request.getRequestDispatcher("index.jsp").forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("创建用户失败");
			}
		}else{
			request.getRequestDispatcher("html/"+target+".jsp").forward(request, response);
			
		}
		
	}
	
	

}
