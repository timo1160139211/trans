<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<core:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成绩表</title>
</head>
<body>
	<center>
		<table border="0">
			<tr>
				<td>选择我的班级:</td>
				<td><select id="team-selector">
						<option value="">所有班级</option>
						<core:forEach items="${teams}" var="team">
							<option value="${team.id}">${team.name}</option>
						</core:forEach>
				</select></td>
			</tr>

		</table>
		<table border="1">
			<tr>
				<td>姓名</td>
				<td>学号</td>
				<td>身份证号</td>
				<td>班级</td>
				<td></td>
				<td></td>
			</tr>
			<core:forEach var="model" items="${userTeamFormModels}">
				<tr>
					<td><core:out value="${model.student_name}"></core:out></td>
					<td><core:out value="${model.student_number}"></core:out></td>
					<td><core:out value="${model.student_idcard}"></core:out></td>
					<td><core:out value="${model.team_name}"></core:out></td>
					<td><a href="${ctx}/teacher/student-update-form/${model.student_id}" >修改学生</a></td>
					<td><a href="${ctx}/teacher/student-delete/${model.student_id}" >删除学生</a></td>
				</tr>
			</core:forEach>
		</table>
		<a href="${ctx}/teacher/home" >返回主页</a>
		 <a href="${ctx}/teacher/student-add-form" >添加学生</a>

	</center>

</body>
<script type="text/javascript">
	$("#team-selector").change(function() {
/*ajax var xmlhttp=new XMLHttpRequest();
		xmlhttp.open("GET","./student-list?teamId=" + p1,true);
		xmlhttp.send(); */
		var p1 = $(this).children('option:selected').val();//这就是selected的值:value
		window.location.href = "./student-list?teamId=" + p1;//页面跳转并传参 
	});
</script>
</html>