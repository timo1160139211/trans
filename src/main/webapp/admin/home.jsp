<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<core:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Home</title>
</head>
<body>
<center>
<h1>welcome:${currentUser.identity} ${currentUser.name}</h1>

<a href="./home" target="_blank">返回主页</a>
<a href="./userList" target="_blank">用户列表</a>
<a href="./addUser" target="_blank">添加用户</a>
<a href="./deleteUser" target="_blank">删除用户</a> 
</center>
</body>
</html>