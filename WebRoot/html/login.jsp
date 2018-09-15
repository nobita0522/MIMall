<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href='<%=basePath%>css/ol.css' />
	</head>
	<script type="text/javascript" src='<%=basePath%>js/jquery-2.1.4.js' ></script>
<script type="text/javascript">
		
$(function () {
    
            $s=$("#s");
            $myspan=$("#myspan");
            $btn1=$("#btn1");
            $btn2=$("#btn2");
           $btn1.keydown(function(){
           $myspan.html("");
           });
           
           $btn2.keydown(function(){
           $myspan.html("");
           });
           
//      $('#zhanghao').hover(changeColor1,changeColor2)
//      $('#d2').hover(changeColor1,changeColor2)
//     
//	        function changeColor1(){
//	          	$(this).css('color','rgb(239 91 0)');
//	         }
//	          function changeColor2(){
//	          	$(this).css('color','black');
//      } 
  		   $("#zhanghao").click(function(){
	           	$("#div_1").show();
	           	$("#div_2").hide();
	           	$(this).css('color','rgb(239 91 0)');
	           	$("#saoma").css('color','rgb(116 116 116)');
           })
           
            $("#saoma").click(function(){
	           	$("#div_2").show();
	           	$("#div_1").hide();
	           	$(this).css('color','rgb(239 91 0)');
	           	$("#zhanghao").css('color','rgb(116 116 116)');
           });
            
            $zs1 = $("zs1");
			$zs1.each(function(){			
				$(this).on("mouseover",function(){
					$(this).addClass("zhanghao");
					$(this).siblings().removeClass("zhanghao");
						
					})
				})   
         });   
            
            
 
        
     function checkuser() {
            
				var pp=$btn1.val();
				var ps=$btn2.val();
			    var flag=true;          
				if(trim(pp)==""){
					$myspan.html("请输入用户名");
					$myspan.className="fail";
					flag=false;
				}else if(trim(pp)!=""){
					if(!isPhone(pp)){
						$myspan.html("用户名不正确");
						$myspan.className="fail";
						flag=false;
					}else if(trim(ps)==""){
						    flag=false;
							$myspan.html("请输入密码");
							$myspan.className="fail";
				
				    }
				}
                if(flag){
                /* alert("submit") */
           			 $("form").submit();           
                }           
            }
 
			function trim(txt) {
				var afterTrimTxt = txt.replace(/^\s*/, "").replace(/\s*$/, "");

				return afterTrimTxt;
			}
			function isPhone(phone){
				var p=/^1[0-9]{10}$/;
				var f=p.test(phone);
				return f;
			}
			function isPassword(password){
				var psw=/^\w{5,10}$/;
				var pf=psw.test(password);
				return pf;
			}
            
			
</script>
<body>		
		<div id="mainbox">			
		  <div id="top">
			<div id="top11"><img src='<%=basePath%>resources/ldy/top11.png' /></div>
		  </div>
		  <div id="shang1"></div>
		  <div id="zhongs">
				<div id="zs">
						<div id="zs1">
							<a id="zhanghao">账号登录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><span class="line"></span>
							<a id="saoma">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;扫码登录</a>
						</div>
						
				</div>
					
				<div id="div_1">
				   <div id="zhong">
					<div id="zl">
					<form action="login" method="post">
						<input type="hidden" name="action" value="login">
						<input type="hidden" name="from" value='<%=request.getParameter("from") %>'>
						<input type="text"name="username"id="btn1"value="" placeholder="邮箱/手机号码/小米ID" style="color: #000000;"/><span></span></br>
						<input type="password" name="password"id="btn2"value="" placeholder="密码"style="color: #000000;"/><span></span></br>
						<span class="myspan1" id="myspan"></span>
						
						<input type="button" onclick="checkuser();" id="btn" style="border: 1px solid rgb(239 91 0);"value="登录"/></br>
						</form>
					</div>
					<div id="xia">
						
							<div id="wenzi1" ><a href='login?from=<%=request.getParameter("from") %>' style="color:rgb(239 91 0);text-decoration: none;">手机短信登录/注册</a></div>
							<div class="nav">
						
								<a class="liji" href='login?from=<%=request.getParameter("from") %>&action=register'>立即注册</a><span style="color: rgb(176 176 176);"> |</span>
								<a class="wangji">忘记密码?</a>
							</div>	
					  </div>
					<div id="xxia">
						<div id="qita2"><span style="color: rgb(176 176 176);">—————————</span>其他方式登录<span style="color: rgb(176 176 176);">——————————</span></div>
	
						 <div id="qita3">
						 	<img src='<%=basePath%>resources/ldy/QQ.png'/>&nbsp;&nbsp;&nbsp;
						 	<img src='<%=basePath%>resources/ldy/微博.png'/>&nbsp;&nbsp;&nbsp;
						 	<img src='<%=basePath%>resources/ldy/支付宝.png'/>&nbsp;&nbsp;&nbsp;
						 	<img src='<%=basePath%>resources/ldy/微信.png'/>
					   </div>
		            </div>
				  </div>
				  </div>				  
				  <div id="div_2" style="display: none;">				  	
				  	<img src='<%=basePath%>resources/ldy/二维码.png' id="ewm"/>
				  	<div class="row">
		                  <p id="r1">使用<span style="color:rgb(255 126 0);">小米商城APP</span>扫一扫</p>
		                  <p>小米手机可打开「设置」&gt;「小米帐号」扫码登录</p>
                	  </div>
				  </div>
				</div>
			<div id="xxxia">
				<ul>
					    <li><a href="Onland.html"style="color: #000000;font-size: 12px;text-decoration: none;">简体</a>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					    <li><a href="#" style="font-size: 12px;text-decoration: none;">繁体</a>&nbsp;&nbsp;| &nbsp;&nbsp;</li>
					    <li><a href="#"style="font-size: 12px;text-decoration: none;">English</a>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					    <li><a href="#"style="font-size: 12px;text-decoration: none;">常见问题</a>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
					    <li><a href="#"style="font-size: 12px;text-decoration: none;">隐私政策</a></li>
				 </ul>					
				  <p class="dibu1">小米公司版权所有-京ICP备10046444-<a><span><img src='<%=basePath%>resources/ldy/徽章.png'></span>京公网安备11010802020134号</a>-京ICP证110507号</p>	
			</div>
		</div>
	</body>
</html>
