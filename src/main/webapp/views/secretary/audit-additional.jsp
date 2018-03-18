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
<title>审核补录</title>
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
					<h3 class="page-title">审核补录</h3>
					<div class="row">
						<div class="col-md-12">
							<div class="panel">
								<ul class="nav nav-tabs" id="myTab">
									<!-- <li class="active" id="ch-tag"><a href="#Chinese" data-toggle="tab">中文期刊论文</a></li>
									<li id="en-tag"><a href="#English" data-toggle="tab">英文期刊论文</a></li>
									<li id="patent-tag"><a href="#Patent" data-toggle="tab">专利</a></li> -->
									<li class="active" id="ch-tag"><a href="#Chinese" data-toggle="tab">论文</a></li>
								</ul>
								<div class="tab-content">
									
									<div class="tab-pane active" id="Chinese">
										<div class="panel-body">
										<form class="form-inline" id="ChineseForm">
											<div class="form-group" style="display: none;">
												<input type="text" name="awardsType"
													value="chPeriodicalThesis" class="type-control">
											</div>
											<div class="form-group">
												<label>标题:</label> <input type="text" name="name"
													class="form-control">
											</div>
											<div class="form-group">
												<label>归属学院:</label> <select name="workunit"
													class="form-control">
													<option value="${sessionScope.currentUser.college}">${sessionScope.currentUser.college}</option>
												</select>
											</div>
											<div class="form-group">
												<label>审核状态:</label> <select id="chAuditStatus" name="status"
													class="form-control">
													<option value="未审核">未审核</option>
													<option value="通过审核">通过审核</option>
													<option value="未通过审核">未通过审核</option>
												</select>
											</div>
											<button id='ch-btn' type="submit" class="btn btn-primary">查询</button>
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
												<th>操作</th>
												<th>操作2</th>
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
$(document).ready(function () {

	var currentAwardsType='chPeriodicalThesis';//维护一个 类型参数字符串,仅在每次切换标签时变化.
	var currentPageNum=1;//维护一个 当前页参数,换页时+ - ,在每次切换标签/查询时初始化.
	var currentPageSize=30;
	var paramMap='';//维护一个 请求参数字符串,仅在每次查询时变化.
	

       function initical(type){currentAwardsType=type;currentPageNum=1;$('#tbody').empty();$('.page-div').empty();}

            $(function () {
                $('#myTab li:eq(0) a').tab('show');
           });

            
		$('#ch-tag').click(function(){initical('chPeriodicalThesis');});
		$('#en-tag').click(function(){initical('enPeriodicalThesis');});
		$('#patent-tag').click(function(){initical('patent');});


            $('#ch-btn,#en-btn,#patent-btn').bind('click', function(){
				currentPageNum=1;    ////维护一个 当前页参数,换页时+ - ,在每次切换标签/查询时初始化.
                        $('#tbody').empty();//清空-------------------------------------------------
                        $('.page-div').empty();//清空-------------------------------------------------


            	var temp_form;
            	if (temp_form != $(this).parent().attr('id')) {
            		temp_form = $(this).parent().attr('id');
            		$('#tbody').empty();
            		}
			
			//变换当前类型
 			$('.type-control').attr('value',currentAwardsType);
			paramMap = $(this).parent().serialize();

			
			var auditSelectedText = '';
			if(currentAwardsType=='chPeriodicalThesis'){
			    auditSelectedText = $("#chAuditStatus").find("option:selected").text();
			}
			if(currentAwardsType=='enPeriodicalThesis'){
			    auditSelectedText = $("#enAuditStatus").find("option:selected").text();
			}
			if(currentAwardsType=='patent'){
			    auditSelectedText = $("#paAuditStatus").find("option:selected").text();
			}
			
            	$(this).parent().attr('target','nm_iframe');
            	$.ajax({
                    type: 'post',
                    url: '${ctx}/secretary/audit-additional-list'+'?pageNum='+currentPageNum+'&',
                    data: paramMap,
                    success: function (page) {
                        if (page != null) {
                            for (var i = 0; i < page.list.length; i++) {

                                var tr = $("<tr/>");
                                $("<td class=\"id\"/ display=\"none;\">").html(page.list[i].id).appendTo(tr);
                                $("<td/>").html(i + 1).appendTo(tr);
                                $("<td/>").html(page.list[i].name).appendTo(tr);
                                $("<td/>").html(page.list[i].no1AutherName).appendTo(tr);
					 				$("<td/>").html("<button type=\"button\" class=\"btn btn-success\" id=\"detaile\">详情</button>").appendTo(tr);
					 				if(auditSelectedText=='未审核'){
										 $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\" id=\"passBtn\">通过</button>").appendTo(tr);
			                         $("<td class=\"options-contant\"/>").appendTo(tr);
										 $("<td/>").html("<button type=\"button\" class=\"btn btn-danger\" id=\"notPassBtn\">不通过</button>").appendTo(tr);
									 }
						 					if(auditSelectedText=='未通过审核'){
	                             $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\" id=\"passBtn\">通过</button>").appendTo(tr);
	                             $("<td class=\"options-contant\"/>").appendTo(tr);
						 					}//未通过审核
						 					if(auditSelectedText=='通过审核'){
	                             $("<td/>").html("<button type=\"button\" class=\"btn btn-danger\" id=\"notPassBtn\">不通过</button>").appendTo(tr);
						 					}//通过审核
                                $('#tbody').append(tr);
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
                                autoClose: 'cancel|1500',
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
                }, 'json');
            });


//pass
            $('body').on('click', '#passBtn', function () {
                var id = $(this).parent().siblings()[0].innerHTML;
                var awardsName = $(this).parent().siblings()[2].innerHTML;
                
                if (confirm("确认[ "+awardsName+" ]通过审核?")) {
                    $.ajax({
                        url: '${ctx}/secretary/audit-additional',
                        type: 'POST',
                        data: {id: id,btnType:'pass'},
                        success: function (data) {
                            $.confirm({
                                title: data.status,
                                content: '该条通过审核',
                                autoClose: 'cancel|1000',
                                backgroundDismiss: true,
                                buttons: {
                                    cancel: {
                                        text: '确定',
                                        btnClass: 'waves-effect waves-button'
                                    }
                                }
                            })
                        }
                     })
                  $(this).parent().parent().remove();
                }//if
                
                
            })


//notPass
            $('body').on('click', '#notPassBtn', function () {
                var id = $(this).parent().siblings()[0].innerHTML;
                var awardsName = $(this).parent().siblings()[2].innerHTML;
                
                if (confirm("确认[ "+awardsName+" ]不通过审核?")) {
                    $.ajax({
                        url: '${ctx}/secretary/audit-additional',
                        type: 'POST',
                        data: {id: id,btnType:'notPass'},
                        success: function (data) {
                            $.confirm({
                                title: data.status,
                                content: '该条未通过审核',
                                autoClose: 'cancel|1000',
                                backgroundDismiss: true,
                                buttons: {
                                    cancel: {
                                        text: '确定',
                                        btnClass: 'waves-effect waves-button'
                                    }
                                }
                            })
                        }
                     })
                  $(this).parent().parent().remove();
                }//if
                  
            })








///////////////////////////////   prePage   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

$('body').on('click', '.prePage', function () {
       currentPageNum = currentPageNum - 1 ;
       
       
		var auditSelectedText = '';
		if(currentAwardsType=='chPeriodicalThesis'){
		    auditSelectedText = $("#chAuditStatus").find("option:selected").text();
		}
		if(currentAwardsType=='enPeriodicalThesis'){
		    auditSelectedText = $("#enAuditStatus").find("option:selected").text();
		}
		if(currentAwardsType=='patent'){
		    auditSelectedText = $("#paAuditStatus").find("option:selected").text();
		}
       
		$.ajax({
			type : 'post',
			url : '${ctx}/secretary/audit-additional-list'+'?pageNum='+currentPageNum+'&',
			data : paramMap,
			success : function(page) {
                        $('#tbody').empty();//清空-------------------------------------------------
                        $('.page-div').empty();//清空-------------------------------------------------

                        if (page != null) {
                            for (var i = 0; i < page.list.length; i++) {

                                var tr = $("<tr/>");
                                $("<td class=\"id\"/ display=\"none;\">").html(page.list[i].id).appendTo(tr);
                                $("<td/>").html(i + 1).appendTo(tr);
                                $("<td/>").html(page.list[i].name).appendTo(tr);
                                $("<td/>").html(page.list[i].no1AutherName).appendTo(tr);
					 				$("<td/>").html("<button type=\"button\" class=\"btn btn-success\" id=\"detaile\">详情</button>").appendTo(tr);
					 				if(auditSelectedText=='未审核'){
										 $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\" id=\"passBtn\">通过</button>").appendTo(tr);
			                         $("<td class=\"options-contant\"/>").appendTo(tr);
										 $("<td/>").html("<button type=\"button\" class=\"btn btn-danger\" id=\"notPassBtn\">不通过</button>").appendTo(tr);
									 }
						 					if(auditSelectedText=='未通过审核'){
	                             $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\" id=\"passBtn\">通过</button>").appendTo(tr);
	                             $("<td class=\"options-contant\"/>").appendTo(tr);
						 					}//未通过审核
						 					if(auditSelectedText=='通过审核'){
	                             $("<td/>").html("<button type=\"button\" class=\"btn btn-danger\" id=\"notPassBtn\">不通过</button>").appendTo(tr);
						 					}//通过审核
                                $('#tbody').append(tr);
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
                                autoClose: 'cancel|1500',
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




///////////////////////////////   nextPage   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
$('body').on('click', '.nextPage', function () {

       currentPageNum = currentPageNum + 1 ;
       
       
		var auditSelectedText = '';
		if(currentAwardsType=='chPeriodicalThesis'){
		    auditSelectedText = $("#chAuditStatus").find("option:selected").text();
		}
		if(currentAwardsType=='enPeriodicalThesis'){
		    auditSelectedText = $("#enAuditStatus").find("option:selected").text();
		}
		if(currentAwardsType=='patent'){
		    auditSelectedText = $("#paAuditStatus").find("option:selected").text();
		}
       
       
		$.ajax({
			type : 'post',
			url : '${ctx}/secretary/audit-additional-list'+'?pageNum='+currentPageNum+'&',
			data : paramMap,
			success : function(page) {
                        $('#tbody').empty();//清空-------------------------------------------------
                        $('.page-div').empty();//清空-------------------------------------------------

                        if (page != null) {
                            for (var i = 0; i < page.list.length; i++) {


                                var tr = $("<tr/>");
                                $("<td class=\"id\"/ display=\"none;\">").html(page.list[i].id).appendTo(tr);
                                $("<td/>").html(i + 1).appendTo(tr);
                                $("<td/>").html(page.list[i].name).appendTo(tr);
                                $("<td/>").html(page.list[i].no1AutherName).appendTo(tr);
								    $("<td/>").html("<button type=\"button\" class=\"btn btn-success\" id=\"detaile\">详情</button>").appendTo(tr);
								 if(auditSelectedText=='未审核'){
									 $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\" id=\"passBtn\">通过</button>").appendTo(tr);
		                         $("<td class=\"options-contant\"/>").appendTo(tr);
									 $("<td/>").html("<button type=\"button\" class=\"btn btn-danger\" id=\"notPassBtn\">不通过</button>").appendTo(tr);
								 }
					 					if(auditSelectedText=='未通过审核'){
                             $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\" id=\"passBtn\">通过</button>").appendTo(tr);
                             $("<td class=\"options-contant\"/>").appendTo(tr);
					 					}//未通过审核
					 					if(auditSelectedText=='通过审核'){
                             $("<td/>").html("<button type=\"button\" class=\"btn btn-danger\" id=\"notPassBtn\">不通过</button>").appendTo(tr);
					 					}//通过审核
					 			
                                $('#tbody').append(tr);
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
                                autoClose: 'cancel|1500',
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




          //******************************************详细detaile*********************************************//

            $('body').on('click', '#detaile', function () {
            	var id = $(this).parent().siblings()[0].innerHTML;
            	
            	currentAwardsType = "thesis";
            	
            		$.ajax({
            			type : 'get',
            			url : '${ctx}/secretary/detaile',
            			data : {
                                   id:id,
                                   awardsType:currentAwardsType
                        },
            			dataType : 'json',
            			success : function(data) {
            				if (data != null) {

            					var detaileStr = '';
            					
            					/*

            					this.supportProject = "";
            					*/
            					
            					if(data.name != ""){detaileStr += "标题:  " + data.name+ "\n";}
            					if(data.type != ""){detaileStr += "类型:  " + data.type+ "\n";}
            					if(data.publishDate != ""){detaileStr += "发表时间:  " + data.publishDate+ "\n";}
          						if(data.publishMagazineThesisSet != ""){detaileStr += "发表刊物/论文集:  " + data.publishMagazineThesisSet+ "\n";}
          						if(data.magazineType != ""){detaileStr += "刊物类型:  " + data.magazineType+ "\n";}
            					
          						if(data.subjectType != ""){detaileStr += "学科门类:  " + data.subjectType+ "\n";}
          						if(data.stairSubject != ""){detaileStr += "一级学科:  " + data.stairSubject+ "\n";}
          						if(data.thesisSetPublisher != ""){detaileStr += "论文集出版单位:  " + data.thesisSetPublisher+ "\n";}
          						if(data.publishRange != ""){detaileStr += "发表范围: " + data.publishRange+ "\n";}
            					if(data.keyWords != ""){detaileStr += "关键字:  " + data.keyWords+ "\n";}
          						if(data.issn != ""){detaileStr += "ISSN号:  " + data.issn+ "\n";}
          						if(data.cn != ""){detaileStr += "CN号:  " + data.cn+ "\n";}
          						if(data.doi != ""){detaileStr += "DOI:  " + data.doi+ "\n";}
          						if(data.theAbstract != ""){detaileStr += "摘要:  " + data.theAbstract+ "\n";}
          						if(data.appearance != ""){detaileStr += "版面:  " + data.appearance+ "\n";}
          						if(data.projectSources != ""){detaileStr += "项目来源:  " + data.projectSources+ "\n";}
          						if(data.note != ""){detaileStr += "备注:  " + data.note+ "\n";}
          						if(data.conferenceName != ""){detaileStr += "会议名称:  " + data.conferenceName+ "\n";}
          						if(data.conferenceSite != ""){detaileStr += "会议地址:  " + data.conferenceSite+ "\n";}
          						if(data.conferenceDate != ""){detaileStr += "会议日期:  " + data.conferenceDate+ "\n";}
          						if(data.embodyNumber != ""){detaileStr += "论文收录号码:  " + data.embodyNumber+ "\n";}
            					
          						
          						if(data.communicateAutherName != ""){detaileStr += "通讯作者姓名:  " + data.communicateAutherName+ "\n";}
          						if(data.no10AutherName != ""){detaileStr += "通讯作者工号: " + data.no10AutherName + "\n";}
          						
          						//if(data.no1AutherType != ""){detaileStr += "第一作者类型:  " + data.no1AutherType+ "\n";}
            					if(data.no1AutherName != ""){detaileStr += "第一作者姓名: " + data.no1AutherName + "\n";}
            					if(data.no1AutherNumber != ""){detaileStr += "第一作者工号: " + data.no1AutherNumber + "\n";}
            					if(data.no2AutherName != ""){detaileStr += "第二作者姓名: " + data.no2AutherName + "\n";}
            					if(data.no2AutherNumber != ""){detaileStr += "第二作者工号: " + data.no2AutherNumber + "\n";}
            					if(data.no3AutherName != ""){detaileStr += "第三作者姓名: " + data.no3AutherName + "\n";}
            					if(data.no3AutherNumber != ""){detaileStr += "第三作者工号: " + data.no3AutherNumber + "\n";}
            					if(data.no4AutherName != ""){detaileStr += "第四作者姓名: " + data.no4AutherName + "\n";}
            					if(data.no4AutherNumber != ""){detaileStr += "第四作者工号: " + data.no4AutherNumber + "\n";}
            					if(data.no5AutherName != ""){detaileStr += "第五作者姓名: " + data.no5AutherName + "\n";}
            					if(data.no5AutherNumber != ""){detaileStr += "第五作者工号: " + data.no5AutherNumber + "\n";}
            					if(data.no6AutherName != ""){detaileStr += "第六作者姓名: " + data.no6AutherName + "\n";}
            					if(data.no6AutherNumber != ""){detaileStr += "第六作者工号: " + data.no6AutherNumber + "\n";}
            					if(data.no7AutherName != ""){detaileStr += "第七作者姓名: " + data.no7AutherName + "\n";}
            					if(data.no7AutherNumber != ""){detaileStr += "第七作者工号: " + data.no7AutherNumber + "\n";}
            					if(data.no8AutherName != ""){detaileStr += "第八作者姓名: " + data.no8AutherName + "\n";}
            					if(data.no8AutherNumber != ""){detaileStr += "第八作者工号: " + data.no8AutherNumber + "\n";}
            					if(data.no9AutherName != ""){detaileStr += "第九作者姓名: " + data.no9AutherName + "\n";}
            					if(data.no9AutherNumber != ""){detaileStr += "第九作者工号: " + data.no9AutherNumber + "\n";}
            					
            					
            					detaileStr += "成果归属单位: " + data.workunit + "\n";
            					detaileStr += "审核状态: " + data.status + "\n";
            		
            					alert(detaileStr);
            				}
            			},
            		});

            });





});//ready
        </script>
</body>

</html>