<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html">
<title>成功登录</title>

<script type="text/javascript">
	window.onload = function() { //页面加载事件
		var time = 3;
		var secondEle = document.getElementById("second");
		var timer = setInterval(function() {
			secondEle.innerHTML = time;
			time--;
			if (time == 0) {
				clearInterval(timer);//关闭定时器
				location.href = "${pageContext.request.contextPath }";
			}
		}, 1000);
	}
	
</script>
</head>

<body>

	恭喜你，登录成功，<a style="color: red">
	</a> <br>
	<span style="color: red" id="second">3</span>秒后跳转，如不跳转请点击
	<a href="${pageContext.request.contextPath }">这里</a>！
</body>
</html>