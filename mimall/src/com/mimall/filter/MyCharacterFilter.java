package com.mimall.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mimall.vo.Users;


public class MyCharacterFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}
	
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain filterChain) throws IOException, ServletException {
		
		
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)res;
		ServletContext application = request.getServletContext();
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String target = request.getRequestURI();
		Users user = (Users) session.getAttribute("user");
		if(target.indexOf("admin.jsp")>-1) {
			if(user != null && user.getADMIN() == 1) {
				request.getRequestDispatcher("/WEB-INF/jsp/admin/admin.jsp").forward(request, response);
			}else {
				response.sendRedirect(application.getAttribute("basePath")+"index.jsp");
			}
		}else {
			
			filterChain.doFilter(request, response);
		}
		
	
		
		
	}
	
	@Override
	public void destroy() {
		
	}

	

}
