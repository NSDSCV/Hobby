<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>版块管理</title>
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="../css/style.css">
	<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
  
   
</head>

<body class="hold-transition skin-red sidebar-mini">
  <!-- .box-body -->
                    <div class="box-header with-border">
                        <h3 class="box-title">版块管理</h3>
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
										  <th class="sorting_asc">版块名</th>
					                      <th class="text-center">操作</th>
			                          </tr>
			                      </thead>
			                      <tbody>
			                      <c:forEach items="${list}" var="one">
			                      		 <tr>
			                              <td><input  type="checkbox" ></td>			                              
				                          <td>${one.tname}</td>
		                                  <td class="text-center">                                           
		                                 	  <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#editModal" onclick="edit('${one.id}','${one.tname}')">修改</button>                                           
		                                  </td>
			                          </tr>
			                      </c:forEach>
			                      </tbody>
			                  </table>
                        </div>
                     </div>
                    <!-- /.box-body -->
         
<!-- 编辑窗口 -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" >
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">版块编辑</h3>
		</div>
		<div class="modal-body">		
			<table class="table table-bordered table-striped"  width="800px">
		      	<tr>
		      		<td>版块ID</td>
		      		<td><input readonly="readonly"  class="form-control" id="tid" name="tid" >  </td>
		      	</tr>
		      	<tr>
		      		<td>版块名</td>
		      		<td><input  class="form-control" id="tname" name="tname" >  </td>
		      	</tr>		      	
			 </table>				
		</div>
		<div class="modal-footer">						
			<button  class="btn btn-success" data-dismiss="modal" aria-hidden="true" onclick="update()">保存</button>
			<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
		</div>
	  </div>
	</div>
</div>
<script type="text/javascript">
	/* 数据回显 */
	function edit(id,name) {
		$('#tid').val(id);
		$('#tname').val(name); 
	}
	/* 提交修改 */
	function update() {
		var id=$('#tid').val();
		var tname=$('#tname').val();
		$.ajax({
			url:"editTheme",
			data:"id="+id+"&tname="+tname,
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