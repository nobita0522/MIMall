<%@page import="com.mimall.vo.Category"%>
<%@page import="org.apache.catalina.core.ApplicationContext"%>
<%@page import="com.mimall.vo.Users" contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="java.util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'TestJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    
<form action="login" method="post">

<%
	Users user = new Users();
	user.setUNAME("123");
	user.setACCOUNT("13");
	session.setAttribute("user", user);
 %>
						<input type="hidden" name="action" value="phonelogin">
						<input type="hidden" name="from" value='/mimall/index.jsp'>
						<div id="first">							
							<input type="text" id="phone" name="phone"  style="border: 1px solid rgb(176 176 176);color: #000000;" value="" placeholder="手机号码"/></br>
						</div>						
						<span class="myspan1" id="myspan"></span>						
						<input type="submit" onclick="checkuser();" id="btn" style="border: 1px solid rgb(239 91 0);"value="立即登录/注册"/></br>
					</form>
					
					
  </body>
</html>
