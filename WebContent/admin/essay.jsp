<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>贴子管理</title>
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
                        <h3 class="box-title">帖子管理</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <button type="button" onclick="dele()" class="btn btn-default" title="删除" ><i class="fa fa-trash-o" ></i> 删除</button>           
                                        <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                    <div class="has-feedback" id="search1">
                                    	帖子标题：<input placeholder="关键字" >
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
										  <th class="sorting_asc">帖子标题</th>
									      <th class="sorting">发布人</th>									      
									      <th class="sorting">发布时间</th>	
									      <th class="text-center">操作</th>
			                          </tr>
			                      </thead>
			                      <tbody>
			                      		<c:forEach items="${list}" var="pro">
			                      	 <tr>
			                              <td><input type="radio" name="id" id="id" value="${pro.id}" ></td>			                              
				                          <td>${pro.title}</td>
									      <td>${pro.uid.username}</td>									     
		                                  <td>${pro.time}</td>
		                                  <td class="text-center">                                           
		                                  	  <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#info" onclick="show('${pro.content}')" >正文</button>                                           
		                                  </td>
			                          </tr>
			                      </c:forEach>
			                      </tbody>
			                  </table>
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
   		/* 提交删除 */
   		function dele() {  
   			var id = $('input[id="id"]:checked').val();//获取已选中的id的value
   			$.ajax({
   				url:"deleById",
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