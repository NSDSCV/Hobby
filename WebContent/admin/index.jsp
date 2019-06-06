<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Hobby社区管理系统</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">

    <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="../plugins/jQueryUI/jquery-ui.min.js"></script>
    <script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="../plugins/adminLTE/js/app.min.js"></script>
	<script type="text/javascript">
	/* 自动执行函数 */
	(function () {
		var loginFlag='${loginFlag}';
		if(loginFlag!=2){
			window.location.href="../login/name";
		}
	} ());
	</script>
<script type="text/javascript">   
		 function SetIFrameHeight(){
		  	  var iframeid=document.getElementById("iframe"); //iframe id
		  	  if (document.getElementById){
		  		iframeid.height =document.documentElement.clientHeight;			   	   
			  }
		 }
    
	</script>    
 
</head>

<body class="hold-transition skin-green sidebar-mini" >

    <div class="wrapper">

        <!-- 页面头部 -->
        <header class="main-header">
            <!-- Logo -->
            <a class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini"><b>Hobby社区</b></span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg"><b>Hobby社区后台管理</b></span>
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top">
                <!-- Sidebar toggle button-->
                <a class="sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>

                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <!-- Messages: style can be found in dropdown.less-->
                        <li class="dropdown messages-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-envelope-o"></i>
                            </a>
                            
                        </li>
                        
                        
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a class="dropdown-toggle" data-toggle="dropdown">
                                <img src="../img/photo.png" class="user-image" alt="User Image">
                                <span class="hidden-xs">${adminName}</span>
                            </a>  
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header">
                                    <img src="../img/photo.png" class="img-circle" alt="User Image">

                                    <p>
                                       ${adminName }
                                    </p>
                                </li>
                                
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="../logout" class="btn btn-default btn-flat">注销</a>
                                    </div>
                                    
                                </li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </nav>
        </header>
        <!-- 页面头部 /-->

        <!-- 导航侧栏 -->
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- Sidebar user panel -->
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="../img/photo.png" class="img-circle" alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <p> ${adminName}</p>
                        <a><i class="fa fa-circle text-success"></i> 在线</a>
                    </div>
                </div>
              

                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu"  >
                    <li class="header">菜单</li>
					<li id="admin-login">
				                <a href="../home/AllCount" target="iframe">
				                    <i class="fa fa-circle-o"></i>首页
				                </a>
			        </li>
				    <!-- 菜单 -->
				    <li class="treeview">
				        <a href="#">
				            <i class="fa fa-folder"></i> 
				            <span>关于用户</span>
				            <span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
				        </a>
				        <ul class="treeview-menu">
							<li id="admin-login">
				                <a href="../user/findAlluser" target="iframe">
				                    <i class="fa fa-circle-o"></i>用户管理
				                </a>
				            </li>
				        </ul>                        
				    </li>
					<li class="treeview">
				        <a href="#">
				            <i class="fa fa-folder"></i> 
				            <span>关于帖子</span>
				            <span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
				        </a>
				        <ul class="treeview-menu">
				
							<li id="admin-login">
				                <a href="../post/findAllPost" target="iframe">
				                    <i class="fa fa-circle-o"></i>帖子管理
				                </a>
				            </li>
							
				        </ul>                        
				    </li>
					
					<li class="treeview">
				        <a href="#">
				            <i class="fa fa-folder"></i> 
				            <span>关于版块</span>
				            <span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
				        </a>
				        <ul class="treeview-menu">
							 <li id="admin-login">
				                <a href="../theme/findAllTheme" target="iframe">
				                    <i class="fa fa-circle-o"></i>版块管理
				                </a>
				            </li>
				        </ul>                        
				    </li>
				    <li class="treeview">
				        <a href="#">
				            <i class="fa fa-folder"></i> 
				            <span>关于投诉</span>
				            <span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
				        </a>
				        <ul class="treeview-menu">
							 <li id="admin-login">
				                <a href="../complaintPost/findAllComplaint" target="iframe">
				                    <i class="fa fa-circle-o"></i>投诉帖子
				                </a>
				                <a href="../complaintComment/findAllComplaint" target="iframe">
				                    <i class="fa fa-circle-o"></i>投诉评论
				                </a>
				            </li>
				        </ul>                        
				    </li>
                </ul>
            </section>
            <!-- /.sidebar -->
        </aside>
        <!-- 导航侧栏 /-->

        <!-- 内容区域 -->
        <div class="content-wrapper">
			<iframe width="100%" id="iframe" name="iframe"	onload="SetIFrameHeight()" 
					frameborder="0"></iframe>
 
        </div>
        <!-- 内容区域 /-->

        <!-- 底部导航 -->
        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                <b>Version</b> 1.0
            </div>
            <strong>Copyright &copy; 2018-2019 Hobby社区研发部.</strong> All rights reserved.
        </footer>
        <!-- 底部导航 /-->

    </div>

</body>

</html>