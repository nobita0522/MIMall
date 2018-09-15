<%@page import="com.mimall.vo.Users"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>	
		<script src='<%=basePath%>/js/jquery-2.1.4.js' type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function(){
				var text;
				var $c1 = $("#c1");
				$c1.focus(function(){
					text = $(this).val();
					$(this).val("");				
				});
				$c1.blur(function(){
					$(this).val()!=""||$(this).val(text);
					checkPassword();
				});
			})
			$(function(){
				var text;
				var $c11 = $("#c11");
				$c11.focus(function(){
					text = $(this).val();
					$(this).val("");
				});
				$c11.blur(function(){
					$(this).val()!=""||$(this).val(text);
					comparepassword();
				});
			})
		
			function checkPassword () {
				var passwordInput = document.getElementById("c1");	
				var c1 = document.getElementById("a666");
				var Password = passwordInput.value;				
				if (!ispass(Password)) {			
					c1.innerHTML = "密码格式不正确";		
					return false;
				}else{
					c1.innerHTML = "";
				}
			}
			
			function ispass(password) {				
				var regExp = /^[A-Za-z0-9\W]{8,16}$/;
				var flag = regExp.test(password);
				return flag;
			}
			
			function comparepassword(){
				var passwordInput = document.getElementById("c1");	
				
				var passwordInput11 = document.getElementById("c11");
				
				var a777 = document.getElementById("a777");				
				
				if(passwordInput.value != passwordInput11.value){
					a777.innerHTML = "两次密码不一致";
					return false;
				}else{
					a777.innerHTML = "";	
				}
			}
			
			$(function(){				
				$("#c2").click(function(){	
				 	if(checkPassword()==0||comparepassword()==0){
				 		
				 	}else{
				 	
				 	$("form").submit();
				 		/* window.location = "Register4.html"; */
				 	}
				});
				
			})
			
			
		</script>
		<style type="text/css">
			* {
				margin: 0px;
			}
			span {
				color: red;
				font-size: 12px;
			}
			#a {
				width:100%;
				height: 670px;
				background-color: rgb(249 249 249);
			    position: relative;
			}
			
			#b1 {
				width:50%;
				height: 430px;
				background-color: #FFFFFF;
				position: absolute;
				left: 25%;
				top: 64px;
			}
			
			#b2 {
				position: absolute;
				left: 47%;				
			}		
			#b3 {
				width: 100%;
				position: absolute;				
				top: 16%;
				color: #000000;
				text-align:center;
				font-size: 27px;
			}
			#b4 {
				position: absolute;
				top: 34%;
				left: 30%;
				font-size: 15px;
			}
			#b5 {
				position: absolute;
				top: 39%;
				left: 30%;
				font-size: 15px;
			}
			#b6 {
				position: absolute;
				top: 48%;
				left: 30%;				
			}
			#b7 {
				position: absolute;
				top: 58%;
				left: 30%;				
			}
			#b8 {
				position: absolute;
				top: 68%;
				left: 30%;
				font-size: 12px;
			}
			#b9 {
				position: absolute;
				top: 78%;
				left: 30%;
			}
			#b9>input:hover{
				background-color: rgb(255 147 106);
			}
			#c2 {
				width: 265px;
				height: 32px;
				background-color: rgb(255 103 0);
				border: rgb(255 103 0) 1px solid;
				color: #ffffff;
			}
			#c1 {
				width: 265px;
				height: 30px;
				color: rgb(157 157 157);
			}
			#c11 {
				width: 265px;
				height: 30px;
				color: rgb(157 157 157);
			}
			a {
				text-decoration: none;
				color: rgb(255 103 0);
			}
			#a1 {
				position: absolute;
				top: 88%;
				left: 40%;
			}
			#a1>ul>li {
				list-style: none;
				display: inline-block;
				font-size: 12px;
				
			}
			#a1>ul>li>a:hover {							
				font-size: 12px;
				color: #000000;
			}
			#c6 {
				color: rgb(157 157 157);
			}
			#a2 {
				position: absolute;
				top: 94%;
				left: 30%;
			}
		</style>
	</head>
	<body>
		<div id="a">
			<div id="b1">
				<div><img id="b2" src='<%=basePath%>/resources/img/小米注册/mi.png'/></div>				
				<div id="b3">注册小米账号</div>
				<% Users newUser = (Users)session.getAttribute("newUser"); %>
				<div id="b4">您注册的手机号为<a href=""><%=newUser.getUPHONE() %></a></div>
				<form action="login" method="post">
					<input type="hidden" name="action" value="registerUser">
					<input type="hidden" name="target" value="success">
					<div id="b5">请设置您的密码</div>
					<div id="b6"><input type="password" name="password" id="c1" value="" placeholder="请输入密码"/><span id="a666"></span></div>
					<div id="b7"><input type="password" name="reppassword" id="c11" value="" placeholder="请输入确认密码"/><span id="a777"></span></div>
					<div id="b8">密码长度8~16位，数字、字母、字符至少包含两种</div>
					<div id="b9">
						<input type="button" name="c2" id="c2" value="提交"/>
					</div>
				</form>
			</div>
		</div>
		<div id="a1">
			<ul>
				<li><a href="" id="c6">简体</a></li>              <span style="color: rgb(157 157 157);" >|</span>
				<li><a href="" id="c6">繁体</a></li>              <span style="color: rgb(157 157 157);">|</span>
				<li><a href="" id="c6">English</a></li>              <span style="color: rgb(157 157 157);">|</span>
				<li><a href="" id="c6">常见问题</a></li>
			</ul>
		</div>
		
		<div id="a2">
			<img src='<%=basePath%>/resources/img/小米注册/zuihou.png'/>
		</div>
	</body>
</html>
