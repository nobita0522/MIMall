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


    <script src = "js/jquery-2.1.4.js"></script>

    <script src="js/style.js"></script>
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
                            <li>
                                <div class="topnav">
                                    <div>
                                        <div class="flag">123</div>
                                        <div><a href="#"><img src="resources/123.png"><p>小米8</p></a></div>
                                        <div class="price">1299元</div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="topnav">
                                    <div>
                                        <div class="flag">123</div>
                                        <div><a href="#"><img src="resources/123.png"><p>小米8</p></a></div>
                                        <div class="price">1299元</div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="topnav">
                                    <div>
                                        <div class="flag">123</div>
                                        <div><a href="#"><img src="resources/123.png"><p>小米8</p></a></div>
                                        <div class="price">1299元</div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="topnav">
                                    <div>
                                        <div class="flag">123</div>
                                        <div><a href="#"><img src="resources/123.png"><p>小米8</p></a></div>
                                        <div class="price">1299元</div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="topnav">
                                    <div>
                                        <div class="flag">123</div>
                                        <div><a href="#"><img src="resources/123.png"><p>小米8</p></a></div>
                                        <div class="price">1299元</div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="topnav">
                                    <div>
                                        <div class="flag">123</div>
                                        <div><a href="#"><img src="resources/123.png"><p>小米8</p></a></div>
                                        <div class="price">1299元</div>
                                    </div>
                                </div>
                            </li>
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
                                <li><a href='<%=basePath%>ProductServlet?action=details&product=<%=product.getPID() %>'><img  src='<%=basePath+"resources/images/"+product.getIMAGE1() %>'>&nbsp;&nbsp;&nbsp;&nbsp;<span><%=product.getPNAME() %></span></a></li>
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
        <h2 class="box title"><div class="titleleft">手机</div><div class="titleright"><a href="#">手机<i class="arrow">></i></a></div></h2>

        <!--手机展示-->

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
                	ArrayList<Product>	productList =(ArrayList<Product>) application.getAttribute("category"+allCategoryList.get(0).getCid());            	
                	for(int i=0; i<productList.size()&&i<8; i++){
                		Product xiaoMiPhone = productList.get(i);
                	
                
                 %>
                    <li>
                        <div>
                            <div class="flag">
                            <%if(xiaoMiPhone.getPDESC() != null){
                            	out.print(xiaoMiPhone.getPDESC());
                            }
                             %></div>
                             
                            <div><a href="#"><img src='<%=basePath+"resources/images/"+xiaoMiPhone.getIMAGE1() %>'><p><%=xiaoMiPhone.getPNAME() %></p></a></div>
                            <div class="price"><%=xiaoMiPhone.getNEWPRICE() %>元</div>
                        </div>
                    </li>
                    <%
                    	}
                     %>
               
	
                </ul>
            </div>
        </div>

        <!--2-->
        <h2 class="box title"><div class="titleleft">配件</div><div class="titleright">全部配件></div></h2>
        <div id="miband" class="box allcontent">
            <div class="showleft">
                <ul>
                    <li>
                        <div><a href="#"><img src="resources/bigmax3.jpg"></a></div>
                    </li>
                </ul>
            </div>
            <div class="showright">
                <ul>
                    <li>
                        <div>
                            <div class="flag">123</div>
                            <div><a href="#"><img src="resources/erji.png"><p>小米8</p></a></div>
                            <div class="price">1299元</div>
                        </div>
                    </li>
                    <li>
                        <div>
                            <div class="flag">123</div>
                            <div><a href="#"><img src="resources/erji.png"><p>小米8</p></a></div>
                            <div class="price">1299元</div>
                        </div>
                    </li>
                    <li>
                        <div>
                            <div class="flag">123</div>
                            <div><a href="#"><img src="resources/erji.png"><p>小米8</p></a></div>
                            <div class="price">1299元</div>
                        </div>
                    </li>
                    <li>
                        <div>
                            <div class="flag">123</div>
                            <div><a href="#"><img src="resources/erji.png"><p>小米8</p></a></div>
                            <div class="price">1299元</div>
                        </div>
                    </li>
                    <li>
                        <div>
                            <div class="flag">123</div>
                            <div><a href="#"><img src="resources/erji.png"><p>小米8</p></a></div>
                            <div class="price">1299元</div>
                        </div>
                    </li>
                    <li>
                        <div>
                            <div class="flag">123</div>
                            <div><a href="#"><img src="resources/erji.png"><p>小米8</p></a></div>
                            <div class="price">1299元</div>
                        </div>
                    </li>
                    <li>
                        <div>
                            <div class="flag">123</div>
                            <div><a href="#"><img src="resources/erji.png"><p>小米8</p></a></div>
                            <div class="price">1299元</div>
                        </div>
                    </li>
                    <li>
                        <div>
                            <div class="flag">123</div>
                            <div><a href="#"><img src="resources/erji.png"><p>小米8</p></a></div>
                            <div class="price">1299元</div>
                        </div>
                    </li>

                </ul>
            </div>
        </div>
    </div>


    <!--底部-->


    <div class="box"></div>

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