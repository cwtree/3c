<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
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
	function confirmDel(id) {
		var res = window.confirm("确认删除该商品所有库存吗？");
		if (res == true) {
			window.location.href = "delete?goodsId=" + id;
		}
	}

	$(document)
			.ready(
					function() {
						$
								.ajax({
									type : "POST",
									url : "coreBiz",
									contentType : "application/json; charset=utf-8",
									dataType : "json",
									success : function(data) {
										if (data.id.length > 0) {
											for (var i = 0; i < data.id.length; i++) {
												$str = "<tr align='center'><td>";
												$str += data.kind[i] + "</td>";
												$str += "<td>" + data.name[i]
														+ "</td>";
												$str += "<td>" + data.cb[i]
														+ " 元</td>";
												$str += "<td>" + data.number[i]
														+ "</td>";
												$str += "<td><a class='glyphicon glyphicon-arrow-up' href='beforeOutOne?goodsId="
														+ data.id[i]
														+ "'>售货</a>&nbsp;&nbsp;&nbsp;<a class='glyphicon glyphicon-arrow-down' href='beforeUpdate?goodsId="
														+ data.id[i]
														+ "'>修改信息</a>&nbsp;&nbsp;&nbsp;<a onmouseover="
														+ "this.style.cursor='pointer'"
														+ " class='glyphicon glyphicon-remove' onclick='confirmDel("
														+ data.id[i] + ")'";
												$str += data.id[i]
														+ "'>删除该商品</a></td></tr>";
												$("#content").append($str);
											}
											$
													.ajax({
														type : "POST",
														url : "nowkind",
														contentType : "application/json; charset=utf-8",
														dataType : "json",
														success : function(data) {
															if (data.nowkinds.length > 0) {
																for (var i = 0; i < data.nowkinds.length; i++) {
																	$str = "<option value='"+data.nowkinds[i]+"'>"
																			+ data.nowkinds[i]
																			+ "</option>";
																	$(
																			"#nowkind")
																			.append(
																					$str);
																}
															}
														},
														error : function(msg) {
															alert("wrong" + msg);
														}
													});
											$("#sumcb").html(data.sumcb);
											$("#showsum").show();
										} else {
											alert("暂无上货，请点击[新品上货]按钮上货！");
										}
									},
									error : function(msg) {
										alert("wrong" + msg);
									}
								});
					});
	function gengxinkucun() {
		if ($("#nowkind").val() == "all") {
			window.location.href = "linfeikeji";
		} else {
			$
					.ajax({
						type : "post",
						url : "gengxinkucun",
						data : {
							"nowkind" : $("#nowkind").val()
						},
						contentType : "application/x-www-form-urlencoded; charset=utf-8",
						dataType : "json",
						success : function(data) {
							if (data.id.length > 0) {
								$("#content tr:gt(0)").remove();
								for (var i = 0; i < data.id.length; i++) {
									$str = "<tr align='center'><td>";
									$str += data.kind[i] + "</td>";
									$str += "<td>" + data.name[i] + "</td>";
									$str += "<td>" + data.cb[i] + " 元</td>";
									$str += "<td>" + data.number[i] + "</td>";
									$str += "<td><a class='glyphicon glyphicon-arrow-up' href='beforeOutOne?goodsId="
											+ data.id[i]
											+ "'>售货</a>&nbsp;&nbsp;<a class='glyphicon glyphicon-arrow-down' href='beforeUpdate?goodsId="
											+ data.id[i]
											+ "'>修改信息</a>&nbsp;&nbsp;<a onmouseover="
											+ "this.style.cursor='pointer'"
											+ " class='glyphicon glyphicon-remove' onclick='confirmDel("
											+ data.id[i] + ")'";
									$str += data.id[i]
											+ "'>删除该商品</a></td></tr>";
									$("#content").append($str);
								}
								$("#sumcb").html(data.sumcbbykind);
							} else {
								alert("暂无上货，请点击[新品上货]按钮上货！");
							}
						},
						error : function(msg) {
							alert("wrong" + msg);
						}
					});
		}
	}
</script>
</head>
<body>
	<jsp:include page="file/header.jsp"></jsp:include>
	<center>
		<div class="col-sm-offset-2 col-sm-10">
			<sf:errors class="alert alert-success" />
		</div>
		<br /> 你也可以选择商品种类查询分类库存信息：<select id="nowkind" name="nowkind"
			onchange="gengxinkucun()">
			<option value="all">--全部商品分类--</option>
		</select>
		<table id="content" class="table table-hover">
			<tr align="center">
				<td><b>商品种类</b></td>
				<td><b>商品名称</b></td>
				<td><b>商品单件成本</b></td>
				<td><b>商品库存</b></td>
				<td><b>操作</b></td>
			</tr>
		</table>
		<div id="showsum" class="alert alert-danger">总成本：<label id="sumcb"></label> 元</div>
	</center>
	<jsp:include page="file/footer.jsp"></jsp:include>
</body>
</html>