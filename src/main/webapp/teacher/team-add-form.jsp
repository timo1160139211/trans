<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<core:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加班级</title>
</head>
<body>
	<center>
		<h1>welcome:${currentUser.name}</h1>
		<core:url var="add" value="/teacher/team-add" />
		<form:form id="form" commandName="team" method="post"
			action="${add}">
			<table>
				<tr>
					<td><label>名称:<form:input type="text" id="name"
								path="name" /></label></td>
				</tr>
				<tr>
					<td><label>简介:<form:input type="textarea"
								id="introduce" path="introduce" /></label></td>
				</tr>
				<tr>
					<td align="center"><label><input type="submit"
							value="添加班级"></label></td>
				</tr>
			</table>
		</form:form>
		<a href="/teacher/home" target="_blank">返回主页</a> 
		<a href="/teacher/team-list" target="_blank">管理我的班级</a>

	</center>

</body>
</html>