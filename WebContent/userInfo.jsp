<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>我的主页</title>
		<link rel="stylesheet" type="text/css" href="css/userInfo.css" />
	</head>
	<body>
		<div id="father">
			<!--1 logo部分-->
			<div id="logo">
				<img src="img/user1.png" height="112px" width="1300px" ondragstart="return false" />
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
				<form action="editUserImages.do" method="post" enctype="multipart/form-data">&emsp;&emsp;&emsp;&emsp;&emsp;
					<input type="file" name="images">
					<input type="submit" style="width: 90px ;height: 40px;background: url('img/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px;color: white;" value="修改头像">&emsp;&emsp;
				</form>
					<a href="editPassword.do"><button style="width: 90px ;height: 40px;background: url('img/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px;color: white;">修改密码</button></a>&emsp;&emsp;
				</div>
			</div>
			<!--3 按钮首页-->
			<div id="index1">
				&emsp;&emsp;
				<a href="indexShow.do" style="font-size: x-large;">首页</a>
			</div>
			<!--4 用户帖子-->
			<div id="eassy1">
				<div id="eassy11">
					&emsp;&emsp;
				<a style="font-size: x-large;">发布的帖子</a>
				</div>
				<c:forEach items="${findAllPost}" var="pro">
					<div class="eassy22">
					<div id="eassy222">
						<a href="showessayInfo.do?id=${pro.id}" style="color: #000000;">
						<h3>${pro.title}</h3></a>
					</div>
					<div id="eassy333">
						<a>发布时间：${pro.time }</a>
					</div>
				</div>
				</c:forEach>
				
				<!-- ========================== -->
				<div id="eassy11">
					&emsp;&emsp;
				<a style="font-size: x-large;">收到的评论</a>
				</div>
				<c:forEach items="${list}" var="pro">
						<div class="eassy22">
					<div id="eassy222">
						<a href="showessayInfo.do?id=${pro.pid.id}" style="color: #000000;">
						<h3>评论人：${pro.uid.username }</h3></a>
					</div>
					<div id="eassy333">
						<a>评论时间：${pro.time}</a>
					</div>    
				</div>
				</c:forEach>
				<!-- ========================== -->
				<div id="eassy11">
					&emsp;&emsp;
				<a style="font-size: x-large;">收到的回复</a>
				</div>
				<c:forEach items="${replycomment}" var="pro">
						<div class="eassy22">
					<div id="eassy222">
						<a href="showessayInfo.do?id=${pro.rid.pid.id}" style="color: #000000;">
						<h3>回复人：${pro.uid.username }</h3></a>
					</div>
					<div id="eassy333">
						<a>回复时间：${pro.time}</a>
					</div>    
				</div>
				</c:forEach>
				</div>
			</div>
			<!--5 页尾 -->
			<div>
		<!-- 引入footer.jsp -->
			<jsp:include page="/footer.jsp"></jsp:include>
		</div>
	</body>
</html>
