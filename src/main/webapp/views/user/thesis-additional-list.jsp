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
<title>补录列表</title>
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
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">已补录:模糊查询</h3>
					<div class="row">
						<div class="col-md-12">
							<div class="panel">
								<ul class="nav nav-tabs" id="myTab">
									<!-- <li class="active" id="ch-tag"><a href="#Chinese" data-toggle="tab">中文期刊论文</a></li>
									<li id="en-tag"><a href="#English" data-toggle="tab">英文期刊论文</a></li>-->
									<li id="patent-tag"><a href="#Patent" data-toggle="tab">专利</a></li> 
									<li class="active" id="ch-tag"><a href="#Chinese"
										data-toggle="tab">论文</a></li>
									<li id="achievementAward-tag"><a href="#achievementAward" data-toggle="tab">成果奖励</a></li>
									<li id="opusAward-tag"><a href="#opusAward" data-toggle="tab">著作奖励/版权</a></li>
								</ul>
								<div class="tab-content">

									<div class="tab-pane active" id="Chinese">
										<div class="panel-body">
											<form class="form-inline" id="ChineseForm">
												<div class="form-group" style="display: none;">
													<input type="text" name="awardsType"
														value="thesis" class="type-control">
												</div>
												<div class="form-group">
													<label>标题:</label> <input type="text" name="name"
														class="form-control">
												</div>
												<div class="form-group">
													<label>(任意)作者名:</label> <input type="text" name="searchName"
														class="form-control">
												</div>
												
												
												<div class="form-group">
													<label>归属学院:</label> <select name="workunit"
														class="form-control">
														<option value="">查询所有学院</option>
														<option value="机械工程学院">机械工程学院</option>
														<option value="交通与车辆工程学院">交通与车辆工程学院</option>
														<option value="农业工程与食品科学学院">农业工程与食品科学学院</option>
														<option value="电气与电子工程学院">电气与电子工程学院</option>
														<option value="计算机科学与技术学院">计算机科学与技术学院</option>
														<option value="化学化工学院">化学化工学院</option>
														<option value="建筑工程学院">建筑工程学院</option>
														<option value="资源与环境工程学院">资源与环境工程学院</option>
														<option value="材料科学与工程学院">材料科学与工程学院</option>
														<option value="生命科学学院">生命科学学院</option>
														<option value="数学与统计学院">数学与统计学院</option>
														<option value="物理与光电工程学院">物理与光电工程学院</option>
														<option value="经济学院">经济学院</option>
														<option value="管理学院">管理学院</option>
														<option value="文学与新闻传播学院">文学与新闻传播学院</option>
														<option value="外国语学院">外国语学院</option>
														<option value="法学院">法学院</option>
														<option value="马克思主义学院">马克思主义学院</option>
														<option value="美术学院">美术学院</option>
														<option value="音乐学院">音乐学院</option>
														<option value="体育学院">体育学院</option>
														<option value="鲁泰纺织服装学院">鲁泰纺织服装学院</option>
														<option value="齐文化研究院">齐文化研究院</option>

														<option value="图书馆">图书馆</option>
														<option value="后勤管理处">后勤管理处</option>
														<option value="学生工作处">学生工作处</option>
														<option value="实验管理中心">实验管理中心</option>
														<option value="校医院">校医院</option>
													</select>
												</div>
												
												<div class="form-group">
													<label>审核状态:</label> <select id="chAuditStatus"
														name="status" class="form-control">
														<option value="未审核">未审核</option>
														<option value="通过审核">通过审核</option>
														<option value="未通过审核">未通过审核</option>
													</select>
												</div>
												<button id='ch-btn' type="submit" class="btn btn-primary">查询</button>
											</form>
										</div>
									</div>
									
									<div class="tab-pane" id="Patent">
										<div class="panel-body">
											<form class="form-inline" id="PatentForm">
												<div class="form-group" style="display: none;">
													<input type="text" name="awardsType" value="enPeriodicalThesis"
														class="type-control">
												</div>
												<div class="form-group">
													<label>名称:</label> <input type="text" name="name"
														class="form-control">
												</div>
												<div class="form-group">
													<label>发明(设计)人:</label> <input type="text"
														name="autherName" class="form-control">
												</div>
												<div class="form-group">
													<label>授权号:</label> <input type="text"
														name="authorizationNumber" class="form-control">
												</div>
												<div class="form-group">
												<label>归属学院:</label> <select name="no10AutherName"
														class="form-control">
														<option value="">查询所有学院</option>
														<option value="机械工程学院">机械工程学院</option>
														<option value="交通与车辆工程学院">交通与车辆工程学院</option>
														<option value="农业工程与食品科学学院">农业工程与食品科学学院</option>
														<option value="电气与电子工程学院">电气与电子工程学院</option>
														<option value="计算机科学与技术学院">计算机科学与技术学院</option>
														<option value="化学化工学院">化学化工学院</option>
														<option value="建筑工程学院">建筑工程学院</option>
														<option value="资源与环境工程学院">资源与环境工程学院</option>
														<option value="材料科学与工程学院">材料科学与工程学院</option>
														<option value="生命科学学院">生命科学学院</option>
														<option value="数学与统计学院">数学与统计学院</option>
														<option value="物理与光电工程学院">物理与光电工程学院</option>
														<option value="经济学院">经济学院</option>
														<option value="管理学院">管理学院</option>
														<option value="文学与新闻传播学院">文学与新闻传播学院</option>
														<option value="外国语学院">外国语学院</option>
														<option value="法学院">法学院</option>
														<option value="马克思主义学院">马克思主义学院</option>
														<option value="美术学院">美术学院</option>
														<option value="音乐学院">音乐学院</option>
														<option value="体育学院">体育学院</option>
														<option value="鲁泰纺织服装学院">鲁泰纺织服装学院</option>
														<option value="齐文化研究院">齐文化研究院</option>

														<option value="图书馆">图书馆</option>
														<option value="后勤管理处">后勤管理处</option>
														<option value="学生工作处">学生工作处</option>
														<option value="实验管理中心">实验管理中心</option>
														<option value="校医院">校医院</option>
													</select>
											    </div>
											<div class="form-group">
												<label>审核状态:</label> <select id="paAuditStatus" name="no10AutherNumber"
													class="form-control">
													<option value="未审核">未审核</option>
													<option value="通过审核">通过审核</option>
													<option value="未通过审核">未通过审核</option>
												</select>
											</div>
												<button id='patent-btn' type="submit" class="btn btn-primary">查询</button>
											</form>
										</div>
									</div>
									
									<div class="tab-pane" id="achievementAward">
										<div class="panel-body">
										<form class="form-inline" id="achievementAwardForm">
											<div class="form-group" style="display: none;">
												<input type="text" name="awardsType"
													value="achievementAward" class="type-control">
											</div>
											<div class="form-group">
												<label>成果名称:</label> <input type="text" name="achievementName"
													class="form-control">
											</div>
											<div class="form-group">
												<label>作者:</label> <input type="text" name="autherName"
													class="form-control">
											</div>
											<div class="form-group">
												<label>归属学院:</label> <select name="no10AutherName"
														class="form-control">
														<option value="">查询所有学院</option>
														<option value="机械工程学院">机械工程学院</option>
														<option value="交通与车辆工程学院">交通与车辆工程学院</option>
														<option value="农业工程与食品科学学院">农业工程与食品科学学院</option>
														<option value="电气与电子工程学院">电气与电子工程学院</option>
														<option value="计算机科学与技术学院">计算机科学与技术学院</option>
														<option value="化学化工学院">化学化工学院</option>
														<option value="建筑工程学院">建筑工程学院</option>
														<option value="资源与环境工程学院">资源与环境工程学院</option>
														<option value="材料科学与工程学院">材料科学与工程学院</option>
														<option value="生命科学学院">生命科学学院</option>
														<option value="数学与统计学院">数学与统计学院</option>
														<option value="物理与光电工程学院">物理与光电工程学院</option>
														<option value="经济学院">经济学院</option>
														<option value="管理学院">管理学院</option>
														<option value="文学与新闻传播学院">文学与新闻传播学院</option>
														<option value="外国语学院">外国语学院</option>
														<option value="法学院">法学院</option>
														<option value="马克思主义学院">马克思主义学院</option>
														<option value="美术学院">美术学院</option>
														<option value="音乐学院">音乐学院</option>
														<option value="体育学院">体育学院</option>
														<option value="鲁泰纺织服装学院">鲁泰纺织服装学院</option>
														<option value="齐文化研究院">齐文化研究院</option>

														<option value="图书馆">图书馆</option>
														<option value="后勤管理处">后勤管理处</option>
														<option value="学生工作处">学生工作处</option>
														<option value="实验管理中心">实验管理中心</option>
														<option value="校医院">校医院</option>
													</select>
											    </div>
											<div class="form-group">
												<label>年:</label> <input type="text" name="year"
													class="form-control">
											</div>
											<div class="form-group">
												<label>审核状态:</label> <select id="achievementAwardAuditStatus" name="no10AutherNumber"
													class="form-control">
													<option value="未审核">未审核</option>
													<option value="通过审核">通过审核</option>
													<option value="未通过审核">未通过审核</option>
												</select>
											</div>
											<button id='achievementAward-btn' type="submit" class="btn btn-primary">查询</button>
										</form>
										</div>
									</div>
									
									<div class="tab-pane" id="opusAward">
										<div class="panel-body">
										<form class="form-inline" id="opusAwardForm">
											<div class="form-group" style="display: none;">
												<input type="text" name="awardsType"
													value="opusAward" class="type-control">
											</div>
											<div class="form-group">
												<label>成果名称:</label> <input type="text" name="name"
													class="form-control">
											</div>
											<div class="form-group">
												<label>作者:</label> <input type="text" name="autherName"
													class="form-control">
											</div>
											<div class="form-group">
												<label>归属学院:</label> <select name="no10AutherName"
														class="form-control">
														<option value="">查询所有学院</option>
														<option value="机械工程学院">机械工程学院</option>
														<option value="交通与车辆工程学院">交通与车辆工程学院</option>
														<option value="农业工程与食品科学学院">农业工程与食品科学学院</option>
														<option value="电气与电子工程学院">电气与电子工程学院</option>
														<option value="计算机科学与技术学院">计算机科学与技术学院</option>
														<option value="化学化工学院">化学化工学院</option>
														<option value="建筑工程学院">建筑工程学院</option>
														<option value="资源与环境工程学院">资源与环境工程学院</option>
														<option value="材料科学与工程学院">材料科学与工程学院</option>
														<option value="生命科学学院">生命科学学院</option>
														<option value="数学与统计学院">数学与统计学院</option>
														<option value="物理与光电工程学院">物理与光电工程学院</option>
														<option value="经济学院">经济学院</option>
														<option value="管理学院">管理学院</option>
														<option value="文学与新闻传播学院">文学与新闻传播学院</option>
														<option value="外国语学院">外国语学院</option>
														<option value="法学院">法学院</option>
														<option value="马克思主义学院">马克思主义学院</option>
														<option value="美术学院">美术学院</option>
														<option value="音乐学院">音乐学院</option>
														<option value="体育学院">体育学院</option>
														<option value="鲁泰纺织服装学院">鲁泰纺织服装学院</option>
														<option value="齐文化研究院">齐文化研究院</option>

														<option value="图书馆">图书馆</option>
														<option value="后勤管理处">后勤管理处</option>
														<option value="学生工作处">学生工作处</option>
														<option value="实验管理中心">实验管理中心</option>
														<option value="校医院">校医院</option>
													</select>
											    </div>
											<div class="form-group">
												<label>审核状态:</label> <select id="opusAwardAuditStatus" name="no10AutherNumber"
													class="form-control">
													<option value="未审核">未审核</option>
													<option value="通过审核">通过审核</option>
													<option value="未通过审核">未通过审核</option>
												</select>
											</div>
											<button id='opusAward-btn' type="submit" class="btn btn-primary">查询</button>
										</form>
										</div>
									</div>
									
									<iframe id="id_iframe" name="nm_iframe" style="display: none;"></iframe>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<!-- TABLE HOVER -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">${manager.title}</h3>
								</div>
								<div class="panel-body">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th>标题</th>
												<th>作者</th>
												<th>详细</th>
											</tr>
										</thead>
										<tbody id="tbody">
										</tbody>
										<div id="Modal"></div>
									</table>
								</div>
								<div class="page-div" align="center"></div>
							</div>
							<!-- END TABLE HOVER -->
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
	<!-- options-contant -->
	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							var currentAwardsType = 'thesis';//维护一个 类型参数字符串,仅在每次切换标签时变化.
							var currentPageNum = 1;//维护一个 当前页参数,换页时+ - ,在每次切换标签/查询时初始化.
							var currentPageSize = 30;
							var paramMap = '';//维护一个 请求参数字符串,仅在每次查询时变化.

							function initical(type) {
								currentAwardsType = type;
								currentPageNum = 1;
								$('#tbody').empty();
								$('.page-div').empty();
							}

							$(function() {
								$('#myTab li:eq(0) a').tab('show');
							});

							$('#ch-tag').click(function() {
								initical('thesis');
							});
							$('#patent-tag').click(function() {
								initical('patent');
							});
							$('#achievementAward-tag').click(function(){initical('achievementAward');});
							$('#opusAward-tag').click(function(){initical('opusAward');});

							$('#ch-btn,#achievementAward-btn,#opusAward-btn,#patent-btn')
									.bind(
											'click',
											function() {
												currentPageNum = 1; ////维护一个 当前页参数,换页时+ - ,在每次切换标签/查询时初始化.
												$('#tbody').empty();//清空-------------------------------------------------
												$('.page-div').empty();//清空-------------------------------------------------

												var temp_form;
												if (temp_form != $(this)
														.parent().attr('id')) {
													temp_form = $(this)
															.parent()
															.attr('id');
													$('#tbody').empty();
												}

												//变换当前类型
												$('.type-control').attr(
														'value',
														currentAwardsType);
												paramMap = $(this).parent()
														.serialize();

												var auditSelectedText = '';
												if (currentAwardsType == 'thesis') {
													auditSelectedText = $(
															"#chAuditStatus")
															.find(
																	"option:selected")
															.text();
												}
												if (currentAwardsType == 'patent') {
													auditSelectedText = $(
															"#paAuditStatus")
															.find(
																	"option:selected")
															.text();
												}
												if(currentAwardsType=='achievementAward'){
												    selectedText = $("#achievementAwardClaimStatus option:selected").text();
												    auditSelectedText = $("#achievementAwardAuditStatus").find("option:selected").text();
												}
												if(currentAwardsType=='opusAward'){
												    selectedText = $("#opusAwardClaimStatus option:selected").text();
												    auditSelectedText = $("#opusAwardAuditStatus").find("option:selected").text();
												}
												
												

												$(this).parent().attr('target',
														'nm_iframe');
												$
														.ajax(
																{
																	type : 'post',
																	url : '${ctx}/user/thesis-additional-list'
																			+ '?pageNum='
																			+ currentPageNum
																			+ '&',
																	data : paramMap,
																	success : function(
																			page) {
																		if (page != null) {
																			for (var i = 0; i < page.list.length; i++) {

																				var tr = $("<tr/>");
																				$(
																						"<td class=\"id\"/ display=\"none;\">")
																						.html(
																								page.list[i].id)
																						.appendTo(
																								tr);
																				$(
																						"<td/>")
																						.html(
																								i + 1)
																						.appendTo(
																								tr);
																				
																				if(currentAwardsType=='opusAward'){
												                                   $("<td/>").html(page.list[i].name).appendTo(tr);
												                            }else if(currentAwardsType=='achievementAward'){
												                                   $("<td/>").html(page.list[i].achievementName).appendTo(tr);
												                            }else{
												                                  		  $(
																								"<td/>")
																								.html(
																									page.list[i].name)
																								.appendTo(
																									tr);
																						 
												                                  }
																				$(
																				"<td/>")
																					.html(
																					page.list[i].no1AutherName)
																				.appendTo(
																					tr);
																				$(
																						"<td/>")
																						.html(
																								"<button type=\"button\" class=\"btn btn-success\" id=\"detaile\">详情</button>")
																						.appendTo(
																								tr);
																				$(
																						"<td class=\"options-contant\"/>")
																						.appendTo(
																								tr);
																				$(
																						'#tbody')
																						.append(
																								tr);
																			}

																			var pageNumAndTotal = "<a class=\"disabled\">第"
																					+ page.pageNum
																					+ " /"
																					+ page.pages
																					+ "页(共"
																					+ page.total
																					+ "条)</a>"

																			var ul = $("<ul class=\"pagination pagination-lg\"/>");
																			$(
																					"<li/>")
																					.html(
																							"<a href=\"#\" class=\"prePage\">&laquo;上一页</a>")
																					.appendTo(
																							ul);
																			$(
																					"<li/>")
																					.html(
																							pageNumAndTotal)
																					.appendTo(
																							ul);
																			$(
																					"<li/>")
																					.html(
																							"<a href=\"#\" class=\"nextPage\">下一页&raquo;</a>")
																					.appendTo(
																							ul);
																			$(
																					'.page-div')
																					.append(
																							ul);
																		} else {
																			$
																					.confirm({
																						title : 'Data error',
																						content : '没有与您相关的数据!',
																						autoClose : 'cancel|1500',
																						backgroundDismiss : true,
																						buttons : {
																							cancel : {
																								text : '取消',
																								btnClass : 'waves-effect waves-button'
																							}
																						}
																					})
																		}
																	}
																}, 'json');
											});

							///////////////////////////////   prePage   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

							$('body')
									.on(
											'click',
											'.prePage',
											function() {
												currentPageNum = currentPageNum - 1;

												var auditSelectedText = '';
												if (currentAwardsType == 'thesis') {
													auditSelectedText = $(
															"#chAuditStatus")
															.find(
																	"option:selected")
															.text();
												}
												if (currentAwardsType == 'patent') {
													auditSelectedText = $(
															"#paAuditStatus")
															.find(
																	"option:selected")
															.text();
												}
												if(currentAwardsType=='achievementAward'){
												    selectedText = $("#achievementAwardClaimStatus option:selected").text();
												    auditSelectedText = $("#achievementAwardAuditStatus").find("option:selected").text();
												}
												if(currentAwardsType=='opusAward'){
												    selectedText = $("#opusAwardClaimStatus option:selected").text();
												    auditSelectedText = $("#opusAwardAuditStatus").find("option:selected").text();
												}

												$
														.ajax({
															type : 'post',
															url : '${ctx}/user/thesis-additional-list'
																	+ '?pageNum='
																	+ currentPageNum
																	+ '&',
															data : paramMap,
															success : function(
																	page) {
																$('#tbody')
																		.empty();//清空-------------------------------------------------
																$('.page-div')
																		.empty();//清空-------------------------------------------------

																if (page != null) {
																	for (var i = 0; i < page.list.length; i++) {

																		var tr = $("<tr/>");
																		$(
																				"<td class=\"id\"/ display=\"none;\">")
																				.html(
																						page.list[i].id)
																				.appendTo(
																						tr);
																		$(
																				"<td/>")
																				.html(
																						i + 1)
																				.appendTo(
																						tr);
																		if(currentAwardsType=='opusAward'){
											                                   $("<td/>").html(page.list[i].name).appendTo(tr);
											                            }else if(currentAwardsType=='achievementAward'){
											                                   $("<td/>").html(page.list[i].achievementName).appendTo(tr);
											                            }else{
											                                  		  $(
																							"<td/>")
																							.html(
																								page.list[i].name)
																							.appendTo(
																								tr);
											                                  }
																		$(
																		"<td/>")
																			.html(
																			page.list[i].no1AutherName)
																		.appendTo(
																			tr);

																		$(
																				"<td/>")
																				.html(
																						"<button type=\"button\" class=\"btn btn-success\" id=\"detaile\">详情</button>")
																				.appendTo(
																						tr);
																		$(
																				"<td class=\"options-contant\"/>")
																				.appendTo(
																						tr);
																		$(
																				'#tbody')
																				.append(
																						tr);
																	}
																	currentPageNum = page.pageNum;//重新定位页数
																	var pageNumAndTotal = "<a class=\"disabled\">第"
																			+ page.pageNum
																			+ " /"
																			+ page.pages
																			+ "页(共"
																			+ page.total
																			+ "条)</a>"

																	var ul = $("<ul class=\"pagination pagination-lg\"/>");
																	$("<li/>")
																			.html(
																					"<a href=\"#\" class=\"prePage\">&laquo;上一页</a>")
																			.appendTo(
																					ul);
																	$("<li/>")
																			.html(
																					pageNumAndTotal)
																			.appendTo(
																					ul);
																	$("<li/>")
																			.html(
																					"<a href=\"#\" class=\"nextPage\">下一页&raquo;</a>")
																			.appendTo(
																					ul);
																	$(
																			'.page-div')
																			.append(
																					ul);
																} else {
																	$
																			.confirm({
																				title : 'Data error',
																				content : '没有与您相关的数据!',
																				autoClose : 'cancel|1500',
																				backgroundDismiss : true,
																				buttons : {
																					cancel : {
																						text : '取消',
																						btnClass : 'waves-effect waves-button'
																					}
																				}
																			})
																}
															}
														});
											})

							///////////////////////////////   nextPage   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
							$('body')
									.on(
											'click',
											'.nextPage',
											function() {

												currentPageNum = currentPageNum + 1;

												var auditSelectedText = '';
												if (currentAwardsType == 'thesis') {
													auditSelectedText = $(
															"#chAuditStatus")
															.find(
																	"option:selected")
															.text();
												}
												if (currentAwardsType == 'patent') {
													auditSelectedText = $(
															"#paAuditStatus")
															.find(
																	"option:selected")
															.text();
												}
												if(currentAwardsType=='achievementAward'){
												    selectedText = $("#achievementAwardClaimStatus option:selected").text();
												    auditSelectedText = $("#achievementAwardAuditStatus").find("option:selected").text();
												}
												if(currentAwardsType=='opusAward'){
												    selectedText = $("#opusAwardClaimStatus option:selected").text();
												    auditSelectedText = $("#opusAwardAuditStatus").find("option:selected").text();
												}

												$
														.ajax({
															type : 'post',
															url : '${ctx}/user/thesis-additional-list'
																	+ '?pageNum='
																	+ currentPageNum
																	+ '&',
															data : paramMap,
															success : function(
																	page) {
																$('#tbody')
																		.empty();//清空-------------------------------------------------
																$('.page-div')
																		.empty();//清空-------------------------------------------------

																if (page != null) {
																	for (var i = 0; i < page.list.length; i++) {

																		var tr = $("<tr/>");
																		$(
																				"<td class=\"id\"/ display=\"none;\">")
																				.html(
																						page.list[i].id)
																				.appendTo(
																						tr);
																		$(
																				"<td/>")
																				.html(
																						i + 1)
																				.appendTo(
																						tr);
																		if(currentAwardsType=='opusAward'){
											                                   $("<td/>").html(page.list[i].name).appendTo(tr);
											                            }else if(currentAwardsType=='achievementAward'){
											                                   $("<td/>").html(page.list[i].achievementName).appendTo(tr);
											                            }else{
											                                  		  $(
																							"<td/>")
																							.html(
																								page.list[i].name)
																							.appendTo(
																								tr);
											                                  }
																		$(
																		"<td/>")
																			.html(
																			page.list[i].no1AutherName)
																		.appendTo(
																			tr);

																		$(
																				"<td/>")
																				.html(
																						"<button type=\"button\" class=\"btn btn-success\" id=\"detaile\">详情</button>")
																				.appendTo(
																						tr);
																		$(
																				"<td class=\"options-contant\"/>")
																				.appendTo(
																						tr);
																		$(
																				'#tbody')
																				.append(
																						tr);
																	}
																	currentPageNum = page.pageNum;//重新定位页数
																	var pageNumAndTotal = "<a class=\"disabled\">第"
																			+ page.pageNum
																			+ " /"
																			+ page.pages
																			+ "页(共"
																			+ page.total
																			+ "条)</a>"

																	var ul = $("<ul class=\"pagination pagination-lg\"/>");
																	$("<li/>")
																			.html(
																					"<a href=\"#\" class=\"prePage\">&laquo;上一页</a>")
																			.appendTo(
																					ul);
																	$("<li/>")
																			.html(
																					pageNumAndTotal)
																			.appendTo(
																					ul);
																	$("<li/>")
																			.html(
																					"<a href=\"#\" class=\"nextPage\">下一页&raquo;</a>")
																			.appendTo(
																					ul);
																	$(
																			'.page-div')
																			.append(
																					ul);
																} else {
																	$
																			.confirm({
																				title : 'Data error',
																				content : '没有与您相关的数据!',
																				autoClose : 'cancel|1500',
																				backgroundDismiss : true,
																				buttons : {
																					cancel : {
																						text : '取消',
																						btnClass : 'waves-effect waves-button'
																					}
																				}
																			})
																}
															}
														});
											})

							//*************************************详细***********************************************//
							$('body')
									.on(
											'click',
											'#detaile',
											function() {
												var id = $(this).parent()
														.siblings()[0].innerHTML;
												var contant = $(this).parent()
														.next();
												if (contant.html() == '') {
													$
															.ajax({
																url : '${ctx}/user/thesis-detail/'+currentAwardsType,
																type : 'POST',
																data : {
																	id : id
																},
																success : function(
																		data) {
																	contant
																			.html(data);
																	$('body')
																			.find(
																					".modal[id$="
																							+ id
																							+ "]")
																			.modal(
																					"show");
																}
															})//ajax
												}//if
												else {
													$('body').find(
															".modal[id$=" + id
																	+ "]")
															.modal("show");
												}
											});

						});//ready
	</script>
</body>

</html>