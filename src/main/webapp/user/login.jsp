<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎登陆</title>

<link rel="stylesheet" href="${ctx}/assets/css/login-style.min.css" />
<link rel="stylesheet"
	href="${ctx}/assets/font-awesome/css/font-awesome.min.css" />


<link rel="stylesheet"
	href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">
<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>

<body>
<center>
	<div class="container">
		<form:form class="form-inline text-center" role="form"
			action="${ctx}/user/login" method="post">
			<div class="form-group">
				<label>用户名:<input type="text" class="form-control"
					id="number" name="number" placeholder="学号/工号"></label>
			</div>
			<div class="form-group">
				<label>密码:<input type="password" class="form-control"
					id="password" name="password" placeholder="密码"></label>
			</div>
			<div class="form-group">
				<label><input type="submit" class="form-control btn-primary"
					value="登陆"></label>
			</div>
		</form:form>
	</div>
</center>


	<!-- 推荐开源CDN来选取需引用的外部JS //-->
	<script src="http://cdn.gbtags.com/jquery/1.11.1/jquery.min.js"></script>
	<script
		src="http://cdn.gbtags.com/twitter-bootstrap/3.2.0/js/bootstrap.js"></script>

	<script type="text/javascript">
		
	</script>
</body>
</html>









