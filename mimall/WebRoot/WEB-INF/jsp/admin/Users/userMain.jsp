<%@ page language="java" import="java.util.*,com.mimall.vo.*,com.page.PageInfo,com.mimall.service.impl.KindServiceImpl" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
				background-color:#F9F9F9;
			}
			
			a:link {
				text-decoration: none;
			}
			
			#userTable {
				 table-layout:fixed;  
			}
			
			#userTable td{
				 overflow: hidden;  
       			 white-space: nowrap;  
       			 text-overflow: ellipsis;
			}
		
			tr.tableHead {
				background-color: #337AB7;
				color: #ffffff;
			}
			
			tr.tableHead>th {
				text-align: center;
			}
			
			/*鼠标悬停的 当前行高亮*/
			/*table>tbody>tr:hover {
				background-color:#BAD0EF !important;
			}*/
			
			div.categoryTableDiv {
				width:1060px;
				margin:0px auto;
				position:relative;
				top:110px;
			}
			
			
			
			#pageInfoDiv {
				position:absolute;
				right:0px;
			}
			
			#requestPage {
				width:40px;
				
			}
			
			.mySpan {
				vertical-align:middle;
			}
			
			.mySpan>span{
				font-size: 12px;
				color:#333;
				padding:0px 4px;
				
			}
			
			/*一级商品种类搜索框*/
			#jdCategorySearch {
				width:500px;
				margin:0px auto;
				position:relative;
				top:50px;
				right:60px;
			}
		</style>
	</head>

	<body>
	 <%
	 	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	 %> 
   
		<div>
			<ul class="breadcrumb">
				<li><a href="#">首页</a></li>
				<li><a href="#">用户管理</a></li>
				<li><a href="#">管理用户</a></li>
			</ul>
		</div>
		
		<form id="categoryForm" action="UserServlet?action=getPageByQuery&target=userMain" method="post">
		
		<div id="jdCategorySearch" class="input-group">
			<input type="search" id="searchCondition" name="searchCondition" value='${requestScope.searchCondition}' class="form-control"/>
			
			<span class="input-group-btn">
			<input type="submit"  value="搜索" class="btn btn-default"/>
			</span>
	</div>
	
	</form>
	
		<div class="text-center categoryTableDiv">
			
	
			<table id="userTable" class="table table-striped table-bordered table-hover">
				<thead>
					<tr class="tableHead">
						<th width="8%">用户ID</th>
						<th width="10%">用户名</th>
						<th width="10%">手机号</th>
						<th width="10%">邮箱</th>
						<th width="5%">年龄</th>
						<th width="5%">性别</th>
						<th width="5%">国籍</th>
						<th width="15%">账户</th>
						<th width="8%">操作</th>
						<th width="8%">操作</th>
						<th width="8%">操作</th>
						<th width="8%">操作</th>
					</tr>
				</thead>

				<tbody>
				
				<%
					List<Users> list = (List<Users>)request.getAttribute("list");
													Iterator<Users> it = list.iterator();
													while(it.hasNext()){
														Users user = it.next();
				%>	
					<tr>
						<td><%=user.getUUID()%></td>
						<td><%=user.getUNAME()%></td>
						<td title="<%=user.getUPHONE()%>" alt="<%=user.getUPHONE()%>"><%=user.getUPHONE()%></td>
						<td><%=user.getUEMAIL()%></td>
						<td><%=user.getUAGE()%></td>
						<td><%=user.getUSEX()%></td>
						<td><%=user.getCOUNTRY()%></td>
						<td><%=user.getACCOUNT()%></td>
				
						<td>
						<%
								int lock = user.getULOCK();
													//锁定状态的用户  锁定按钮灰掉
													if(lock==0){
							%>
									<button onclick="unlock(<%=user.getUUID()%>)" class="btn btn-success btn-xs disabled" disabled="disabled">解锁</button>
							<%
								}else{
							%>
									<button onclick="unlock(<%=user.getUUID()%>)" class="btn btn-success btn-xs">解锁</button>
							<%
								}
							%>
						</td>
						<td>
						<%
								
													//锁定状态的用户  锁定按钮灰掉
													if(lock==1){
							%>
									<button onclick="lock(<%=user.getUUID()%>)" class="btn btn-success btn-xs disabled" disabled="disabled">锁定</button>
							<%
								}else{
							%>
									<button onclick="lock(<%=user.getUUID()%>)" class="btn btn-success btn-xs">锁定</button>
							<%
								}
							%>
						</td>
						<td>
							<%
								int admin = user.getADMIN();
													//管理员用户  设置管理员按钮灰掉
													if(admin==1){
							%>
									<button onclick="manage(<%=user.getUUID() %>)" class="btn btn-success btn-xs disabled" disabled="disabled">设为管理员</button>
							<%
								}else{
							%>
									<button onclick="manage(<%=user.getUUID()%>)" class="btn btn-success btn-xs">设为管理员</button>
							<%
								}
							%>
						</td>
						<td>
							<%
								
													//管理员用户  设置管理员按钮灰掉
													if(admin==0){
							%>
									<button onclick="managed(<%=user.getUUID() %>)" class="btn btn-success btn-xs disabled" disabled="disabled">取消管理员</button>
							<%
								}else{
							%>
									<button onclick="managed(<%=user.getUUID()%>)" class="btn btn-success btn-xs">取消管理员</button>
							<%
								}
							%>
						</td>
					</tr>
				<%
					}
				%>
					

				
			
				</tbody>
					
			</table>
			
<form id="userForm2" action="UserServlet?action=getPageByQuery&target=userMain" method="post">

			<div id="pageInfoDiv">
			
	<a id="first" class="btn btn-default btn-sm" href='UserServlet?action=getPageByQuery&target=userMain&searchCondition=${requestScope.searchCondition}&requestPage=1'>首页</a>
    
    
    <a id="previous" class="btn btn-default btn-sm" href='UserServlet?action=getPageByQuery&target=userMain&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getPreviousPage()%>'> 上一页</a>
      <a id="next" class="btn btn-default btn-sm" href='UserServlet?action=getPageByQuery&target=userMain&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getNextPage()%>'> 下一页</a>
    
   
     <a id="last" class="btn btn-default btn-sm" href='UserServlet?action=getPageByQuery&target=userMain&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getTotalPageCount()%>'>尾页</a>
    
   <span class="mySpan">
    <span>当前第<%=pageInfo.getCurrentPage()%>页</span>
    
   <span>共<%=pageInfo.getTotalRecordCount()%>条记录 </span>
    
    <span>共<%=pageInfo.getTotalPageCount()%>页</span>
    
    <span>每页<%=pageInfo.getPerPageRecordCount()%>条</span>
   
     
    <span>跳到第 </span>
   
    	<input type="hidden" name="searchCondition" value="${requestScope.searchCondition}"/>
    	
    	<select id="requestPage" name="requestPage">
    		<%
    			int TotalPageCount = pageInfo.getTotalPageCount();
    			
    			int currentPage = pageInfo.getCurrentPage();
    			for(int i=1;i<=TotalPageCount;i++){
    				
    				if(currentPage==i){
    					out.println("<option selected='selected'>" + i + "</option>");
    				}else{
    					out.println("<option>" + i + "</option>");
    				}
    				
    			}
    		 %>
    		
    	</select>
    	
    <span>页 </span>
    </form>
   </span>
    	
    	
		
		</div>	
		</div>
		
		
		
			

		<script src="resources/css/bootstrap/js/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
		<script src="resources/css/bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="resources/css/jQuery-confirm/jquery-confirm.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			function trim(txt){
	var afterTrimTxt = txt.replace(/^\s*/,"").replace(/\s*$/,"");
	return afterTrimTxt;
}
			$(function(){
				//对id为categoryTable表格进行隔行换色
				$("#userTable>tbody>tr:even").css("background-color","#fff");
				
				//给跳到第几页下拉列表框绑定事件
				$("#requestPage").change(function(){
					
					
					//提交请求
					$("#userForm2").submit();
				});
				
				//第一页时 "首页"和上一页不能用
				
				var currentPage = <%=pageInfo.getCurrentPage()%>;
				var totalPageCount = <%=pageInfo.getTotalPageCount()%>;
				if(currentPage==1 || currentPage > totalPageCount){
					$("#first").addClass("disabled");
					$("#previous").addClass("disabled");
				}
				
				if(currentPage==totalPageCount || currentPage > totalPageCount){
					//最后一页时 "下一页"和"尾页"不能能用
					$("#next").addClass("disabled");
					$("#last").addClass("disabled");
				} 
				
				
				
			});
			
			function lock(uuid){
				$.confirm({
				    title: ' ',
				    content: '您确认要将用户 + uuid + '锁定吗?',
				    confirm: function(){
				       	//发请求
				       	location.assign("UserServlet?action=userLock&target=userMain&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&uuid=" + uuid);
				    },
				    cancel: function(){
				       
				    }
				});
			}
			
			function unlock(uuid){
				$.confirm({
				    title: ' ',
				    content: '您确认要将用户' + uuid + '解锁吗?',
				    confirm: function(){
				       	//发请求
				       	location.assign("UserServlet?action=userUnlock&target=userMain&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&uuid=" + uuid);
				    },
				    cancel: function(){
				       
				    }
				});
			}
			
			function manage(uuid){
				$.confirm({
				    title: ' ',
				    content: '您确认要将用户' + uuid + '设为管理员吗?',
				    confirm: function(){
				       	//发请求
				       	location.assign("UserServlet?action=userManage&target=userMain&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&uuid=" + uuid);
				    },
				    cancel: function(){
				       
				    }
				});
			}
			
			function managed(uuid){
				$.confirm({
				    title: ' ',
				    content: '您确认要将用户' + uuid + '取消管理员吗?',
				    confirm: function(){
				       	//发请求
				       	location.assign("UserServlet?action=userManaged&target=userMain&searchCondition=${requestScope.searchCondition}&requestPage=<%=pageInfo.getCurrentPage()%>&uuid=" + uuid);
				    },
				    cancel: function(){
				       
				    }
				});
			}
			
			
			
			
			
		</script>
		
		<%
			String msg = (String)request.getAttribute("msg");
			String msgDetail = (String)request.getAttribute("msgDetail");
			if(msg!=null){
		%>
			
		<script type="text/javascript">
				
			 $.alert({
                   title: '${msg}',
                   content: '${msgDetail}',
                   animation: 'rotate',
                   closeAnimation: 'right',
                   opacity: 0.5
               });
			
			
		</script>
		
		<%
			}
		%>
			
		
	</body>

</html>