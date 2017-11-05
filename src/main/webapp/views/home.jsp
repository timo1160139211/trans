<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">

<head>
	<title>Home</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<jsp:include page="/views/resources/head.jsp" flush="true"/>
 
 </head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="index.html"><img src="${ctx}/views/assets/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"></a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
				</div>				
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="lnr lnr-question-circle"></i> <span>Help</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#">Basic Use</a></li>
								<li><a href="#">Working With Data</a></li>
								<li><a href="#">Security</a></li>
								<li><a href="#">Troubleshooting</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="${ctx}/views/assets/img/user.png" class="img-circle" alt="Avatar"> <span>${currentUser.name}</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="lnr lnr-user"></i> <span>My Profile</span></a></li>
								<li><a href="#"><i class="lnr lnr-envelope"></i> <span>Message</span></a></li>
								<li><a href="#"><i class="lnr lnr-cog"></i> <span>Settings</span></a></li>
								<li><a href="javascript:;" onclick="logout()"><i class="lnr lnr-exit"></i> <span>Logout</span></a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="index.html" class=""><i class="lnr lnr-home"></i> <span>Home</span></a></li>
						<li><a href="elements.html" class=""><i class="fa fa-search"></i> <span>Search</span></a></li>
						<li><a href="charts.html" class=""><i class="lnr lnr-pencil"></i> <span>Modify</span></a></li>
						<li>
							<a href="#subPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i> <span>Claim</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages" class="collapse ">
								<ul class="nav">
									<li><a href="page-profile.html" class="">Profile</a></li>
									<li><a href="page-login.html" class="">Login</a></li>
									<li><a href="page-lockscreen.html" class="">Lockscreen</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">Tables</h3>
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
												<th>类型</th>
												<th>名称</th>
												<th>第一作者</th>
												<th>其他作者</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody id="tbody">	
										</tbody>
										<div id="Modal"></div>
										<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
											  <div class="modal-dialog" role="document">
											    <div class="modal-content">
											      <div class="modal-header">
											        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											        <form:form>
											        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
											      </div>
											      <div class="modal-body">
												      <label for="sdutNum">山理工职工人数</label>
												      <input type="text" class="form-control" name="form-control" id="sdutNum" >
												      <label for="myNo">你是第几作者</label>
												      <input type="text" class="form-control" name="form-control" id="myNo" >
											      </div>
											      <div class="modal-footer">
											        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
											        <button type="button" class="btn btn-primary">Save changes</button>
											      </div>
											      </form:form>
											    </div>
											  </div>
											</div>
									</table>
								</div>
							</div>
							<!-- END TABLE HOVER -->
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>

		,<button type="button" class="btn btn-primary" onclick=""></button>

		<!-- END MAIN -->
		<div class="clearfix"></div>
		<footer>
			<div class="container-fluid">
				<p class="copyright">&copy; 2017 &nbsp;&nbsp;PoweredBy &nbsp;Softlab&nbsp;1#314</p>
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->
	<jsp:include page="/views/resources/footer.jsp" flush="true"/>
	<!-- options-contant -->
	<script type="text/javascript">
	$(document).ready(function () {
		if('${currentUser}' == null)
		{
			window.location.href = "localhost:8080" + "${ctx}";
		}
	    getdataByCurrentUser();
	    /*$('#myModal').bind('click',function(){
	    	//$('Modal').load('${ctx}/views/options-contant.jsp');
	    });*/
	});
	function getdataByCurrentUser(){
		$.ajax({
			type: 'post',
	        url: '${ctx}/user/thesis-list',
	        success: function(data) {
				if (data != null) {
					for (var i = 0; i < data.length; i++) {
						var tr = $("<tr/>");
	                    $("<td/>").html(i + 1).appendTo(tr);
	                    $("<td/>").html(data[i].type).appendTo(tr);
	                    $("<td/>").html(data[i].name).appendTo(tr);
	                    $("<td/>").html(data[i].no1AutherName).appendTo(tr);
	                    $("<td/>").html(data[i].otherAutherName).appendTo(tr);
	                    var button = $("<button type=\"button\" class=\"btn btn-primary\" data-toggle=\"modal\" id=\"myModalBtn\" data-target=\"#myModal\">认领</button>");
	                    button.appendTo($("<td/>")).appendTo(tr);
	                    $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\">详情</button>");
	                    //$("<td/>").html().load("/views/options-contant.html").appendTo(tr);
	                   	$('#tbody').append(tr);
					}
				}
				else {
					$.confirm({
	                	title: 'Data error',
						content: '没有与您相关的数据!',
						autoClose: 'cancel|3000',
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
		},'json');
	}
	/*退出当前用户*/
	function logout(){
		$.post('{ctx}/logout', function() {});
	};
		
	</script>
</body>

</html>