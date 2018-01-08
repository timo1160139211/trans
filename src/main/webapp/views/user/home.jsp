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
							<p class="text-danger">初始密码为默认密码(工号),请尽快修改密码并牢记.</p>
							<hr>
							<h3>2.人员查找(备用)</h3>
							<p class="text-primary">按名字:动态模糊查找用户.查'小' -> '小明','小红'...
							<br/>-英文论文表单'第n作者'名称填写后 自动检索出工号并填写,检索不到显示'学生?校外人员'供选.
							</p>
							<hr>
							<h3>3.认领</h3>
							<p class="text-danger">-认领按钮第一次点击为载入数据,再次点击进入认领表单.
							<br/>-中文论文、专利的表单完成自动填充.
							<br/>-英文论文表单 第n作者 名称填写后自动检索出工号,检索不到显示'学生?校外人员'供选.
							<br/>-认领时,姓名为中文,工号请只保留'数字''学生'或'校外人员'.</p>
							<hr>
							<h3>4.退出登陆</h3>
							<p class="text-primary">右上角(头像)->退出.</p>
							<hr>
							<h3>5.登陆超时</h3>
							<p class="text-primary">超过5分钟无操作,将会自动退出.(重新登陆即可)</p>
							<hr>
							<h1>FAQ:</h1>
							<h3>1.认领不小心填错了怎么办?</h3>
							<p class="text-primary">没关系,把检索状态'未认领'换成'已认领',把刚才误认的检索出来,重新认领一次即可.</p>
							<hr>
							<h1>提示:</h1>
							<h3>1.复制</h3>
							<p class="text-primary">Ctrl+C 可复制光标选定的内容</p>
							<hr>
							<h3>2.粘贴</h3>
							<p class="text-primary">Ctrl+V 可粘贴上次复制的内容,粘贴到光标的位置.实现快速无误内容搬移</p>
							<hr>
							<h3>3.撤消</h3>
							<p class="text-primary">Ctrl+Z 可撤销前n次输入</p>
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