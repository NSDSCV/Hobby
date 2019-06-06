<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Hobby社区</title>
		<link rel="stylesheet" type="text/css" href="css/index.css" />
	</head>
	<body>
		<div id="father">
			<!--1.logo部分-->
			<div id="logo">
				<div class="top">
					<a href="indexShow.do"><img src="img/logo.png" ondragstart="return false;" height="46px"/></a>
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
			<!--设置不允许有浮动对象-->
			<div id="clear">
				
			</div>
			<!--2 搜索栏-->
			<div id="search">
				<div class="search1">
					<a style="float: right; padding-top: 5px;">
						访客量：<%=application.getAttribute("count")%>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					</a>
				</div>
				<!-- <div class="search1" >
					<a style="float: right;">
						<form>
							<input type="type"  placeholder="请输入关键字" style="height: 25px; width: 180px;"  />
							<input type="submit" value="搜索" style="height: 28px; width: 49px;" />&emsp;&emsp;&emsp;&emsp;
						</form>
					</a>
				</div> -->
			</div>
			<!--3 主题板块-->
			<div id="item">
						<c:forEach items="${themes}" var="pro">
							<div class="item1">
							<div class="iteminfo">
								<a href="themeInfo.do?id=${pro.id }"  ondragstart="return false"><img src="img/index1.gif"  /></a>
								<a href="themeInfo.do?id=${pro.id }" style="color: red" > ${pro.tname}</a>
							</div>
							
							<c:forEach items="${map}" var="mapOne">
								<c:if test="${pro.id==mapOne.tid}">
									<div class="iteminfo">
									&emsp;&emsp;<a> 帖子数：${mapOne.count}</a>
									</div>      
								</c:if>
							</c:forEach>  
							
						</div>
						</c:forEach>
						
			</div>
			<!--图标部分-->
			<div id="logo1">
				<img src="img/1.png" height="68px" ondragstart="return false" />
			</div>
			<!--4  发帖按钮部分-->
			<div id="buttons">
				<a style="font-size: 26px; color: red;" href="printInfo.do?id=0">发帖</a>&emsp;&emsp;
				<a style="font-size: 21px;">最新帖子 TOP10</a>&emsp;&emsp;
			</div>
			<!--5 最新模块用户发帖显示-->
			<div id="AllInfo">
				<c:forEach items="${postTime}" var="pro">
					<div class="info">
					<div id="face">
						&emsp;<a href="showOtherUserInfo.do?email=${pro.uid.email}" ><img src="${pro.uid.images}" width="68px" height="68px" ondragstart="return false" /></a>
					</div>
					<div id="eassyItem">
						<div id="info2">
							<a href="showessayInfo.do?id=${pro.id}"><h3>${pro.title}</h3></a>
						</div>
						<div class="info2">
							&emsp;&emsp; 用户：${pro.uid.username } &nbsp;&nbsp;浏览量：${pro.hot} &nbsp;&nbsp;发表时间：${pro.time }   
						</div>
					</div>
					</div>	
				</c:forEach>
				<!-- ============================ -->
				<!--4  发帖按钮部分-->
			<div id="buttons">
				<a style="font-size: 26px; color: red;" href="printInfo.do?id=0">发帖</a>&emsp;&emsp;
				<a style="font-size: 21px; " >热门帖子 TOP10</a>
			</div>
			<!--5 最热模块用户发帖显示-->
			<div id="AllInfo">
				<c:forEach items="${postHot }" var="pro">
					<div class="info">
					<div id="face">
						&emsp;<a href="showOtherUserInfo.do?email=${pro.uid.email}" ><img src="${pro.uid.images}" height="68px" width="68px" ondragstart="return false" /></a>
					</div>
					<div id="eassyItem">
						<div id="info2">
							<a href="showessayInfo.do?id=${pro.id}"><h3>${pro.title}</h3></a>
						</div>
						<div class="info2">
							&emsp;&emsp; 用户：${pro.uid.username } &nbsp;&nbsp;浏览量：${pro.hot} &nbsp;&nbsp;发表时间：${pro.time }   
						</div>
					</div>
					</div>	
				</c:forEach>
			</div>
			<!--6  分页 -->
			
			<!--7 页尾 -->
			<!-- 引入footer.jsp -->
			<jsp:include page="/footer.jsp"></jsp:include>
		
		</div>
	</body>
</html>
