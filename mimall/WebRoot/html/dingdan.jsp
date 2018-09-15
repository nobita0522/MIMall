<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/dingdancss.css"/>
    <script src="js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">



    </script>

</head>
<body>
<div id="d2">
    <div id="e1">
        <p id="f1">等待付款</p>
        <ul id="f2">
            <li>2018年08月28日 17:28<span style="color: rgb(224 224 224);">|</span></li>
            <li>周海<span style="color: rgb(224 224 224);">|</span></li>
            <li>订单号：5180828186404205<span style="color: rgb(224 224 224);">|</span></li>
            <li>在线支付</li>
        </ul>
        <p id="f3">订单金额:</p>
        <p id="f4">2669</p>
        <p id="f5">元</p>
    </div>
    <div id="e2">
        <img id="f6" src="resources/images/product25/pms_1527684977.9168848!560x560_1535790641941_9885_8355.jpg"
             style="width: 65px;height: 47px"/>
        <p id="f7">米8</p>
        <p id="f8">2669元x1</p>
        <input type="button" name="f9" id="f9" value="立即支付"/>
        <input type="button" name="f10" id="f10" value="订单详情"/>
    </div>
</div>
<div id="d3">
    <div id="e3">
        <p id="f1">等待付款</p>
        <ul id="f2">
            <li>2018年08月27日 21:37<span style="color: rgb(224 224 224);">|</span></li>
            <li>周海<span style="color: rgb(224 224 224);">|</span></li>
            <li>订单号：5180827152806519<span style="color: rgb(224 224 224);">|</span></li>
            <li>在线支付</li>
        </ul>
        <p id="f3">订单金额:</p>
        <p id="f4">15.00</p>
        <p id="f12">元</p>
    </div>
    <div id="e4">
        <img id="f6" src="resources/ysy-resurces/usb.png"/>
        <p id="f7">USB Type-C 转换头 黑色</p>
        <p id="f8">5元x1</p>
        <input type="button" name="f9" id="f9" value="立即支付"/>
        <input type="button" name="f10" id="f10" value="订单详情"/>
    </div>
</div>
<div id="d4">
    <div id="e5">
        <p id="f11">已收货</p>
        <ul id="f2">
            <li>2018年08月01日 22:16<span style="color: rgb(224 224 224);">|</span></li>
            <li>陈雄<span style="color: rgb(224 224 224);">|</span></li>
            <li>订单号：5180801894802199<span style="color: rgb(224 224 224);">|</span></li>
            <li>在线支付</li>
        </ul>
        <p id="f3">订单金额:</p>
        <p id="f4">19.90</p>
        <p id="f12">元</p>
    </div>
    <div id="e6">
        <img id="f13" src="resources/ysy-resurces/Type-C.png"/>
        <p id="f7">小米Type-C to AUDIO转换线 白色</p>
        <p id="f8">9.9元x1</p>
        <input type="button" name="f14" id="f14" value="订单详情"/>
        <input type="button" name="f10" id="f10" value="申请售后"/>
    </div>
</div>
</body>
</html>
