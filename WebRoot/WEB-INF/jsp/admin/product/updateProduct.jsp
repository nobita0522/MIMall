<%@ page language="java" import="java.util.*,com.mimall.vo.*,com.mimall.service.impl.KindServiceImpl" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<base href="<%=basePath%>">
<title>修改</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">


<link rel="stylesheet" type="text/css" href="resources/css/bootstrap/css/bootstrap.css"/>
<style type="text/css">

body {
		background-color:#F9F9F9;
}

div.categoryClass {
	margin-bottom: 15px;
}

#categoryFieldset {
	width: 400px;
	height:360px;
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
	position:absolute;
	right:50px;
	bottom:50px;
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
	
	<%
			Product product = (Product)request.getAttribute("product");
		%>
	<div>
			<ul class="breadcrumb">
				<li><a href="#">首页</a></li>
				<li><a href="#">商品种类管理</a></li>
				<li><a href="#">修改一级商品种类</a></li>
			</ul>
	</div>			
	<form action="ProductServlet" method="post">
		<input type="hidden" name="action" value="update"/>
		<input type="hidden" name="pid" value="<%=product.getPID()%>"/>
		<input type="hidden" name="target" value="<%=request.getAttribute("target")%>"/>
		<input type="hidden" name="requestPage" value="<%=request.getAttribute("requestPage")%>"/>
		<input type="hidden" name="searchCondition" value="${requestScope.searchCondition}"/>
		
		<fieldset id="categoryFieldset">
			<legend>修改商品</legend>
			
			<div class="categoryClass">
				<label for="PID">商品编号</label>
				<%=product.getPID()%>
				<input type="hidden"  class="categoryLabel" name="PID"
					id="PID" value="<%=product.getPID()%>"/>
				<input type="hidden"  class="categoryLabel" name="ONSALE"
					id="PID" value="<%=product.getONSALE()%>"/>
			</div>
			
			<div class="categoryClass">
				<label for="FACTORYID">手机型号</label><input type="text" class="categoryLabel" name="FACTORYID"
					id="FACTORYID" value="<%=product.getFACTORYID()%>"/>
			</div>
			<div class="categoryClass">
				<label for="PNAME">商品名称</label><input type="text" class="categoryLabel" name="PNAME"
					id="PNAME" value="<%=product.getPNAME()%>" />
			</div>
			<div class="categoryClass">
				<label for="PDESC">商品描述</label><input type="text" class="categoryLabel" name="PDESC"
					id="PDESC" value="<%=product.getPDESC()%>"/>
			</div>
			<div class="categoryClass">
				<label for="INVENTORY">商品库存</label><input type="text" class="categoryLabel" name="INVENTORY"
					id="INVENTORY" value="<%=product.getINVENTORY()%>"/>
			</div>
			<div class="categoryClass">
				<label for="ORIGINALPRICE">商品原价</label><input type="text" class="categoryLabel" name="ORIGINALPRICE"
					id="ORIGINALPRICE" value="<%=product.getORIGINALPRICE()%>"/>
			</div>
			<div class="categoryClass">
				<label for="NEWPRICE">商品现价</label><input type="text" class="categoryLabel" name="NEWPRICE"
					id="NEWPRICE" value="<%=product.getNEWPRICE()%>"/>
			</div>
			<div class="categoryClass">
				<label for="PCOLOR">商品颜色</label><input type="text" class="categoryLabel" name="PCOLOR"
					id="PCOLOR" value="<%=product.getPCOLOR()%>"/>
			</div>
			<div class="categoryClass">
				<label for="VERSION">商品版本</label><input type="text" class="categoryLabel" name="VERSION"
					id="VERSION" value="<%=product.getVERSION()%>"/>
			</div>

			<div class="categoryClass">
				<label for="CID">所属种类</label>
				<select id="CID" name="CID">
					<%
						List<Category> categoryList = (List<Category>)request.getAttribute("categoryList");
						int parentCid = (Integer)request.getAttribute("parentCid");
						Iterator<Category> it = categoryList.iterator();
						while(it.hasNext()){
							Category category = it.next();
							
							if(category.getCid()==parentCid){
					%>
								<option value='<%=category.getCid()%>' selected='selected'><%=category.getCname()%></option>
					<%
						}else{
					%>	
								<option value='<%=category.getCid()%>'><%=category.getCname()%></option>
					<%
						}
									
				}
					%>
					
					
				</select>			
				
				
				<select name="KID" id="KID">
					<%
						int kid = product.getKID();
																		
						KindServiceImpl service = new KindServiceImpl();
						List<Kind> category2List = service.getAllCategory2ByCategory1(parentCid);
						for(Kind temp:category2List){
					
							if(temp.getCid()==kid){
					%>
								<option value='<%=temp.getCid()%>' selected='selected'><%=temp.getCname() %></option>
					<%
							}else{
					%>
								<option value='<%=temp.getCid()%>'><%=temp.getCname() %></option>
					<%
							}
						
					
						}
					
					%>
				</select>
			</div>
			
			<div class="categoryClass">
				<input type="submit" class="btn btn-success addCategoryBtn" value="修改商品" />
			</div>
		</fieldset>
	</form>

<script src="resources/css/bootstrap/js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
<script src="resources/css/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	
		/* $(function(){
			//给 id为 category1 的 下拉列表框 绑定 onchange事件
			$("#CID").change(function(){
				var category1Select = $("#CID")[0];
				
				var selectedIndex = category1Select.selectedIndex;
				var cid = category1Select.options[selectedIndex].value;
				
				//发送ajax请求   发给 ProductServlet
				$.post("ProductServlet",{
					"action":"getCategory2OfCategory1",
					"cid":cid
				},function(data,status){
					
				
					//使用dom技术来更新 创建出一个 二级产品种类的下拉列表框   把以前的替换就可以了
					var select = "<select name='KID' id='KID'>";
					for(var i=0;i<data.length;i++){
						
						select = select + "<option value='" + data[i].cid + "'>" + data[i].cname + "</option>";
					}
					
					select = select + "</select>";
					
					//替换以前的
					$("#KID").replaceWith(select);

				},"json");
				
				
  
			});
		}); */
		
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
