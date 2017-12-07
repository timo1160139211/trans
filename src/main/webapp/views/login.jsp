<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="en" class="fullscreen-bg">

<head>
<title>欢迎登录</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<jsp:include page="/views/resources/head.jsp" flush="true" />
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box ">
					<div class="left">
						<div class="content">
							<div class="header">
								<div class="logo text-center">
									<img src="${ctx}/views/assets/img/logo-dark.png"
										alt="SDUT logo">
								</div>
								<p class="lead">Login to your account</p>
							</div>
							<form id="login" class="form-auth-small" action="${ctx}/login"
								method="post">
								<div class="form-group">
									<p>
										<label for="number" class="control-label sr-only">工号</label> <input
											type="text" class="form-control" id="login_number"
											name="number" placeholder="工号 e.g. 120100">
									</p>
									<p>
										<label for="password" class="control-label sr-only">Password</label>
										<input type="password" class="form-control"
											id="login_password" name="password" placeholder="密码">
									</p>
								</div>
								<div class="form-group clearfix">
									<label class="fancy-checkbox element-left"> <input
										type="checkbox"> <span>Remember me</span>
									</label>
								</div>
								<button type="submit" class="btn btn-primary btn-lg btn-block">登陆</button>
								<div class="bottom">
									<span class="helper-text"><i class="fa fa-lock"></i> <a
										href="#">Forgot password?</a></span>
								</div>
							</form>
						</div>
					</div>
					<div class="right">
						<div class="overlay"></div>
						<div class="content text">
							<h1 class="heading">山东理工大学－成果认领系统</h1>
							<p>By GaoYisheng＆HuAnlu</p>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- END WRAPPER -->




	<script src="${ctx}/views/assets/vendor/jquery/jquery.js"></script>

	<script
		src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>

	<script
		src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>

	<script type="text/javascript">

$.validator.setDefaults({
    submitHandler: function(form) {
          form.submit();
    }
});


$().ready(function() {	

$("#login").validate({
                    event:'keyup',
                rules : {
                	  number : {
                          required : true,
                          minlength : 4,
                          maxlength : 16
                         },
                	  password : {
                         required : true,
                          minlength : 4,
                          maxlength : 16
                         }
                    
                  }//rules.

            });//validate
});//ready

		</script>






</body>

</html>