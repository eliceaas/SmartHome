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
	<title>SmartHome－主页</title>

	<!-- css -->
	<link href="css/base.min.css" rel="stylesheet">

	<!-- css for this project -->
	<link href="css/project.min.css" rel="stylesheet">
	
	<script type="text/javascript" src="js/json2.js"></script>
</head>



<script type="text/javascript">
var xmlhttp;
function loadStatus()
{
var url="statusjson.action";

xmlhttp=null;
if (window.XMLHttpRequest)
  {// code for IE7, Firefox, Opera, etc.
  xmlhttp=new XMLHttpRequest();
  }
else if (window.ActiveXObject)
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
if (xmlhttp!=null)
  {
  xmlhttp.onreadystatechange=state_Change;
  xmlhttp.open("GET",url,true);
  xmlhttp.setRequestHeader('If-Modified-Since', '0');
  xmlhttp.send(null);
  }
else
  {
  alert("您的浏览器不支持本系统，请换用新浏览器");
  }
}

function state_Change()
{
if (xmlhttp.readyState==4)
  {// 4 = "loaded"
  if (xmlhttp.status==200)
    {// 200 = "OK"
	var statusObj = JSON.parse(xmlhttp.responseText);
	var tempStr="<font size='6'>";
	tempStr += (statusObj.STATUS.temp+'</font>℃<br/><font size="3">温度适宜，请尽情享用吧</font>');
    document.getElementById('temp').innerHTML=tempStr;
    
    var humiStr="<font size='6'>";
	humiStr += (statusObj.STATUS.humi+'</font>%<br/><font size="3">湿度较低，建议打开加湿器</font>');
    document.getElementById('humi').innerHTML=humiStr;
    
    var cputempStr="<font size='6'>";
	cputempStr += (statusObj.STATUS.cputemp+'</font>℃<br/><font size="3">系统工作正常</font>');
    document.getElementById('cputemp').innerHTML=cputempStr;
    }
  else
    {
    alert("服务器开小差了，点确定试试吧～");
    }
  }
}
</script>




<body class="avoid-fout page-brand-accent">
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
				<i class="icon margin-right">chevron_right</i>总体概览Glance
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
				<h1 class="heading">系统概览</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner">
				<h2 class="content-sub-heading">实时一览(每两秒自动更新一次数据)</h2>
				<div class="card-wrap">
					<div class="row">
						<div class="col-lg-3 col-md-4 col-sm-6">
							<div class="card card-red">
								<div class="card-main">
									<div class="card-inner" id="temp1">
										<p class="card-heading">室内温度</p>
										<p id="temp">
											
										</p>
									</div>
									<%-- <div class="card-action">
										<div class="card-action-btn pull-left">
											<a class="btn btn-flat waves-attach" href="index.jsp"><span class="icon">check</span>&nbsp;更新数据</a>
										</div>
									</div> --%>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6">
							<div class="card card-brand">
								<div class="card-main">
									<div class="card-inner">
										<p class="card-heading">室内湿度</p>
										<p id="humi">
			
										</p>
									</div>
									<%-- <div class="card-action">
										<div class="card-action-btn pull-left">
											<a class="btn btn-flat waves-attach" href="index.jsp"><span class="icon">check</span>&nbsp;更新数据</a>
										</div>
									</div> --%>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6">
							<div class="card card-brand-accent">
								<div class="card-main">
									<div class="card-inner">
										<p class="card-heading">系统CPU温度</p>
										<p id="cputemp">
											<!-- <font size="6"></font>℃<br/>
											<font size="4">系统工作正常</font> -->
										</p>
									</div>
									<%-- <div class="card-action">
										<div class="card-action-btn pull-left">
											<a class="btn btn-flat waves-attach" href="index.jsp"><span class="icon">check</span>&nbsp;更新数据</a>
										</div>
									</div> --%>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6">
							<div class="card card-amber">
								<div class="card-main">
									<div class="card-inner">
										<p class="card-heading">本地天气</p>
										<p><iframe width="420" scrolling="no" height="60" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=5"></iframe>
										</p>
									</div>
									<%-- <div class="card-action">
										<div class="card-action-btn pull-left">
											<a class="btn btn-flat waves-attach" href="index.jsp"><span class="icon">check</span>&nbsp;更新数据</a>
										</div>
									</div> --%>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-4 col-sm-6">
							<div class="card card-green">
								<div class="card-main">
									<div class="card-inner">
										<p class="card-heading">待审核用户</p>
										<p>
											<font size="4">有</font><font size="6">&nbsp;<s:property value="unuseusers"/>&nbsp;</font>
											<font size="4">个新注册用户需要您的审核</font>
										</p>
									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<a class="btn btn-flat waves-attach" href="usersmanager.action"><span class="icon">check</span>&nbsp;去审核</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<%-- <div class="col-lg-3 col-md-4 col-sm-6">
							<div class="card card-red">
								<div class="card-main">
									<div class="card-inner">
										<p class="card-heading">Red Card</p>
										<p>
											Lorem ipsum dolor sit amet.<br>
											Consectetur adipiscing elit.
										</p>
									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<a class="btn btn-flat waves-attach" href="javascript:void(0)"><span class="icon">check</span>&nbsp;Button</a>
										</div>
									</div>
								</div>
							</div>
						</div> --%>
					</div>
				</div>
				
                
                
                
                
                
                
	<footer class="footer">
		<div class="container">
			<p>CopyRight @ElectronicDream 2015 1.0.1 alpha</p>
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
<script type="text/javascript">loadStatus();</script>
<script type="text/javascript">setInterval(loadStatus,2000)</script>
</html>