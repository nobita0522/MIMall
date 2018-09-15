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
            <th width="25%">流水号</th>
            <th width="10%">订单状态</th>
            <th width="10%">支付方式</th>
            <th width="15%">创建时间</th>
            <th width="15%">用户姓名</th>
            <th width="15%">用户联系方式</th>
            <th width="5%">操作1</th>
            <th width="5%">操作2</th>
        </tr>
        </thead>

        <tbody>

        <%
            List<MiMallOrder> miMallOrders = (List<MiMallOrder>) request.getAttribute("miMallOrders");
            List<Users> usersList = (List<Users>) request.getAttribute("usersList");
            if (miMallOrders != null) {
                for (int i = 0;i < miMallOrders.size();i++) {
                    MiMallOrder miMallOrder = miMallOrders.get(i);
                    Users users = usersList.get(i);
        %>
        <tr>
            <td><%=miMallOrder.getPaySerialNumber()%>
            </td>
            <%
                if (miMallOrder.getOrderState().equals(0)) {
            %>
            <td>待支付</td>
            <%
            } else if (miMallOrder.getOrderState().equals(1)) {
            %>
            <td>已支付</td>
            <%
            } else if (miMallOrder.getOrderState().equals(2)) {
            %>
            <td>已取消</td>
            <%
                }
            %>
            <td><%=miMallOrder.getPayMethod()%>
            </td>
            <td><%=Utility.handleStrDate(miMallOrder.getCreateTime())%>
            </td>
            <td><%=users.getUNAME()%>
            </td>
            <td><%=miMallOrder.getPhoneNumber()%>
            </td>
            <td>
                <button onclick="findOrderDetailsByPaySerialnumber('<%=miMallOrder.getPaySerialNumber()%>')"
                        class="btn btn-success btn-xs">查看
                </button>
            </td>
            <td>
                <button onclick="cancelOrderByPaySerialnumber('<%=miMallOrder.getPaySerialNumber()%>')"
                        class="btn btn-danger btn-xs">取消</button>
            </td>
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
    function findOrderDetailsByPaySerialnumber(paySerialNumber) {
        location.assign("OrderServlet?paySerialNumber=" + paySerialNumber + "&action=findOrderDetails");
        console.dir(paySerialNumber);
    }

    function cancelOrderByPaySerialnumber(paySerialNumber) {
        $.confirm({
            title: ' ',
            content: '确认取消该订单吗?',
            confirm: function(){
                //发请求
                location.assign("OrderServlet?action=cancelOrderByPaySerialnumber&orderState=2&paySerialNumber=" + paySerialNumber);
            },
            cancel: function(){

            }
        });
    }
</script>
</body>

</html>