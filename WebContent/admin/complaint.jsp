<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>被投诉的帖子</title>
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="../css/style.css">
	<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
	<style>
		#search1{
			float: right;
			padding-left: 774px;
		}
	</style>
    
</head>
<body class="hold-transition skin-red sidebar-mini">
  <!-- .box-body -->
                    <div class="box-header with-border">
                        <h3 class="box-title">被投诉的帖子</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                    <div class="has-feedback" id="search1">
                                    	用户名：<input >
											<button class="btn btn-default" >查询</button>                                    
                                	</div>
                                </div>
                            </div>
                            <div class="box-tools pull-right">
                                <div class="has-feedback">
							                                         
                                </div>
                            </div>
                            <!--工具栏/-->

			                  <!--数据列表-->
			                  <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
			                      <thead>
			                          <tr>
			                              <th class="" style="padding-right:0px">
			                              </th> 
										  <th class="sorting_asc">投诉帖子标题</th>
									      <th class="sorting">被投诉的用户</th>									      
									      <th class="sorting">投诉人</th>									     				
									      <th class="sorting">审核状态</th>									     				
					                      <th class="text-center">操作</th>
			                          </tr>
			                      </thead>
			                      <tbody>
			                      <c:forEach items="${list}" var="pro">
			                      		<tr>
			                              <td><input  type="checkbox" ></td>			                              
				                          <td>${pro.pid.title}</td>
									      <td>${pro.bename.username}</td>									     
		                                  <td>${pro.name.username}</td>
		                                  <c:if test="${pro.bename.status==1 }">
			                                  <td><a style="color: red">已将用户：${pro.bename.username} 封号</a></td>		                                 
		                                  </c:if>
		                                  <c:if test="${pro.bename.status==0 }">
			                                  <td>未通过</td>		                                 
		                                  </c:if>		                                 
		                                  <td class="text-center">                                           
		                                 	  <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#editModal" onclick="showBeName('${pro.bename.username}','${pro.id}')"  >处理</button>                                           
		                                  	  <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#info" onclick="show('${pro.pid.content}')"  >正文</button>                                           
		                                  </td>
			                          </tr>
			                      </c:forEach>
			                      </tbody>
			                  </table>
			                  <!--数据列表/-->                        
							 
                        </div>
                        <!-- 数据表格 /-->
                        
                     </div>
                    <!-- /.box-body -->
         
<!-- 处理窗口 -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" >
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">处理</h3>
		</div>
		<div class="modal-body">		
			<table class="table table-bordered table-striped"  width="800px">
		      	<tr>
		      		<td>要处理的用户</td>
		      		<td>
		      			<input readonly="readonly" id="bename" name="bename">
		      			<input type="hidden" id="id" name="id">
		      		 </td>
		      	</tr>		      	
		    </table>				
		</div>
		<div class="modal-footer">
			<button class="btn btn-success" data-dismiss="modal" aria-hidden="true" onclick="dealBeNameSuccess()">审核通过（封号处理）</button>
         	<button class="btn btn-danger"  data-dismiss="modal" aria-hidden="true" onclick="dealBeNameFail()">审核未通过</button>
			<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
		</div>
	  </div>
	</div>
</div>
<!-- 帖子正文 -->
<div class="modal fade" id="info" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" >
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">帖子正文</h3>
		</div>
		<div class="modal-body">		
				<!--正文显示-->
				<textarea readonly="readonly" id="content" name="content" style="height: 238px;width: 569px"></textarea>
		</div>
		<div class="modal-footer">	
			<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
		</div>
	  </div>
	</div>
</div>
   <script type="text/javascript">
   		/* 数据回显 */
   		function show(content) {
			$('#content').val(content);
		}
   		/* 显示处理框的信息 */
   		function showBeName(bename,id) {
			$('#id').val(id);
   			$('#bename').val(bename);
   		}
   		/* 提交通过 */
   		function dealBeNameSuccess() {  
   			var id=document.getElementById("id").value;
   			$.ajax({
   				url:"dealBeNameSuccess",
   				data:"id="+id,
   				type:"post",	
   				success:function(data){
   					window.location.reload();
   				},
   				error:function(){
   					window.location.reload();
   				} 
   		 });
   		}
   		/* 提交未通过 */
   			function dealBeNameFail() {  
   			var id=document.getElementById("id").value;
   			$.ajax({
   				url:"dealBeNameFail",  
   				data:"id="+id,
   				type:"post",	
   				success:function(data){
   					window.location.reload();
   				},
   				error:function(){
   					window.location.reload();
   				} 
   		 });
   		}
   </script>
</body>
</html>