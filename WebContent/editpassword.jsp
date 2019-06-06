<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>修改密码</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/editpassword.css" />
		<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
		<script src="js/jquery.validate.min.js" type="text/javascript"></script>
	
<style type="text/css">
.error {
	color: red;
}
</style>	
<!-- 表单检验方法 -->
<script type="text/javascript">
$(function(){
	$("#myform").validate({
		rules:{
			"password":{
				"required":true,
				"rangelength":[6,12]
			},
			"repassword":{
				"required":true,
				"rangelength":[6,12],
				"equalTo":"#password"
			}
		},
		messages:{
			"password":{
				"required":"密码不能为空",
				"rangelength":"密码长度6-12位"
			},
			"repassword":{
				"required":"密码不能为空",
				"rangelength":"密码长度6-12位",
				"equalTo":"两次密码不一致"
			}
		}
	});
});
</script>		
	</head>
	<body>
		<div id="father">
			<!--1 logo部分-->
			<div id="logo">
				<img src="img/user1.png" ondragstart="return false" height="112px" width="1300px" />
			</div>
			<!--2 用户头像 信息-->
			<div id="info">
				<div id="info1">
					&emsp;&emsp;<img src="${user.images }" height="111px" width="111px" ondragstart="return false"  />
				</div>
				<div id="info2">
					<br /><br />
					&emsp;<a style="font-size: x-large;">${user.username }</a>
				</div>
				<div id="info3">
					<a href="editPassword.do"><button style="width: 90px ;height: 40px;background: url('img/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px;color: white;">修改密码</button></a>&emsp;&emsp;
				</div>
			</div>
			<!--3 按钮首页-->
			<div id="index1">
				&emsp;&emsp;
				<a href="indexShow.do" style="font-size: x-large;">首页</a>
			</div>
			<!--4 修改密码-->
			<div id="1111">
				<h2>修改密码</h2>
			</div>
			<!--5 表单-->
			<form id="myform" method="post" action="editNewPassword.do">
			<div id="form">
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">新密码</label>
					<div class="col-sm-6">
						<input type="password" class="form-control" id="password" name="password" placeholder="请输入新密码">
					</div>
				</div><br />
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">确认密码</label>
					<div class="col-sm-6">
							<input type="password" class="form-control" id="repassword" name="repassword" placeholder="请输入新密码" >
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" width="100" value="修改" name="submit" style="background: url('img/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
					</div>
				</div>
			</div>
			</form>
			<!--5 页尾 -->
			<!-- 引入footer.jsp -->
			<jsp:include page="/footer.jsp"></jsp:include>
		</div>
	</body>
</html>
