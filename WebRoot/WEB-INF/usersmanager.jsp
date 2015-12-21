<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, width=device-width" name="viewport">
	<META   HTTP-EQUIV="Pragma"   CONTENT="no-cache">    
 	<META   HTTP-EQUIV="Cache-Control"   CONTENT="no-cache">    
 	<META   HTTP-EQUIV="Expires"   CONTENT="0">    
	<title>SmartHome－用户管理器</title>

	<!-- css -->
	<link href="css/base.min.css" rel="stylesheet">

	<!-- css for this project -->
	<link href="css/project.min.css" rel="stylesheet">
	
</head>




<body class="avoid-fout page-brand">
	<header class="header header-transparent header-waterfall">
		<ul class="nav nav-list pull-left">
			<li>
				<a data-toggle="menu" href="#menu">
					<span class="icon icon-lg">menu</span>
				</a>
			</li>
		</ul>
		<a class="header-logo margin-left-no" href="index.action">SmartHome智能家居管理系统</a>
		<div class="header-affix pull-left" data-offset-top="108" data-spy="affix">
			<span class="header-text margin-left-no">
				<i class="icon margin-right">chevron_right</i>用户管理器Users Manager
			</span>
		</div>
		<ul class="nav nav-list pull-right">
			<li>
				<a data-toggle="menu" href="#profile">
					<span class="access-hide">John Smith</span>
					<span class="avatar"><img alt="alt text for John Smith avatar" src="images/users/avatar-001.jpg"></span>
				</a>
			</li>
		</ul>
	</header>
	<nav aria-hidden="true" class="menu" id="menu" tabindex="-1">
		<div class="menu-scroll">
			<div class="menu-content">
				<a class="menu-logo">功能</a>
				<ul class="nav">
					<li class="active">
						<a class="waves-attach" href="index.action">系统概览</a>
					</li>
					<li class="active">
						<a class="waves-attach" href="rc.action">家居控制</a>
					</li>
					<li class="active">
						<a class="waves-attach" href="rc.action">远程视频监控</a>
					</li>
					<li class="active">
						<a class="waves-attach" href="historymanager.action">数据历史纪录</a>
					</li>
					<hr>
					<li class="active">
						<a class="waves-attach" href="usersmanager.action">用户管理</a>
					</li>
					<li class="active">
						<a class="waves-attach" href="download.jsp">客户端下载</a>
					</li>
				</ul>
				
			</div>
		</div>
	</nav>
	<nav class="menu menu-right" id="profile" tabindex="-1">
		<div class="menu-scroll">
			<div class="menu-top">
				<div class="menu-top-img">
					<img alt="John Smith" src="images/samples/landscape.jpg">
				</div>
				<div class="menu-top-info">
					<a class="menu-top-user" href="javascript:void(0)" id="username"><span class="avatar pull-left"><img alt="alt text for John Smith avatar" src="images/users/avatar-001.jpg"></span> <s:property value="#session.user.name"/> </a>
				</div>
				<div class="menu-top-info-sub">
					<small>您可以在这里找到您的个人信息</small>
				</div>
			</div>
			<div class="menu-content">
				<ul class="nav">
					<li>
						<a class="waves-attach" href="javascript:void(0)"><span class="icon icon-lg">account_box</span>个人档案设定</a>
					</li>
					<%-- <li>
						<a class="waves-attach" href="javascript:void(0)"><span class="icon icon-lg">add_to_photos</span>Upload Photo</a>
					</li> --%>
					<li>
						<a class="waves-attach" href="logout.action"><span class="icon icon-lg">exit_to_app</span>登出</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="content">
		<div class="content-heading">
			<div class="container">
				<h1 class="heading">用户管理器Users Manager</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner">
				<h2 class="content-sub-heading">您可以在此处管理本系统的使用用户</h2>
				
				
				
				
				<div class="table-responsive">
							<table class="table" title="Default Tabl">
								<thead>
									<tr>
										<th>用户id</th>
										<th>用户名</th>
										<th>用户类型</th>
										<th>联系电话</th>
										<th>是否启用</th>
										<th>设置权限</th>
										<th>删除用户</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator value="userslist">
										<tr>
											<td><s:property value="id"/></td>
											<td><s:property value="name"/></td>
											<td>
												<s:if test="type==0">
													管理员
												</s:if>
												<s:if test="type==1">
													用户
												</s:if>
											</td>
											
											<td><s:property value="phonenum"/></td>
											
											<td>
												<s:if test="id==1">
													系统默认账户
												</s:if>
												<s:else>
													<s:if test="inuse==0">
													<s:a action="usersmanager" method="allowUser">开启使用权限
														<s:param name="id">${id}</s:param>	
													</s:a>
												</s:if>
												<s:if test="inuse==1">
													<s:a action="usersmanager" method="banUser">关闭使用权限
														<s:param name="id">${id}</s:param>	
													</s:a>
												</s:if>
												</s:else>
											</td>
											
											<td>
											<s:if test="id==1">
													系统默认管理员账户
												</s:if>
												<s:else>
													<s:if test="type==0">
														<s:a action="usersmanager" method="banAdmin">赋予普通用户权限
															<s:param name="id">${id}</s:param>	
														</s:a>
													</s:if>
													<s:if test="type==1">
														<s:a action="usersmanager" method="setAdmin">赋予管理员权限
															<s:param name="id">${id}</s:param>	
														</s:a>
													</s:if>
												</s:else>
											</td>
											<td>
											<s:if test="id==1">
													默认账户
												</s:if>
												<s:else>
													<s:a action="usersmanager" method="delUser">删除
														<s:param name="id">${id}</s:param>
													</s:a>
												</s:else>
											</td>
										</tr>
									</s:iterator>
								</tbody>
							</table>
							

  	<br><br>
  	<font size="5">第<font color="red"><s:property value="page"/></font>页 </font>&nbsp;&nbsp;
    <font size="5">共<font color="red"><s:property value="totalPage"/></font>页 </font>&nbsp;&nbsp;
        <font size="5">共<font color="red"><s:property value="totalNum"/></font>个用户</font><br><br>
        <p align="center">
        <s:if test="page== 1">
            首页&nbsp;&nbsp;&nbsp;上一页
        </s:if>
        
        <s:else>
            <a href="usersmanager.action">首页</a>
            &nbsp;&nbsp;&nbsp;
            <a href="usersmanager.action?page=<s:property value="page - 1"/>">上一页</a>
        </s:else>
        
        <s:if test="page!=totalPage">
            <a href="usersmanager.action?page=<s:property value="page + 1"/>">下一页</a>
            &nbsp;&nbsp;&nbsp;
            <a href="usersmanager.action?page=<s:property value="totalPage"/>">尾页</a>
        </s:if>
        
        <s:else>
            下一页&nbsp;&nbsp;&nbsp;尾页
        </s:else>
	</p>
				
				
				
				
			</section>
		</div>
	</div>
				
                
                
        
	<footer class="footer">
		<div class="container">
			<p>CopyRight @ElectronicDream 2015</p>
		</div>
	</footer>
	<%-- <div class="fbtn-container">
		<div class="fbtn-inner">
			<a class="fbtn fbtn-brand-accent fbtn-lg" data-toggle="dropdown"><span class="fbtn-text">Links</span><span class="fbtn-ori icon">add</span><span class="fbtn-sub icon">close</span></a>
			<div class="fbtn-dropdown">
				<a class="fbtn" href="https://github.com/Daemonite/material" target="_blank"><span class="fbtn-text">Fork me on GitHub</span><span class="fa fa-github"></span></a>
				<a class="fbtn fbtn-blue" href="https://twitter.com/daemonites" target="_blank"><span class="fbtn-text">Follow Daemon on Twitter</span><span class="fa fa-twitter"></span></a>
				<a class="fbtn fbtn-alt" href="http://www.daemon.com.au/" target="_blank"><span class="fbtn-text">Visit Daemon Website</span><span class="icon">link</span></a>
			</div>
		</div>
	</div> --%>

	<!-- js -->
	<script src="js/jquery.min.js"></script>
	<script src="js/base.min.js"></script>

	<!-- js for this project -->
	<script src="js/project.min.js"></script>
	
</body>
</html>