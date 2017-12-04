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
															</tr>
														</thead>
														<tbody id="tbody-patent">
														</tbody>
														<div id="Modal"></div>
													</table>
												</div>
												<div id="patent-page-div" align="center"></div>
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
															</tr>
														</thead>
														<tbody id="tbody-en">
														</tbody>
														<div id="Modal"></div>
													</table>
												</div>
												<div id="en-page-div" align="center"></div>
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
															</tr>
														</thead>
														<tbody id="tbody-ch">
														</tbody>
														<div id="Modal"></div>
													</table>
												</div>
												<div id="ch-page-div" align="center"></div>
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
		if($('#tbody-patent').children().length == 0){
		$.ajax({
			type : 'post',
			url : '${ctx}/admin/notClaimed-list',
			data : {
				awardsType : 'patent'
			},
			success : function(data) {
				if (data != null) {
                    for (var i = 0; i < data.length; i++) {
                        var tr = $("<tr/>");
                        $("<td class=\"id\"/ display=\"none;\">").html(data[i].id).appendTo(tr);
                        $("<td/>").html(i + 1).appendTo(tr);
                        $("<td/>").html(data[i].type).appendTo(tr);
                        $("<td/>").html(data[i].name).appendTo(tr);
                        $("<td/>").html(data[i].no1AutherName).appendTo(tr);
                        $("<td/>").html(data[i].otherAutherName).appendTo(tr);
                        $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\">详情</button>").appendTo(tr);
                        $('#tbody-patent').append(tr);
                    }
                    
                    var ul = $("<ul class=\"pagination pagination-lg\"/>");
                    $("<li/>").html("<a href=\"#\">&laquo;上一页</a>").appendTo(ul);
                    $("<li/>").html("<a class=\"disabled\">第5 /215页(共x条)</a>").appendTo(ul);
                    $("<li/>").html("<a href=\"#\">下一页&raquo;</a>").appendTo(ul);
                    $('#patent-page-div').append(ul);
                    
                } else {
                    $.confirm({
                        title: 'Data error',
                        content: '没有与您相关的数据!',
                        autoClose: 'cancel|1000',
                        backgroundDismiss: true,
                        buttons: {
                            cancel: {
                                text: '取消',
                                btnClass: 'waves-effect waves-button'
                            }
                        }
                    })
                }
			}
		});
		}})
	$('#enPeriodicalThesis-tab').on('click', function() {
		if($('#tbody-en').children().length == 0){
		$.ajax({
			type : 'post',
			url : '${ctx}/admin/notClaimed-list',
			data : {
				awardsType : 'enPeriodicalThesis'
			},
			success : function(data) {
				if (data != null) {
                    for (var i = 0; i < data.length; i++) {
                        var tr = $("<tr/>");
                        $("<td class=\"id\"/ display=\"none;\">").html(data[i].id).appendTo(tr);
                        $("<td/>").html(i + 1).appendTo(tr);
                        $("<td/>").html(data[i].type).appendTo(tr);
                        $("<td/>").html(data[i].name).appendTo(tr);
                        $("<td/>").html(data[i].no1AutherName).appendTo(tr);
                        $("<td/>").html(data[i].otherAutherName).appendTo(tr);
                        $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\">详情</button>").appendTo(tr);
                        $('#tbody-en').append(tr);
                    }
                    
                    var ul = $("<ul class=\"pagination pagination-lg\"/>");
                    $("<li/>").html("<a href=\"#\">&laquo;上一页</a>").appendTo(ul);
                    $("<li/>").html("<a class=\"disabled\">第5 /215页(共x条)</a>").appendTo(ul);
                    $("<li/>").html("<a href=\"#\">下一页&raquo;</a>").appendTo(ul);
                    $('#en-page-div').append(ul);
                    
                } else {
                    $.confirm({
                        title: 'Data error',
                        content: '没有与您相关的数据!',
                        autoClose: 'cancel|1000',
                        backgroundDismiss: true,
                        buttons: {
                            cancel: {
                                text: '取消',
                                btnClass: 'waves-effect waves-button'
                            }
                        }
                    })
                }
			}
		});
	}})
	$('#chPeriodicalThesis-tab').on('click', function() {
		if($('#tbody-ch').children().length == 0){
		$.ajax({
			type : 'post',
			url : '${ctx}/admin/notClaimed-list',
			data : {
				awardsType : 'chPeriodicalThesis',
				pageSize : '30',
				pageNum : '1'
			},
			success : function(data) {
				if (data != null) {
                    for (var i = 0; i < data.length; i++) {
                        var tr = $("<tr/>");
                        $("<td class=\"id\"/ display=\"none;\">").html(data[i].id).appendTo(tr);
                        $("<td/>").html(i + 1).appendTo(tr);
                        $("<td/>").html(data[i].type).appendTo(tr);
                        $("<td/>").html(data[i].name).appendTo(tr);
                        $("<td/>").html(data[i].no1AutherName).appendTo(tr);
                        $("<td/>").html(data[i].otherAutherName).appendTo(tr);
                        $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\">详情</button>").appendTo(tr);
                        $('#tbody-ch').append(tr);
                    }
                        
                        var ul = $("<ul class=\"pagination pagination-lg\"/>");
                        $("<li/>").html("<a href=\"#\" id=\"ch-prePage\">&laquo;上一页</a>").appendTo(ul);
                        $("<li/>").html("<a class=\"disabled\">第5 /215页(共x条)</a>").appendTo(ul);
                        $("<li/>").html("<a href=\"#\">下一页&raquo;</a>").appendTo(ul);
                        $('#ch-page-div').append(ul);

                } else {
                    $.confirm({
                        title: 'Data error',
                        content: '没有与您相关的数据!',
                        autoClose: 'cancel|1000',
                        backgroundDismiss: true,
                        buttons: {
                            cancel: {
                                text: '取消',
                                btnClass: 'waves-effect waves-button'
                            }
                        }
                    })
                }
			}
		});
	}})
	
	$('body').on('click', '#ch-prePage', function () {
                var id = $(this).parent().siblings()[0].innerHTML;
                var contant = $(this).parent().next();
                if (contant.html() == '') {
                    $.ajax({
                        url: '${ctx}/user/options-contant',
                        type: 'POST',
                        data: {id: id,awardsType:'chPeriodicalThesis'},
                        success: function (data) {
                            contant.html(data);
                            $.confirm({
                                title: 'Data error',
                                content: '数据记载完毕!请再次点击认领.',
                                autoClose: 'cancel|1000',
                                backgroundDismiss: true,
                                buttons: {
                                    cancel: {
                                        text: '取消',
                                        btnClass: 'waves-effect waves-button'
                                    }
                                }
                            })
                        }
                    })
                }
            })

	</script>
</body>
</html>