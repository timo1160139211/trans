<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<core:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Teacher Home</title>
</head>
<body>
<center>
<h1>welcome:${currentUser.identity} ${currentUser.name}</h1>

<p><core:out value="${currentUser.email}"></core:out></p>

<a href="./team-list" target="_blank">管理我的班级</a>
<a href="./student-list" target="_blank">管理我的学生</a>
<a href="./question-list" target="_blank">管理我的题目</a>
<a href="./achievement-list" target="_blank">查看成绩单</a>
<a href="./team-add-form" target="_blank">添加班级</a>
<a href="./student-add-form" target="_blank">添加学生</a>
<a href="./question-add-form" target="_blank">添加题目</a>
</center>
</body>
</html>