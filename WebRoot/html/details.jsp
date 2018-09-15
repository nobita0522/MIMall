<%@page import="com.mimall.vo.Product"%>
<%@page import="com.mimall.vo.Users"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>

<%
	ArrayList<Product> productList = (ArrayList<Product>) request.getAttribute("allByName");
	
 %>

<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <title><%=productList.get(0).getPNAME()%>立即购买-小米商城</title>

    <script type="text/javascript" src='<%=basePath%>js/jquery-2.1.4.js'></script>
    <link href='<%=basePath%>css/mi_item_details.css' type="text/css" rel="stylesheet"/>
    <script>

        $(function () {
        
            var $itemBox = $("#div4 .buyBox");
            var $itemDetailsImg = $(".buyBox img");
            var i = 0;

            /*  change img src */
            <%-- var changeImg = function () {
                var imgNo = i % 4 + 1;
                
                
                
                $itemDetailsImg.attr("src", '<%=basePath%>resources/images/mi6_" + imgNo + ".jpg');
                i++;
            }
 --%>
            /* let the item pic scroll with window scroll  */
            $(window).scroll(function () {
                var heightScroll = $(document).scrollTop();
                if (heightScroll > 200 && heightScroll < 900) {
                    $itemBox.css("margin-top", heightScroll - 200);
                }
            });
            window.setInterval(changeImg, 2000);

            /*  bind click event to choose version li to change class*/
            var $versionLis = $(".step-list li");
            $versionLis.click(function () {
                console.dir("111");
                $versionLis.attr("class","dontselected-step");
                $(this).attr("class","selected-step")
            });

            /*  bind click event to choose color li to change class*/
            var $chooseColorLis1 = $(".step-list2 li");
            var $chooseColorLis2 = $(".step-list3 li");
            $chooseColorLis1.click(function () {
                $chooseColorLis1.attr("class","dontselected-step");
                $chooseColorLis2.attr("class","dontselected-step");
                $(this).attr("class","selected-step");
            });
            $chooseColorLis2.click(function () {
                $chooseColorLis1.attr("class","dontselected-step");
                $chooseColorLis2.attr("class","dontselected-step");
                $(this).attr("class","selected-step");
            });

            /*  change insurance service */
            var li1 = $("#li1");
            var li2 = $("#li2");
            var checkBox1 = $("#checkBox1");
            var checkBox2 = $("#checkBox2");
            var checkBox3 = $("#checkBox3");
            var checkBox4 = $("#checkBox4");

            li1.click(function () {
                checkBox1.attr("src",'<%=basePath%>resources/img/circlecheckBox_selected.png');
                checkBox2.attr("src",'<%=basePath%>resources/img/squarecheckBox_selected.png');
                checkBox3.attr("src",'<%=basePath%>resources/img/circlecheckBox_default.png');
                checkBox4.attr("src",'<%=basePath%>resources/img/squarecheckBox_default.png');
            });
            li2.click(function () {
                checkBox1.attr("src",'<%=basePath%>resources/img/circlecheckBox_default.png');
                checkBox2.attr("src",'<%=basePath%>resources/img/squarecheckBox_default.png');
                checkBox3.attr("src",'<%=basePath%>resources/img/circlecheckBox_selected.png');
                checkBox4.attr("src",'<%=basePath%>resources/img/squarecheckBox_selected.png');
            });

            /*  change like img src */
            var $likeImg = $(".step-title5 img");
            var $likeLi = $(".step-title5 .dontselected-step");
            $likeLi.mousemove(function () {
                $likeImg.attr("src", '<%=basePath%>resources/img/like_selected.png');
            }).mouseout(function () {
                $likeImg.attr("src", '<%=basePath%>resources/img/like_default.png');
            })
            
            
             //实现鼠标滑动个人中心
    $("#personcenter").hover(
        function(){

            $(this).find('a').css('color','black');
            $(this).find(".downmenu").slideDown();
            $(this).css("background-color","white");
        },function () {
            $(this).css("background-color","#222222");
            $(this).find('a').css('color','rgb(225,225,225)');
            $(this).find(".downmenu").hide();
        }
    )

    $("#personcenter a").hover(function () {
        $(this).css('color','#FF6700');
    },function () {
        $(this).css('color','black');
    })

    $("#personcenter .downmenu a").hover(function () {
        $(this).css('background-color','rgba(225,225,225,.5)')
    },function () {
        $(this).css("background-color","white");
        $(this).css('color','black');
        }
    )

    //实现购物车显示和隐藏
    $("#topnavbar #topnavbarright #shopcart").hover(
        function () {
            $(this).find("#shopcartbox").slideDown();;
        },function () {
            $(this).find("#shopcartbox").hide();
        }
    )
            

        })

    </script>


</head>
<body>

<div>

    <!-- div1 -->
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
                	<li id="login"><a href='<%=basePath %>login?from=<%=request.getRequestURI() %>'>登录</a></li>
                	
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
                                <div><a class="goods" href="#"><img src="resources/mi8.png'><span class="desc">132</span><span class="price">1799x1</span></a><a class="delete" href="#">✖</a></div>
                                <div><a class="goods" href="#"><img src="resources/mi8.png'><span class="desc">132</span><span class="price">1799x1</span></a><a class="delete" href="#">✖</a></div>
                                <div id="totalprice"><span>共 <em>1</em> 件商品<span>1799<em>元</em></span></span><button onclick="window.location.href='http://www.baidu.com'">去购物车结算</button></div>
                        </div>

                    </li>
                </ul>

        </div>
    </div>

    <!-- div2 -->
    <div id="div2">

        <div class="content">

            <div><img src='<%=basePath%>resources/img/mi_logo.png' id="mi_logo"></div>

            <ul>
                <li class="userChoice">全部商品分类</li>
                <li class="userChoice">小米手机</li>
                <li class="userChoice">红米</li>
                <li class="userChoice">电视</li>
                <li class="userChoice">笔记本</li>
                <li class="userChoice">盒子</li>
                <li class="userChoice">新品</li>
                <li class="userChoice">路由器</li>
                <li class="userChoice">智能硬件</li>
                <li class="userChoice">服务</li>
                <li class="userChoice">社区</li>
            </ul>

            <!-- form or li to realise -->

        </div>
    </div>

    <div class="segment">
    </div>

    <!-- div3 -->
    <div id="div3">

        <div class="content">

            <h2><%=productList.get(0).getPNAME()%></h2>

           

            <ul class="itemDetails">
                <li class="userChoice2">概述</li>
                <li class="vertical">|</li>
                <li class="userChoice2">参数</li>
                <li class="vertical">|</li>
                <li class="userChoice2">F码通道</li>
                <li class="vertical">|</li>
                <li class="userChoice2">用户评价</li>
            </ul>

        </div>


    </div>

    <!-- div4 -->
    <div id="div4">

        <div class="content">

            <div class="buyBox">
                    
            <img src='<%=basePath%>resources/images/<%=productList.get(0).getIMAGE1()%>'/>
            
            
            </div>
            <div class="proInf">

                <h2><%=productList.get(0).getPNAME()%></h2>
                <div class="sale-desc"><%if(productList.get(0).getPDESC() != null) out.write(productList.get(0).getPDESC());%></div>
                <span class="pro-price"><%=productList.get(0).getNEWPRICE()%>元<del>
                <%
                	if(productList.get(0).getNEWPRICE() != productList.get(0).getORIGINALPRICE()){
                 %>
                
                <%=productList.get(0).getORIGINALPRICE()%>元</del><%} %> </span>
                <div class="user-address">
                    <img src='<%=basePath%>resources/img/address.png'/>
                    <span class="addr-item">天津</span>
                    <span class="addr-item">天津市</span>
                    <span class="addr-item">和平区</span>
                    <span class="addr-item">劝业场街道</span>
                    <span class="addr-update">修改</span>
                    <div class="item-state">
                        <span class="init">正在加载</span>
                        <span class="sale">有现货</span>
                        <span class="over">该地区暂时缺货</span>
                        <span class="no">暂时无法送达</span>
                        <span class="pre">预售商品</span>
                        <span class="book">预售商品</span>
                        <span class="nohasAddress"></span>
                        <span class="time"></span>
                    </div>
                </div>

                <div class="step-title">选择版本</div>
                <ul class="step-list">
                    <li class="selected-step"><span><%=productList.get(0).getVERSION()%></span><span class="step-list-price"><%=productList.get(0).getNEWPRICE()%>元</span></li>
                <%-- <%for(int i=0; i<productList.size()&& i<2; i++){ %> --%>
                   <!--  <li class="dontselected-step"><span>4GB+64GB</span><span class="step-list-price">949元</span></li> -->
                </ul>

                <div class="step-title2">选择颜色</div>
                <ul class="step-list2">
                    <li class="selected-step"><img src='<%=basePath%>resources/img/point_gray.png' class="image"/><span><%=productList.get(0).getPCOLOR()%></span></li>
                    <li class="dontselected-step"><img src='<%=basePath%>resources/img/point_blue.png' class="image"/><span>巴厘蓝</span></li>
                </ul>
                <ul class="step-list3">
                    <li class="dontselected-step"><img src='<%=basePath%>resources/img/point_gold.png' class="image"/><span>流沙金</span></li>
                    <li class="dontselected-step"><img src='<%=basePath%>resources/img/point_pink.png' class="image"/><span>樱花粉</span></li>
                </ul>

                <div class="step-title3">选择小米提供的保障服务</div>
                <ul class="step-list4">
                    <li class="SecurityService-selected" id="li1">
                        <div class="SecurityService-content">
                            <img src='<%=basePath%>resources/img/circlecheckBox_selected.png' class="defalut-checkBox image" id="checkBox1">
                            <img src='<%=basePath%>resources/img/insurance.jpg' class="insurance"/>
                            <div class="SecurityService-content-details" style="float: left">
                                <div>意外保障服务</div>
                                <div class="accident">手机意外摔落/进水/碾压等损坏</div>
                                <div>
                                    <img src='<%=basePath%>resources/img/squarecheckBox_selected.png' class="defalut-checkBox image" id="checkBox2">
                                    <span class="SecurityService-problems have-red">我已阅读</span>
                                    <span class="SecurityService-problems terms-problems">服务条款</span>
                                    <span class="SecurityService-problems vertical">|</span>
                                    <span class="SecurityService-problems terms-problems">常见问题</span>
                                </div>
                            </div>
                        </div>
                    </li>

                    <li class="SecurityService-default" id="li2">
                        <div class="SecurityService-content">
                            <img src='<%=basePath%>resources/img/circlecheckBox_default.png' class="defalut-checkBox image" id="checkBox3">
                            <img src='<%=basePath%>resources/img/insurance.jpg' class="insurance"/>
                            <div class="SecurityService-content-details" style="float: left">
                                <div>碎屏保障服务</div>
                                <div class="accident">手机意外碎屏</div>
                                <div>
                                    <img src='<%=basePath%>resources/img/squarecheckBox_default.png' class="defalut-checkBox image" id="checkBox4">
                                    <span class="SecurityService-problems have-red">我已阅读</span>
                                    <span class="SecurityService-problems terms-problems">服务条款</span>
                                    <span class="SecurityService-problems vertical">|</span>
                                    <span class="SecurityService-problems terms-problems">常见问题</span>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>

                <div class="step-title4">
                    <ul class="step-list4">
                        <li class="step-list4-content">
                            <div id="phone-model-data1"><%=productList.get(0).getPNAME()%> <%=productList.get(0).getVERSION()%> <%=productList.get(0).getPCOLOR()%></div>
                            <div id="phone-model-data2">碎屏保障服务</div>
                            <div id="phone-model-data3"><span>总计 : </span><span><%=productList.get(0).getNEWPRICE()%> 元</span></div>
                        </li>
                    </ul>
                </div>

                <div class="step-title5">
                    <ul class="step-list5">
                        <li class="selected-step"><span class="textone">加入购物车</span></li>
                        <li class="dontselected-step"><span class="textone"><img
                                src='<%=basePath%>resources/img/like_default.png'/><span>喜欢</span></span></li>
                    </ul>
                </div>

                <ul class="item-promise">
                    <li><img src='<%=basePath%>resources/img/right.png' class="right"></li>
                    <li>
                        <span class="right-text">7天无理由退货</span>
                    </li>
                    <li><img src='<%=basePath%>resources/img/right.png' class="right"></li>
                    <li>
                        <span class="right-text">15天质量问题换货</span>
                    </li>
                    <li><img src='<%=basePath%>resources/img/right.png' class="right"></li>
                    <li>
                        <span class="right-text">365天保修</span>
                    </li>
                    <li><img src='<%=basePath%>resources/img/right.png' class="right"></li>
                    <li>
                        <span class="right-text">7天无理由退货</span>
                    </li>
                </ul>

            </div>
        </div>
    </div>

    <!-- div5 -->
    <div id="div5">
        <div class="content">
            <h3>特别说明</h3>
            <div>
                <img src='<%=basePath%>resources/img/special_introduction.jpg' style="height: 339px;width: 1224px;margin-top: 1em"/>
            </div>
        </div>

    </div>

    <!-- div6 -->
    <div id="div6">
        <div class="content">
            <h3>官方微信</h3>
            <div>
                <img src='<%=basePath%>resources/img/official_vx.jpg' style="height: 160px;width: 1224px;margin-top: 1em"/>
            </div>
        </div>
    </div>

    <!-- 吴 博 -->
    <div id="div7">
        <div class="bottom content">

            <div class="foot_title">


                <div class="div1">
                    <a href="#"><img src='<%=basePath%>resources/image/photo11.png' class="img"/> 预约维修服务</a>
                </div>


                <div class="div2">
                    <a href="#"> <img src='<%=basePath%>resources/image/photo12.png' alt="" class="img"/> 七天无理由退货</a>
                </div>
                <div class="div3">
                    <a href="#"><img src='<%=basePath%>resources/image/photo13.png' alt="" class="img"/> 15天免费换货</a>
                </div>
                <div class="div4">
                    <a href="#"><img src='<%=basePath%>resources/image/photo14.png' alt="" class="img"/> 满150包邮</a>
                </div>
                <div class="div5">
                    <a href="#"><img src='<%=basePath%>resources/image/photo15.png' alt="" class="img1"/> 520家售后网点</a>
                </div>

            </div>
            <hr width="1200px" style="background-color: #EDEDED; position: relative; left:70px">
            <div class="foot_content">
                <div class="foot_content_1">
                    <div class="foot_content_3">帮助中心</div>
                    <div class="foot_content_2">账户管理</div>
                    <div class="foot_content_4">购物指南</div>
                    <div class="foot_content_4">订单操作</div>
                </div>
                <div class="foot_content_1">
                    <div class="foot_content_3">服务支持</div>
                    <div class="foot_content_2"> 售后政策</div>
                    <div class="foot_content_4">自助服务</div>
                    <div class="foot_content_4">相关下载</div>
                </div>
                <div class="foot_content_1">
                    <div class="foot_content_3">线下门店</div>
                    <div class="foot_content_2">小米之家</div>
                    <div class="foot_content_4">服务网点</div>
                    <div class="foot_content_4">授权体验店</div>
                </div>

                <div class="foot_content_1">
                    <div class="foot_content_3">关于小米</div>
                    <div class="foot_content_2">了解小米</div>
                    <div class="foot_content_4">加入小米</div>
                    <div class="foot_content_4">投资者关系</div>
                </div>


                <div class="foot_content_1">
                    <div class="foot_content_3">关注我们</div>
                    <div class="foot_content_2">新浪微博</div>
                    <div class="foot_content_4">官方微信</div>
                    <div class="foot_content_4">联系我们</div>
                </div>

                <div class="foot_content_1">
                    <div class="foot_content_3">特色服务</div>
                    <div class="foot_content_2">F码通道</div>
                    <div class="foot_content_4">礼物码</div>
                    <div class="foot_content_4">防伪查询</div>
                </div>
                <div class="foot_content_6">
                    <div class="foot_content_7"><p>400-100-5678</p></div>
                    <div class="foot_content_8"><p class="p1">周一至周日 8:00-18:00</p></br><p class="p2">（仅收市话费）</p></div>
                    <div class="photo16" id="photo16"></div>
                </div>
            </div>
        </div>
    </div>

    <div class="foot_bottom">
        <div class="foot_bottom1">

            <div class="photo18">

            </div>
            <div class="foot_bottom1_2">
                <div class="foot_bottom1_2_1">
                    <div class="zi1">小米商城</div>
                    <div class="zi2"> MIUI</div>
                    <div class="zi3"> 米家</div>
                    <div class="zi4"> 米聊</div>
                    <div class="zi5"> 多看</div>
                    <div class="zi6"> 游戏</div>
                    <div class="zi7"> 路由器</div>
                    <div class="zi8"> 米粉卡</div>
                    <div class="zi9"> 政企服务</div>
                    <div class="zi10"> 小米天猫店</div>
                    <div class="zi11"> 隐私政策</div>
                    <div class="zi12"> 问题反馈</div>
                    <div class="zi13"> 廉政举报</div>
                    <div class="zi14"> Select Region</div>
                </div>
                <div class="foot_bottom1_2_2">
                    <div class="zi15">
                        ©mi.com 京ICP证110507号
                    </div>

                    <div class="zi16">
                        京ICP备10046444号
                    </div>
                    <div class="zi17">
                        京公网安备11010802020134号
                    </div>
                    <div class="zi18">
                        京网文[2017]1530-131号
                    </div>
                </div>
                <div class="foot_bottom1_2_3">
                    <div class="zi19">违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
                </div>
            </div>

            <div class="foot_bottom1_2_3">
                <div class="photo19"><img src='<%=basePath%>resources/image/photo19.png' width="78px" height="27px"></div>
                <div class="photo20"><img src='<%=basePath%>resources/image/photo20.png'></div>
                <div class="photo21"><img src='<%=basePath%>resources/image/photo21.png'></div>
                <div class="photo22"><img src='<%=basePath%>resources/image/photo22.png'></div>
                <div class="photo23"><img src='<%=basePath%>resources/image/photo23.png'></div>
            </div>
        </div>

        <div class="foot_bottom2">
            探索黑米科技，小米为发烧而生
        </div>

    </div>

</div>
</body>
</html>