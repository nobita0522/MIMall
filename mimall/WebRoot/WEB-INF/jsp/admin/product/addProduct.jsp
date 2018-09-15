<%@ page language="java" import="java.util.*,com.mimall.vo.*,com.mimall.service.impl.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <base href="<%=basePath%>">

<title>添加商品</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<link rel="stylesheet" type="text/css" href="resources/css/bootstrap/css/bootstrap.css"/>

<style type="text/css">

body {
		background-color:#F9F9F9;
}

div.categoryClass {
	margin-bottom: 20px;
}

#categoryFieldset {
	width: 370px;
	height:auto;
	padding: 30px 50px;
	position:relative;
	top:10px;
	left:200px;
}

fieldset legend {
	font-size:20px;
	font: 16px/100% Arial, Verdana, "宋体";
}

fieldset label {
	margin-right: 50px;
	font: 16px/100% Arial, Verdana, "宋体";
}

/*bootstrap 按钮样式*/
.btn {
  display: inline-block;
  padding: 6px 12px;
  margin-bottom: 0;
  font-size: 14px;
  font-weight: normal;
  line-height: 1.42857143;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
      touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  background-image: none;
  border: 1px solid transparent;
  border-radius: 4px;
}

.btn-success {
  color: #fff;
  background-color: #5cb85c;
  border-color: #4cae4c;
}

.addCategoryBtn {
	position:relative;
	left: 120px;
}

.categoryLabel
 {
  
  padding: 0px 10px;
  font-size: 16px;
  border-radius: 3px;
}
</style>



</head>

<body>
	<ul class="breadcrumb">
		<li><a href="#">首页</a></li>
		<li><a href="#">商品管理</a></li>
		<li><a href="#">添加商品</a></li>
	</ul>
	
	<form action="ProductServlet" method="post">
		
		<input type="hidden" name="action" value="add"/>
		
		<fieldset id="categoryFieldset">
			<legend>添加商品</legend>
			<div class="categoryClass">
				<label for="FACTORYID">手机型号</label><input type="text" class="categoryLabel" name="FACTORYID"
					id="FACTORYID" />
			</div>
			<div class="categoryClass">
				<label for="PNAME">商品名称</label><input type="text" class="categoryLabel" name="PNAME"
					id="PNAME" />
			</div>
			<div class="categoryClass">
				<label for="PDESC">商品描述</label><input type="text" class="categoryLabel" name="PDESC"
					id="PDESC" />
			</div>
			<div class="categoryClass">
				<label for="INVENTORY">商品库存</label><input type="text" class="categoryLabel" name="INVENTORY"
					id="INVENTORY" />
			</div>
			<div class="categoryClass">
				<label for="ORIGINALPRICE">商品原价</label><input type="text" class="categoryLabel" name="ORIGINALPRICE"
					id="ORIGINALPRICE" />
			</div>
			<div class="categoryClass">
				<label for="NEWPRICE">商品现价</label><input type="text" class="categoryLabel" name="NEWPRICE"
					id="NEWPRICE" />
			</div>
			<div class="categoryClass">
				<label for="PCOLOR">商品颜色</label><input type="text" class="categoryLabel" name="PCOLOR"
					id="PCOLOR" />
			</div>
			<div class="categoryClass">
				<label for="VERSION">商品版本</label><input type="text" class="categoryLabel" name="VERSION"
					id="VERSION" />
			</div>
			
			<div class="categoryClass">
				<label for="CID">所属种类</label>
				
				<select id="CID" name="CID">
				
				<%
				List<Category> list = (List<Category>)request.getAttribute("list");
					for(Category category:list){
				%>
					
					<option value="<%=category.getCid()  %>"><%=category.getCname()%></option>
				<%
					}
				%>
					
				</select>
				
				
				<select name="KID" id="KID">
				<%
					Category category = list.get(0);
							KindServiceImpl service = new KindServiceImpl();
							
							List<Kind> kindList = service.getAllCategory2ByCategory1(category.getCid());
							for(Kind kind:kindList){
				%>
					<option value="<%=kind.getCid()%>"><%=kind.getCname()%></option>
				<%
					}
				 %>
					
				</select>
			</div>

			<div class="categoryClass">
				<input type="submit" class="btn btn-success addCategoryBtn" value="添加一级商品种类" />
			</div>
		</fieldset>
	</form>

		<script src="resources/css/bootstrap/js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
		<script src="resources/css/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="resources/css/jQuery-confirm/jquery-confirm.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
	$(function(){
		//给一级商品种类下拉列表框绑定onchange事件
		//当用户选择一级商品种类后  发送Ajax请求  去服务器查询 对应的下面的二级商品种类
		//并且使用dom技术 动态改变  二级商品种类下拉列表框中的内容
		$("#CID").change(function(){
			
			
			var category1Id = this.options[this.selectedIndex].value;
			
			$.post("ProductServlet",{"action":"getCategory2ByCategory1ForAddProduct","category1Id":category1Id},
			function(data){			
				//在回调函数中  使用dom技术  更新   category2下拉列表框
				generateCategory2Select(data);
			},"json");
		});
	});
	
	function generateCategory2Select(data){
		
		/*
			<select name="KID" id="KID">
				<option value="1">手机</option>
			</select>
		*/
		var category2Select = '<select name="KID" id="KID">';
		
		for(var i=0;i<data.length;i++){
			var KID = data[i].cid;
			var cname = data[i].cname;
			
			category2Select = category2Select + '<option value="' + KID + '">';
			category2Select = category2Select + cname + '</option>';
		}
		
		category2Select = category2Select + '</select>';
		
		$("#KID").replaceWith(category2Select);
	}
</script>
</body>
</html>
