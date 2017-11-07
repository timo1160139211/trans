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
		<jsp:include page="/views/common/nav.jsp" flush="true"/>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<jsp:include page="/views/common/left.jsp" flush="true"/>
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
							<!-- END TABLE HOVER -->
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
				<p class="copyright">&copy; 2017 &nbsp;&nbsp;PoweredBy &nbsp;Softlab&nbsp;1#314</p>
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->
	<jsp:include page="/views/resources/footer.jsp" flush="true"/>
	<!-- options-contant -->
	<script type="text/javascript">
	$(document).ready(function () {
		if('${currentUser}' == '')
		{
			window.location.href = "localhost:8080" + "${ctx}";
		}
	    getdataByCurrentUser();
	});
	function getdataByCurrentUser(){
		$.ajax({
			type: 'post',
	        url: '${ctx}/user/thesis-list',
	        success: function(data) {
				if (data != null) {
					for (var i = 0; i < data.length; i++) {
						var tr = $("<tr/>");
						$("<td class=\"id\"/ display=\"none;\">").html(data[i].id).appendTo(tr);
	                    $("<td/>").html(i + 1).appendTo(tr);
	                    $("<td/>").html(data[i].type).appendTo(tr);
	                    $("<td/>").html(data[i].name).appendTo(tr);
	                    $("<td/>").html(data[i].no1AutherName).appendTo(tr);
	                    $("<td/>").html(data[i].otherAutherName).appendTo(tr);
	                    $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\" data-toggle=\"modal\" id=\"myModalBtn\" data-target=\"#myModal"+data[i].id+"\">认领</button>").appendTo(tr);
	                    $("<td class=\"options-contant\"/>").appendTo(tr);
	                    $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\">详情</button>").appendTo(tr);
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

	$('body').on('click','#myModalBtn',function(){
		var id = $(this).parent().siblings()[0].innerHTML;
		var contant = $(this).parent().next();
		if (contant.html() == '') {
			$.ajax({
			   	url: '${ctx}/user/options-contant',
			    type: 'POST',
			    data: {id: id},
			    success:function(data){
			    	contant.html(data);
			    	/*$.confirm({
			    		title: 'Data error',
						content: '数据记载完毕!',
						autoClose: 'cancel|1000',
						backgroundDismiss: true,
						buttons: {
							cancel: {
								text: '取消',
								btnClass: 'waves-effect waves-button'
							}
						}
			    	})*/
			    }
			})
		}
	})

	/*退出当前用户*/
	function logout(){
		$.get('${ctx}/logout');
	};
		
	</script>
</body>

</html>
	