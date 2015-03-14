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
		var name = $("#goodsName").val();
		var cb =$("#goodsCb").val();
		var number =$("#goodsNumber").val();
		if(name==null||name=="") {
			alert("请输入商品名称");
			return false;
		}else if(number==null||number=="") {
			alert("请输入商品库存");
			return false;
		}else if(cb==null||cb=="") {
			alert("请输入商品成本");
			return false;
		}else {
			return true;
		}
	}
</script>
</head>
<body>
	<embed src='<%=path%>/notice/welcome.mp3' hidden="true" autostart='true' loop='false'>
	<jsp:include page="../file/header.jsp"></jsp:include>
	<center>
		<div class="col-sm-offset-2 col-sm-10"><sf:errors class="alert alert-success"/> </div>
		<br />
		<sf:form method="post" modelAttribute="goods" action="updateGoods"
			onsubmit="return validate()">
			<input type="hidden" value="${goods.goodsId}" name="goodsId" />
			<table class="table table-hover">
				<tr align="center">
					<td colspan="2"><b>注意：</b>成本一旦修改，此前所售商品一律按此次修改的成本计算利润，否则请你选择【新品上货】</td>
				</tr>
				<tr>
					<td>商品名称：</td>
					<td><input type="text" name="goodsName" id="goodsName" value="${goods.goodsName}"/></td>
				</tr>
				<tr>
					<td>商品种类：(不可修改)</td>
					<td><input type="text" name="goodsKind" id="goodsKind" value="${goods.goodsKind}" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>商品库存：</td>
					<td><input type="text" name="goodsNumber" id="goodsNumber" value="${goods.goodsNumber}"/></td>
				</tr>
				<tr>
					<td>商品单件成本：</td>
					<td><input type="text" name="goodsCb" id="goodsCb" value="${goods.goodsCb}"/></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit"  class="btn btn-info" value="确认修改信息"></td>
				</tr>
			</table>
		</sf:form>
	</center>
	<jsp:include page="../file/footer.jsp"></jsp:include>
</body>
</html>