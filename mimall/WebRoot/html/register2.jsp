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
		<script src='<%=basePath%>js/jquery-2.1.4.js' type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
		/* var verificationCode = 123456; */
		
		function antoChangeTime(){
			var com =119;
			$("#c3").prop("disabled","disable");
			var tiemid = window.setInterval(refer,1000);
			function refer () {
				if(com == 0){
					$("#c3").val("重新发送");
					$("#c3").prop("disabled","");
					$("#c3").css("color","#000000");
					window.clearInterval(tiemid);
					
				}else{
					$("#c3").val("重新发送（"+com+"）");
					$("#c3").css("color","rgb(181 197 218)");
					com--;
					
				}
			}
		}
			
		$(function(){
			var text;
			var $c2 = $("#c2");
			$c2.focus(function(){
				text = $(this).val();
				$(this).val("");
			});
			$c2.blur(function(){
				$(this).val()!=""||$(this).val(text);
			});
			
			$("#c3").click(antoChangeTime);
			antoChangeTime();
			
			$("#c7").click(function(){
				var ps = $("#c2").val();
				var pp = parseInt($("#phoneID").html());
				/* alert(ps);
				alert(pp); */
				$.post(
				"http://www.nobitastudio.cn/lanqiaoPro1/userConfirmVerificationCode.action",
				{ "phoneNumber": pp,  "verificationCode": ps},
					function (message) {
						msg = message.success;
						msgg = message.inf;
						if(msg){
							$("form").submit();
						}else{
							alert("验证"+mesgg);
							window.location.reload();					
						}
				},
				"json");
				/* if(c2val == verificationCode){		
					$("form").submit();			
					window.location='html/register3.html';
				}else{
					$("#oo").html("验证码错误");
				} */
				
			})
		})
				
		
		
		
			
		</script>
		
		<style type="text/css">			
			* {
				margin: 0px;
			}
			#oo {
				color: red;
				position: absolute;
				top: 0px;
				top: 6px;
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
				top: 35%;
				left: 30%;
				font-size: 10px;
				color: rgb(102 102 102);
			}
			#b5 {
				position: absolute;
				top: 40%;
				left: 30%;
				font-size: 10px;
				color: rgb(102 102 102);
			}	
			#b6 {
				position: absolute;
				top:47%;
				left: 30%;			
				width: 500px;
			}	
			#c1 {
				color: rgb(255 103 0);
				text-decoration: none;
			}
			#c2 {
				width: 170px;
				height: 25px;
				border: #E7E7E7 1px solid;
				color: rgb(181 181 218);
			}
			#c3 {
				display: inline-block;
				background-color: #FFFFFF;
				padding: 0 20px 0 20px;
				font-size: 12px;
				text-decoration: none;
				height: 30px;
				line-height: 30px;
				border: #E7E7E7 1px solid;
			}
			
			#b7 {
				position: absolute;
				top: 57%;
				left: 30%;
			}
			#b7>input:hover{
				background-color: rgb(255 147 106);
			}
			#b8 {
				position: absolute;
				top:67%;
				left: 30%;
			}
			#b8>input:hover {
				color: rgb(181 181 218);
			}
			#c7 {
				width: 265px;
				height: 32px;
				background-color: rgb(255 103 0);
				border: rgb(255 103 0) 1px solid;
				color: #ffffff;
			}
			#c4 {
				display: inline-block;
				background-color: #FFFFFF;
				padding: 0 20px 0 20px;
				font-size: 12px;
				text-decoration: none;
				height: 30px;
				line-height: 30px;
				border: #E7E7E7 1px solid;
				width: 265px;
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
				text-decoration: none;
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
				<div><img id="b2" src='<%=basePath%>resources/img/小米注册/mi.png'/></div>				
				<div id="b3">注册小米账号</div>
				<% Users newUser = (Users)session.getAttribute("newUser"); %>
				<div id="b4">我们已经发送一条验证短信至<a id="c1" href="">+86 <span id='phoneID'><%=newUser.getUPHONE() %></span></a></div>
				<div id="b5">请输入短信中的验证码</div> 
				<form action="login" method="post">
					<input type="hidden" name="action" value="registerUser">
					<input type="hidden" name="target" value="register3">				
					<div id="b6">
						<input type="text" name="" id="c2" value="" placeholder="请输入验证码"/>  <input type="button" name="c3" id="c3"/><span id="oo"></span>
					</div>
					<div id="b7"><input type="button" name="c7" id="c7" value="下一步"/></div>
					<div id="b8">
						<input type="button" name="c4" id="c4" value="返回" onclick="window.location='html/register.jsp'"/>
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
			<img src='<%=basePath%>resources/img/小米注册/zuihou.png'/>
		</div>
	</body>
</html>
