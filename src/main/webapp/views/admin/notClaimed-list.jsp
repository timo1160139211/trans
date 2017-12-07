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
																<th>唯一标识</th>
																<th>名称</th>
																<th>作者</th>
																<th>出处</th>
																<th>操作</th>
															</tr>
														</thead>
														<tbody class="datatable">
														</tbody>
														<div id="Modal"></div>
													</table>
												</div>
												<div class="page-div" align="center"></div>
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
																<th>唯一标识</th>
																<th>名称</th>
																<th>作者</th>
																<th>出处</th>
																<th>操作</th>
															</tr>
														</thead>
														<tbody class="datatable">
														</tbody>
														<div id="Modal"></div>
													</table>
												</div>
												<div class="page-div" align="center"></div>
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
																<th>唯一标识</th>
																<th>名称</th>
																<th>作者</th>
																<th>出处</th>
																<th>操作</th>
															</tr>
														</thead>
														<tbody class="datatable">
														</tbody>
														<div id="Modal"></div>
													</table>
												</div>
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

      var currentPageNum=1;
      var currentPageSize=30;
      var currentAwardsType='patent';



	$('#patent-tab').on('click', function() {
             currentAwardsType='patent';
             currentPageNum=1;

		$('.datatable').empty();
             $('.page-div').empty();
		if($('.datatable').children().length == 0){
		$.ajax({
			type : 'post',
			url : '${ctx}/admin/notClaimed-list',
			data : {
				awardsType : currentAwardsType,
				pageSize : currentPageSize,
				pageNum : currentPageNum
			},
			success : function(page) {
				if (page != null) {
                    for (var i = 0; i < page.list.length; i++) {
                        var tr = $("<tr/>");
                        $("<td class=\"id\"/ display=\"none;\">").html(page.list[i].id).appendTo(tr);
                        $("<td/>").html(i + 1).appendTo(tr);
                        $("<td/>").html(page.list[i].keyId).appendTo(tr);
                        $("<td/>").html(page.list[i].name).appendTo(tr);
                        $("<td/>").html(page.list[i].allAutherName).appendTo(tr);
                        $("<td/>").html(page.list[i].provenance).appendTo(tr);
                        $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\">详情</button>").appendTo(tr);
                        $('.datatable').append(tr);
                    }
                        var pageNumAndTotal = "<a class=\"disabled\">第" + page.pageNum + " /" + page.pages + "页(共" + page.total + "条)</a>" 
                    
                        var ul = $("<ul class=\"pagination pagination-lg\"/>");
                        $("<li/>").html("<a href=\"#\" class=\"prePage\">&laquo;上一页</a>").appendTo(ul);
                        $("<li/>").html(pageNumAndTotal).appendTo(ul);
                        $("<li/>").html("<a href=\"#\" class=\"nextPage\">下一页&raquo;</a>").appendTo(ul);
                        $('.page-div').append(ul);
                    
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
             currentAwardsType='enPeriodicalThesis';
             currentPageNum=1;

             $('.datatable').empty();
             $('.page-div').empty();
		if($('.datatable').children().length == 0){
		$.ajax({
			type : 'post',
			url : '${ctx}/admin/notClaimed-list',
			data : {
				awardsType : currentAwardsType,
				pageSize : currentPageSize,
				pageNum : currentPageNum
			},
			success : function(page) {
				if (page != null) {
                    for (var i = 0; i < page.list.length; i++) {
                        var tr = $("<tr/>");
                        $("<td class=\"id\"/ display=\"none;\">").html(page.list[i].id).appendTo(tr);
                        $("<td/>").html(i + 1).appendTo(tr);
                        $("<td/>").html(page.list[i].keyId).appendTo(tr);
                        $("<td/>").html(page.list[i].name).appendTo(tr);
                        $("<td/>").html(page.list[i].allAutherName).appendTo(tr);
                        $("<td/>").html(page.list[i].provenance).appendTo(tr);
                        $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\">详情</button>").appendTo(tr);
                        $('.datatable').append(tr);
                    }
                        var pageNumAndTotal = "<a class=\"disabled\">第" + page.pageNum + " /" + page.pages + "页(共" + page.total + "条)</a>" 
                    
                        var ul = $("<ul class=\"pagination pagination-lg\"/>");
                        $("<li/>").html("<a href=\"#\" class=\"prePage\">&laquo;上一页</a>").appendTo(ul);
                        $("<li/>").html(pageNumAndTotal).appendTo(ul);
                        $("<li/>").html("<a href=\"#\" class=\"nextPage\">下一页&raquo;</a>").appendTo(ul);
                        $('.page-div').append(ul);
                    
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
             currentAwardsType='chPeriodicalThesis';
             currentPageNum=1;

             $('.datatable').empty();
             $('.page-div').empty();
		if($('.datatable').children().length == 0){
		$.ajax({
			type : 'post',
			url : '${ctx}/admin/notClaimed-list',
			data : {
				awardsType : currentAwardsType,
				pageSize : currentPageSize,
				pageNum : currentPageNum
			},
			success : function(page) {
				if (page != null) {
                    for (var i = 0; i < page.list.length; i++) {
                        var tr = $("<tr/>");
                        $("<td class=\"id\"/ display=\"none;\">").html(page.list[i].id).appendTo(tr);
                        $("<td/>").html(i + 1).appendTo(tr);
                        $("<td/>").html(page.list[i].keyId).appendTo(tr);
                        $("<td/>").html(page.list[i].name).appendTo(tr);
                        $("<td/>").html(page.list[i].allAutherName).appendTo(tr);
                        $("<td/>").html(page.list[i].provenance).appendTo(tr);
                        $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\">详情</button>").appendTo(tr);
                        $('.datatable').append(tr);
                    }
                        var pageNumAndTotal = "<a class=\"disabled\">第" + page.pageNum + " /" + page.pages + "页(共" + page.total + "条)</a>" 
                    
                        var ul = $("<ul class=\"pagination pagination-lg\"/>");
                        $("<li/>").html("<a href=\"#\" class=\"prePage\">&laquo;上一页</a>").appendTo(ul);
                        $("<li/>").html(pageNumAndTotal).appendTo(ul);
                        $("<li/>").html("<a href=\"#\" class=\"nextPage\">下一页&raquo;</a>").appendTo(ul);
                        $('.page-div').append(ul);

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
	
	$('body').on('click', '.prePage', function () {
       currentPageNum = currentPageNum - 1 ;
		$.ajax({
			type : 'post',
			url : '${ctx}/admin/notClaimed-list',
			data : {
				awardsType : currentAwardsType,
				pageSize : currentPageSize,
				pageNum : currentPageNum
			},
			success : function(page) {
                        $('.datatable').empty();//清空-------------------------------------------------
                        $('.page-div').empty();//清空-------------------------------------------------

				if (page != null) {
                    for (var i = 0; i < page.list.length; i++) {
                        var tr = $("<tr/>");
                        $("<td class=\"id\"/ display=\"none;\">").html(page.list[i].id).appendTo(tr);
                        $("<td/>").html(i + 1).appendTo(tr);
                        $("<td/>").html(page.list[i].keyId).appendTo(tr);
                        $("<td/>").html(page.list[i].name).appendTo(tr);
                        $("<td/>").html(page.list[i].allAutherName).appendTo(tr);
                        $("<td/>").html(page.list[i].provenance).appendTo(tr);
                        $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\">详情</button>").appendTo(tr);
                        $('.datatable').append(tr);
                    }
                        var pageNumAndTotal = "<a class=\"disabled\">第" + page.pageNum + " /" + page.pages + "页(共" + page.total + "条)</a>" 
                    
                        currentPageNum = page.pageNum;

                        var ul = $("<ul class=\"pagination pagination-lg\"/>");
                        $("<li/>").html("<a href=\"#\" class=\"prePage\">&laquo;上一页</a>").appendTo(ul);
                        $("<li/>").html(pageNumAndTotal).appendTo(ul);
                        $("<li/>").html("<a href=\"#\" class=\"nextPage\">下一页&raquo;</a>").appendTo(ul);
                        $('.page-div').append(ul);

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
            })

	$('body').on('click', '.nextPage', function () {

             currentPageNum = currentPageNum + 1 ; 
		$.ajax({
			type : 'post',
			url : '${ctx}/admin/notClaimed-list',
			data : {
				awardsType : currentAwardsType,
				pageSize : currentPageSize,
				pageNum : currentPageNum
			},
			success : function(page) {
                        $('.datatable').empty();//清空-------------------------------------------------
                        $('.page-div').empty();//清空-------------------------------------------------


				if (page != null) {
                    for (var i = 0; i < page.list.length; i++) {
                        var tr = $("<tr/>");
                        $("<td class=\"id\"/ display=\"none;\">").html(page.list[i].id).appendTo(tr);
                        $("<td/>").html(i + 1).appendTo(tr);
                        $("<td/>").html(page.list[i].keyId).appendTo(tr);
                        $("<td/>").html(page.list[i].name).appendTo(tr);
                        $("<td/>").html(page.list[i].allAutherName).appendTo(tr);
                        $("<td/>").html(page.list[i].provenance).appendTo(tr);
                        $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\">详情</button>").appendTo(tr);
                        $('.datatable').append(tr);
                    }
                        var pageNumAndTotal = "<a class=\"disabled\">第" + page.pageNum + " /" + page.pages + "页(共" + page.total + "条)</a>" 
                    
                        currentPageNum = page.pageNum; //重新赋当前值

                        var ul = $("<ul class=\"pagination pagination-lg\"/>");
                        $("<li/>").html("<a href=\"#\" class=\"prePage\">&laquo;上一页</a>").appendTo(ul);
                        $("<li/>").html(pageNumAndTotal).appendTo(ul);
                        $("<li/>").html("<a href=\"#\" class=\"nextPage\">下一页&raquo;</a>").appendTo(ul);
                        $('.page-div').append(ul);

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
            })

	</script>
</body>
</html>