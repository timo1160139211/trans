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
<title>未认领列表</title>
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
					<h3 class="page-title">截至当前,未认领数据如下:</h3>
					<div class="row">
						<div class="col-md-12">
							<div class="panel">
								<ul class="nav nav-tabs" id="myTab">
									<li class="active"><a id="patent-tab" href="#Patent"
										data-toggle="tab">专利</a></li>
									<li><a id="enPeriodicalThesis-tab" href="#English"
										data-toggle="tab">英文期刊论文</a></li>
									<li><a id="chPeriodicalThesis-tab" href="#Chinese"
										data-toggle="tab">中文期刊论文</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="Patent">
										<div class="panel-body">
											<div class="form-group">
												<div class="panel-body">
													<table class="table table-hover">
														<thead>
															<tr>
																<th>#</th>
																<th>类型</th>
																<th>名称</th>
																<th>第一作者</th>
																<th>其他作者</th>
																<th>操作1</th>
																<th>操作2</th>
															</tr>
														</thead>
														<tbody id="tbody">
														</tbody>
														<div id="Modal"></div>
													</table>
												</div>
											</div>

										</div>
									</div>
									<div class="tab-pane" id="English">
										<div class="panel-body">
											<div class="form-group">
												<div class="panel-body">
													<table class="table table-hover">
														<thead>
															<tr>
																<th>#</th>
																<th>类型</th>
																<th>名称</th>
																<th>第一作者</th>
																<th>其他作者</th>
																<th>操作1</th>
																<th>操作2</th>
															</tr>
														</thead>
														<tbody id="tbody">
														</tbody>
														<div id="Modal"></div>
													</table>
												</div>
											</div>
										</div>
									</div>
									<div class="tab-pane" id="Chinese">
										<div class="panel-body">
											<div class="form-group">
												<div class="panel-body">
													<table class="table table-hover">
														<thead>
															<tr>
																<th>#</th>
																<th>类型</th>
																<th>名称</th>
																<th>第一作者</th>
																<th>其他作者</th>
																<th>操作1</th>
																<th>操作2</th>
															</tr>
														</thead>
														<tbody id="tbody">
														</tbody>
														<div id="Modal"></div>
													</table>
												</div>
											</div>
										</div>
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
	<script type="text/javascript">
		$('#patent-tab').on('click', function() {
			$post();
			$(this).button('complete'); // button text will be "finished!"
		})
		$('#enPeriodicalThesis-tab').on('click', function() {
			$post();
			$(this).button('complete') // button text will be "finished!"
		})
		$('#chPeriodicalThesis-tab').on('click', function() {
			$post();
			$(this).button('complete') // button text will be "finished!"
		})
	</script>
</body>
</html>
