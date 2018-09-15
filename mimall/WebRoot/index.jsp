<%@page import="com.mimall.vo.Users"%>
<%@page import="com.mimall.vo.Product"%>
<%@page import="com.mimall.vo.Category"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<head>


    <title>小米商城</title>
	<base href="<%=basePath%>">
    <script src = "js/jquery-2.1.4.js"></script>

    <script src="js/style.js"></script>
    <script type="text/javascript">
    	$(function(){
    		$("#search").click(function(){
    			$("#searchform").submit();
    		})
    	})
    </script>
    
    <link rel="stylesheet" type="text/css" href="css/style.css">
    
    


</head>
<body>
<div id="main">
    <!--活动栏-->
    <div class="box"></div>
    <!--顶部导航栏-->
    <div class="topbox">
        <div id="topnavbar" class="box">

                <ul id="topnavbarleft">
                    <li><a href="#">小米商城</a></li>
                    <li class="sep"><span>|</span></li>
                    <li><a href="#">MIUI</a></li>
                    <li class="sep"><span>|</span></li>
                    <li><a href="#">loT</a></li>
                    <li class="sep"><span>|</span></li>
                    <li><a href="#">云服务</a></li>
                    <li class="sep"><span>|</span></li>
                    <li><a href="#">金融</a></li>
                    <li class="sep"><span>|</span></li>
                    <li><a href="#">有品</a></li>
                    <li class="sep"><span>|</span></li>
                    <li><a href="#">小爱开放平台</a></li>
                    <li class="sep"><span>|</span></li>
                    <li><a href="#">Select Region</a></li>
                </ul>

                <ul id="topnavbarright">
                <% 
                	Users user =  (Users)session.getAttribute("user");
                	if(user == null){
                	
                 %>
                	<li id="login"><a href='login?from=<%=request.getRequestURI() %>'>登录</a></li>
                	
                	<%}else{
                		
                	 %>
                    <li id="personcenter" >
                        <a href="#">
                            <%=user.getUNAME() %>
                        </a>
                        <ul class="downmenu">
                            <li><a href="#">个人中心</a></li>
                            <li><a href="#">评价晒单</a></li>
                            <li><a href="#">小米账户</a></li>
                            <li><a href='login?target=<%=request.getRequestURI() %>&action=loginout'>退出登录</a></li>
                        </ul>
                    </li>
                    
                    <%} %>
                    <li class="sep"><span>|</span></li>
                    <li><a href="#">消息通知</a></li>
                    <li class="sep"><span>|</span></li>
                    <li><a href="#">我的订单</a></li>
                    <li class="sep"><span>|</span></li>
                    <li id="shopcart"><a href="#">购物车</a>
                        <div id="shopcartbox" >
                            <div id="nogoodscart" style="display: none" ><p>购物车中还没有商品，赶紧选购吧！</p></div>
                            <div id="hasgoodscart">
                                <div><a class="goods" href="#"><img src="resources/mi8.png"><span class="desc">132</span><span class="price">1799x1</span></a><a class="delete" href="#">✖</a></div>
                                <div><a class="goods" href="#"><img src="resources/mi8.png"><span class="desc">132</span><span class="price">1799x1</span></a><a class="delete" href="#">✖</a></div>
                                <div id="totalprice"><span>共 <em>1</em> 件商品<span>1799<em>元</em></span></span><button onclick="window.location.href='http://www.baidu.com'">去购物车结算</button></div>
                        </div>

                    </li>
                </ul>

        </div>
    </div>

    <div class="box">
        <div id="secondnavbar">
            <a href="#" id="logo"><img src="resources/top_grid/logo.png"></a>
            <ul>
                <li id="gifimg"><a href="#"><img src="resources/top_grid/816.gif"></a></li>
                <li class="topbutton"><a href="#">小米手机</a>
                    <div class="downmenu2">
                        <ul class="dropdownmenu">
                        <% ArrayList<Product> xiaoMiPhoneList= (ArrayList<Product>)application.getAttribute("xiaoMiPhone");
                        	for(int i=0; i<xiaoMiPhoneList.size()&& i<6; i++ ){
                        %>
                            <li>
                                <div class="topnav">
                                    <div>
                                        <%if(xiaoMiPhoneList.get(i).getPDESC() != null){%>
                                        	<div class="flag"><%=xiaoMiPhoneList.get(i).getPDESC() %></div>
                                        	
                                        	<% }else{%>
                                        	
                                        	<div class="flag" style="border: none"></div>
                                        	<%}%>
                                        <div><a href='ProductServlet?action=details&product=<%=xiaoMiPhoneList.get(i).getPID() %>'><img src='<%=basePath +"resources/images/"+ xiaoMiPhoneList.get(i).getIMAGE1()%>'><p><%=xiaoMiPhoneList.get(i).getPNAME() %></p></a></div>
                                        <div class="price"><%=xiaoMiPhoneList.get(i).getNEWPRICE() %>元</div>
                                    </div>
                                </div>
                            </li>
                           <%} %>
                        </ul>
                    </div>
                </li>
                <li><a href="#">红米</a></li>
                <li><a href="#">电视</a></li>
                <li><a href="#">笔记本</a></li>
                <li><a href="#">空调</a></li>
                <li><a href="#">笔记本</a></li>
                <li><a href="#">新品</a></li>
                <li><a href="#">路由器</a></li>
                <li><a href="#">智能硬件</a></li>
                <li><a href="#">服务</a></li>
                <li><a href="#">社区</a></li>
            </ul>
            
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



    <!--顶部轮播图-->
    <div id="daohanglunbo" class="box" >

        <div class="leftdaohang">
            <ul class="daohangul" id="daohanghandle">
            <%
            	List<Category> allCategoryList = (List<Category>)application.getAttribute("allCategoryList");
            	
            	for(Category category:allCategoryList){
            	
             	
             %>
                <li class="rightdaohangnav daohanghandle" value="<%=category.getCid() %>">
                    <a href="#"><%=category.getCname() %></a>
                    <div class="rightdaohang">
                        
                        <%
                        	List<Product> allProductOfCategory = (List<Product>)application.getAttribute("category"+category.getCid());
                        	int pageCount = allProductOfCategory.size()%6>0?allProductOfCategory.size()/6+1:allProductOfCategory.size()/6;
                        	for(int i=0; i<pageCount; i++){
                        	
                         %>
                        
                        <div class="rightdaohangnav rightdaohangdiv">
                            <ul class="daohangul">
                            	<%  for(int j=i*6; j<allProductOfCategory.size(); j++){
                            			Product product = allProductOfCategory.get(j);
                            			if(j<(i+1)*6){
                            			
                            	  %>
                                <li><a href='ProductServlet?action=details&product=<%=product.getPID() %>'><img  src='<%=basePath+"resources/images/"+product.getIMAGE1() %>'>&nbsp;&nbsp;&nbsp;&nbsp;<span><%=product.getPNAME() %></span></a></li>
                                <%
                                		}else{
                                			continue;
                                		}
                                	}
                                 %>
                            </ul>
                        </div>
                        
                        <%
                        	}
                         %>
                    </div>
                </li>
                
              <%
              	}
               %>
                
            </ul>
        </div>

        <div id="lunbo">
            <table>
                <tr  class="button1" href="mi.com/index.html">
                    <td colspan="3"><a href="#"></a></td>
                </tr>
                <tr>
                    <td id="button1" class="button"><a><img src="resources/daohanglunbo/left02.gif"><img src="resources/daohanglunbo/left01.gif" style="display: none"></a></td>
                    <td  class="button2"><a href="#"></a></td>
                    <td id="button2" class="button"><a><img src="resources/daohanglunbo/right02.gif"><img src="resources/daohanglunbo/right01.gif" style="display: none"></a></td>
                </tr>
                <tr  class="button1">
                    <td colspan="3"><a href="#"></a></td>
                </tr>
            </table>
        </div>

    </div>


    <!--内容-->
    <div id="content" class="box">
        <div id="leftcontent">
            <div>
                <ul>
                    <li><a href="#"><img src="resources/content/content_left/1.gif"></a></li>
                    <li><a href="#"><img src="resources/content/content_left/2.gif"></a></li>
                    <li><a href="#"><img src="resources/content/content_left/3.gif"></a></li>
                </ul>
            </div>
            <div>
                <ul>
                    <li class="firstli"><a href="#"><img src="resources/content/content_left/4.gif"></a></li>
                    <li><a href="#"><img src="resources/content/content_left/5.gif"></a></li>
                    <li><a href="#"><img src="resources/content/content_left/6.gif"></a></li>
                </ul>
            </div>
        </div>
        <div id="rightcontent">
            <ul>
                <li><a href="#"><img src="resources/content/hongmi.jpg"></a></li>
                <li><a href="#"><img src="resources/content/shouhuan.jpg"></a></li>
                <li><a href="#"><img src="resources/content/mix.jpg"></a></li>
            </ul>
        </div>
    </div>


    <div class="contentbox">

        <!--手机展示-->
	<%	for(int j=0; j<allCategoryList.size(); j++){
        	ArrayList<Product>	productList =(ArrayList<Product>) application.getAttribute("category"+allCategoryList.get(j).getCid()); 
        	if(productList != null && productList.size()>0){
        
        %>
        <h2 class="box title"><div class="titleleft"><%=allCategoryList.get(j).getCname() %></div></h2>
        <div id="phone" class="box allcontent">
            <div class="showleft">
                <ul>
                    <li>
                        <div><a href="#"><img src="resources/bigmax3.jpg"></a></div>
                    </li>
                </ul>
            </div>
            <div class="showright">
                <ul>
                <%
                	for(int i=0; i<productList.size()&&i<8; i++){
                		Product xiaoMiPhone = productList.get(i);
                 %>
                    <li>
                        <div>
                            <%if(xiaoMiPhone.getPDESC() != null){%>
                            <div class="flag"><%=xiaoMiPhone.getPDESC() %></div>
                           <% }else{%>
                            <div class="flag" style="border: none; background-color: rgba(0,0,0,0);"></div>
                           <%} %>
                             
                            <div><a href='ProductServlet?action=details&product=<%=xiaoMiPhone.getPID()%>'><img src='<%=basePath+"resources/images/"+xiaoMiPhone.getIMAGE1() %>'><p><%=xiaoMiPhone.getPNAME() %></p></a></div>
                            <div class="price"><%=xiaoMiPhone.getNEWPRICE() %>元</div>
                        </div>
                    </li>
                    <%
                    	}
                     %>
               
	
                </ul>
            </div>
        </div>
		<%
			}
		}%>
     
        
    </div>


    <!--底部-->









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

<!-- <script type="text/javascript">
    	$(function(){    		
    	
    	
    	
    	  //右侧展开栏
	   		$(".daohanghandle").hover(function () {
			        var $top=$(this).parent().offset().top;
			        var $left = $(this).offset().left;
			        var cidvalue = $(this).val();
			        $(this).find(".rightdaohang").css("top",$top+'px');
			        $(this).find(".rightdaohang").css("left",$left+231.8+'px');
			        $.post("IndexServlet",{"action":"getKindByCid","CID":cidvalue},
					function(productList){			
						//在回调函数中  使用dom技术  更新   category2下拉列表框
						var pageCount = 0;		    		
			    		pageCount = Math.ceil(productList.length/6);			    								
		    		 	var leftDaohang ='';				    		 		
		    			for(var j=0; j<pageCount; j++){
		    		 	leftDaohang = leftDaohang+'<div class="rightdaohangnav rightdaohangdiv"> <ul class="daohangul">';	
		    				for(var i=j*6; i<productList.length; i++){
		    					if(i<(j+1)*6){
		    						var pImage = productList[i].IMAGE1;
						    		var pname = productList[i].PNAME;
						    		leftDaohang = leftDaohang +
			                                '<li><a href="#"><img  src="resources/daohanglunbo/'+pImage+'">&nbsp;&nbsp;&nbsp;&nbsp;<span>'
			                                +pname+
			                                '</span></a></li>';                             
						    		 alert(pname); 
		    					}else{
		    						continue;
		    					}
			    				
		    				}
			    			
			    			leftDaohang = leftDaohang + '</ul></div>'
			    			}
		    			$(".daohanghandle").find(".rightdaohang").show();
			    			alert(leftDaohang);   
			    		
					},"json");
			        
			        
	    	},function(){
	    		$(this).find(".rightdaohang").hide();
	    	}
	    	)
	    	

    </script> -->

</body>


</html>