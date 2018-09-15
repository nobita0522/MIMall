<%@ page language="java" import="java.util.*,com.mimall.vo.*,com.page.PageInfo,com.mimall.service.impl.KindServiceImpl"
         pageEncoding="UTF-8" %>
<%@ page import="com.mimall.util.Utility" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>

<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title></title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <link rel="stylesheet" type="text/css" href="resources/css/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="resources/css/jQuery-confirm/jquery-confirm.css"/>
    <style type="text/css">
        body {
            background-color: #F9F9F9;
        }

        a:link {
            text-decoration: none;
        }

        #productTable {
            table-layout: fixed;
        }

        #productTable td {
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        tr.tableHead {
            background-color: #337AB7;
            color: #ffffff;
        }

        tr.tableHead > th {
            text-align: center;
        }

        /*鼠标悬停的 当前行高亮*/
        /*table>tbody>tr:hover {
            background-color:#BAD0EF !important;
        }*/

        div.categoryTableDiv {
            width: 1060px;
            margin: 0px auto;
            position: relative;
            top: 110px;
        }

        #pageInfoDiv {
            position: absolute;
            right: 0px;
        }

        #requestPage {
            width: 40px;

        }

        .mySpan {
            vertical-align: middle;
        }

        .mySpan > span {
            font-size: 12px;
            color: #333;
            padding: 0px 4px;

        }

        /*一级商品种类搜索框*/
        #jdCategorySearch {
            width: 500px;
            margin: 0px auto;
            position: relative;
            top: 50px;
            right: 60px;
        }
    </style>
</head>

<body>

<div>
    <ul class="breadcrumb">
        <li><a href="#">首页</a></li>
        <li><a href="#">商品管理</a></li>
        <li><a href="#">管理商品</a></li>
    </ul>
</div>

<form id="categoryForm" action="ProductServlet?action=getPageByQuery&target=productMain" method="post">

    <div id="jdCategorySearch" class="input-group">
        <input type="search" id="searchCondition" name="searchCondition" value='${requestScope.searchCondition}'
               class="form-control"/>

        <span class="input-group-btn">
			<input type="submit" value="搜索" class="btn btn-default"/>
			</span>
    </div>

</form>

<div class="text-center categoryTableDiv">

    <table id="productTable" class="table table-striped table-bordered table-hover">
        <thead>
        <tr class="tableHead">
            <th width="25%">订单流水号</th>
            <th width="10%">商品编号</th>
            <th width="10%">商品名称</th>
            <th width="10%">单价</th>
            <th width="10%">购买数量</th>
            <th width="20%">收货人姓名</th>
            <th width="15%">收货人联系方式</th>
        </tr>
        </thead>

        <tbody>

        <%
            ClientMiMallOrder clientMiMallOrder = (ClientMiMallOrder) request.getAttribute("clientMiMallOrder");
            MiMallOrder miMallOrder = clientMiMallOrder.getMiMallOrder();
            Users user = clientMiMallOrder.getUser();
            List<Product> products = clientMiMallOrder.getProducts();
            List<Integer> purchaseNumbers = clientMiMallOrder.getPurchaseNumbers();
            if (products != null) {
                for (int i = 0;i < products.size();i++) {
                    Product product = products.get(i);
                    Integer purchaseNumber = purchaseNumbers.get(i);
        %>
        <tr>
            <td><%=miMallOrder.getPaySerialNumber()%></td>
            <td><%=product.getPID()%></td>
            <td><%=product.getPNAME()%></td>
            <td><%=product.getNEWPRICE() + " 元"%></td>
            <td><%=purchaseNumber%></td>
            <td><%=user.getUNAME()%></td>
            <td><%=user.getUPHONE()%></td>
        </tr>
        <%
                }
            }
        %>
        </tbody>

    </table>
    </span>

</div>
</div>

<script src="resources/css/bootstrap/js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
<script src="resources/css/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
<script src="resources/css/jQuery-confirm/jquery-confirm.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

</script>
</body>

</html>