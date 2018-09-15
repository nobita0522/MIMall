<%@ page language="java" import="java.util.*,com.mimall.vo.*,com.mimall.service.impl.*,com.mimall.service.inter.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Title</title>
     <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link type="text/css" rel="stylesheet" href="resources/css/wbcss.css"/>
    <script type="text/javascript" src="resources/js/jquery-2.1.4.js" charset="utf-8"></script>
    <script type="text/javascript">
        $(function () {

            $xiala=$("#xiala");
            $head_topbarinfo=$(".head_topbarinfo");
            $xialakuang=$(".blockhidden");
            $head_topbarinfo.bind("mouseover",function () {


                $xialakuang.prop("class","block");


            });

            $head_topbarinfo.bind("mouseout",function () {


                $xialakuang.prop("class","blockhidden");


            });

            $photo16=$("#photo16");
            $photo16.bind("mouseover",function () {
                $photo16.attr("class","photo17");
            });

            $photo16.bind("mouseout",function () {
                $photo16.attr("class","photo16");
            });

            $pinglun=$(".pinglun");
            $pinglun1=$(".pinglun1");
            $pinglun2=$(".pinglun2");
            $pinglun3=$(".pinglun3");
            $pinglun4=$(".pinglun4");
            $pinglun5=$(".pinglun5");
            $pinglun6=$(".pinglun6");
            $pinglun7=$(".pinglun7");
            $pinglun8=$(".pinglun8");
            $pinglun9=$(".pinglun9");


            $milog=$("#milog");

    $shoppingziti3=$(".shoppingziti3");
    $pinglun.bind("mouseover",function () {

        $(".pinglun").addClass("pinglunphoto");
        $(".pinglun").html("");

    });


            $pinglun.bind("mouseout",function () {


                $(".pinglun").html("750人好评");
                $(".pinglun").removeClass("pinglunphoto");
            });


            $pinglun1.bind("mouseover",function () {

                $(".pinglun1").addClass("pinglunphoto");
                $(".pinglun1").html("");

            });


            $pinglun1.bind("mouseout",function () {


                $(".pinglun1").html("1万人好评");
                $(".pinglun1").removeClass("pinglunphoto");
            });


            $pinglun2.bind("mouseover",function () {

                $(".pinglun2").addClass("pinglunphoto");
                $(".pinglun2").html("");

            });


            $pinglun2.bind("mouseout",function () {


                $(".pinglun2").html("11.1万人好评");
                $(".pinglun2").removeClass("pinglunphoto");
            });


            $pinglun3.bind("mouseover",function () {

                $(".pinglun3").addClass("pinglunphoto");
                $(".pinglun3").html("");

            });


            $pinglun3.bind("mouseout",function () {


                $(".pinglun3").html("3003人好评");
                $(".pinglun3").removeClass("pinglunphoto");
            });


            $pinglun4.bind("mouseover",function () {

                $(".pinglun4").addClass("pinglunphoto");
                $(".pinglun4").html("");

            });


            $pinglun4.bind("mouseout",function () {


                $(".pinglun4").html("9338人好评");
                $(".pinglun4").removeClass("pinglunphoto");
            });


            $pinglun5.bind("mouseover",function () {

                $(".pinglun5").addClass("pinglunphoto");
                $(".pinglun5").html("");

            });


            $pinglun5.bind("mouseout",function () {


                $(".pinglun5").html("4979人好评");
                $(".pinglun5").removeClass("pinglunphoto");
            });


            $pinglun6.bind("mouseover",function () {

                $(".pinglun6").addClass("pinglunphoto");
                $(".pinglun6").html("");

            });


            $pinglun6.bind("mouseout",function () {


                $(".pinglun6").html("3222人好评");
                $(".pinglun6").removeClass("pinglunphoto");
            });



            $pinglun7.bind("mouseover",function () {

                $(".pinglun7").addClass("pinglunphoto");
                $(".pinglun7").html("");

            });


            $pinglun7.bind("mouseout",function () {


                $(".pinglun7").html("1.3万人好评");
                $(".pinglun7").removeClass("pinglunphoto");
            });



            $pinglun8.bind("mouseover",function () {

                $(".pinglun8").addClass("pinglunphoto");
                $(".pinglun8").html("");

            });


            $pinglun8.bind("mouseout",function () {


                $(".pinglun8").html("5.2万人好评");
                $(".pinglun8").removeClass("pinglunphoto");
            });




            $zongmilog=$("#zongmilog");
            $twomilog=$("#twomilog");
            $milog2=$(".milog2");
            $milog1=$(".milog1");

           $twomilog.bind("mouseover",function () {
              ;
                $twomilog.fadeIn();

            })

            $twomilog.bind("mouseout",function () {

                $twomilog.fadeOut();

            })


        });
        
        


        $(function () {
          
            
                var name = $("#shoppingziti1").html();
                var price = $("#shoppingziti2").html();
                var img1 = $("#othershopping2").attr('src');
                
            
                



                var selectAll = $("#selectall");

                var selectbutton = $(".selected");



                selectAll.click(function(){
                    if(selectAll.prop("checked")){
                        $(".selected").prop("checked",true);
                       $(".gotojiesuan").css("background-image", 'url("resources/wbimage/photo27.png")');
                    }
                    else{
                        $(".selected").prop("checked",false);
                        $(".gotojiesuan").css("background-image", 'url("resources/wbimage/photo27.png")');
                    }
                    changeTotalPrice($(".selected"))
                    selectxianshi($(".selected"));


                })






function coculTotalPrice(tmp){
					var count = parseInt(tmp.find(".count").html());
				
				
					var price = parseInt(tmp.find(".price").html());
					
					tmp.find(".totalprice").html(count*price+"元");
				}
				

 


 $(".cartdecrease1").bind("click",function(){	
					
						var count = parseInt($(this).parent().next().html());
						if(count>1){
							count--
							$(this).parent().next().html(count);
						
							coculTotalPrice($(this).parent().parent());
						}else{
							alert("商品数量不能小于 1")
						}	
						
						changeTotalPrice($(".selected"));
					});
					
					
					
					
					$(".cartadd1").bind("click",function(){						
											
					
						
						var count = parseInt($(this).parent().prev().html());
						count++;
						$(this).parent().prev().html(count);
						coculTotalPrice($(this).parent().parent());
						changeTotalPrice($(".selected"));
					});
					
            
            
					$(".cartadd").bind("click",function(){						
											
						var count = parseInt($(this).parent().prev().html());
					
						coculTotalPrice($(this).parent().parent());
						changeTotalPrice($(".selected"));
					});
            
            
            
            $(".cartdecrease").click(function(){
            
             var count = parseInt($(this).parent().next().html());
						if(count>1){
							
							coculTotalPrice($(this).parent().parent());
						}else{
							alert("商品数量不能小于 1")
						}	
						changeTotalPrice($(".selected"));
					});
					
					
					
					
					
            
            
            
            
             



                selectbutton.click(function(){
                    if($(this).prop("checked")){
                        $(this).prop("checked",true);
                        $(".gotojiesuan").css("background-image", 'url("resources/wbimage/photo28.png")');
                    }else{
                        $(this).prop("checked",false);
                        selectAll.prop("checked",false);
                        $(".gotojiesuan").css("background-image", 'url("resources/wbimage/photo27.png")');
                    }
                    changeTotalPrice($(".selected"))
                    selectxianshi($(".selected"));

                })






                function selectxianshi(check1){
                    $countamount=$(".countamount");
                    var amountcount=0;
                    check1.each(function(){
                        if($(this).prop("checked")){
                            //alert($(this).parent().html())
                            //alert(parseInt($(this).parent().parent().find(".totalprice").text()))
                            amountcount++;
                            $(".gotojiesuan").css("background-image", 'url("resources/wbimage/photo28.png")');
                        }
                        $countamount.html(amountcount);
                    })
                    if(amountcount==0){
                      $(".gotojiesuan").css("background-image", 'url("resources/wbimage/photo27.png")');
                         $countamount.html(amountcount);
                    }
                }

               
              

                



         
  
            

       

        function changeTotalPrice(button){
            var tmptotalPrice=0;
            button.each(function(){
                if($(this).prop("checked")){
                    //alert($(this).parent().html())
                    //alert(parseInt($(this).parent().parent().find(".totalprice").text()))
                    tmptotalPrice=tmptotalPrice+parseInt($(this).parent().parent().find(".totalprice").html());
             
                }
            })
       
            var str2=tmptotalPrice+"元";
            $("#allprice").html(str2);

        }



        });


    </script>
</head>
<body>
<div class="zhengti">

    <div class="head">
       <div class="head_log" id="zongmilog">
            
             
            <img src="resources/wbimage/milog.png">


           
        </div>
        <div class="head_title">
            <div class="fudong1">全部商品分类</div>
            <div class="fudong11">小米手机</div>
              <div class="fudong11">红米</div>
                <div class="fudong11">电视</div>
                  <div class="fudong11">笔记本</div>
                  <div class="fudong11">空调</div>
                  <div class="fudong11">新品</div>
                  <div class="fudong11">路由器</div>
                  <div class="fudong11">智能硬件</div>
                  <div class="fudong11">服务</div>
                  <div class="fudong11">社区</div>
        </div>

        <div class="head_topbarinfo">
            <ul class="ul1">
                <li>
                <% Users users=(Users)session.getAttribute("user"); 
                 String yonghuming=null;
                if(users==null||users.getUNAME()==null){
               yonghuming="您好请登录";
                }else{
                yonghuming=users.getUNAME();
                
                }
                
                %>
                    <a href="login?requestpage=8&from=<%=request.getRequestURI() %>&action=go" id="xiala" class="a1"><%=yonghuming %>﹀</a>
                    <div class="blockhidden">
                        <ul class="f">
                            <li><a href="">个人中心</a></li>
                            <li><a href="">评价晒单</a></li>
                            <li><a href="">我的喜欢</a></li>
                            <li><a href="">小米账户</a></li>
                            <li><a href="">退出登录</a></li>
                        </ul>
                    </div>
                </li>

            </ul>
        </div>

        <a href="#" class="dingdan">
            |我的订单
        </a>
    </div>
      <%
   
    shoppingcart danyishoppingcart= (shoppingcart)request.getAttribute("danyishopping");
   
    //out.print(danyishoppingcart.getPID());
    //out.print(danyishoppingcart.getUUID());
    //out.print(danyishoppingcart.getPNAME());
   //out.print(danyishoppingcart.getPDESC());
   //out.print(danyishoppingcart.getNEWPRICE());
  // out.print(danyishoppingcart.getIMAGE1());
   %>
<div class="zhongjian">
<img class="photoduigou" src="resources/wbimage/photoduigou.png" style="margin-top:10px">
<div class="photoduigou2">
<img  src="resources/wbimage/photoduigou2.png" style="margin-top:20px">
   <span class="shppinginfo"><%=danyishoppingcart.getPNAME() %></span>
</div>
     <a class="gotoshoppingcart" href="ShoppingCartServlet?action=getshoppingcartinfo&uuid=<%=danyishoppingcart.getUUID() %>&pid=<%=danyishoppingcart.getPID() %>&requestpage=2">去购物车结算</a>
   </div>
    <div class="content">

       
   
  
        <div class="others">
            <div class="othershoppingtitle">
                买购物车中商品的人还买了
            </div>
            <div class="othershopping">
                <div class="aloneshopping">
                    <img src="resources/wbimage/othersshopping1.png" alt="">
                </div>
                
                <%ProductService product1=new ProductServiceImpl();
                 Product p1=product1.getProductById("26");
               
                    
                  Users u1=(Users)session.getAttribute("user");
                  String uuid1;
                  if(u1==null){
                   uuid1=null;
                  }else{
                     uuid1=u1.getUUID();
                  }
                 %>
                <div class="aloneshopping">
                    <div class="photo">
                       <img src='<%=basePath %>resources/images/<%=p1.getIMAGE1() %>' alt="" width="227px" height="201px" id="othershopping2">  
                  
                    </div>
                    <div class="shoppingziti1" id="shoppingziti1">
                      <%=p1.getPNAME() %>
                    </div>
                    <div class="shoppingziti2" id="shoppingziti2">
                        <%=p1.getNEWPRICE() %>
                    </div>
                    <div class="shoppingziti3">
                     
    
                       <a class="pinglun" href='ShoppingCartServlet?action=addintoshoppingcart&requestpage=1&uuid=<%=uuid1 %>&pid=<%=p1.getPID()%>&cartcount=1'> 750人好评</a>
                    </div>
                </div>
                <%ProductService product2=new ProductServiceImpl();
                 Product p2=product2.getProductById("28");
                 %>
                <div class="aloneshopping" >
                    <div class="photo">
                        <img src="<%=basePath %>resources/images/<%=p2.getIMAGE1() %>" alt="" width="227px" height="201px">
                    </div>
                    <div class="shoppingziti1">
                      <%=p2.getPNAME() %>
                    </div>
                    <div class="shoppingziti2">
                       <%=p2.getNEWPRICE() %>
                    </div>
                    <div class="shoppingziti3">
                        <a class="pinglun1" href="ShoppingCartServlet?action=addintoshoppingcart&requestpage=1&uuid=<%=uuid1 %>&pid=<%=p2.getPID()%>&cartcount=1">1万人好评</a>
                    </div>
                </div>
                <%ProductService product3=new ProductServiceImpl();
                 Product p3=product3.getProductById("29");
                 %>
                <div class="aloneshopping">
                    <div class="photo">
                        <img src="<%=basePath %>resources/images/<%=p3.getIMAGE1() %>" alt="" width="227px"  height="201px">
                    </div>
                    <div class="shoppingziti1">
                        <%=p3.getPNAME() %>
                    </div>
                    <div class="shoppingziti2">
                        <%=p3.getNEWPRICE() %>
                    </div>
                    <div class="shoppingziti3">
                       <a href="ShoppingCartServlet?action=addintoshoppingcart&requestpage=1&uuid=<%=uuid1 %>&pid=<%=p3.getPID()%>&cartcount=1" class="pinglun2"> 11.1万人好评</a>
                    </div>
                </div>
                 <%ProductService product4=new ProductServiceImpl();
                 Product p4=product4.getProductById("30");
                 %>
                <div class="aloneshopping">
                    <div class="photo">
                        <img src="<%=basePath %>resources/images/<%=p4.getIMAGE1() %>" alt="" width="227px"  height="201px">
                    </div>
                    <div class="shoppingziti1">
                       <%=p4.getPNAME() %>
                    </div>
                    <div class="shoppingziti2">
                        <%=p4.getNEWPRICE() %>
                    </div>
                    <div class="shoppingziti3">
                       <a href="ShoppingCartServlet?action=addintoshoppingcart&requestpage=1&uuid=<%=uuid1 %>&pid=<%=p4.getPID()%>&cartcount=1" class="pinglun3"> 3003人好评</a>
                    </div>
                </div>
                <%ProductService product5=new ProductServiceImpl();
                 Product p5=product5.getProductById("31");
                 %>
                <div class="aloneshopping">
                    <div class="photo">
                        <img src="<%=basePath %>resources/images/<%=p5.getIMAGE1() %>" alt="" width="227px"  height="201px">
                    </div>
                    <div class="shoppingziti1">
                       <%=p5.getPNAME() %>
                    </div>
                    <div class="shoppingziti2">
                       <%=p5.getNEWPRICE() %>
                    </div>
                    <div class="shoppingziti3">
                        <a href="ShoppingCartServlet?action=addintoshoppingcart&requestpage=1&uuid=<%=uuid1 %>&pid=<%=p5.getPID()%>&cartcount=1" class="pinglun4"> 9338人好评</a>
                    </div>
                </div>
                
                <%ProductService product6=new ProductServiceImpl();
                 Product p6=product6.getProductById("32");
                 %>
                <div class="aloneshopping">
                    <div class="photo">
                        <img src="<%=basePath %>resources/images/<%=p6.getIMAGE1() %>" alt="" width="227px"  height="201px">
                    </div>
                    <div class="shoppingziti1">
                     <%=p6.getPNAME() %>
                    </div>
                    <div class="shoppingziti2">
                       <%=p6.getNEWPRICE() %>
                    </div>
                    <div class="shoppingziti3">
                        <a href="ShoppingCartServlet?action=addintoshoppingcart&requestpage=1&uuid=<%=uuid1 %>&pid=<%=p6.getPID()%>&cartcount=1" class="pinglun5">4979人好评</a>
                    </div>
                </div>
                
                <%ProductService product7=new ProductServiceImpl();
                 Product p7=product7.getProductById("40");
                 %>
                <div class="aloneshopping">
                    <div class="photo">
                        <img src="<%=basePath %>resources/images/<%=p7.getIMAGE1() %>" alt="" width="227px"  height="201px">
                    </div>
                    <div class="shoppingziti1">
                        <%=p7.getPNAME() %>
                    </div>
                    <div class="shoppingziti2">
                       <%=p7.getNEWPRICE() %>
                    </div>
                    <div class="shoppingziti3">
                        <a href="ShoppingCartServlet?action=addintoshoppingcart&requestpage=1&uuid=<%=uuid1 %>&pid=<%=p7.getPID()%>&cartcount=1" class="pinglun6">3222人好评</a>
                    </div>
                </div>
                 <%ProductService product8=new ProductServiceImpl();
                 Product p8=product8.getProductById("28");
                 %>
                <div class="aloneshopping">
                    <div class="photo">
                        <img src="<%=basePath %>resources/images/<%=p8.getIMAGE1() %>" alt="" width="227px"  height="201px">
                    </div>
                    <div class="shoppingziti1">
                      <%=p8.getPNAME() %>
                    </div>
                    <div class="shoppingziti2">
                        <%=p8.getNEWPRICE() %>
                    </div>
                    <div class="shoppingziti3">
                       <a href="ShoppingCartServlet?action=addintoshoppingcart&requestpage=1&uuid=<%=uuid1 %>&pid=<%=p8.getPID()%>&cartcount=1" class="pinglun7"> 1.3万人好评</a>
                    </div>
                </div>
                <%ProductService product9=new ProductServiceImpl();
                 Product p9=product9.getProductById("40");
                 %>
                <div class="aloneshopping">
                    <div class="photo">
                        <img src="<%=basePath %>resources/images/<%=p8.getIMAGE1() %>" alt="" width="227px"  height="201px">
                    </div>
                    <div class="shoppingziti8">
                       <%=p9.getPNAME() %>
                    </div>
                    <div class="shoppingziti2">
                        <%=p9.getNEWPRICE() %>
                    </div>
                    <div class="shoppingziti3">
                    
                       <a href="ShoppingCartServlet?action=addintoshoppingcart&requestpage=1&uuid=<%=uuid1 %>&pid=<%=p9.getPID()%>&cartcount=1" class="pinglun8"> 5.2万人好评</a>
                    </div>
                </div>
            </div>
        </div>
    </div><!--content-->
<div class="tianchongyanse"></div>

    <div class="bottom">

        <div class="foot_title">


                <div class="div1">
                   <a href="#" ><img src="resources/wbimage/photo11.png"  class="img"/>             预约维修服务</a>
                </div>


                <div class="div2">
                    <a href="#"> <img src="resources/wbimage/photo12.png" alt="" class="img"/>            七天无理由退货</a>
                </div>
                <div class="div3">
                    <a href="#"><img src="resources/wbimage/photo13.png" alt="" class="img"/>             15天免费换货</a>
                </div>
                <div class="div4">
                  <a href="#"><img src="resources/wbimage/photo14.png" alt="" class="img"/>             满150包邮</a>
                </div>
                <div class="div5">
                    <a href="#"><img src="resources/wbimage/photo15.png" alt="" class="img1"/>             520家售后网点</a>
                </div>

        </div>
        <hr width="1200px" style="background-color: #EDEDED; position: relative; left:70px">

        <div class="foot_content">
            <div class="foot_content_1">
                <div class="foot_content_3">帮助中心</div>
                <div class="foot_content_2">账户管理</div>
                <div class="foot_content_4">购物指南</div>
                <div  class="foot_content_4">订单操作</div>
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
                <div class="foot_content_7"><p >400-100-5678</p></div>
                <div class="foot_content_8"><p class="p1">周一至周日 8:00-18:00</p></br><p class="p2">（仅收市话费）</p></div>
                <div class="photo16" id="photo16" ></div>
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
                       <div class="zi3">米家</div>
                       <div class="zi4">米聊</div>
                       <div class="zi5">多看</div>
                       <div class="zi6">游戏</div>
                       <div class="zi7">路由器</div>
                       <div class="zi8">米粉卡</div>
                       <div class="zi9">政企服务</div>
                       <div class="zi10">小米天猫店</div>
                       <div class="zi11">隐私政策</div>
                       <div class="zi12">问题反馈</div>
                       <div class="zi13">廉政举报</div>
                       <div class="zi14">Select Region</div>
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
                  <div class="photo19"><img src="resources/wbimage/photo19.png" width="78px" height="27px"></div>
                   <div class="photo20"><img src="resources/wbimage/photo20.png"> </div>
                   <div class="photo21"><img src="resources/wbimage/photo21.png" ></div>
                   <div class="photo22"><img src="resources/wbimage/photo22.png"  ></div>
                   <div class="photo23"><img src="resources/wbimage/photo23.png" ></div>
               </div>
           </div>
           <div class="foot_bottom2">
               探索黑米科技，小米为发烧而生
           </div>


           </div>

    </div>

</div>



</body>
</html>