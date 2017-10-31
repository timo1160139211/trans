<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<core:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改学生</title>
</head>
<body>
	<core:url var="update" value="/teacher/student-update" />
	<form:form id="form" modelAttribute="selectedStudent" method="post"
		action="${update}">
		<form:hidden path="id"></form:hidden>
		<table>
			<tr>
				<td><label>姓名:<form:input type="text" id="name"
							path="name" /></label></td>
			</tr>
			<tr>
				<td><label>学号:<form:input type="text" id="number"
							path="number" /></label></td>
			</tr>
			<tr>
				<td><label>密码:<form:input type="password" id="password"
							path="password" /></label></td>
			</tr>
			<tr>
				<td align="center"><form:select id="team-selector"
						path="teamId">
						<core:forEach items="${teams}" var="team">
							<option value="${team.id}">${team.name}</option>
						</core:forEach>
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
</body>
</html>