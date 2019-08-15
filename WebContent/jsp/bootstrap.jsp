<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>bootstrap</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>

<script
	src="C:\Users\lijie\Desktop\bootstrap-table\dist\bootstrap-table.js"></script>
<link
	href="C:\Users\lijie\Desktop\bootstrap-table\dist\bootstrap-table.min.css"
	rel="stylesheet" />
<script
	src="C:\Users\lijie\Desktop\bootstrap-table\dist\locale\bootstrap-table-zh-CN.min.js"></script>

<script>
	$(function() {
		$("#realTime_Table").bootstrapTable({
			search : true,
			pagination : false,
			pageSize : 15,
			pageList : [ 5, 10, 15, 20 ],
			showColumns : true,
			showRefresh : false,
			showToggle : true,
			locale : "zh-CN",
			striped : true
		});
	});
</script>
</head>
<body>
	<div class="container-fluid" bgcolor="red">
		<table id="realTime_Table" data-click-to-select="true"
			class="table table-hover" data-page-size="20">
			<thead>
				<tr>
					<th data-sortable="true" data-field="realTimeDate">日期</th>
					<th data-sortable="true" data-field="newPlayerNum">新增用户</th>
					<th data-sortable="true" data-field="activePlayerNum">活跃用户</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
</body>
</html>
