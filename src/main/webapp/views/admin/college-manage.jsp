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
<title></title>
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
					<h3 class="page-title">学院查找</h3>
					<div class="row">
						<div class="col-md-12">
							<form id="search_form">
							<div class="row">
							<div class="col-md-3">
								<label for="name">名称:</label>
								</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-md-3">
											<input type="text" class="form-control" name="name" id="name">
										</div>
										<div class="col-md-1">
											<button id="search_button" type="button"
												class="btn btn-primary">查询</button>
										</div>
										<div class="col-md-1">
										</div>
										<div class="col-md-1">
											<button id="add_button" type="button" class="btn btn-success">添加</button>
										</div>
									</div>
								</div>
							</form>
						</div>
						<div class="row">
							<div class="col-md-12">
								<!-- TABLE HOVER -->
								<div class="panel">
									<div class="panel-heading">
										<h3 class="panel-title" align="center">动态模糊匹配结果</h3>
									</div>
									<div class="panel-body">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>#</th>
													<th>名称</th>
													<th>操作1</th>
													<th>操作2</th>
													<th>操作3</th>
												</tr>
											</thead>
											<tbody id="tbody">
											</tbody>
											<div id="Modal"></div>
										</table>
									</div>
									<div class="page-div" align="center"></div>
									>
								</div>
								<!-- END TABLE HOVER -->
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
$(document).ready(function () {

          var currentPageNum=1;
	    var currentPageSize=30;
        
            $('#search_button').bind('click', function () {
                var currentPageNum=1;	
                setTimeout(function () {
                    $('#tbody').empty();//清空-------------------------------------------------
                    $('.page-div').empty();//清空-------------------------------------------------
                    $.ajax({
                        type: 'post',
                        url: '${ctx}/admin/college-search/'+currentPageNum,
                        data: $('#search_form').serialize(),
                        success: function (page) {
                            if (page != null) {
                            for (var i = 0; i < page.list.length; i++) {
                                var tr = $("<tr/>");
                                $("<td class=\"id\"/ display=\"none;\">").html(page.list[i].id).appendTo(tr);
                                $("<td/>").html(i + 1).appendTo(tr);
                                $("<td/>").html(page.list[i].name).appendTo(tr);
                                $("<td/>").html("<button type='button' class='btn btn-success' id='detail"+page.list[i].id+"'>查看秘书</button>").appendTo(tr);
									 $("<td/>").html("<button type='button' class='btn btn-success' id='update"+page.list[i].id+"'>修改</button>").appendTo(tr);
									 $("<td/>").html("<button type='button' class='btn btn-danger' id='delete"+page.list[i].id+"'>删除</button>").appendTo(tr);
                                $('#tbody').append(tr); 
                            }
	                        var pageNumAndTotal = "<a class=\"disabled\">第" + page.pageNum + " /" + page.pages + "页(共" + page.total + "条)</a>" 
    	                    
	                        currentPageNum = page.pageNum;

	                        var ul = $("<ul class=\"pagination pagination-lg\"/>");
	                        $("<li/>").html("<a href=\"#\" class=\"prePage\">&laquo;上一页</a>").appendTo(ul);
	                        $("<li/>").html(pageNumAndTotal).appendTo(ul);
	                        $("<li/>").html("<a href=\"#\" class=\"nextPage\">下一页&raquo;</a>").appendTo(ul);
	                        $('.page-div').append(ul);
                            
                        }     
                        }
                    })
                }, 1000);
            });
            
           

	 ///////////////////////////////////////   重置   //////////////////////////////////////////////// var id = $(this).parent().siblings()[0].innerHTML;

		$('body').on('click', "button[id^='reset_password']", function () {
			
			var id = $(this).parent().siblings()[0].innerHTML;
			var btn_id = 'reset_password' + id;
			var username = $(this).parent().siblings()[2].innerHTML;
			
			if(confirm("确定重置'" + username + "'的密码?")){
				$.ajax({
					type:'post',				
					url:'${ctx}/admin/reset-user-password',
					data:{id:id},
					success:function(data){
						if(data !=null){
							alert(data.msg);
							$('#'+btn_id).attr("class","btn btn-default");
							$('#'+btn_id).attr("disabled","disabled");
							$('#'+btn_id).text(' 已重置 ');
						}//if(data !=null)
					}//success
				});//ajax

			}//if(confirm

		});


	 ///////////////////////////////////////   删除   ////////////////////////////////////////////////

		$('body').on('click', "button[id^='delete']", function () {
			var id = $(this).parent().siblings()[0].innerHTML;
			var btn_id = 'delete' + id;
			var username = $(this).parent().siblings()[2].innerHTML;
			
			if(confirm("确定删除用户'" + username + "'?")){
				$.ajax({
					type:'post',				
					url:'${ctx}/admin/delete-user',
					data:{id:id},
					success:function(data){
						if(data !=null){
							alert(data.msg);
							$('#'+btn_id).parent().parent().remove();
						}//if(data !=null)
					}//success
				});//ajax

			}//if(confirm
			
		});



            ///////////////////////////////////////   上一页   ////////////////////////////////////////////////
       	$('body').on('click', '.prePage', function () {
        	       currentPageNum = currentPageNum - 1 ;
        			$.ajax({
        				type : 'post',
                     url: '${ctx}/admin/user-search/'+currentPageNum,
                     data: $('#search_form').serialize(),
        				success : function(page) {
        	                        $('#tbody').empty();//清空-------------------------------------------------
        	                        $('.page-div').empty();//清空-------------------------------------------------

        					if (page != null) {
        	                    for (var i = 0; i < page.list.length; i++) {
                                    var tr = $("<tr/>");
                                    $("<td class=\"id\"/ display=\"none;\">").html(page.list[i].id).appendTo(tr);
                                    $("<td/>").html(i + 1).appendTo(tr);
                                    $("<td/>").html(page.list[i].name).appendTo(tr);
                                    $("<td/>").html(page.list[i].number).appendTo(tr);
                                    $("<td/>").html(page.list[i].college).appendTo(tr);
                                    $("<td/>").html(page.list[i].status).appendTo(tr);
										if(page.list[i].number != page.list[i].password){
											$("<td/>").html("<button type='button' class='btn btn-success' id='reset_password"+page.list[i].id+"'>重置密码</button>").appendTo(tr);
										}else{
											$("<td/>").html("<button type='button' class='btn btn-default' disabled='disabled'>已重置</button>").appendTo(tr);
										}
										$("<td/>").html("<button type='button' class='btn btn-danger' id='delete"+page.list[i].id+"'>删除用户</button>").appendTo(tr);
                  	              $('#tbody').append(tr);  
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


            ///////////////////////////////////////   下一页   ////////////////////////////////////////////////
        		$('body').on('click', '.nextPage', function () {

        	       currentPageNum = currentPageNum + 1 ; 
        			$.ajax({
        				type : 'post',
                        url: '${ctx}/admin/user-search/'+currentPageNum,
                        data: $('#search_form').serialize(),
        				success : function(page) {
        	                        $('#tbody').empty();//清空-------------------------------------------------
        	                        $('.page-div').empty();//清空-------------------------------------------------


        					if (page != null) {
        	                    for (var i = 0; i < page.list.length; i++) {
                                    var tr = $("<tr/>");
                                    $("<td class=\"id\"/ display=\"none;\">").html(page.list[i].id).appendTo(tr);
                                    $("<td/>").html(i + 1).appendTo(tr);
                                    $("<td/>").html(page.list[i].name).appendTo(tr);
                                    $("<td/>").html(page.list[i].number).appendTo(tr);
                                    $("<td/>").html(page.list[i].college).appendTo(tr);
                                    $("<td/>").html(page.list[i].status).appendTo(tr);
										if(page.list[i].number != page.list[i].password){
											$("<td/>").html("<button type='button' class='btn btn-success' id='reset_password"+page.list[i].id+"'>重置密码</button>").appendTo(tr);
										}else{
											$("<td/>").html("<button type='button' class='btn btn-default' disabled='disabled'>已重置</button>").appendTo(tr);
										}
										$("<td/>").html("<button type='button' class='btn btn-danger' id='delete"+page.list[i].id+"'>删除用户</button>").appendTo(tr);
                              	  $('#tbody').append(tr); 
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
        	            
});//ready
        </script>
</body>

</html>