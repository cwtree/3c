<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>林飞科技3C数码城-中国移动</title>
<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script language="javascript" type="text/javascript"
	src="<%=path%>/js/jquery-1.7.2.js"></script>
<script language="javascript" type="text/javascript"
	src="<%=path%>/js/bootstrap.min.js"></script>
<style type="text/css">
table {
	border-collapse: collapse;
	text-align: center;
	margin: 0 auto
}

table tr td {
	border: 1px #999 solid;
	padding: 5px;
	width: 100px
}

table .header {
	background: #E1E1E1
}

table .header:hover {
	text-decoration: none
}

table tr {
	background: #EFEFEF
}

table tr:hover {
	text-decoration: underline
}
</style>
</head>
<body>
	<jsp:include page="file/header.jsp"></jsp:include>
	<center>
		<sf:form method="post" modelAttribute="userInfo" action="login"
			class="form-inline" role="form">
			<table width="40%" align="center" border="1">
				<tr>
					<td>用户名</td>
					<td><sf:input path="username" size="30"/></td>
				</tr>
				<tr>
					<td>密码</td>
					<td><sf:password path="password" size="30"/></td>
				</tr>
				<tr>
					<td colspan="2"><button type="submit" class="btn btn-primary" >登录</button></td>
				</tr>
			</table>
			<sf:errors class="label label-danger" />
			<br />
			<br />
		</sf:form>
	</center>
</body>
</html>