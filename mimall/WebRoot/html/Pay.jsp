<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
	<base href='<%=basePath %>'>
		<meta charset="UTF-8">
		<title>支付订单</title>
		<link rel="stylesheet" href="css/pay.css" />
		<script type="text/javascript" src="js/jquery-2.1.4.js" ></script>
		<script type="text/javascript">
           
			function slideToggle(){
				if($("#J_postInfo1").show()){
					$("#J_postInfo2").show();
				           	$("#J_postInfo1").hide();
				}else if($("#J_postInfo2").show()){
					$("#J_postInfo1").show();
				           	$("#J_postInfo2").hide();
				}
					
			// 		$("#J_postInfo2").slideToggle();//窗帘效果的切换,点一下收,点一下开,参数可以无,参数说明同上
			 }
		</script>
	</head>
	<body>
		<div id="btn1">
		   <div id="top">
			<div id="top1">
				<div id="top11"><img src="/mimall/resources/ldy/mi1.png" id="top111"/></div>
			    <div id="top12">
			    	<div id="top122">支付订单</div>
			    </div>
			    <div id="top13">
			      <div id="top133">
			    	<span class="user">
			    		<a  href="#"><span class="name">1493328322</span>
			    			<img class="iconfont" src="/mimall/resources/ldy/箭头.png" />
			    		</a>
			    		<ul class="user-menu" style="display: none;">
			    			<li><a href="#">个人中心</a></li>
			    			<li><a href="#">评价晒单</a></li>
			    			<li><a href="#">我的喜欢</a></li>
			    			<li><a href="#">小米账户</a></li>
			    			<li><a  href="#">退出登录</a></li>
			    		</ul>
			    	</span>
			    	<span class="sep">|</span>
			    	<a class="dingdan" href="#">我的订单</a>
			      </div>
			    </div>
			 </div>
		   </div>
		   <div id="zhong">
		   	<div id="z1">
		   		<div id="z11">
		   			<div id="z111">
		   				<div id="z1111">
		   					<div>
		   						<i class="icon-right">√&nbsp;</i>
		   					</div>
		   					
		   					<div id="success">
		   						<div id="success1">		 					
		                            <h2 class="title">订单提交成功！去付款咯～</h2>
		                            <p class="order-time" id="J_deliverDesc"></p>
		                            <p class="order-time">请在<span class="pay-time-tip">48小时0分</span>内完成支付, 超时后将取消订单</p>                    
		                            <p class="xy" id="J_postInfo1">
		                               	 收货信息：李丹亚 157****2833 &nbsp;&nbsp;
		                                新疆&nbsp;&nbsp;省直辖县级行政单位&nbsp;&nbsp;石河子市&nbsp;&nbsp;向阳街道&nbsp;&nbsp;石河子大学中区十六号楼
		                            </p>
		                            <p class="yx" id="J_postInfo2">
		                            	订单号:&nbsp;&nbsp;&nbsp;<span class="number">5180829211600803</span></br>
		                               	收货信息:&nbsp;&nbsp;李丹亚 157****2833 &nbsp;&nbsp;
		                                新疆&nbsp;&nbsp;省直辖县级行政单位&nbsp;&nbsp;石河子市&nbsp;&nbsp;向阳街道&nbsp;&nbsp;石河子大学中区十六号楼</br>
	                                	商品名称:&nbsp;&nbsp;8H记忆棉U形护颈枕&nbsp;混灰色</br>
	                                	发票信息:&nbsp;&nbsp;电子发票&nbsp;个人
		                            </p>
		   						</div>
		   						<div id="success2">
		   							
		                            <p class="total">
		                              	  应付总额：<span class="money"><em>59</em>元</span>
		                            </p>
		                            <a href="#" class="show-detail" id="J_showDetail" onclick="slideToggle()">订单详情<img class="iconfont" src="/mimall/resources/ldy/箭头.png" /></a>
                                       
		   						</div>
		   					</div>
		   				</div>
		   			</div>
		   		</div>
		   		<div id="z12">
		   			<div id="z121">
		   				<div id="zshang">
		   					<div class="cash-title" id="J_cashTitle">
                                        选择以下支付方式付款
                        	</div>
		   				</div>
		   				<div id="zxia">		   					
	   						<div class="zhifu">
		                        <h3 class="title1">支付平台</h3>
		                        <span class="desc"></span>
	                        </div>
	                        <div id="zhifu1">
                        		<ul>
	                            	<li id="J_weixin">
	                            		<img src="/mimall/resources/ldy/weixin.png" alt="微信支付" style="margin-left: 0;">
	                            	</li>
	                            	<li class="J_bank">
	                            		
	                            		<img src="/mimall/resources/ldy/zhifubao.png" alt="支付宝" style="margin-left: 0;height:64px;border-bottom: 1px solid #E0E0E0;">
	                            	</li>
	                            	<li class="J_bank">
	                            		
	                            		<img src="/mimall/resources/ldy/zaixian.png" alt="银联" style="margin-left: 0;">
	                            	</li>	                            	
                        		</ul>
                            </div>
		   				</div>
		   			</div>		   			
		   		</div>
		   	</div>
		   </div>
		</div>
	</body>
</html>
