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
                        <h3 class="page-title">认领</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel">
                                    <ul class="nav nav-tabs" id="myTab">
                                        <li class="active"><a href="#Patent" data-toggle="tab">专利</a></li>
                                        <li><a href="#English" data-toggle="tab">英文期刊论文</a></li>
                                        <li><a href="#Chinese" data-toggle="tab">中文期刊论文</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="Patent">
                                            <div class="panel-body">
                                                <form class="form-inline" id="PatentForm">
                                                    <div class="form-group" style="display: none;">
                                                        <input type="text" name="awardsType" value="patent" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>名称:</label>
                                                        <input type="text" name="name" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>发明(设计)人:</label>
                                                        <input type="text" name="autherName" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>授权号：</label>
                                                        <input type="text" name="authorizationNumber" class="form-control" placeholder="ZL2010">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>是否为PCT专利：</label>
                                                        <input type="checkbox" name="pctPatentOrNot" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>状态</label>
                                                        <select name="claimStatus" class="form-control">
                                                            <option value="未认领">未认领</option>
                                                            <option value="已认领">已认领</option>
                                                        </select>
                                                    </div>
                                                    <button type="submit" class="btn btn-default">Send invitation</button>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="English">
                                            <form class="form-inline" id="EnglishForm">
                                                <div class="form-group" style="display: none;">
                                                    <input type="text" name="awardsType" value="enPeriodicalThesis" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label>标题:</label>
                                                    <input type="text" name="name" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label>作者:</label>
                                                    <input type="text" name="autherName" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label>来源：</label>
                                                    <input type="text" name="provenance" class="form-control" placeholder="ZL2010">
                                                </div>
                                                <div class="form-group">
                                                    <label>学科领域：</label>
                                                    <input type="text" name="subject" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label>卷：</label>
                                                    <input type="text" name="volume" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label>年：</label>
                                                    <input type="text" name="year" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label>状态</label>
                                                    <select name="claimStatus" class="form-control">
                                                        <option value="未认领">未认领</option>
                                                        <option value="已认领">已认领</option>
                                                    </select>
                                                </div>
                                                <button type="submit" class="btn btn-default">Send invitation</button>
                                            </form>
                                        </div>
                                        <div class="tab-pane" id="Chinese">
                                            <form class="form-inline" id="ChineseForm">
                                                <div class="form-group" style="display: none;">
                                                    <input type="text" name="awardsType" value="chPeriodicalThesis" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label>标题:</label>
                                                    <input type="text" name="name" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label>作者:</label>
                                                    <input type="text" name="autherName" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label>出处：</label>
                                                    <input type="text" name="provenance" class="form-control" placeholder="ZL2010">
                                                </div>
                                                <div class="form-group">
                                                    <label>卷：</label>
                                                    <input type="text" name="volume" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label>年：</label>
                                                    <input type="text" name="year" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label>状态</label>
                                                    <select name="claimStatus" class="form-control">
                                                        <option value="未认领">未认领</option>
                                                        <option value="已认领">已认领</option>
                                                    </select>
                                                </div>
                                                <button type="submit" class="btn btn-default">Send invitation</button>
                                            </form>
                                        </div>
                                        <iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe>
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
            $(function () {
                $('#myTab li:eq(0) a').tab('show');
            });
            $(document).ready(function () {
                if ('${currentUser}' == '')
                {
                    window.location.href = "localhost:8080" + "${ctx}" + "/login";
                }
            });
            $('.tab-content form button').bind('click', function(){
            	var temp_form;
            	if (temp_form != $(this).parent().attr('id')) {
            		temp_form = $(this).parent().attr('id');
            		$('#tbody').empty();
            	}
            	$(this).parent().attr('target','nm_iframe');          	
            	$.ajax({
                    type: 'post',
                    url: '${ctx}/user/awards-list',
                    data: $(this).parent().serialize(),
                    success: function (data) {
                        if (data != null) {
                            for (var i = 0; i < data.length; i++) {
                                var tr = $("<tr/>");
                                $("<td class=\"id\"/ display=\"none;\">").html(data[i].id).appendTo(tr);
                                $("<td/>").html(i + 1).appendTo(tr);
                                $("<td/>").html(data[i].type).appendTo(tr);
                                $("<td/>").html(data[i].name).appendTo(tr);
                                $("<td/>").html(data[i].no1AutherName).appendTo(tr);
                                $("<td/>").html(data[i].otherAutherName).appendTo(tr);
                                $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\" data-toggle=\"modal\" id=\"myModalBtn\" data-target=\"#myModal" + data[i].id + "\">认领</button>").appendTo(tr);
                                $("<td class=\"options-contant\"/>").appendTo(tr);
                                $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\">详情</button>").appendTo(tr);
                                $('#tbody').append(tr);
                            }
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
                }, 'json');
            });
            $('body').on('click', '#myModalBtn', function () {
                var id = $(this).parent().siblings()[0].innerHTML;
                var contant = $(this).parent().next();
                if (contant.html() == '') {
                    $.ajax({
                        url: '${ctx}/user/options-contant',
                        type: 'POST',
                        data: {id: id},
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

            /*退出当前用户*/
            function logout() {
                $.get('${ctx}/logout');
            }
            ;

        </script>
    </body>

</html>
