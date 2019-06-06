<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>注册  </title>
		<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/register.css" />
		<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="js/jquery.validate.min.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
<style type="text/css">
.error {
	color: red;
}
</style>
	
<!-- 异步检验用户名是否存在 （Ajax） -->
<script type="text/javascript">
		$(function() {
			//为输入框绑定事件
			$("#username").blur(function() {
				//1 失去焦点获得输入框的内容
				var usernameInput=$("#username").val();/* 获取输入的数据 */
				//2 去服务端校验该用户名是否存在  ---Ajax
				$.post(
					"checkUserName.do",
					{"username":usernameInput},
					function(data) {
						var isExist = data.isExist;
						//3 根据返回的isExist动态的显示信息
						var usernameInfo="";
							if(isExist){
								//该用户已经存在或为空
								usernameInfo="该用户名已经存在"
									$("#usernameInfo").css("color","red");
							}else{
								usernameInfo="该用户名可以使用"
									$("#usernameInfo").css("color","green");
							}
						$("#usernameInfo").html(usernameInfo);
					},
					"json"
				);
				
			});
		});
</script>
<!-- 异步检验邮箱是否已经注册过 -->
<script type="text/javascript">
		$(function() {
			//为输入框绑定事件
			$("#email").blur(function() {
				//1 失去焦点获得输入框的内容
				var emailnameInput=$("#email").val();/* 获取输入的数据 */
				//2 去服务端校验邮箱是否存在  ---Ajax
				$.post(
					"checkemailName.do",
					{"email":emailnameInput},
					function(data) {
						var isExist = data.isExist;
						//3 根据返回的isExist动态的显示信息
						var emailnameInfo="";
							if(isExist){
								//该邮箱已经存在或为空
								emailnameInfo="该邮箱已被注册"
									$("#emailnameInfo").css("color","red");
							}
						$("#emailnameInfo").html(emailnameInfo);
					},
					"json"
				);
				
			});
		});
</script>

<!-- 表单检验方法 -->
<script type="text/javascript">
$(function(){
	$("#myform").validate({
		rules:{
			"username":{
				"required":true,
			},
			"password":{
				"required":true,
				"rangelength":[6,12]
			},
			"repassword":{
				"required":true,
				"rangelength":[6,12],
				"equalTo":"#password"
			},
			"email":{
				"required":true,
				"email":true
			}
		},
		messages:{
			"username":{
				"required":"用户名不能为空",
			},
			"password":{
				"required":"密码不能为空",
				"rangelength":"密码长度6-12位"
			},
			"repassword":{
				"required":"密码不能为空",
				"rangelength":"密码长度6-12位",
				"equalTo":"两次密码不一致"
			},
			"email":{
				"required":"邮箱不能为空",
				"email":"邮箱格式不正确"
			}
		}
	});
});
</script>

	</head>
	<body>
		<div id="father">
			<!--1 logo 部分-->
				<div id="logo">
				<div class="top">
					<a href="indexShow.do"><img src="img/logo2.png" height="80px" ondragstart="return false"/></a>
				</div>
				<div class="top" id="top">
					&emsp;&emsp;
					
					<a href="indexShow.do">首页</a>&emsp;&emsp;
					<c:if test="${empty user }">
						<a href="login.jsp">登录</a>&emsp;&emsp;
						<a href="register.jsp">注册</a>
					</c:if>
					<c:if test="${!empty user }">
						欢迎您，<a style="color: red">${user.username}</a> &nbsp;&nbsp;&nbsp;&nbsp;
						<a href="showUserInfo.do">我的主页</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="exituserlogin.do">退出</a>
					</c:if>
				</div>
				<div class="top">
					<img src="img/register1.jpg" ondragstart="return false" />
				</div>
			</div>
				<!--2 表单部分-->
				<div id="context">
					<div >
						<div class="container" style=" width: 100%; height: 500px; no-repeat;">
				<div class="row">
					<div class="col-md-7">

					</div>

					<div class="col-md-5">
						<div style="width: 619px; border: 1px solid #E7E7E7; padding: 22px 0 112px 16px; border-radius: 4px; margin-top: 1px; background: #FFFF;">
							<font>注册</font>USER REGISTERED
							
							<form id="myform" class="form-horizontal" action="addUser.do" method="post" enctype="multipart/form-data">
								<div class="form-group">
									<label for="username" class="col-sm-2 control-label">用户名</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名">
										<span id="usernameInfo"></span>
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
									<div class="col-sm-6">
										<input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-2 control-label">确认密码</label>
									<div class="col-sm-6">
										<input type="password" class="form-control" id="repassword" name="repassword" placeholder="请输入密码">
									</div>
								</div>
								 <div class="form-group">
									<label for="inputPassword3" class="col-sm-2 control-label">邮箱验证</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="email" name="email" placeholder="请输入邮箱">
										<span id="emailnameInfo"></span>
									</div>  <a style="color: red;size:10px ">注：用于验证并激活账号</a>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-2 control-label">上传头像</label>
									<div class="col-sm-6">
										<input type="file" id="images" name="images" >
										<a style="color: red;size:10px ">只支持PNG,JPG,JPEG格式的图片且小于为500KB</a>
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<input type="submit" width="100" value="注册" name="submit" style="background: url('img/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
					</div>
				</div>
				<!--3 表尾部分-->
			<!-- 引入footer.jsp -->
			<br>
			<jsp:include page="/footer.jsp"></jsp:include>
		</div>
	</body>
</html>