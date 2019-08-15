<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>springmvc</title>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<style type="text/css">
	body{
		background:#F5F5F5;
		padding:auto;
	}
	table{
		margin:auto;
	}
	#tableId{
		border:1px solid white;
		
	}
	
	#tableId tr td{
		padding:15px 25px;
	}
	#divs{
		width:300px;
		height:200px;
		margin:auto;
	}
</style>

<script type="text/javascript">
	$(function(){
		$("#divs").hide();
	});
	function addUser(){
		$("#divs").show();
		$("#divs form").attr("action","insertByUsers.do");
	}
	
	function updateUser(){
		$("#divs").show();
		$("#divs form").attr("action","updateByUsers.do");
		$("[name='str']").each(function(){
			if($(this).prop("checked")){
				var i = $(this).val();
				$("#userId").val(i);
				$("#userPassword").val($("#userPassword"+i).html());
				$("#userSex").val($("#userSex"+i).html());
				$("#userPhone").val($("#userPhone"+i).html());
				
			};
		});
	}
</script>
</head>
<body>
	<form action="deleteByUsers.do">
	<table>
		<tr>
			<td><input type="button" value="新增用户 "  onclick="addUser();"/></td>
			<td><input type="submit" value="删除用户"/></td>
			<td><input type="button" value="修改用户信息"  onclick="updateUser();"/></td>
		</tr>
	</table>
	<table id="tableId" >
		<tr>
			<th></th>
			<th>用户账号</th>
			<th>用户密码</th>
			<th>用户性别</th>
			<th>用户手机号码</th>
		</tr>
		<c:forEach items="${userList }" var="i">
		<tr>
			<td><input type="checkbox" name="str" value="${i.userId}"/></td>
			<td id="userId${i.userId }">${i.userId }</td>
			<td id="userPassword${i.userId }">${i.userPassword }</td>
			<td id="userSex${i.userId }">${i.userSex }</td>
			<td id="userPhone${i.userId }">${i.userPhone }</td>
		</tr>
		</c:forEach>
		
	</table>
	</form>
	<div id="divs" style="background:white;">
		<form>
			<table>
			<tr><td>用户账号<input type="text" id="userId" name="userId"/></td></tr>
			<tr><td>用户密码<input type="text" id="userPassword" name="userPassword"/></td></tr>
			<tr><td>用户性别<input type="text" id="userSex" name="userSex"/></td></tr>
			<tr><td>手机号码<input type="text" id="userPhone" name="userPhone"/></td></tr>
			<tr><td><input type="submit"></td></tr>
			</table>
		</form>
	</div>
	
</body>
</html>