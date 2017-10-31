<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<core:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
</head>
<body>
	<center>
		<table border="1">
			<tr>
				<td>姓名</td>
				<td>工号</td>
				<td>身份证号</td>
				<td>身份</td>
				<td></td>
				<td></td>
			</tr>
			<core:forEach var="user" items="${userList}">
				<tr>
					<td><core:out value="${user.name}"></core:out></td>
					<td><core:out value="${user.number}"></core:out></td>
					<td><core:out value="${user.idcard}"></core:out></td>
					<td><core:out value="${user.identity}"></core:out></td>
					<td><a href="./updateUser/${user.id}" target="_blank">修改用户</a></td>
					<td><a href="./deleteUser/${user.id}" target="_blank">删除用户</a></td>
				</tr>
			</core:forEach>
		</table>
		<a href="./home" target="_blank">返回主页</a>
		<a href="./addUser" target="_blank">添加用户</a>

	</center>

</body>
</html>