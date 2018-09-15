
<%@page import="com.page.PageInfo"%>
<%@page import="com.mimall.vo.Product"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
 <% ArrayList<Product> resultsList = (ArrayList<Product>)session.getAttribute("searchList"); %>
	<base href="<%=basePath%>">
		<title></title>
		<style type="text/css">
			@import url("css/mi-phone.css");
		</style>
	</head>

	<body>
		<div id="app">
			<div id="header-all">
				<div id="header">
					<a href="" id="mi-mall">小米商城</a>
					<span class="sep-left">|</span>
					<a href="" id="mi-mall">MIUI</a>
					<span class="sep-left">|</span>
					<a href="" id="mi-mall">loT</a>
					<span class="sep-left">|</span>
					<a href="" id="mi-mall">云服务</a>
					<span class="sep-left">|</span>
					<a href="" id="mi-mall">金融</a>
					<span class="sep-left">|</span>
					<a href="" id="mi-mall">有品</a>
					<span class="sep-left">|</span>
					<a href="" id="mi-mall">小爱开发平台</a>
					<span class="sep-left">|</span>
					<a href="" id="mi-mall">政企服务</a>
					<span class="sep-left">|</span>
					<a href="" id="mi-mall">Select Region</a>

					<div id="shop-car">
						<a href="" id="shop-car-1">
							<img src="resources/产品列表图集/购物车空.png" id="shop-car-2" /> 购物车
							<span>（0）</span>
						</a>
					</div>
					<a href="" id="word">消息通知</a>
					<span class="sep-right">|</span>
					<a href="" id="word">注册</a>
					<span class="sep-right">|</span>
					<a href="" id="word">登录</a>
				</div>
			</div>

			<div id="div1">
				<div id="div1-1">
					<a href=""><img src="resources/产品列表图集/mi-logo.png" class="mi-logo" /></a>
					<div id="div1-1-1">
						<ul id="div1-li">
							<li class="li">
								<a href="" class="li-header">全部商品分类</a>
							</li>
							<li class="li">
								<a href="" class="li1">小米手机</a>
							</li>
							<li class="li">
								<a href="" class="li1">红米</a>
							</li>
							<li class="li">
								<a href="" class="li1">电视</a>
							</li>
							<li class="li">
								<a href="" class="li1">笔记本</a>
							</li>
							<li class="li">
								<a href="" class="li1">空调</a>
							</li>
							<li class="li">
								<a href="" class="li1">新品</a>
							</li>
							<li class="li">
								<a href="" class="li1">路由器</a>
							</li>
							<li class="li">
								<a href="" class="li1">智能硬件</a>
							</li>
							<li class="li">
								<a href="" class="li1">服务</a>
							</li>
							<li class="li">
								<a href="" class="li1">社区</a>
							</li>
						</ul>
					</div>
					<form action="IndexServlet" method="post" id="searchform">
			            <input type="hidden" name="currentPage" value="1">
			            <input type="hidden" name="action" value="search">
			            <input type="hidden" name="target" value="results">
			            <div id="div1-1-2">
							<input type="text" id="search-text" name="PNAME" value=""/>
							<input type="submit" id="search" value="" >
							<img src="resources/img/search.png" class="search-logo" />
							
						</div>
		            </form>

				</div>
			</div>

			<div id="div2">
				<div id="div2-1">
					<a href="" id="div2-1-1">首页</a>
					<span class="sep">&gt;</span>
					<a href="" id="div2-1-1">全部结果</a>
					<span class="sep">&gt;</span>
					<a href="" id="div2-1-phone">手机</a>
				</div>
			</div>

			<div id="div3">
				<div id="div3-1">
					<div id="div3-1-1">
						<dl>
							<dt class="dt1">分类：</dt>
							<dd class="dd1-all">全部</dd>
							<dd class="dd1">
								<a href="" id="dd1-a">贴膜</a>
							</dd>
							<dd class="dd1">
								<a href="" id="dd1-a">保护套/保护壳</a>
							</dd>
							<dd class="dd1">
								<a href="" id="dd1-a">净化器</a>
							</dd>
							<dd class="dd1">
								<a href="" id="dd1-a">线材</a>
							</dd>
							<dd class="dd1">
								<a href="" id="dd1-a">相机</a>
							</dd>
							<a href="" class="dl-a">
								更多
								<img src="resources/产品列表图集/更多.png" id="dl-a-logo" />
							</a>
						</dl>
					</div>
					<div id="div3-1-2">
						<dl>
							<dt class="dt1">机型：</dt>
							<dd class="dd1-all">全部</dd>
							<dd class="dd1">
								<a href="" id="dd1-a">小米Max3</a>
							</dd>
							<dd class="dd1">
								<a href="" id="dd1-a">红米6 Pro</a>
							</dd>
							<dd class="dd1">
								<a href="" id="dd1-a">小米平板4</a>
							</dd>
							<dd class="dd1">
								<a href="" id="dd1-a">红米6A</a>
							</dd>
							<dd class="dd1">
								<a href="" id="dd1-a">红米6</a>
							</dd>
							<a href="" class="dl-a">
								更多
								<img src="resources/产品列表图集/更多.png" id="dl-a-logo" />
							</a>
						</dl>
					</div>
					<div id="div3-1-3">
						<dl>
							<dt class="dt1">品牌：</dt>
							<dd class="dd1-all">全部</dd>
							<dd class="dd1">
								<a href="" id="dd1-a">小米</a>
							</dd>
							<dd class="dd1">
								<a href="" id="dd1-a">第三方品牌</a>
							</dd>
							<dd class="dd1">
								<a href="" id="dd1-a">ZMI</a>
							</dd>
							<dd class="dd1">
								<a href="" id="dd1-a">1MORE</a>
							</dd>
							<dd class="dd1">
								<a href="" id="dd1-a">米家</a>
							</dd>
						</dl>
					</div>
				</div>
			</div>

			<div id="div4">
				<div class="div4-1">
					<div id="div4-1-1">
						<ul id="div4-ul1">
							<li class="div4-li">
								<a href="" class="div4-ul1-A">推荐</a>
							</li>
							<li class="div4-li1">
								<a href="" class="div4-ul1-a">新品</a>
							</li>
							<li class="div4-li1">
								<a href="" class="div4-ul1-a">价格  ↑</a>
							</li>
							<li class="div4-li1">
								<a href="" class="div4-ul1-a">评论最多</a>
							</li>
						</ul>
					</div>
					<div id="div4-1-2">
						<ul id="div4-ul2">
							<li class="div4-li2">
								<a href="" class="div4-ul1-a">
									<span id="div4-checkbox"></span> 查看评价
								</a>
							</li>
							<li class="div4-li2">
								<a href="" class="div4-ul1-a">
									<span id="div4-checkbox"></span> 仅显示特惠商品
								</a>
							</li>
							<li class="div4-li2">
								<a href="" class="div4-ul1-a">
									<span id="div4-checkbox"></span> 仅显示有货商品
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<div id="div5">
				<div id="div5-1">
					<div id="div5-1-1">
						
					<%
						for(int i=0; i<resultsList.size()&&i<4;i++){
					%>
					
						<div class="class2">
						<%
							for(int j=i*4; j<resultsList.size()&&j<(i+1)*4;j++){
								Product product =(Product) resultsList.get(j);
					%>
					
						<% if(j==i*4){%>
							<div class="iphone">
								<div id="div5-logo">
									<div id="div5-like">
										<img src="resources/产品列表图集/喜欢.png"/>
										<p id="like-text">喜欢</p>
									</div>
									<div id="div5-shopcar">
										<img src="resources/产品列表图集/加入购物车.png"/>
										<p id="shopcar-text">加入购物车</p>
									</div>
								</div>
								<a href=""><img src="resources/images/<%=product.getIMAGE1() %>" class="photo" /></a>
								<div class="iphone-text">
									<a href="" class="iphone-text-a"><%=product.getPNAME()+" "+product.getVERSION()+" "+product.getPCOLOR()  %></a>
								</div>
								<div class="iphone-text1">
									<p class="price">
										<%=product.getNEWPRICE() %>元
										<%if(product.getORIGINALPRICE() != product.getNEWPRICE()) {%>
										<del><%=product.getORIGINALPRICE() %></del>
										<%} %>
									</p>
								</div>
							</div>
						<%}else{%>
						
							<div class="iphone1">
								<div id="div5-logo">
									<div id="div5-like">
										<img src="resources/产品列表图集/喜欢.png"/>
										<p id="like-text">喜欢</p>
									</div>
									<div id="div5-shopcar">
										<img src="resources/产品列表图集/加入购物车.png"/>
										<p id="shopcar-text">加入购物车</p>
									</div>
								</div>
								<a href=""><img src='resources/images/<%=product.getIMAGE1() %>' class="photo" /></a>
								<div class="iphone-text">
									<a href="" class="iphone-text-a"><%=product.getPNAME()+" "+product.getVERSION()+" "+product.getPCOLOR()  %></a>
								</div>
								<div class="iphone-text1">
									<p class="price">
										<%=product.getNEWPRICE() %>元
										<%if(product.getORIGINALPRICE() != product.getNEWPRICE()) {%>
										<del><%=product.getORIGINALPRICE() %></del>
										<%} %>
									</p>
								</div>
							</div>
						<%} }%>
		
						</div>
					<% }%>
					</div>
				</div>

			</div>

			<div id="div6">
				<div id="div6-1">
					<div class="div6-1-1">
						<p class="left"><img src="resources/产品列表图集/left.png" class="left-logo" /></p>
					<%PageInfo pageInfo = (PageInfo)(session.getAttribute("searchPageInfo"));
						int totalPageCount =  pageInfo.getTotalPageCount();
						int currentPage = pageInfo.getCurrentPage();
						for(int i=1; i<=totalPageCount; i++){
							if(i == currentPage){
					%>
							<a href="">
								<p class="number1"><%=i%></p>
							</a>
							
					<% 		}else{%>
							<a href="">
								<p class="number"><%=i%></p>
							</a>
						<% }
					}
					%>
						
						<a href="">
							<p class="right"><img src="resources/产品列表图集/right.png" class="right-logo" /></p>
						</a>
					</div>
				</div>
			</div>

			<div id="div7">
				<h2 class="h2"><div>您还看了</div></h2>
				<div id="div7-1">
					<div id="div7-1-1">
						<div class="class3">
							<a href=""><img src="resources/产品列表图集/7-1.jpg" class="div7-photo" /></a>
							<div class="div7-text">
								<a href="" class="div7-text-a">小米8 透明探索版 8GB内存</a>
							</div>
							<div class="div7-text1">
								<p class="div7-price">3699元</p>
							</div>
							<div class="div7-text2">
								<div class="div7-good">1.1万人好评</div>
								<div class="div7-text2-box">加入购物车</div>
							</div>
						</div>
						<div class="class4">
							<a href=""><img src="resources/产品列表图集/7-2.jpg" class="div7-photo" /></a>
							<div class="div7-text">
								<a href="" class="div7-text-a">小米简约头层小牛皮钱包</a>
							</div>
							<div class="div7-text1">
								<p class="div7-price">129元</p>
							</div>
							<div class="div7-text2">
								<div class="div7-good">1.1万人好评</div>
								<div class="div7-text2-box">加入购物车</div>
							</div>
						</div>
						<div class="class4">
							<a href=""><img src="resources/产品列表图集/7-3.png" class="div7-photo" /></a>
							<div class="div7-text">
								<a href="" class="div7-text-a">最生活毛巾•Air（100条装）</a>
							</div>
							<div class="div7-text1">
								<p class="div7-price">690元</p>
							</div>
							<div class="div7-text2">
								<div class="div7-good">1.1万人好评</div>
								<div class="div7-text2-box">加入购物车</div>
							</div>
						</div>
						<div class="class4">
							<a href=""><img src="resources/产品列表图集/7-4.jpg" class="div7-photo" /></a>
							<div class="div7-text">
								<a href="" class="div7-text-a">小米3L软壳风衣 男款</a>
							</div>
							<div class="div7-text1">
								<p class="div7-price">129元</p>
							</div>
							<div class="div7-text2">
								<div class="div7-good">1.1万人好评</div>
								<div class="div7-text2-box">加入购物车</div>
							</div>
						</div>
						<div class="class4">
							<a href=""><img src="resources/产品列表图集/7-5.jpg" class="div7-photo" /></a>
							<div class="div7-text">
								<a href="" class="div7-text-a">90分简约头层小牛皮零钱包</a>
							</div>
							<div class="div7-text1">
								<p class="div7-price">69元</p>
							</div>
							<div class="div7-text2">
								<div class="div7-good">1.1万人好评</div>
								<div class="div7-text2-box">加入购物车</div>
							</div>
						</div>
					</div>
					<div id="div7-1-2">
						<div id="div7-1-p">
							<p class="div7-p1">○</p>
							<p class="div7-p2">●</p>
						</div>
					</div>
				</div>
			</div>

			<div id="div8">
				<div id="div8-1">
					<div id="div8-1-1">
						<ul class="div8-ul">
							<li class="div8-li1">
								<a href="" class="div8-li-a">
									<img src="resources/产品列表图集/photo1.png"/ class="div8-photo1">
									<p>预约维修服务</p>
								</a>
							</li>
							<li class="div8-li"> 
								<a href="" class="div8-li-a">
									<img src="resources/产品列表图集/photo2.png" class="div8-photo1"/>
									<p>7天无理由退货</p>
								</a>
							</li>
							<li class="div8-li">
								<a href="" class="div8-li-a">
									<img src="resources/产品列表图集/photo3.png" class="div8-photo1"/>
									<p>15天免费换货</p>
								</a>
							</li>
							<li class="div8-li">
								<a href="" class="div8-li-a">
									<img src="resources/产品列表图集/photo4.png" class="div8-photo1"/>
									<p>满150元包邮</p>
								</a>
							</li>
							<li class="div8-li">
								<a href="" class="div8-li-a">
									<img src="resources/产品列表图集/photo5.png" class="div8-photo1"/>
									<p>520余家售后网点</p>
								</a>
							</li>
						</ul>
					</div>
					<div id="div8-1-2">
						<dl class="div8-dl">
							<dt class="div8-dt">帮助中心</dt>
							<dd class="div8-dd">
								<a href="" class="div8-dd-a">账户管理</a>
							</dd>
							<dd class="div8-dd1">
								<a href="" class="div8-dd-a">购物指南</a>
							</dd>
							<dd class="div8-dd1">
								<a href="" class="div8-dd-a">订单操作</a>
							</dd>
						</dl>
						
						<dl class="div8-dl">
							<dt class="div8-dt">服务支持</dt>
							<dd class="div8-dd">
								<a href="" class="div8-dd-a">售后政策</a>
							</dd>
							<dd class="div8-dd1">
								<a href="" class="div8-dd-a">自助服务</a>
							</dd>
							<dd class="div8-dd1">
								<a href="" class="div8-dd-a">相关下载</a>
							</dd>
						</dl>
						
						<dl class="div8-dl">
							<dt class="div8-dt">线下门店</dt>
							<dd class="div8-dd">
								<a href="" class="div8-dd-a">小米之家</a>
							</dd>
							<dd class="div8-dd1">
								<a href="" class="div8-dd-a">服务网点</a>
							</dd>
							<dd class="div8-dd1">
								<a href="" class="div8-dd-a">授权体验店</a>
							</dd>
						</dl>
						
						<dl class="div8-dl">
							<dt class="div8-dt">关于小米</dt>
							<dd class="div8-dd">
								<a href="" class="div8-dd-a">了解小米</a>
							</dd>
							<dd class="div8-dd1">
								<a href="" class="div8-dd-a">加入小米</a>
							</dd>
							<dd class="div8-dd1">
								<a href="" class="div8-dd-a">投资者关系</a>
							</dd>
						</dl>
						
						<dl class="div8-dl">
							<dt class="div8-dt">关注我们</dt>
							<dd class="div8-dd">
								<a href="" class="div8-dd-a">新浪微博</a>
							</dd>
							<dd class="div8-dd1">
								<a href="" class="div8-dd-a">官方微信</a>
							</dd>
							<dd class="div8-dd1">
								<a href="" class="div8-dd-a">联系我们</a>
							</dd>
						</dl>
						
						<dl class="div8-dl">
							<dt class="div8-dt">特色服务</dt>
							<dd class="div8-dd">
								<a href="" class="div8-dd-a">F 码通道</a>
							</dd>
							<dd class="div8-dd1">
								<a href="" class="div8-dd-a">礼物码</a>
							</dd>
							<dd class="div8-dd1">
								<a href="" class="div8-dd-a">防伪查询</a>
							</dd>
						</dl>
						
						<div id="div8-1-2-1">
							<p class="telphone-number">400-100-5678</p>
							<p class="time-text">
								周一至周日 8:00-18:00
								<br>
								（仅收市话费）
							</p>
							<div class="sever"></div>
						</div>
				 	</div>
				</div>
				
			</div>
			
			<div id="div9">
				<div id="div9-1">
					<div id="div9-1-1">
						<div id="div9-logo"><img src="resources/产品列表图集/foot-milogo.png"/></div>
						<div id="four-photo">
							<a href="" class="photo-a"><img src="resources/产品列表图集/1 (1).png"/></a>
							<a href="" class="photo-a"><img src="resources/产品列表图集/1 (2).png"/></a>
							<a href="" class="photo-a"><img src="resources/产品列表图集/1 (3).png"/></a>
							<a href="" class="photo-a"><img src="resources/产品列表图集/1 (4).png"/></a>
							<a href="" class="photo-a"><img src="resources/产品列表图集/1 (5).png"/></a>
						</div>
						<div class="foot-text">
							<p class="foot-text-p1">
								<a href="" class="foot-a">小米商城</a>
								<span class="foot-sep">|</span>
								<a href="" class="foot-a">MIUI</a>
								<span class="foot-sep">|</span>
								<a href="" class="foot-a">米家</a>
								<span class="foot-sep">|</span>
								<a href="" class="foot-a">米聊</a>
								<span class="foot-sep">|</span>
								<a href="" class="foot-a">多看</a>
								<span class="foot-sep">|</span>
								<a href="" class="foot-a">游戏</a>
								<span class="foot-sep">|</span>
								<a href="" class="foot-a">路由器</a>
								<span class="foot-sep">|</span>
								<a href="" class="foot-a">米粉卡</a>
								<span class="foot-sep">|</span>
								<a href="" class="foot-a">企业服务</a>
								<span class="foot-sep">|</span>
								<a href="" class="foot-a">小米天猫店</a>
								<span class="foot-sep">|</span>
								<a href="" class="foot-a">隐私政策</a>
								<span class="foot-sep">|</span>
								<a href="" class="foot-a">问题反馈</a>
								<span class="foot-sep">|</span>
								<a href="" class="foot-a">廉政举报</a>
								<span class="foot-sep">|</span>
								<a href="" class="foot-a">Select Region</a>
							</p>
							<p class="foot-text-p2">
								©
								<a href="">mi.com</a>
								京ICP证110507号
								<a href="">京ICP备10046444号</a>
								<a href="">京公网安备11010802020134号</a>
								<a href="">京网文[2017]1530-131号</a>
								<br>
								违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试
							</p>
						</div>
					</div>
					<div id="div9-1-2"><p>探索黑科技，小米为发烧而生！</p></div>
				</div>
				
			</div>

		</div>
	</body>

</html>