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
    <link rel="stylesheet" type="text/css" href="css/zhifucss.css"/>
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
        <p id="f4">599.00</p>
        <p id="f5">元</p>
    </div>
    <div id="e2">
        <img id="f6" src="resources/ysy-resurces/yuemi.png"/>
        <p id="f7">悦米机械键盘Pro静音版 白色</p>
        <p id="f8">599元x1</p>
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
</body>
</html>
