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
<title>添加用户</title>
</head>
<body>
	<center>
		<form id="form" method="post" action="${ctx}/admin/add">
			<table>
				<tr>
					<td><label>姓名:<input type="text" id="name" name="name"
							placeholder="张三"></label></td>
				</tr>
				<tr>
					<td><label>工号:<input type="text" id="number"
							name="number" placeholder="120"></label></td>
				</tr>
				<tr>
					<td><label>密码:<input type="password" id="password"
							name="password" placeholder="123"></label></td>
				</tr>
				<tr>
					<td><select id="identity-selector" name="identity">
							<option value="teacher">老师</option>
							<option value="admin">管理员</option>
					</select></td>
				</tr>
				<tr>
					<td><label>身份证号:<input type="text" id="idcard"
							name="idcard" placeholder="370106"></label></td>
				</tr>
				<tr>
					<td align="center"><label><input type="submit"
							value="添加"></label></td>
				</tr>
			</table>
		</form>
		<a href="./home" target="_blank">返回主页</a> 
		<a href="./userList"
			target="_blank">用户列表</a>
	</center>

</body>
</html>