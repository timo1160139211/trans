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
<title>Insert title here</title>
</head>
<body>

	<center>
		<table border="1">
			<tr>
				<td>名称</td>
				<td>描述</td>
				<td>截止日期</td>
				<td>难度系数</td>
				<td></td>
			</tr>
			<core:forEach var="question" items="${questionList}">
				<tr>

					<td><core:out value="${question.name}"></core:out></td>
					<td><core:out value="${question.detail}"></core:out></td>
					<td><fmt:formatDate type="both" dateStyle="medium"
							timeStyle="medium" value="${question.deadtime}" /></td>
					<td><core:out value="${question.diffculty}"></core:out></td>
					<td><a href="../student/exam/${question.id}">开始答题</a></td>
				</tr>
			</core:forEach>
		</table>

	</center>

</body>
</html>