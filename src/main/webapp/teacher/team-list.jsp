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
<title>Team List</title>
</head>
<body>
	<center>
		<table border="1">
			<tr>
				<td>名称</td>
				<td>简介</td>
				<td>责任老师</td>
				<td></td>
				<td></td>
			</tr>
			<core:forEach var="team" items="${teamList}">
				<tr>
					<td><core:out value="${team.name}"></core:out></td>
					<td><core:out value="${team.introduce}"></core:out></td>
					<td><core:out value="${currentUser.name}"></core:out></td>
					<td><a href="./team-update-form/${team.id}" target="_blank">修改班级</a></td>
					<td><a href="./team-delete/${team.id}" target="_blank">删除班级</a></td>
				</tr>
			</core:forEach>
		</table>
		<a href="./home" target="_blank">返回主页</a>
		<a href="./team-add-form" target="_blank">添加班级</a>

	</center>
</body>
</html>