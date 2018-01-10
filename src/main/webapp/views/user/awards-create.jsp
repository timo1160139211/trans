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
												<form:form class="form-inline"
													action="${ctx}/user/awards-create/Patent" method="post">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
														<h4 class="modal-title" id="myModalLabel">补录:专利</h4>
													</div>

													<input type="hidden" name="id" value="${awards.id}">

													<div class="modal-body">
														<label>名称：</label> <input type="text"
																name="name"
																class="form-control">

														<label>名称：</label> <input type="text"
																name="name"
																class="form-control">

														<br>
														<div class="form-group ">
															<label>第一作者：</label> <input type="text"
																name="no1AutherName" value="${awards.no1AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no1AutherNumber"
																value="${awards.no1AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第二作者：</label> <input type="text"
																name="no2AutherName" value="${awards.no2AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no2AutherNumber"
																value="${awards.no2AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第三作者：</label> <input type="text"
																name="no3AutherName" value="${awards.no3AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no3AutherNumber"
																value="${awards.no3AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第四作者：</label> <input type="text"
																name="no4AutherName" value="${awards.no4AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no4AutherNumber"
																value="${awards.no4AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第五作者：</label> <input type="text"
																name="no5AutherName" value="${awards.no5AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no5AutherNumber"
																value="${awards.no5AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第六作者：</label> <input type="text"
																name="no6AutherName" value="${awards.no6AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no6AutherNumber"
																value="${awards.no6AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第七作者：</label> <input type="text"
																name="no7AutherName" value="${awards.no7AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no7AutherNumber"
																value="${awards.no7AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第八作者：</label> <input type="text"
																name="no8AutherName" value="${awards.no8AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no8AutherNumber"
																value="${awards.no8AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第九作者：</label> <input type="text"
																name="no9AutherName" value="${awards.no9AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no9AutherNumber"
																value="${awards.no9AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第十作者：</label> <input type="text"
																name="no10AutherName" value="${awards.no10AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no10AutherNumber"
																value="${awards.no10AutherNumber}" class="form-control">
														</div>
													</div>
													<div class="modal-footer">
														<label>你知道吗?Ctrl+Z可撤销前n次输入</label>
														<button type="button" class="btn btn-default"
															data-dismiss="modal">再检查检查</button>
														<button type="submit" class="btn btn-primary"
															id="Claim${awards.id}">确定认领</button>
													</div>
												</form:form>
												<div class="page-div" align="center"></div>
											</div>
										</div>
									</div>
									<div class="tab-pane" id="English">
										<div class="panel-body">
											<div class="form-group">
												<form:form commandName="awards" class="form-inline"
													action="${ctx}/user/claim" method="post">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
														<h4 class="modal-title" id="myModalLabel">任务认领</h4>
													</div>

													<input type="hidden" name="id" value="${awards.id}">
													<input type="hidden" name="name" value="${awards.name}">
													<input type="hidden" name="awardsType"
														value="${awardsType}">

													<div class="modal-body">
														<h3>名称:</h3>
														<p>${awards.name}</p>
														<br>
														<h4>所有作者:</h4>
														<p>${awards.allAutherName}</p>
														<br>
														<c:if test="${awardsType == 'chPeriodicalThesis'}">
															<h4>作者单位:</h4>
															<p>${awards.mechanism == '' ? '':awards.mechanism}</p>
															<br>
														</c:if>
														<div class="form-group ">
															<label>第一作者：</label> <input type="text"
																name="no1AutherName" value="${awards.no1AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no1AutherNumber"
																value="${awards.no1AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第二作者：</label> <input type="text"
																name="no2AutherName" value="${awards.no2AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no2AutherNumber"
																value="${awards.no2AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第三作者：</label> <input type="text"
																name="no3AutherName" value="${awards.no3AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no3AutherNumber"
																value="${awards.no3AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第四作者：</label> <input type="text"
																name="no4AutherName" value="${awards.no4AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no4AutherNumber"
																value="${awards.no4AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第五作者：</label> <input type="text"
																name="no5AutherName" value="${awards.no5AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no5AutherNumber"
																value="${awards.no5AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第六作者：</label> <input type="text"
																name="no6AutherName" value="${awards.no6AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no6AutherNumber"
																value="${awards.no6AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第七作者：</label> <input type="text"
																name="no7AutherName" value="${awards.no7AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no7AutherNumber"
																value="${awards.no7AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第八作者：</label> <input type="text"
																name="no8AutherName" value="${awards.no8AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no8AutherNumber"
																value="${awards.no8AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第九作者：</label> <input type="text"
																name="no9AutherName" value="${awards.no9AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no9AutherNumber"
																value="${awards.no9AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第十作者：</label> <input type="text"
																name="no10AutherName" value="${awards.no10AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no10AutherNumber"
																value="${awards.no10AutherNumber}" class="form-control">
														</div>
													</div>
													<div class="modal-footer">
														<label>你知道吗?Ctrl+Z可撤销前n次输入</label>
														<button type="button" class="btn btn-default"
															data-dismiss="modal">再检查检查</button>
														<button type="submit" class="btn btn-primary"
															id="Claim${awards.id}">确定认领</button>
													</div>
												</form:form>
												<div class="page-div" align="center"></div>
											</div>
										</div>
									</div>
									<div class="tab-pane" id="Chinese">
										<div class="panel-body">
											<div class="form-group">
												<form:form commandName="awards" class="form-inline"
													action="${ctx}/user/claim" method="post">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
														<h4 class="modal-title" id="myModalLabel">任务认领</h4>
													</div>

													<input type="hidden" name="id" value="${awards.id}">
													<input type="hidden" name="name" value="${awards.name}">
													<input type="hidden" name="awardsType"
														value="${awardsType}">

													<div class="modal-body">
														<h3>名称:</h3>
														<p>${awards.name}</p>
														<br>
														<h4>所有作者:</h4>
														<p>${awards.allAutherName}</p>
														<br>
														<c:if test="${awardsType == 'chPeriodicalThesis'}">
															<h4>作者单位:</h4>
															<p>${awards.mechanism == '' ? '':awards.mechanism}</p>
															<br>
														</c:if>
														<div class="form-group ">
															<label>第一作者：</label> <input type="text"
																name="no1AutherName" value="${awards.no1AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no1AutherNumber"
																value="${awards.no1AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第二作者：</label> <input type="text"
																name="no2AutherName" value="${awards.no2AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no2AutherNumber"
																value="${awards.no2AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第三作者：</label> <input type="text"
																name="no3AutherName" value="${awards.no3AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no3AutherNumber"
																value="${awards.no3AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第四作者：</label> <input type="text"
																name="no4AutherName" value="${awards.no4AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no4AutherNumber"
																value="${awards.no4AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第五作者：</label> <input type="text"
																name="no5AutherName" value="${awards.no5AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no5AutherNumber"
																value="${awards.no5AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第六作者：</label> <input type="text"
																name="no6AutherName" value="${awards.no6AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no6AutherNumber"
																value="${awards.no6AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第七作者：</label> <input type="text"
																name="no7AutherName" value="${awards.no7AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no7AutherNumber"
																value="${awards.no7AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第八作者：</label> <input type="text"
																name="no8AutherName" value="${awards.no8AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no8AutherNumber"
																value="${awards.no8AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第九作者：</label> <input type="text"
																name="no9AutherName" value="${awards.no9AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no9AutherNumber"
																value="${awards.no9AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第十作者：</label> <input type="text"
																name="no10AutherName" value="${awards.no10AutherName}"
																class="form-control"> <label>工号：</label> <input
																type="text" name="no10AutherNumber"
																value="${awards.no10AutherNumber}" class="form-control">
														</div>
													</div>
													<div class="modal-footer">
														<label>你知道吗?Ctrl+Z可撤销前n次输入</label>
														<button type="button" class="btn btn-default"
															data-dismiss="modal">再检查检查</button>
														<button type="submit" class="btn btn-primary"
															id="Claim${awards.id}">确定认领</button>
													</div>
												</form:form>
												<div class="page-div" align="center"></div>
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
			<!-- END MAIN CONTENT -->
		</div>

		<!-- END MAIN -->
		<div class="clearfix"></div>
		<jsp:include page="/views/common/copyright.jsp" flush="true" />
	</div>
	<!-- END WRAPPER -->
	<jsp:include page="/views/resources/footer.jsp" flush="true" />
	<script type="text/javascript">
	</script>
</body>
</html>