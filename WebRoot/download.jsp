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
	<title>SmartHome－客户端下载</title>

	<!-- css -->
	<link href="css/base.min.css" rel="stylesheet">

	<!-- css for this project -->
	<link href="css/project.min.css" rel="stylesheet">
	
	<script type="text/javascript" src="js/json2.js"></script>

</head>




<body class="avoid-fout page-amber">

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
				<i class="icon margin-right">chevron_right</i>远程监控
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
						<a class="waves-attach" href="remotecamera.action">远程视频监控</a>
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
				<h1 class="heading">手机客户端下载</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner">
				<h2 class="content-sub-heading">SmartHome安卓客户端</h2>
				<p>Ver 1.0 Beta公开测试版</p>
				<p>SmartHome安卓客户端第一个公开版本闪亮登场</p>
				<p>这个版本是从先前我们内测中挑选出来的一个比较稳定的版本，倾注了我们每个团队成员的心血</p>
				<p>虽然已经是较为完善的版本了，但依旧可能存在或大或小的bug</p>
				<p>如果您能在使用过程中向我们反馈您遇到的问题我们必感激不尽</p>
				<p>版本亮点:</p>
				<p>实现了web端的基本功能，具有视频监控功能，以后想使用本系统再也不用打开网页啦！</p>
				<a href="">点此下载</a>
				
				
				
				
				
				
				
			</section>
		</div>
	</div>
				
                
                
        
	<footer class="footer">
		<div class="container">
			<p>CopyRight @ElectronicDream 2015</p>
		</div>
	</footer>


	<!-- js -->
	<script src="js/jquery.min.js"></script>
	<script src="js/base.min.js"></script>

	<!-- js for this project -->
	<script src="js/project.min.js"></script>
	
</body>
</html>