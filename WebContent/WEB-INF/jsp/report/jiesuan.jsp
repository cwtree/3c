<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script language="javascript" type="text/javascript"
	src="<%=path%>/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#day").val("");
	$("#month").val("");
	$("#year").val("");
	$("#showsum").hide();
});
function validate() {
	var v1 = $("#day").val();
	var v2 = $("#month").val();
	var v3 = $("#year").val();
	var sum_len = v1.length+v2.length+v3.length;
	if(sum_len>10||sum_len<4) {
		alert("请选择一个日期输入框并按格式输入(日度:2014-03-08;月度:2014-03;年度:2014)");
		$("#day").val("");
		$("#month").val("");
		$("#year").val("");
		return false;
	}
	if(v1.length==10) {
		$.ajax({
			type : "post",
			url : "dayjiesuan",
			data:{"day":$("#day").val()},
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			dataType : "json",
			success : function(data) {
				if (data.date.length > 0) {
					var sum = 0;
					$("#content tr:gt(0)").remove();
					for (var i = 0; i < data.date.length; i++) {
						$str = "<tr align='center'><td>";
						$str += data.kind[i] + "</td>";
						$str += "<td>" + data.name[i] + "</td>";
						$str += "<td>" + data.cb[i] + "</td>";
						$str += "<td>" + data.price[i] + "</td>";
						$str += "<td>" + data.number[i] + "</td>";
						$str += "<td>" + data.lirun[i] + "</td>";
						$str += "<td>" + data.date[i] + "</td></tr>";
						$("#content").append($str);
						sum+=parseFloat(data.lirun[i]);
					}
					$("#sum").html(sum);
					$("#jisuanri").html(data.jiesuanri);
					$("#showsum").show();
				} else {
					alert(v1+" 无销售记录");
				}
			},
			error : function(msg) {
				alert("wrong" + msg);
			}
		});
		return true;
	}else if(v2.length==7) {
		$.ajax({
			type : "post",
			url : "monthjiesuan",
			data:{"month":$("#month").val()},
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			dataType : "json",
			success : function(data) {
				if (data.date.length > 0) {
					var sum = 0;
					$("#content tr:gt(0)").remove();
					for (var i = 0; i < data.date.length; i++) {
						$str = "<tr align='center'><td>";
						$str += data.kind[i] + "</td>";
						$str += "<td>" + data.name[i] + "</td>";
						$str += "<td>" + data.cb[i] + "</td>";
						$str += "<td>" + data.price[i] + "</td>";
						$str += "<td>" + data.number[i] + "</td>";
						$str += "<td>" + data.lirun[i] + "</td>";
						$str += "<td>" + data.date[i] + "</td></tr>";
						$("#content").append($str);
						sum+=parseFloat(data.lirun[i]);
					}
					$("#sum").html(sum);
					$("#jisuanri").html(data.jiesuanri);
					$("#showsum").show();
				} else {
					alert(v2+" 无销售记录");
				}
			},
			error : function(msg) {
				alert("wrong" + msg);
			}
		});
		return true;
	}else if(v3.length==4) {
		$.ajax({
			type : "post",
			url : "yearjiesuan",
			data:{"year":$("#year").val()},
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			dataType : "json",
			success : function(data) {
				if (data.date.length > 0) {
					var sum = 0;
					$("#content tr:gt(0)").remove();
					for (var i = 0; i < data.date.length; i++) {
						$str = "<tr align='center'><td>";
						$str += data.kind[i] + "</td>";
						$str += "<td>" + data.name[i] + "</td>";
						$str += "<td>" + data.cb[i] + "</td>";
						$str += "<td>" + data.price[i] + "</td>";
						$str += "<td>" + data.number[i] + "</td>";
						$str += "<td>" + data.lirun[i] + "</td>";
						$str += "<td>" + data.date[i] + "</td></tr>";
						$("#content").append($str);
						sum+=parseFloat(data.lirun[i]);
					}
					$("#sum").html(sum);
					$("#jisuanri").html(data.jiesuanri);
					$("#showsum").show();
				} else {
					alert(v3+" 无销售记录");
				}
			},
			error : function(msg) {
				alert("wrong" + msg);
			}
		});
		return true;
	} else {
		alert("请严格按照格式要求输入(日度:2014-03-08;月度:2014-03;年度:2014)");
		$("#day").val("");
		$("#month").val("");
		$("#year").val("");
		return false;
	}
}
</script>
</head>
<body>
	<jsp:include page="../file/header.jsp"></jsp:include>
	<center>
		<table>
			<tr>
				<td colspan="4"><div class="alert alert-danger">默认为今日销售结算。也可以自定义结算查询，同时只能在一个输入框中输入！</div></td>
			</tr>
			<tr>
				<td><span class="glyphicon glyphicon-th"><b>日</b>度结算(yyyy-mm-dd)</span><input
					id="day" type="text" onClick="WdatePicker()" /></td>
				<td><span class="glyphicon glyphicon-th"><b>月</b>度结算(yyyy-mm)</span><input
					id="month" type="text" /></td>
				<td><span class="glyphicon glyphicon-th"><b>年</b>度结算(yyyy)</span><input
					id="year" type="text" /></td>
				<td><span class="btn btn-danger" onclick="return validate()"><i class="glyphicon glyphicon-send">确认结算</i></span></td>
			</tr>
		</table>
		<br />
		<table id="content" class="table table-hover">
			<tr align="center">
				<td><b>商品种类</b></td>
				<td><b>商品名称</b></td>
				<td><b>商品成本</b></td>
				<td><b>商品售价</b></td>
				<td><b>成交数量</b></td>
				<td><b>共计利润</b></td>
				<td><b>售出时间</b></td>
			</tr>

			<c:choose>
				<c:when test="${res == null || fn:length(res) == 0}">
					<td colspan="7"><div class="alert alert-success">无销售记录！请再接再厉！</div></td>
				</c:when>
				<c:otherwise>
					<c:forEach items="${res}" var="data">
						<tr align="center">
							<td>${data.goodsKind}</td>
							<td>${data.goodsName}</td>
							<td>${data.goodsCb}</td>
							<td>${data.goodsPrice}</td>
							<td>${data.dealNumber}</td>
							<td>${data.liRun}</td>
							<td>${data.dealDate}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="7"><div class="alert alert-danger">${today}结算，总利润：<label>${lirun}</label> 元</div></td>
			</tr>
		</table>
		<div id="showsum" class="alert alert-danger"><label id="jisuanri"></label>结算，总利润：<label id="sum"></label> 元</div>
	</center>
	<jsp:include page="../file/footer.jsp"></jsp:include>
</body>
</html>