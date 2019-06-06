<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1" charset="utf-8">
		<title>会员登录</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/login.css" />
		<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
	</head>

	<body>
		<div id="father">
			<div id="logo">
				<div class="top">
					<a href="indexShow.do"><img  src="img/logo.png" height="58px" ondragstart="return false" /></a>
				</div>
				<div class="top"></div>
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
			</div>
			<div class="container" style="width: 100%; height: 500px; background: #FF2C4C url('img/login1.jpg') no-repeat;">
				<div class="row">
					<div class="col-md-7">

					</div>

					<div class="col-md-5">
						<div style="width: 448px; border: 1px solid #E7E7E7; padding: 5px 0 52px 31px; border-radius: 33px; margin-top: 60px; background: #fbfaf4;">
							<font>登录</font>USER LOGIN
							<div></div>
							<form class="form-horizontal" action="userlogin.do" method="post">
								<div class="form-group">
									<label for="username" class="col-sm-2 control-label">邮箱号</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="email" name="email" placeholder="请输入邮箱号">
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
									<div class="col-sm-6">
										<input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
										<span style="color: red">${userLoginInfo}</span>
									</div>       
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<a style="color: red" href="register.jsp">还没注册？</a>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
										<!-- <a href="">忘记密码？</a> -->
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<input type="submit" width="100" value="登录" name="submit" style="background: url('img/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div id="blank">
				
			</div>
			<!--7 页尾 -->
			<!-- 引入footer.jsp -->
			<jsp:include page="/footer.jsp"></jsp:include>
		</div>
	</body>

</html>