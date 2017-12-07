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
<title>认领进度</title>
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
					<h3 class="page-title">截至当前,认领进度如下:</h3>
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
												<p class="help-block">
													<label>已认领专利:</label> <input type="text"
														class="form-control" id="patent-claimed" value=""
														readonly="true" />
												</p>
												<p class="help-block">
													<label>专利总数:</label> <input type="text"
														class="form-control" id="patent-total" value=""
														readonly="true" />
												</p>
											</div>

										</div>
									</div>
									<div class="tab-pane" id="English">
										<div class="panel-body">
											<div class="form-group">
												<p class="help-block">
													<label>已认领英文期刊论文:</label><input type="text"
														class="form-control" id="enPeriodicalThesis-claimed"
														value="" readonly="true" />
												</p>
												<p class="help-block">
													<label>英文期刊论文总数:</label><input type="text"
														class="form-control" id="enPeriodicalThesis-total"
														value="" readonly="true" />
												</p>
											</div>
										</div>
									</div>
									<div class="tab-pane" id="Chinese">
										<div class="panel-body">
											<div class="form-group">
												<p class="help-block">
													<label>已认领中文期刊论文:</label><input type="text"
														class="form-control" id="chPeriodicalThesis-claimed"
														value="" readonly="true" />
												</p>
												<p class="help-block">
													<label>中文期刊论文总数:</label><input type="text"
														class="form-control" id="chPeriodicalThesis-total"
														value="" readonly="true" />
												</p>
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
		<jsp:include page="/views/resources/footer.jsp" flush="true" />
	</div>
	<!-- END WRAPPER -->
	<jsp:include page="/views/resources/footer.jsp" flush="true" />
	<script type="text/javascript">
		$('#patent-tab').on('click', function() {
			$.ajax({
				type : 'post',
				url : '${ctx}/admin/claim-statistic',
				data : {
					awardsType : 'patent'
				},
				success : function(data) {
					$("#patent-claimed").val(data.claimed);
					$("#patent-total").val(data.total);
				}
			});
		})
		$('#enPeriodicalThesis-tab').on('click', function() {
			$.ajax({
				type : 'post',
				url : '${ctx}/admin/claim-statistic',
				data : {
					awardsType : 'enPeriodicalThesis'
				},
				success : function(data) {
					$("#enPeriodicalThesis-claimed").val(data.claimed);
					$("#enPeriodicalThesis-total").val(data.total);
				}
			});
		})
		$('#chPeriodicalThesis-tab').on('click', function() {
			$.ajax({
				type : 'post',
				url : '${ctx}/admin/claim-statistic',
				data : {
					awardsType : 'chPeriodicalThesis'
				},
				success : function(data) {
					$("#chPeriodicalThesis-claimed").val(data.claimed);
					$("#chPeriodicalThesis-total").val(data.total);
				}
			});
		})
	</script>
</body>
</html>