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
			
			$(function(){	
				var $b5 = $("#b5");				
				$b5.click(function(){		
					var $b6 = $("#b6");
					if($b6.is(":visible")){
						$b6.hide();
					}else{
						$b6.show();
					}
				  });

                var $c3 = $("#c3");
                $c3.click(function(){
                    var $b10 = $("#b10");
                    if($b10.is(":visible")){
                        $b10.hide();
                    }else{
                        $b10.show();
                    }
                });
			});
			

			var kuang2Input;
			window.onload = function() {
				kuang2Input = document.getElementById("kuang2");					
				kuang2Input.onblur = checkkuang2Input;
				kuang2Input.onkeyup = checkkuang2Input;
				
			}

			function checkkuang2Input () {
				var phonenb = kuang2Input.value;
				var mySpan = kuang2Input.nextSibling;				
				mySpan.innerHTML = "";
				if (isNaN(phonenb)) { //不是数字
					//1.提示 "号码必须为数字"
					mySpan.innerHTML = "号码必须为数字";				
				} else if (phonenb.length>11) {
					//1.提示号码位数要等于11
					mySpan.innerHTML = "请输入正确的号码格式";			
				}	
				c4 = document.getElementById("c4");
				/*c4.onclick = judge;
				function judge(){
					var phonenb = kuang2Input.value;
					if(mySpan.innerHTML == "号码必须为数字"||mySpan.innerHTML == "请输入正确的号码格式"){
						
					}else{
						if(phonenb.length == 11){
						window.location =  'Register2.html';	
						}						
					}

				}*/
			}


            function checkuser() {

                var $myspan = $("#oo");
                var $btn1 = $("#kuang2");
                var pp=$btn1.val();
                var flag=true;
                if(trim(pp)==""){
                    $myspan.html("请输入手机号");
                    $myspan.className="fail";
                    flag=false;
                }else if(trim(pp)!=""){
                    if(!isPhone(pp)){
                        $myspan.html("手机格式不正确");
                        $myspan.className="fail";
                        flag=false;
                    }
                }

                if(flag){
              /*   alert("first");   */             
                    $.post('login',{'phone':pp,'action':'queryPhone'},
                    function(data){
                    	if(data.UPHONE == null){
	                    	$.post(
								"http://www.nobitastudio.cn/lanqiaoPro1/useGetMessageVerificationCode.action",
								{ "phoneNumber": pp,  "messageType": 0},
								function (message) {
									if(message.success){
										$("form").submit();
									}else{
										alert("获取验证码"+message.inf);
									}				      															    		  	
								},
							"json");	
	                    	
                    	}else{
                    		 $myspan.html("该手机号码已被注册");
                    	}
                    })
                }
            }

            function trim(txt) {
                var afterTrimTxt = txt.replace(/^\s*/, "").replace(/\s*$/, "");

                return afterTrimTxt;
            }
            function isPhone(phone) {
                var p = /^1[0-9]{10}$/;
                var f = p.test(phone);
                return f;
            }

			
		$(function(){
			var text;
			var $kuang2 = $("#kuang2");
			$kuang2.focus(function(){
				text = $(this).val();
				$(this).val("");
			});
			$kuang2.blur(function(){
				$(this).val()!=""||$(this).val(text);
			});
		})
			
		</script>
		<style type="text/css">
			* {
				margin: 0px;
			}
			#oo {
				color: red;
				font-size: 12px;
				position: absolute;
				top: 120%;
			}
			a {
				text-decoration: none;
				color: #000000;
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
				width: 100%;
				position: absolute;				
				top: 30%;
				color: #000000;
				left: 30%;
				font-size: 12px;
			}
			#b5 {
				width: 100%;
				position: absolute;				
				top: 35%;				
				left: 30%;
				
			}
			#b6 {
				position: absolute;
				top: 43%;
				left: 25%;
				z-index: 100;
				background-color: #FFFFFF;
			}
			#b6>ul>li{
				width: 268px;
				height: 33px;
				list-style: none;				
				border: #E7E7E7 1px solid;
				}
			#b6>ul>li:hover{
				background-color: #E7E7E7;
				}
			#d1 {					
				color: #000000;					
				}
			#b7 {
				width: 100%;
				position: absolute;				
				top: 44%;
				color: #000000;
				left: 30%;
				font-size: 12px;
			}
			#b8 {
				width: 100%;
				position: absolute;				
				top: 50%;
				color: #000000;
				left: 30%;
				font-size: 12px;
			}
			#b9 {
				width: 100%;
				height: 30px;
				position: absolute;				
				top: 55%;				
				left: 30%;						
			}
			#kuang2 {
				width: 210px;
				height: 30px;
				border: #E7E7E7 1px solid;
				color: rgb(157 157 157);	
				position: absolute;			
				top: 1px;
				left: 6%;
			}
			#kuang1 {
				width: 230px;
				height: 32px;
				border: #E7E7E7 1px solid;
				color: rgb(157 157 157);	
				position: absolute;	
				top: 2px;		
				
			}
			#b10>ul>li {
				list-style: none;
				width: 264px;
				height: 33px;
				list-style: none;				
				border: #E7E7E7 1px solid;
			}
			#b10>ul>li:hover{
				background-color: #E7E7E7;
			}
			#b10 {
				position: absolute;
				top: 63%;
				left: 25%;
				z-index: 100;
				background-color: #FFFFFF;
			}
			
			#b11 {
				position: absolute;
				top: 68%;
				left: 30%;
			}	
			#b11>input:hover{
				background-color: rgb(255 147 106);
			}	
			#b12 {
				position: absolute;
				top: 87%;
				left: 30%;
				font-size: 12px;
				
				color: rgb(157 157 157);
			}
			#c3 {
				border: #E7E7E7 1px solid;
				height: 34px;
				width: 52px;
				position: absolute;
				top: 1px;
			}
			#c4 {
				width: 265px;
				height: 32px;
				background-color: rgb(255 103 0);
				border: rgb(255 103 0) 1px solid;
				color: #ffffff;
			}
			
			#c5 {
				position: absolute;
				top: 0%;
				left: -7%;
				background-color: red;
			}
			#c6 {
				color: rgb(157 157 157);
			}
			#c8 {
				width: 264px;
				height: 24px;
			}
			#c9 {
				width: 261px;
				height: 24px;
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
			
			#a2 {
				position: absolute;
				top: 94%;
				left: 30%;
			}
			#e2 {
				position: absolute;
				left: 225px;
			}
		</style>
	</head>
	<body>
		<div id="a">
			<div id="b1">
				<div><img id="b2" src='<%=basePath%>resources/img/小米注册/mi.png'/></div>				
				<div id="b3">注册小米账号</div>
				<div id="b4">国家/地区</div>
				<div id="b5">
					<select name="country" id="kuang1">
						<option value="">中国</option>
						<option value="">中国香港</option>
						<option value="">中国台湾</option>
						<option value="">Brazil</option>
					</select>
				<img id="e2" src='<%=basePath%>resources/img/小米注册/1.png'/></div>					
				<div id="b7">成功注册账号后，国家/地区将不能被修改</div>
				<div id="b8">手机号码</div>
				<div id="b9">
					<select name="" id="c3">
						<option value="中国  " id="d1">+86</option>
						<option value="" id="d1">+886</option>
						<option value="" id="d1">+852</option>
						<option value="" id="d1">+55</option>
					</select>
				<form action="login" method="post">
					<input type="hidden" name="action" value="registerUser">
					<input type="hidden" name="target" value="register2">
					<input type="text" id="kuang2" name="phone" value="" placeholder="请输入手机号"/><span id="oo"></span></div>
					
					<div id="b11"><input type="button" onclick="checkuser();" name="" id="c4" value="立即注册"/></div>
				</form>
				<div id="b12">
					<img id="c5" src='<%=basePath%>resources/img/小米注册/duigou.png'/>注册帐号即表示您同意并愿意遵守小米<a href="">用户协议</a>和<a href="">隐私政策</a>
				</div>         
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
