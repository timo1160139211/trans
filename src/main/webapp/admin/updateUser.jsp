<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<core:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新用户</title>
</head>
<body>
	<center>
		<h1>welcome:${currentUser.name}</h1>
		<core:url var="update" value="/admin/update" />
		<form:form id="form" modelAttribute="selectedUser" method="post"
			action="${update}">
			<form:hidden path="id"></form:hidden>
			<table>
				<tr>
					<td><label>姓名:<form:input type="text" id="name"
								path="name" /></label></td>
				</tr>
				<tr>
					<td><label>工号:<form:input type="text" id="number"
								path="number" /></label></td>
				</tr>
				<tr>
					<td><label>密码:<form:input type="password"
								id="password" path="password" /></label></td>
				</tr>
				<tr>
					<td align="center"><form:select id="identity-selector" path="identity">
							<option value="teacher">老师</option>
							<option value="admin">管理员</option>
						</form:select></td>
				</tr>
				<tr>
					<td><label>身份证号:<form:input type="text" id="idcard"
								path="idcard" /></label></td>
				</tr>
				<tr>
					<td align="center"><label><input type="submit"
							value="修改用户"></label></td>
				</tr>
			</table>
		</form:form>
		<a href="/admin/home" target="_blank">返回主页</a>
		 <a href="/admin/userList" target="_blank">用户列表</a> 
			<a href="/admin/addUser" target="_blank">添加用户</a>

	</center>
</body>
</html>