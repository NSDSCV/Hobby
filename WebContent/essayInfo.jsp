<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>帖子详情</title>
		<link rel="stylesheet" type="text/css" href="css/essayInfo.css" />
	</head>
	<body>
		<div id="father">
			<!--1.logo部分-->
			<div id="logo">
				<div class="top">
					<a href="indexShow.do"><img src="img/logo.png" height="46px" ondragstart="return false"/></a>
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
				<div class="search1" id="font1" >
					<font face="微软雅黑,黑体" size="5" >
						欢迎您来到：<a style="color: #D43F3A">${postById.tid.tname}</a>&nbsp;专区
					</font>
				</div>
				<div class="search1">
					<a style="float: right; padding-top: 5px;">
						访客量：<%=application.getAttribute("count")%>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					</a>
				</div>
				<!-- <div class="search1" >
					<a style="float: right;">
						<form>
							<input type="type" style="height: 25px; width: 180px;" placeholder="请输入关键字" />
							<input type="submit" value="搜索" style="height: 28px; width: 49px;" />&emsp;&emsp;&emsp;&emsp;
						</form>
					</a>
				</div> -->
			</div>
			<!--3 面包屑导航-->
			<div id="mianbaoxie">
					<a href="indexShow.do" style="color: #FFFFFF;">首页</a>
					<a style="color: #FFFFFF;">></a><a href="themeInfo.do?id=${postById.tid.id }" style="color: #FFFFFF;">${postById.tid.tname}</a>
					<a style="color: #FFFFFF;">></a><a style="color: #FFFFFF;">帖子详情</a>
			</div>
			<!--4 评论按钮 -->
			<div id="buttons">
				<a style="font-size: 26px; color: red;" href="commentEssay.do?postId=${postById.id}">评论</a>&emsp;&emsp;
				&nbsp;&nbsp;&nbsp;
				<a href = "userComplaintPost.do?pid=${postById.id}" style="color: blue;">举报此贴</a>
			</div>
			<!--5 内容栏 -->
				<div id="info1">
					<div class="info11">
						浏览量：${postById.hot}  <br/>
						评论数：${replyCount}       
					</div>   
					<div class="info111">
						&nbsp;&nbsp;&nbsp;
						<font size="4">${postById.title }</font>
					</div>
				</div>
				<div id="info2">
					<div class="info11" >
						<a href="showOtherUserInfo.do?email=${postById.uid.email}">${postById.uid.username }</a>
					</div>
					<div class="info111">
						&nbsp;&nbsp;&nbsp;
						<font size="3">${postById.time }</font>
					</div>
				</div>
				<div id="info3">
					<div id="info33">
						<div id="info444">
							&emsp;&emsp;
							<img src="${postById.uid.images }" ondragstart="return false" height="100px" width="100px" />
						</div>
						<div id="info445">
							&emsp;&emsp;&emsp;
							帖子数：${usePostCountById}  
						</div>
						<div id="info446">
							&emsp;&emsp;<img ondragstart="return false" src="img/4.png" /><br /><br />
							注册时间：${postById.uid.birthday }<br /><br />
						</div>
					</div>
					
					<div id="info333">
						<!--这是正文部分-->
						${postById.content}
					</div>
				</div>
				
				<!--6 标题-->
				<div id="Allsay">
					<font size="6">全部评论</font>
				</div>
				<!--7 评论内容 -->
				<c:forEach items="${allReply }" var="pro">
				<div id="info2">
					<div class="info11" >
						<a href="showOtherUserInfo.do?email=${pro.uid.email}">${pro.uid.username }</a>
					</div>
					<div class="info111">
						&nbsp;&nbsp;&nbsp;
						<font size="3">评论时间：${pro.time }</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a style="color: blue;" href="showReply.do?rid=${pro.id}">回复Ta</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a style="color: blue;" href="userComplaintComment.do?rid=${pro.id}">举报</a>
					</div>
				</div>
					<div id="info3">
					<div id="info33">
						<div id="info444">
							&emsp;&emsp;
							<img src="${pro.uid.images }" height="100px" width="100px" ondragstart="return false" />
						</div>
						<div id="info446">
							&emsp;&emsp;<img src="img/4.png" ondragstart="return false" /><br /><br />
							<div id="info445">
							&emsp;&emsp;&emsp;
						</div>
							注册时间：${pro.uid.birthday}<br /><br />
						</div>
					</div>
					<div id="info333">
						<!--这是正文部分-->
						${pro.info }
					</div>
				</div>
				<!-- 回复内容  -->	
				<c:forEach items="${map}" var="mapOne">
					<c:if test="${pro.id==mapOne.rid}">
							<div id="info9">
					<div id="info99"><br />
						<a>回复人：${mapOne.uid.username}</a>
					</div>
					<div id="info999">
						<!--这是回复部分-->
						${mapOne.info}
					</div>				
							</div>
					</c:if>		
				</c:forEach>
			</c:forEach>
			<!-- 假如没有任何评论 -->
			<div style="padding-left: 492px">
			 	<c:if test="${replyCount==0}">
					<img src="img/5.png" style="width: 20%;height: 50%;" ondragstart="return false">
				</c:if>	
			</div>
				<!--8 页尾-->
				<!-- 引入footer.jsp -->
			<jsp:include page="/footer.jsp"></jsp:include>
		</div>
		
	</body>
</html>
