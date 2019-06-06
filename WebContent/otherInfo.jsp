<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Ta的主页</title>
		<link rel="stylesheet" type="text/css" href="css/otherInfo.css" />
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
					&emsp;&emsp;<img  ondragstart="return false" src="${Otheruser.images }" height="111px" width="111px"  />
				</div>
				<div id="info2">
					<br /><br />
					&emsp;<a style="font-size: x-large;">${Otheruser.username }
				</div>
				<div id="info3">
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				</div>
			</div>
			<!--3 按钮首页-->
			<div id="index1">
				&emsp;&emsp;
				<a href="indexShow.do" style="font-size: x-large; color: red;">首页</a>
			</div>
			<!--4 用户帖子-->
			<div id="eassy1">
				<div id="eassy11">
					&emsp;&emsp;
				<a style="font-size: x-large;">Ta发布的帖子</a>
				</div>
				<c:forEach items="${findAllOtherPost }" var="pro">
						<div class="eassy22">
					<div id="eassy222">
						<a href="showessayInfo.do?id=${pro.id}" style="color: #000000;">
						<h3>${pro.title }</h3></a>
					</div>
					<div id="eassy333">
						<a>${pro.time }</a>
					</div>
				</div>
				</c:forEach>
				
			</div>
			<!--5 页尾 -->
			<!-- 引入footer.jsp -->
			<jsp:include page="/footer.jsp"></jsp:include>
		</div>
	</body>
</html>
