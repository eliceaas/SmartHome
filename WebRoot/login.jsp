<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, width=device-width" name="viewport">
	<title>登录－SmartHome</title>

	<!-- css -->
	<link href="css/base.min.css" rel="stylesheet">

	<!-- css for this project -->
	<link href="css/project.min.css" rel="stylesheet">
	<script type="text/javascript">
function checknames(){
	var pass=document.getElementById("name");
	document.getElementById("passname").innerHTML="以字母开头，4-20位字母或数字";
}

function checkname(){
	var pass=document.getElementById("name");
	
	if(pass.value==''||pass.value==null){
		// document.getElementById("passname").innerHTML="<font color='red'>此项为必填项</font>";
	}else if(pass.value.length<4){
		document.getElementById("passname").innerHTML="<font color='red'>登录名太短了，至少4位</font>";
	}else if(pass.value.length>=4){
		var patrn=/^[a-zA-Z][a-zA-Z0-9]*$/;
		
		if(!patrn.exec(pass.value)){
			document.getElementById("passname").innerHTML="<font color='red'>登陆名错误，以字母开头，4-20位字母或数字</font>"; 
		}else{
			$.ajax({
				url:'/ajax/checkname?passportid='+pass.value,
				dataType:'text',
				success:function(data){
					var user =eval('('+data+')');
					document.getElementById("passname").innerHTML=user.msg;
				}
			});
		}
	}
}

function checkmails(){
	document.getElementById("mailname").innerHTML="请输入常用的邮箱，以便日后找回密码";
}

function checkmail(){
	var mail=document.getElementById("mail");
	if(mail.value==''||mail.value==null){
		document.getElementById("mailname").innerHTML="<font color='red'>此项为必填项</font>";
	}else{
		var m=/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,4}$/;
		if(!m.exec(mail.value)){
			document.getElementById("mailname").innerHTML="<font color='red'>请输入正确的邮箱地址</font>";
		}else{
			document.getElementById("mailname").innerHTML="正确";
		}
	}
}

function checkpasswords(){
	document.getElementById("passwname").innerHTML="请输入6-20位英文字母、数字或符号，区分大小写";
}

function checkpasswordss(pwd){
	if(pwd==null||pwd==''){
		document.getElementById("passwname").innerHTML="";
	}else if(pwd.length<6){
		document.getElementById("passwname").innerHTML="请输入至少6位以字母开头，数字或符号";
	}else{
		document.getElementById("passwname").innerHTML="正确";
	}
}

function checkpasswords2(){
	document.getElementById("passname2").innerHTML="请再次输入密码";
}

function checkpassword2(pwd2){
	if(pwd2==null||pwd2==''){
		document.getElementById("passname2").innerHTML="";
	}else if(pwd2.length<6){
		document.getElementById("passname2").innerHTML="<font color='red'>密码输入不一致，请重新输入</font>";
	}else{
		var pwd=document.getElementById("pwd").value;
		
		if(pwd!=pwd2){
			document.getElementById("passname2").innerHTML="<font color='red'>密码输入不一致，请重新输入</font>";
		}else{
			document.getElementById("passname2").innerHTML="正确";
		}
	}
}

function checkuname(){
	document.getElementById("unames").innerHTML="请输入中文或英文";
}

function checkuser(user){
	if(user==''){
		document.getElementById("unames").innerHTML="<font color='red'>此项为必填项</font>";
	}else{
		var yd=/^[A-Za-z\u4E00-\u9fa5]*$/;

		if(!yd.exec(user)){
			document.getElementById("unames").innerHTML="请输入中文或英文";
		}else{
			document.getElementById("unames").innerHTML="正确";
		}
	}
}

function chkpwd(obj){

	var t=obj.value;
	var id=getResult(t);
	
	//定义对应的消息提示
	var msg=new Array(4);;
	msg[0]="密码过短。";
	msg[1]="密码强度差。";
	msg[2]="密码强度良好。";
	msg[3]="密码强度高。";

	var sty=new Array(4);
	sty[0]=-45;
	sty[1]=-30;;
	sty[2]=-15;
	sty[3]=0;

	var col = new Array(4);
	col[0] = "gray";
	col[1] = "#50AEDD";
	col[2] = "#FF8213";
	col[3] = "green";

	//设置显示效果
	var sWidth=300;
	var sHeight=15;
	var Bobj=document.getElementById("chkResult");
	Bobj.style.fontSize="12px";
	Bobj.style.color=col[id];
	Bobj.style.width=sWidth + "px";;
	Bobj.style.height=sHeight + "px";
	Bobj.style.lineHeight=sHeight + "px";
/*	Bobj.style.background="url no-repeat left " + sty[id] + "px";*/
	Bobj.innerHTML="检测提示：" + msg[id];
}

//定义检测函数,返回0/1/2/3分别代表无效/差/一般/强
function getResult(s){
	if(s.length < 4){
		return 0;
	}
	var ls = 0;
	if (s.match(/[a-z]/ig)){
		ls++;
	}
	if(s.match(/[0-9]/ig)){
		ls++;
	}
	if(s.match(/(.[^a-z0-9])/ig)){
		ls++;
	}
	if(s.length < 6 && ls > 0){
		ls--;
	}
	return ls;
}

function check(){

	var name=document.getElementById("name").value;
	var mail=document.getElementById("mail").value;
	var pwd=document.getElementById("pwd").value;
	var pwd2=document.getElementById("pwd2").value;
	var captcha=document.getElementById("captcha").value;
	var username=document.getElementById("username").value;
	var m=/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,4}$/;
	var patrn=/^[a-zA-Z][a-zA-Z0-9]*$/;
	var user=/^[A-Za-z\u4E00-\u9fa5]*$/;
	
	if(name==''){
		document.getElementById("passname").innerHTML="<font color='red'>此项为必填项</font>";
		return false;
	}else if(name.length<4){
		document.getElementById("passname").innerHTML="<font color='red'>登录名太短了，至少4位</font>";
		return false;
	}else if(!patrn.exec(name)){
		document.getElementById("passname").innerHTML="<font color='red'>以字母开头，4-20位字母或数字</font>";
		return false;
	}else if(mail==''){
		document.getElementById("mailname").innerHTML="<font color='red'>此项为必填项</font>";
		return false;
	}else if(!m.exec(mail)){
		document.getElementById("mailname").innerHTML="<font color='red'>请输入正确的邮箱地址</font>";
		return false;
	}else if(pwd==''){
		document.getElementById("passwname").innerHTML="<font color='red'>此项为必填项</font>";
		return false;
	}else if(pwd.length<6){
		document.getElementById("passwname").innerHTML="<font color='red'>请输入6-20位英文字母、数字或符号，区分大小写</font>";
		return false;
	}else if(pwd2==''){
		document.getElementById("passname2").innerHTML="<font color='red'>此项为必填项</font>";
		return false;
	}else if(pwd2.length<6){
		document.getElementById("passname2").innerHTML="<font color='red'>密码输入不一致，请重新输入</font>";
		return false;
	}else if(pwd!=pwd2){
		document.getElementById("passname2").innerHTML="<font color='red'>密码输入不一致，请重新输入</font>";
		return false;
	}else if(username==''){
		document.getElementById("unames").innerHTML="<font color='red'>此项为必填项</font>";
		return false;
	}else if(!user.exec(username)){
		document.getElementById("unames").innerHTML="<font color='red'>请输入中文或英文</font>";
		return false;
	}else if(captcha==''){
		document.getElementById("resets").innerHTML="<font color='red'>请输入验证码</font>";
		return false;
	}else{
		return true;
	}
	
}
</script>
</head>
<body class="avoid-fout page-brand-accent">

	<header class="header header-brand">
		<span class="header-logo">SmartHome智能家居管理系统</span>
	</header>
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-lg-push-4 col-sm-6 col-sm-push-3">
					<section class="content-inner">
						<div class="card-wrap">
							<div class="card">
								<div class="card-main">
									<div class="card-header">
										<div class="card-inner">
											<h1 class="card-heading">用户登录</h1>
										</div>
									</div>
									<div class="card-inner">
										<p class="text-center">
											<span class="avatar avatar-inline avatar-lg">
												<img alt="Login" src="images/users/avatar-001.jpg">
											</span>
										</p>
										<form class="form" action="login.action" method="post">
											<div class="form-group form-group-label">
												<div class="row">
													<div class="col-md-10 col-md-push-1">
														<label class="floating-label" for="login-username">用户名</label>
														<input class="form-control" name="name" id="name" type="text">
													</div>
												</div>
											</div>
											<div class="form-group form-group-label">
												<div class="row">
													<div class="col-md-10 col-md-push-1">
														<label class="floating-label" for="login-password">密码</label>
														<input class="form-control" name="password" id="password" type="password">
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-md-10 col-md-push-1">
														<button class="btn btn-block waves-attach waves-button">登录</button>
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-md-10 col-md-push-1">
														<div class="checkbox checkbox-adv">
															<label for="login-remember">
																<input class="access-hide" id="login-remember" name="login-remember" type="checkbox">记住密码
																<span class="circle"></span><span class="circle-check"></span><span class="circle-icon icon">done</span>
															</label>
														</div>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="clearfix">
							<p class="margin-no-top pull-left"><a class="btn btn-flat btn-blue waves-attach" data-toggle="modal" href="#modal-big">用户需知</a></p>
							<p class="margin-no-top pull-right"><a class="btn btn-flat btn-blue waves-attach" data-toggle="modal" href="#register">创建账户</a></p>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
	
	

	<div aria-hidden="true" class="modal fade" id="register" role="dialog" tabindex="-1">
		<div class="modal-dialog modal-xs">
			<div class="modal-content">
				<div class="modal-heading">
					<a class="modal-close" data-dismiss="modal">&times;</a>
					<h2 class="modal-title">注册</h2>
				</div>
				<div class="modal-inner">
				<form action="register.action" method="post" onsubmit="return check();">
					<label for="input-text">用户名</label>
							<input class="form-control form-control-default" name="name" id="name" type="text" onfocus="javascript:checknames();" onkeyup="javascript:checkname();">
							<br><p id="passname"></p>
					<label for="input-password">密码</label>
								<input class="form-control form-control-default" name="password" id="pwd" type="password" onfocus="javascript:checkpasswords();" onblur="javascript:checkpasswordss(this.value);" onkeyup="chkpwd(this)">
							<br><p id="passwname"></p>
					<label for="input-password">再次输入密码</label>
								<input class="form-control form-control-default" id="pwd2" type="password" onfocus="javascript:checkpasswords2();" onblur="javascript:checkpassword2(this.value);" >
							<br><p id="passname2"></p>
					<label for="input-text">联系电话</label>
							<input class="form-control form-control-default" name="phonenum" id="register_mobile" type="text" onkeyup="this.value=this.value.replace(/\D/g)" onafterpaste="this.value=this.value.replace(/\D/g,&#39;&#39;)">
							<br>
				</div>
				<div class="modal-footer">
					<p class="text-right"><button class="btn btn-brand" id="register_0">注册</button></form></p>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
		<div aria-hidden="true" class="modal fade" id="modal-big" role="dialog" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-heading">
					<a class="modal-close" data-dismiss="modal">&times;</a>
					<h2 class="modal-title">尊敬的用户</h2>
				</div>
				<div class="modal-inner">
					<p><strong>请仔细阅读以下说明。</strong></p>
					<p>首先，您看到此页面代表着您已经准备好使用本系统了，我们在此表示由衷的谢意尝试我们的系统</p>
					<p>这是由ElectronicDream团队打造的智能家居系统，结合了一系列智能家居系统的优点</p>
					<p>感谢大家的试用与支持!</p>
					<p>版权所有©️Electronic Dream</p>
					<p>版本:1.0.3 alpha</p>
					<p>更新日期:dec 28 2015</p>
					<p>更新日志:</p>
					<p>&nbsp;&nbsp;1.重写了部分数据库操作逻辑</p>
					<p>&nbsp;&nbsp;2.修复了ui中的部分bug</p>
					<p>&nbsp;&nbsp;3.修复了历史管理器中点击下一页跳至用户管理器的bug</p>
					<p>&nbsp;&nbsp;4.远程视频监控现在已经可以使用了</p>
				</div>
				<div class="modal-footer">
					<p class="text-right"><button class="btn btn-flat btn-brand waves-attach" data-dismiss="modal" type="button">关闭</button><!-- <button class="btn btn-flat btn-brand waves-attach" data-dismiss="modal" type="button">OK</button> --></p>
				</div>
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