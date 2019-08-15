<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>员工管理</title>
    <link rel="stylesheet" type="text/css" href="../themes/metro/easyui.css">  
    <link rel="stylesheet" type="text/css" href="../themes/mobile.css">  
    <link rel="stylesheet" type="text/css" href="../themes/icon.css">  
    <script type="text/javascript" src="../js/jquery.min.js"></script>  
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script> 
    <script type="text/javascript" src="../js/jquery.easyui.mobile.js"></script> 
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script> 
    
	<script type="text/javascript">
		var result = 0;
		$(function(){
			//清空表单
			$("#myForm").form("clear");
			//修饰表格
			$('#dg').datagrid({    
		  	  	url:'../selectByUsers.do',
		    	method:'get',   
		    	//单行选中  true:单行  false:多行
		    	singleSelect:false,
		    	//设置表格滚动条的宽高
		    	scrollbarSize:0,
		    	//自适应列宽
		    	fitColumns:true,
		    	//显示分页工具栏
				pagination:true,
		    	//设置表格行背景为斑马线样式
		    	striped:true,
		    	columns:[[    
		       		{field:'userId',title:'用户账号',width:100},
		       		{field:'userPassword',title:'用户密码',width:100},
		       		{field:'userSex',title:'用户性别',width:100},
		       		{field:'userPhone',title:'手机号码',width:120}
		    	]],
		    	 //添加工具栏
			    toolbar: [{
				    //工具名
				    text:'添加用户',
				    //图标样式
					iconCls: 'icon-add',
					//点击触发：回调函数
					handler: function(){
						//打开添加信息div
						$("#dd").dialog('open').dialog("setTitle","添加用户");
						$("#hiddenId").attr("value","insertByUsers.do");
					}
				},'-',{
					text:'修改用户信息',
					iconCls: 'icon-edit',
					handler: function(){
						//得到要修改的行：数组
						var row = $("#dg").datagrid("getSelections");
						//判断行引用不为空
						if(row.length == 0){
							$.messager.alert('提示','请选择要修改信息的员工','info');				
						}else if(row.length == 1){
							//将row数据赋到修改form中
							$('#myForm').form('load',row[0]);
							//打开div窗口 并修改窗口标题
							$("#dd").dialog("open").dialog("setTitle","修改员工信息");
							$("#hiddenId").attr("value","updateByUsers.do");
						}else{
							$.messager.alert('提示','一次只能选择一位员工','info');				
						}
					}
				},'-',{
					text:'删除用户',
					iconCls: 'icon-lock',
					handler: function(){
						//得到要禁用的行：数组
						var row = $("#dg").datagrid("getSelections");
						//判断数组不为空
						if(row.length != 0){
							$.messager.confirm('提示', '您确定要删除所选用户？', function(r){
								//确定
								if (r){
									//存放所有要删除的用户id
									var userIdList = [];
									//循环所有要删除的行
									$(row).each(function(){
										userIdList.push(this.userId);
										$.ajax({
											type:'post',
											data:JSON.stringify(userIdList),
											dataType:'html',
											contentType:"application/json",
											url:'../deleteByUsers.do',
											success:function(data){
												//判断是否禁用成功
												if(data == 'ok'){
													//禁用成功数+1
													result++;
													//判断禁用成功数和数组长度是否相等
													if(result == row.length){
														//恢复成功数变量初始值
														result=0;
														$.messager.alert('提示','成功删除该用户','info');
														//刷新表格
														$('#dg').datagrid("reload");
													}
												}
											}
										});
										
									});
								}
							});
						}else{
							$.messager.alert('提示','请选择要删除的用户','info');
						}
					}
				},'-',{
					text:'用户账号:<input class="easyui-textbox" id="userIds" name="userId"></input>',
					handler:function(){
					}
				},{
					text:'<input type="button" value="搜索">',
					handler:function(){
						$('#dg').datagrid('load',{
							userId:$("#userIds").val(),
							});
					}
				}]

			});
		 	
		});
		
		function handle(){
			var hiddenId = $("#hiddenId").val();
			$("#myForm").form("submit",{
					url:'../'+hiddenId,
					onSubmit: function(){    
					      var isValid = $(this).form('validate');
					      return isValid;
					},    
					success:function(data){  
						alert(data);
					        if(data == "ok"){
					        	$.messager.alert('提示','操作成功','info');
								//关闭div窗口
								$("#dd").dialog('close');
								//清空表单
								$("#myForm").form("clear");
								//重新查询数据库刷新数据表格
								$('#dg').datagrid("reload");
						    }else{
					        	$.messager.alert('提示','操作失败','info');
						    }
					    }      
				});
			
		}
	</script>
  </head>
  
  <body bgcolor="#F8F8F8">
   	<table id="dg" style="width:87%;"></table>
   	<div id="dd" class="easyui-dialog" style="padding:10px 15px;left:400px;top:70px;width:450px;height:490px;"   
        data-options="closed:true,draggable:true">   
        <form id="myForm" method="post">
        	<table>	
        		<tr height="40px">
        			<td>用户账号</td>
        			<td><input class="easyui-textbox" data-options="required:true" style="width:180px" name="userId"/> </td>
        		</tr>
        		<tr height="40px">
        			<td>用户密码</td>
        			<td><input class="easyui-textbox"  data-options="required:true" style="width:180px" name="userPassword"/></td>
        		</tr>
        		<tr height="40px">
        			<td>用户性别</td>
        			<td><input type="radio" name="userSex" data-options="required:true" value="男"/>男  <input type="radio" name="userSex" value="女"/>女</td>
        		</tr>
        		<tr height="40px">
        			<td>手机号码</td>
        			<td><input class="easyui-textbox" data-options="required:true" style="width:180px" name="userPhone"/></td>
        		</tr>
        		<tr height="40px">
        			<td></td>
        			<td><a id="btn"  class="easyui-linkbutton" onclick="handle();">确认</a> 
    					<a id="btn"  class="easyui-linkbutton" onclick="$('#dd').dialog('close');$('#myForm').form('clear');">取消</a> </td>
        		</tr>
        	</table>
    		<input type="hidden" name="handle" onclick="handle();" id="hiddenId">
  
    		
		</form>	
	</div>
  </body>
</html>
