<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
	<title>Hobby社区后台管理系统</title>
	 <link rel="icon" href="../assets/img/favicon.ico">

    <link rel="stylesheet" type="text/css" href="css/webbase.css" />
    <link rel="stylesheet" type="text/css" href="css/pages-login-manage.css" />
    <style type="text/css">
    	#bottom{
				text-align: center;
			}
    </style>
</head>	

<body>
	<div class="loginmanage">
		<div class="py-container">
			<h4 class="manage-title">Hobby社区后台管理系统</h4>
			<div class="loginform">

				<ul class="sui-nav nav-tabs tab-wraped">
					<li class="active">
						<a href="#profile" data-toggle="tab" style="padding-left: 3px;">
							<h3>账户登录</h3>
						</a>
					</li>
				</ul>
				<div class="tab-content tab-wraped">
					<div id="profile" class="tab-pane  active">
						<form class="sui-form" action="login" method="post" id="loginform">
							<div class="input-prepend"><span class="add-on loginname"></span>
								<input id="prependedInput" name="username" type="text" placeholder="用户名" class="span2 input-xfat">
							</div>
							<div class="input-prepend"><span class="add-on loginpwd"></span>
								<input id="prependedInput" name="password" type="password" placeholder="请输入密码" class="span2 input-xfat">
							</div>
							<div class="logined">
								<a class="sui-btn btn-block btn-xlarge btn-danger" onclick="document:loginform.submit()" target="_blank">登&nbsp;&nbsp;录</a>
							</div>
						</form> 

					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>


	<!--foot-->
			<div id="bottom">
				<a href="#">关于我们</a>
				<a href="#">人才招聘</a>
				<a href="#">举报</a>
				<a href="#">法律声明</a>
				<a href="#">服务声明</a>  
				<br />
					Copyright © 2018-2019 Hobby社区   All rights reserved  
				&emsp;  站长：Arlin
			</div>

<script type="text/javascript" src="js/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="js/plugins/sui/sui.min.js"></script>
<script type="text/javascript" src="js/plugins/jquery-placeholder/jquery.placeholder.min.js"></script>
<script src="js/pages/jquery.slideunlock.js"></script>
<script>
	$(function(){
		var slider = new SliderUnlock("#slider",{
				successLabelTip : "欢迎访问Hobby社区"	
			},function(){
				// alert("验证成功,即将跳转至首页");
            	// window.location.href="index.html"
        	});
        slider.init();
	})
	</script>
</body>

</html>