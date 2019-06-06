<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>主题详情</title>
		<link rel="stylesheet" type="text/css" href="css/themeInfo.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
		<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
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
						欢迎您来到：<a style="color: #D43F3A">${theme.tname }</a>&nbsp;专区
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
							<input type="type"  placeholder="请输入关键字" style="height: 25px; width: 180px;"  />
							<input type="submit" value="搜索" style="height: 28px; width: 49px;" />&emsp;&emsp;&emsp;&emsp;
						</form>
					</a>
				</div> -->
			</div>
			<!--3 主题板块-->
			<div id="item">
						<div class="item1">
							<div class="iteminfo">
								<a  ondragstart="return false"><img src="img/index1.gif" /></a>
								<a  style="" > ${theme.tname }</a>
							</div>
							<div class="iteminfo">
							&emsp;&emsp;<a> 帖子数：${count.count}</a>
							</div>
						</div>
			</div>
			<!--4 图标部分-->
			<!-- <div id="logo1">
				<img src="img/1.png" height="68px" ondragstart="return false" />
			</div>  -->
			<!--4  发帖按钮部分-->
			<div id="buttons">
				<a style="font-size: 26px; color: red;" href="themePrintInfo.do?id=${theme.id}">发帖</a>&emsp;&emsp;
				<a style="font-size: 21px;">最新帖子</a>&emsp;&emsp;
			</div>
			<!--5 最新模块用户发帖显示-->
			<div id="AllInfo">
				<c:forEach items="${pageNewBean.postList}" var="pro">
					<div class="info">
					<div id="face">
						&emsp;<a href="showOtherUserInfo.do?email=${pro.uid.email}"><img src="${pro.uid.images}" width="68px" height="68px" ondragstart="return false" /></a>
					</div>
					<div id="eassyItem">
						<div id="info2">
							<a href="showessayInfo.do?id=${pro.id}" style="size: 8px"><h4>${pro.title}</h4></a>
						</div>
						<div class="info2">
							&emsp;&emsp; 用户：${pro.uid.username } &nbsp;&nbsp;浏览量：${pro.hot} &nbsp;&nbsp;发表时间：${pro.time }   
						</div>
					</div>
					</div>	
				</c:forEach>
				
				  
	<!--分页 -->
	  <div style="width: 380px; margin: 0 auto; margin-top: 50px;">
		<ul class="pagination" style="text-align: center; margin-top: 10px;">
			<!-- 上一页 -->
			<!-- 判断当前页是否是第一页 -->
			<c:if test="${pageNewBean.currentPage==1 }"> 
				<li class="disabled">
					<a href="javascript:void(0);" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
			</c:if> 
			<c:if test="${pageNewBean.currentPage!=1 }"> 
				<li>
					<a href="${pageContext.request.contextPath }/themeInfo.do?currentPageNew=${pageNewBean.currentPage-1}&id=${theme.id}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
			 </c:if>	
		
			 <c:forEach begin="1" end="${pageNewBean.totalPage }" var="page"> 
				<!-- 判断当前页 -->
				<c:if test="${pageNewBean.currentPage==page }">
					<li class="active"><a href="javascript:void(0);">${page}</a></li>
				</c:if>
				<c:if test="${pageNewBean.currentPage!=page }">
					<li><a href="${pageContext.request.contextPath }/themeInfo.do?currentPageNew=${page}&id=${theme.id}">${page}</a></li>
				</c:if>
			 </c:forEach>
			
			<!-- 判断当前页是否是最后一页 -->
			<c:if test="${pageNewBean.currentPage==pageNewBean.totalPage }">
				<li class="disabled">
					<a href="javascript:void(0);" aria-label="Next"> 
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
			<c:if test="${pageNewBean.currentPage!=pageNewBean.totalPage }">
				<li>
					<a href="${pageContext.request.contextPath }/themeInfo.do?currentPageNew=${pageNewBean.currentPage+1}&id=${theme.id}" aria-label="Next"> 
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
		</ul>
	</div>
	<!-- 分页结束 --> 
				
				
				<!-- ============================ -->
				<!--4  发帖按钮部分-->
			<div id="buttons">
				<a style="font-size: 26px; color: red;" href="themePrintInfo.do?id=${theme.id}">发帖</a>&emsp;&emsp;
				<a style="font-size: 21px; " >热门帖子</a>
			</div>
			<!--5 最热模块用户发帖显示-->
			<div id="AllInfo">
				<c:forEach items="${pageHotBean.postList }" var="pro">
					<div class="info">
					<div id="face">
						&emsp;<a href="showOtherUserInfo.do?email=${pro.uid.email}"><img src="${pro.uid.images}" width="68px" height="68px" ondragstart="return false" /></a>
					</div>
					<div id="eassyItem">
						<div id="info2">
							<a href="showessayInfo.do?id=${pro.id}"><h4>${pro.title}</h4></a>
						</div>
						<div class="info2">
							&emsp;&emsp; 用户：${pro.uid.username } &nbsp;&nbsp;浏览量：${pro.hot} &nbsp;&nbsp;发表时间：${pro.time }   
						</div>
					</div>
					</div>	
				</c:forEach>
			
			
		<!--分页 -->
	  <div style="width: 380px; margin: 0 auto; margin-top: 50px;">
		<ul class="pagination" style="text-align: center; margin-top: 10px;">
			<!-- 上一页 -->
			<!-- 判断当前页是否是第一页 -->
			<c:if test="${pageHotBean.currentPage==1 }"> 
				<li class="disabled">
					<a href="javascript:void(0);" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
			</c:if> 
			<c:if test="${pageHotBean.currentPage!=1 }"> 
				<li>
					<a href="${pageContext.request.contextPath }/themeInfo.do?currentPageHot=${pageHotBean.currentPage-1}&id=${theme.id}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
			 </c:if>	
		
			 <c:forEach begin="1" end="${pageHotBean.totalPage }" var="page"> 
				<!-- 判断当前页 -->
				<c:if test="${pageHotBean.currentPage==page }">
					<li class="active"><a href="javascript:void(0);">${page}</a></li>
				</c:if>
				<c:if test="${pageHotBean.currentPage!=page }">
					<li><a href="${pageContext.request.contextPath }/themeInfo.do?currentPageHot=${page}&id=${theme.id}">${page}</a></li>
				</c:if>
			 </c:forEach>
			
			<!-- 判断当前页是否是最后一页 -->
			<c:if test="${pageHotBean.currentPage==pageHotBean.totalPage }">
				<li class="disabled">
					<a href="javascript:void(0);" aria-label="Next"> 
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
			<c:if test="${pageHotBean.currentPage!=pageHotBean.totalPage }">
				<li>
					<a href="${pageContext.request.contextPath }/themeInfo.do?currentPageHot=${pageHotBean.currentPage+1}&id=${theme.id}" aria-label="Next"> 
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
		</ul>
	</div>
	<!-- 分页结束 --> 	
				
				
			</div>
			<!--7  分页 -->
			
			<!--8 页尾 -->
			<!-- 引入footer.jsp -->
			<jsp:include page="/footer.jsp"></jsp:include>
		</div>
	</body>
</html>
