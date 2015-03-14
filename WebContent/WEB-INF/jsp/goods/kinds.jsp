<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
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
<title>林飞科技3C数码城-中国移动</title>
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script language="javascript" type="text/javascript"
	src="<%=path%>/js/jquery-1.7.2.js"></script>
<script language="javascript" type="text/javascript"
	src="<%=path%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
function validate(a) {
	$.ajax({
				type : "post",
				url : "findgoodsbykind",
				data:{"kindsId":a},
				contentType : "application/x-www-form-urlencoded; charset=utf-8",
				dataType : "text",
				success : function(data) {
					alert(data);
					location.reload();
				},
				error : function(msg) {
					alert("wrong" + msg);
				}
			});
}
</script>
</head>
<body>
	<jsp:include page="../file/header.jsp"></jsp:include>
	<center>
		<div class="col-sm-offset-2 col-sm-10">
			<sf:errors class="alert alert-success" />
		</div>
		<br />
		<table class="table table-hover">
			<tr align="center">
				<td><b>商品种类</b></td>
				<td><b>操作</b></td>
			</tr>
			<c:choose>
				<c:when test="${gk == null || fn:length(gk) == 0}">
					<tr>
						<td colspan="2"><div class="alert alert-success">暂无商品种类，请到【新品上货】中添加分类！</div></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${gk}" var="data">
						<tr align="center">
							<td>${data.kind}</td>
							<td><a class="btn btn-default" onclick="validate(${data.kindsId})"><i class="glyphicon glyphicon-ban-circle">删除该分类</i></a></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</center>
	<jsp:include page="../file/footer.jsp"></jsp:include>
</body>
</html>