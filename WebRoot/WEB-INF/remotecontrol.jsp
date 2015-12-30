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
	<title>SmartHome－家居控制</title>

	<!-- css -->
	<link href="css/base.min.css" rel="stylesheet">

	<!-- css for this project -->
	<link href="css/project.min.css" rel="stylesheet">
	

	<script type="text/javascript">
var xmlhttp1;
function onlightchange(para)
{
xmlhttp1=null;
if (window.XMLHttpRequest)
  {// code for IE7, Firefox, Opera, etc.
  xmlhttp1=new XMLHttpRequest();
  }
else if (window.ActiveXObject)
  {// code for IE6, IE5
  xmlhttp1=new ActiveXObject("Microsoft.XMLHTTP");
  }
  if(para.checked){
	  xmlhttp1.open("GET","rc!openlight.action",true);
	  xmlhttp1.setRequestHeader('If-Modified-Since', '0');
	  xmlhttp1.send(null);
  }else{
	  xmlhttp1.open("GET","rc!closelight.action",true);
	  xmlhttp1.setRequestHeader('If-Modified-Since', '0');
	  xmlhttp1.send(null);
  }
}
</script>
<script type="text/javascript">
var xmlhttp2;
function onfanchange(para)
{
xmlhttp2=null;
if (window.XMLHttpRequest)
  {// code for IE7, Firefox, Opera, etc.
  xmlhttp2=new XMLHttpRequest();
  }
else if (window.ActiveXObject)
  {// code for IE6, IE5
  xmlhttp2=new ActiveXObject("Microsoft.XMLHTTP");
  }
  if(para.checked){
	  xmlhttp2.open("GET","rc!openfan.action",true);
	  xmlhttp2.setRequestHeader('If-Modified-Since', '0');
	  xmlhttp2.send(null);
  }else{
	  xmlhttp2.open("GET","rc!closefan.action",true);
	  xmlhttp2.setRequestHeader('If-Modified-Since', '0');
	  xmlhttp2.send(null);
  }
}
</script>
</head>




<body class="avoid-fout page-green">
	
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
				<i class="icon margin-right">chevron_right</i>远程控制
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
				<h1 class="heading">远程监控</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner">
				<h2 class="content-sub-heading">您可以在此处看到您家里的实时情况</h2>
				
				
				
				
				<img src="http://<s:property value="ip"/>:8888/?action=stream" width="640" height="480"/>
				
				<div class="form-group">
						<div class="checkbox switch">
							<label for="input-switch-1">
								<input class="access-hide" id="input-switch-1" name="input-switch" type="checkbox" onclick="onlightchange(this)"><span class="switch-toggle"></span>灯光开关
							</label>
						</div>
				</div>
				<div class="checkbox switch">
								<label for="input-switch-2">
									<input class="access-hide" id="input-switch-2" name="input-switch" type="checkbox"  onclick="onfanchange(this)"><span class="switch-toggle switch-toggle-brand"></span>风扇开关
								</label>
				</div>
				
				
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