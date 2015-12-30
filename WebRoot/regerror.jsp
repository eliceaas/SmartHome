<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, width=device-width" name="viewport">
	<title>出错了！</title>
<script type="text/javascript">
var time = 3; //时间,秒
function Redirect() {
    window.location = "login.jsp";
}
var i = 0;
function dis() {
    document.all.s.innerHTML = "还剩" + (time - i) + "秒";
    i++;
}
timer = setInterval('dis()', 1000); //显示时间
timer = setTimeout('Redirect()', time * 1000); //跳转
</script>
	<!-- css -->
	<link href="css/base.min.css" rel="stylesheet">

	<!-- css for this project -->
	<link href="css/project.min.css" rel="stylesheet">
	
</head>
<body class="avoid-fout page-brand-accent">

	<header class="header header-brand">
		<span class="header-logo">SmartHome智能家居管理系统</span>
	</header>

	
						<div class="card card-brand">
								<div class="card-main">
									<div class="card-inner">
										<p class="card-heading" id="s">注册失败！请稍后重试</p>
										<p>
											<span id="s"></span>
										</p>
									</div>
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