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
<title>上传文件</title>
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
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">选择文件上传到数据库，请按标准数据格式xls上传.</h3>
					<div class="row">
						<div class="col-md-12">
							<div class="panel">
								<ul class="nav nav-tabs" id="myTab">
									<li class="active"><a href="#patent" data-toggle="tab">专利</a></li>
									<li><a href="#English" data-toggle="tab">英文期刊论文</a></li>
									<li><a href="#Chinese" data-toggle="tab">中文期刊论文</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="patent">
										<div class="panel-body">
											<form:form class="form-inline" id="upload-patent"
												action="${ctx}/admin/upload/patent"
												enctype="multipart/form-data" method="post">
												<div class="form-group">
													<label for="upload">选择 专利.xls 文件</label> <input type="file"
														id="upload-file-patent" name="filename">
													<p class="help-block"></p>
												</div>
												<button type="submit" class="btn btn-default">上传</button>
											</form:form>

										</div>
									</div>
									<div class="tab-pane" id="English">
										<form:form class="form-inline" id="upload-enPeriodicalThesis"
											action="${ctx}/admin/upload/enPeriodicalThesis"
											enctype="multipart/form-data" method="post">
											<div class="form-group">
												<label for="upload">选择 英文期刊论文.xls 文件</label> <input
													type="file" id="upload-file-enPeriodicalThesis"
													name="filename">
												<p class="help-block"></p>
											</div>
											<button type="submit" class="btn btn-default">上传</button>
										</form:form>
									</div>
									<div class="tab-pane" id="Chinese">
										<form:form class="form-inline" id="upload-chPeriodicalThesis"
											action="${ctx}/admin/upload/chPeriodicalThesis"
											enctype="multipart/form-data" method="post">
											<div class="form-group">
												<label for="upload">选择 中文期刊论文.xls 文件</label> <input
													type="file" id="upload-file-chPeriodicalThesis"
													name="filename">
												<p class="help-block"></p>
											</div>
											<button type="submit" class="btn btn-default">上传</button>
										</form:form>
									</div>
									<iframe id="id_iframe" name="nm_iframe" style="display: none;"></iframe>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>

		<!-- END MAIN -->
		<div class="clearfix"></div>
		<footer>
			<div class="container-fluid">
				<p class="copyright">&copy; 2017 &nbsp;&nbsp;PoweredBy
					&nbsp;Softlab&nbsp;1#314</p>
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->
	<jsp:include page="/views/resources/footer.jsp" flush="true" />
</body>
</html>