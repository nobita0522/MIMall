<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ page import="com.mimall.vo.Users" %>
<%@ page import="com.mimall.vo.ClientMiMallOrder" %>
<%@ page import="com.mimall.vo.MiMallOrder" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>

<%

%>

<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/myfromcss.css"/>
    <script src="js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        $(function () {
            var $d1 = $("#d1");
            $d1.css("color", "rgb(255 103 0)");

            var text;
            var $c10 = $("#c10");
            $c10.css("color", "rgb(117 117 117)");
            $c10.focus(function () {
                text = $(this).val();
                $(this).val("");
            });
            $c10.blur(function () {
                $(this).val() != "" || $(this).val(text);
            });

            var text;
            var $b6 = $("#b6");
            $b6.css("color", "rgb(117 117 117)");
            $b6.focus(function () {
                text = $(this).val();
                $(this).val("");
            });
            $b6.blur(function () {
                $(this).val() != "" || $(this).val(text);
            });
        });

    </script>

</head>
<body>
<div id="a1">
    <a href=""><img id="b1" src="resources/ysy-resurces/xiaomi.png"/></a>
    <div class="b5">
        <ul id="">
            <li><a href="">全部商品分类</a></li>
            <li><a href="">小米手机</a></li>
            <li><a href="">红米</a></li>
            <li><a href="">电视</a></li>
            <li><a href="">笔记本</a></li>
            <li><a href="">空调</a></li>
            <li><a href="">新品</a></li>
            <li><a href="">路由器</a></li>
            <li><a href="">智能硬件</a></li>
            <li><a href="">服务</a></li>
            <li><a href="">社区</a></li>
        </ul>
    </div>
    <input type="text" name="" id="b6" value="             小米8  小米mix2s"/><img id="b7"
                                                                               src="resources/ysy-resurces/sousuo.png"/>
</div>
<div id="a2">
    <ul id="b2">
        <a href="" id="c5">首页</a> > 交易订单
    </ul>
    <div id="b3">
        <ul id="c1">
            <li>订单中心</li>
            <li><a href="" id="d1">我的订单</a></li>
            <li><a href="" id="d1">意外保</a></li>
            <li><a href="" id="d1">团购订单</a></li>
            <li><a href="" id="d1">评价晒单</a></li>
            <li><a href="" id="d1">话费充值订单</a></li>
            <li><a href="" id="d1">依旧换新订单</a></li>
        </ul>
        <ul id="c2">
            <li>个人中心</li>
            <li><a href="" id="d1">我的个人中心</a></li>
            <li><a href="" id="d1">消息通知</a></li>
            <li><a href="" id="d1">购买资格</a></li>
            <li><a href="" id="d1">小米礼品卡</a></li>
            <li><a href="" id="d1">现金券</a></li>
            <li><a href="" id="d1">喜欢的商品</a></li>
            <li><a href="" id="d1">优惠券</a></li>
            <li><a href="" id="d1">收获地址</a></li>
        </ul>
        <ul id="c3">
            <li>售后服务</li>
            <li><a href="" id="d1">服务记录</a></li>
            <li><a href="" id="d1">申请服务</a></li>
            <li><a href="" id="d1">领取快递报销</a></li>

        </ul>
        <ul id="c4">
            <li>账户管理</li>
            <li><a href="" id="d1">个人信息</a></li>
            <li><a href="" id="d1">修改密码</a></li>
            <li><a href="" id="d1">社区VIP认证</a></li>

        </ul>
    </div>
    <div id="b4">
        <ul>
            <li id="c6">我的订单</li>
            <li id="c7">请谨防钓鱼链接或诈骗电话，</li>
            <li id="c8"><a href="">了解更多></a></li>
        </ul>
        <div id="c9">
            <ul>
                <li><a href="html/dingdan.jsp" id="d6" target="myframe">全部有效订单</a> <span
                        style="color: rgb(224 224 224);">|</span></li>
                <li><a href="html/zhifu.jsp" id="d7" target="myframe">待支付(2)</a> <span
                        style="color: rgb(224 224 224);">|</span></li>
                <li><a href="html/shouhuo.jsp" id="d8" target="myframe">待收货</a> <span
                        style="color: rgb(224 224 224);">|</span></li>
                <li><a href="html/guanbi.jsp" id="d9" target="myframe">已关闭</a></li>
            </ul>
            <input type="text" name="c10" id="c10" value="    输入商品名称、商品编号"/><img id="c11"
                                                                                 src="resources/ysy-resurces/sousuo2.png"/>
        </div>
        <div id="c12">

            <iframe src="html/dingdan.jsp" name="myframe" width="100%" height="100%" frameborder="0"></iframe>


        </div>
    </div>
</div>
</body>
</html>

