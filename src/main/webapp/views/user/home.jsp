<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="en">

<head>
<title>主页</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<jsp:include page="/views/resources/head.jsp" flush="true" />
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<jsp:include page="/views/common/nav.jsp" flush="true" />
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<jsp:include page="/views/common/left.jsp" flush="true" />
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<!-- MAIN -->
		<div class="main">
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">欢迎您: ${currentUser.name}</h3>
					<div class="panel panel-headline">
						<div class="panel-body">
							<h1>使用指导:</h1>
							<h3>1.密码</h3>
							<p class="text-danger">初始密码为默认密码,请尽快修改密码并牢记.</p>
							<hr>
							<h3>2.查找</h3>
							<p class="text-primary">按名字:动态模糊查找用户.</p>
							<hr>
							<h3>3.认领</h3>
							<p class="text-primary">工号请只保留数字工号('学生/校外人员'除外).</p>
							<hr>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- END MAIN -->
		<div class="clearfix"></div>
		<jsp:include page="/views/common/copyright.jsp" flush="true" />
	</div>
	<!-- END WRAPPER -->
	<jsp:include page="/views/resources/footer.jsp" flush="true" />

</body>
</html>