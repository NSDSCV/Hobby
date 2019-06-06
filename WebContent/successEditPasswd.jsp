<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html">
<title>修改密码</title>

<script type="text/javascript">
	 window.onload = function() { //页面加载事件
		var time = 5;
		var secondEle = document.getElementById("second");
		var timer = setInterval(function() {
			secondEle.innerHTML = time;
			time--;
			if (time == 0) {
				clearInterval(timer);//关闭定时器
				location.href = "${pageContext.request.contextPath}";
			}
		}, 1000);
	} 
</script>
</head>

<body>
		<table width="100%" height="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td valign="middle" align="center">
		
		<font size="10px">修改密码成功，正在跳转到首页</font>
	 <br>
	<font size="6px"><span style="color: red" id="second">5</span>秒后跳转，如不跳转请点击
	<a href="${pageContext.request.contextPath}">这里</a>！
	</font>
		</td>
	</tr>
</table>
		
</body>
</html>