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
	function validate() {
		var kucun = parseInt($("#kucun").val());
		var dealnum =parseInt($("#dealNum").val());
		if (dealnum > kucun) {
			alert("成交量不能大于库存量！");
			$("#dealNum").val(1);
			return false;
		}else {
			var price = $("#goodsPrice").val();
			if(price==null||price=="") {
				alert("请输入(整数)售出单价！");
				return false;
			}
		}
		return true;
	}
</script>
</head>
<body>
	<embed src='<%=path%>/notice/welcome.mp3' hidden="true" autostart='true' loop='false'>
	<jsp:include page="../file/header.jsp"></jsp:include>
	<center>
		<div class="col-sm-offset-2 col-sm-10"><sf:errors class="alert alert-success"/> </div>
		<br />
		<sf:form method="post" modelAttribute="goods" action="shouHuo"
			onsubmit="return validate()">
			<input type="hidden" value="${goods.goodsId}" name="goodsId" />
			<table class="table table-hover">
				<tr>
					<td>商品名称：</td>
					<td>${goods.goodsName}</td>
				</tr>
				<tr>
					<td>商品种类：</td>
					<td>${goods.goodsKind}</td>
				</tr>
				<tr>
					<td>成交数量：（目前库存：<input type="text" name="kucun" id="kucun"
						value="${goods.goodsNumber}" readonly="readonly" size="5"></td>
					<td><input type="text" name="dealNumber" id="dealNum"
						value="1"></td>
				</tr>
				<tr>
					<td>售出单价：</td>
					<td><input type="text" name="goodsPrice" id="goodsPrice"/></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit"  class="btn btn-info" value="确认售出"></td>
				</tr>
			</table>
		</sf:form>
	</center>
	<jsp:include page="../file/footer.jsp"></jsp:include>
</body>
</html>