<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="/mimall/css/mo.css" />
	</head>
	<script type="text/javascript" src="/mimall/js/jquery-2.1.4.js" ></script>
	
	<script type="text/javascript">
			 $(function () {
           
            
            $s=$("#s");
            $myspan=$("#myspan");
            $phone=$("#phone");
            $pwd1=$("#pwd1");
           $phone.keydown(function(){
           $myspan.html("");
           });
           
           $pwd1.keydown(function(){
           $myspan.html("");
           });
           
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

           
           $("#pwd2").click(function(){
	
				
				      var pp=$phone.val();
				      	if(trim(pp)==""){
							$myspan.html("请输入手机号");
							$myspan.className="fail";
							flag=false;
						}else{
							  times=120,
						      timer=null;
						    
						     // 计时开始
						     var that = this;
						      this.disabled=true;
						      var msg;
						      
						      $.post(
								"http://www.nobitastudio.cn/lanqiaoPro1/useGetMessageVerificationCode.action",
								{ "phoneNumber": pp,  "messageType": 0},
								function (message) {
								msg=message.success;
								if(message.success){					      
									 timer = setInterval(function(){
									 	 times --;
								        that.value = times + "秒后重试";
								        if(times <= 0){
								          that.disabled =false;
								          that.value = "发送验证码";
								          clearInterval(timer);
								          times = 120;
								        }
						        //console.log(times);
						    		  },1000);  	
				    		  	}
								$myspan.html("验证码" + message.inf);//根据 message 中的值进行相关操作
								},
								"json");						      
						}
              });
     

        });

         function checkuser() {
            
				var pp=$phone.val();
				//var myspan=btn2.nextSibling;
				var ps=$pwd1.val();
			
				   var flag=true;
            
				if(trim(pp)==""){
					$myspan.html("请输入手机号");
					$myspan.className="fail";
					flag=false;
				}else if(trim(pp)!=""){
					if(!isPhone(pp)){
						$myspan.html("手机号不正确");
						$myspan.className="fail";
						flag=false;
					}else if(trim(ps)==""){
						    flag=false;
							$myspan.html("请输入验证码");
							$myspan.className="fail";
				
				    }
				}
            
            if(flag){
            
	            var msg;
	            var msgg;

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
						}
				},
				"json");
				
				
	            
	           
            
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
				<div id="top11"><img src="/mimall/resources/ldy/top11.png" />  </div>
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
								
					<form action="login" method="post">
						<input type="hidden" name="action" value="phonelogin">
						<input type="hidden" name="from" value='<%=request.getParameter("from") %>'>
						<div id="first">
							<input type="text" id="username" style="border: 1px solid rgb(176 176 176);" value="+86"/>
							<input type="text" id="phone" name="phone"  style="border: 1px solid rgb(176 176 176);color: #000000;" value="" placeholder="手机号码"/></br>
						</div>
						<div id="two">
							<input type="text" name="pwd1" id="pwd1" style="border: 1px solid rgb(176 176 176);color: #000000;"value="" placeholder="短信验证码"/>
							<input type="button" name="pwd2" id="pwd2" style="border: 1px solid rgb(176 176 176);" value="获取验证码"/><span></span></br>
							
						</div>
						<span class="myspan1" id="myspan"></span>
						
						<input type="button" onclick="checkuser();" id="btn" style="border: 1px solid rgb(239 91 0);"value="立即登录/注册"/></br>
					</form>
					
					
					<div id="xia">
						
							<div id="wenzi1" ><a href="login?from=<%=request.getParameter("from") %>&action=go" style="color:rgb(239 91 0);text-decoration: none;">账号密码登录</a></div>
							
							
						
					</div>
					<div id="xxia">
						<div id="qita2"><span style="color: rgb(176 176 176);">—————————</span>其他方式登录<span style="color: rgb(176 176 176);">——————————</span></div>
	
						 <div id="qita3">
						 	<img src="/mimall/resources/ldy/QQ.png"/>&nbsp;&nbsp;&nbsp;
						 	<img src="/mimall/resources/ldy/微博.png"/>&nbsp;&nbsp;&nbsp;
						 	<img src="/mimall/resources/ldy/支付宝.png"/>&nbsp;&nbsp;&nbsp;
						 	<img src="/mimall/resources/ldy/微信.png"/>
					   </div>
		            </div>
				  </div>
				  </div>
				   <div id="div_2" style="display: none;"><img src="/mimall/resources/ldy/二维码.png" id="ewm"/>
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
					
				  <p class="dibu1">小米公司版权所有-京ICP备10046444-<a><span><img src="/mimall/resources/ldy/徽章.png"></span>京公网安备11010802020134号</a>-京ICP证110507号</p>	
			</div>
		</div>
	</body>
</html>
