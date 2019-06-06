<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>发布帖子</title>
		<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
		 <!-- 富文本编辑器 -->
		<link rel="stylesheet" href="kindeditor/themes/default/default.css" />
		<link rel="stylesheet" type="text/css" href="css/scanfInfo.css" />
		<script charset="utf-8" src="kindeditor/kindeditor-min.js"></script>
		<script charset="utf-8" src="kindeditor/lang/zh_CN.js"></script>
		<!-- 正文区域 /-->
		<script>
			var editor;
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="content"]', {
					resizeType : 1,
					allowPreviewEmoticons : false,
					allowImageUpload : false,
					allowFileManager : true,
					allowFlashUpload:false,
					allowMediaUpload:false,
					newlineTag:'br',
					items : [
						'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist', '|', 'emoticons'],
						//限制字数 200字以内
			            afterChange : function() {
			                $('content').html(this.count('text'));//字数统计包含纯文本、IMG、EMBED，不包含换行符，IMG和EMBED算一个文字
			                if(this.count('text') > 200) {
			                	alert("字数已经超过了200字");
			                   var strValue=editor.text();
			                   editor.text("");
			                    editor.appendHtml(strValue.substring(0,200));
			                }
			            }
				});
			});
		</script>
		
<!-- 提交发帖 -->
<script type="text/javascript">
		function getPost(){
			var content=editor.html();//取出富文本的HTML格式的文本内容
			var title=document.getElementById("title").value;//取出标题内容
			var id=document.getElementById("id").value;//取出主题内容
			 if (content == ""){
				alert ("亲，正文不能为空哦");
				selectObj.focus();
				return false;
			} 
			 if (title == ""){
				alert ("亲，标题不能为空哦");
				selectObj.focus();
				return false;
			} 
			 $.ajax({
				url:"printPost.do",
				data:{"content":content,"title":title,"id":id},
				type:"post",	
				success:function(data){
					if(data!=""){
						alert("发布成功！");
						window.location="showessayInfo.do?id="+data;
					}
				},
				error:function(data){
					if(data==""){
						alert("发布帖子失败！！");
					}
				}
			}); 
		}		
</script>
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
					&emsp;&emsp;&emsp;
					
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
			<!--3 面包屑-->
			<div id="mianbaoxie">
					<a href="indexShow.do">首页</a>><a>发布帖子</a><br /><br />
			&nbsp;&nbsp;&nbsp;
				<a style="color: red;">请遵守《互联网论坛社区服务管理规定》，不得违反国家法律法规，一旦发现或被举报，必将实名封号处理</a>
			</div><br />
			<!-- 发帖的主题栏选择 -->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<b>主题：</b>
				<input type="hidden" value="${theme.id}" id="id" name="id" readonly="readonly" style="width: 117px;height: 32px">
				<input type="text" value="${theme.tname}" id="tname" name="tname" readonly="readonly" style="width: 117px;height: 32px">
			&nbsp;&nbsp;&nbsp;&nbsp;
			
			<!-- 帖子标题 -->
			<b>帖子标题：</b>
			<input type="text" id="title" name="title" style="width: 270px;height: 25px">
			<!--4 富文本编辑器-->
			<div id="kindeditor">
			<b>正文：</b>
			<br>
				<textarea id="content" name="content" style="width:800px;height:400px;visibility:hidden;" ></textarea>
				<br />
				&emsp;<input type="submit" onclick="getPost()" width="100" value="发帖" name="submit" style="background: url('img/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
			</div>
			<!--5 页尾 -->
			<!-- 引入footer.jsp -->
			<jsp:include page="/footer.jsp"></jsp:include>
		</div>
	</body>
</html>
