<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>林飞科技3C数码城-中国移动</title>
<script language="javascript" type="text/javascript"
	src="<%=path%>/js/jquery-1.7.2.js"></script>
<script language="javascript" type="text/javascript"
	src="<%=path%>/js/jquery.validate.min.js"></script>
<script type="text/javascript">
	function validate() {
		var p1 = document.getElementById("newpwd").value;
		var p2 = document.getElementById("renewpwd").value;
		if(p1!=p2) {
			alert("两次密码输入不一致，请重新输入");
			return false;
		}else {
			return true;
		}
	}
</script>
</head>
<body>
<jsp:include page="../file/header.jsp"></jsp:include>
<center>
<sf:form method="post" action="rechangepwd" onsubmit="return validate()">
	<table>
		<tr>
			<td>原密码：</td>
			<td><input type="password" name="oldpwd" id="oldpwd" /></td>
		</tr>
		<tr>
			<td>新密码：</td>
			<td><input type="password" name="newpwd" id="newpwd" /></td>
		</tr>
		<tr>
			<td>重复新密码：</td>
			<td><input type="password" name="renewpwd" id="renewpwd"/></td>
		</tr>
		<tr>
			<td><input type="submit" value="确认修改" class="btn btn-info"></td>
			<td><input type="reset" value="清空" class="btn btn-info"></td>
		</tr>
	</table>
</sf:form>
</center>
<jsp:include page="../file/footer.jsp"></jsp:include>
</body>
</html>