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
	$(document).ready(function() {
		$("#kinds").hide();
		$("#addkind").click(function() {
			$("#kinds").toggle();
		});
	});
	function validate() {
		if (!IsNum($("#shanghuonum").val())||!IsNum($("#danjian").val())) {
			alert("上货数量和单价，请输入数字!")
			return false;
		}
	}
	function IsNum(num) {
		var reNum = /^\d*$/;
		return (reNum.test(num));
	}
</script>
</head>
<body>
	<jsp:include page="../file/header.jsp"></jsp:include>
	<center>
		<div class="col-sm-offset-2 col-sm-10">
			<sf:errors class="alert alert-success" />
		</div>
		<sf:form class="form-inline" method="post" modelAttribute="gk"
			action="addKind" id="kinds">
			<div class="form-group">
				<input type="text" name="kind" size="50" class="form-control" />
			</div>
			<div class="form-group">
				<input type="submit" value="确认添加商品种类" class="btn btn-info">
			</div>
		</sf:form>
		<br />
		<sf:form method="post" modelAttribute="goods" action="shangHuo">
			<table class="table table-hover">
				<tr>
					<td>商品名称：</td>
					<td><sf:input path="goodsName" size="50" /></td>
				</tr>
				<tr>
					<td>商品种类：</td>
					<td><select name="goodsKind">
							<c:choose>
								<c:when test="${kinds == null || fn:length(kinds) == 0}">
									<option value="">----暂无商品种类----</option>
								</c:when>
								<c:otherwise>
									<c:forEach items="${kinds}" var="data">
										<option value="${data.kind}">${data.kind}</option>
									</c:forEach>
								</c:otherwise>
							</c:choose>
					</select> <b id="addkind" class="glyphicon glyphicon-plus"
						onmouseover="this.style.cursor='pointer'">添加分类</b></td>
				</tr>
				<tr>
					<td>上货数量：</td>
					<td><sf:input path="goodsNumber" id="shanghuonum"/></td>
				</tr>
				<tr>
					<td>商品单件成本：</td>
					<td><sf:input path="goodsCb" id="danjian"/></td>
				</tr>
				<tr>
					<td><input type="submit" value="确认上货" class="btn btn-info"></td>
					<td><input type="reset" value="清空" class="btn btn-info"></td>
				</tr>
			</table>
		</sf:form>
	</center>
	<jsp:include page="../file/footer.jsp"></jsp:include>
</body>
</html>