<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
	<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title></title>
	<link rel="stylesheet" type="text/css" href="css/guanbicss.css"/>
	</head>
	<body>
		<p id="f16">当前没有已关闭订单。</p>
	</body>
</html>
