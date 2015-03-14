<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script language="javascript" type="text/javascript"
	src="<%=path%>/js/jquery-1.7.2.js"></script>
<script language="javascript" type="text/javascript"
	src="<%=path%>/js/bootstrap.min.js"></script>
</head>
<body>
	<center>
		<div class="jumbotron">
			<h1>林飞科技3C数码产品</h1>
			<p>手机销售维修，电脑组装，各类数码产品维修</p>
		</div>
		<c:choose>
			<c:when test="${username == null}">
			</c:when>
			<c:otherwise>
				<div class="alert alert-success">
					<p class="glyphicon glyphicon-user" align="right"><%=session.getAttribute("username")%>,
					您好！今天是<%=session.getAttribute("date")%>&nbsp;&nbsp;&nbsp;&nbsp;<a class="glyphicon glyphicon-log-out" href="/3c">退出登录</a></p>
				</div>
				<table width="60%">
					<tr align="center">
						<td><span class="btn btn-primary"
							onclick="window.location.href='shanghuo'"><i
								class="glyphicon glyphicon-arrow-up">&nbsp;新品上货</i></span></td>
						<td><span class="btn btn-warning"
							onclick="window.location.href='nowkuncun'"><i
								class="glyphicon glyphicon-search">&nbsp;现有库存</i></span></td>
						<td><span class="btn btn-success"
							onclick="window.location.href='jiesuan'"><i
								class="glyphicon glyphicon-random">&nbsp;售货结算</i></span></td>
						<td><span class="btn btn-danger"
							onclick="window.location.href='redirectkind'"><i
								class="glyphicon glyphicon-align-center">&nbsp;商品种类管理</i></span></td>
						<td><span class="btn btn-info"
							onclick="window.location.href='repwd'"><i
								class="glyphicon glyphicon-refresh">&nbsp;修改密码</i></span></td>
					</tr>
				</table>
				<br />
			</c:otherwise>
		</c:choose>
	</center>
</body>
</html>