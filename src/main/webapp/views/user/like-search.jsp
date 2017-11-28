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
        <title></title>
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
            <!-- MAIN -->
            <div class="main">
                <!-- MAIN CONTENT -->
                <div class="main-content">
                    <div class="container-fluid">
                        <h3 class="page-title">人员查找</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <form id="search_form">
                                    <div class="form-group">
                                        <label for="name">姓名:</label>
                                        <input type="text" class="form-control" name="name" id="name">
                                    </div>
                                    
                                </form>
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
                                                        <th>姓名</th>
                                                        <th>工号</th>
                                                        <th>学院</th>
                                                        <th>状态</th>
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
        <script type="text/javascript">
            $('#name').bind('keyup focus', function () {
                setTimeout(function () {
                	  $('#tbody').empty();
                    $.ajax({
                        type: 'post',
                        url: '${ctx}/user/search',
                        data: $('#search_form').serialize(),
                        success: function (data) {
                            if (data != null) {
                            for (var i = 0; i < data.length; i++) {
                                var tr = $("<tr/>");
                                $("<td class=\"id\"/ display=\"none;\">").html(data[i].id).appendTo(tr);
                                $("<td/>").html(i + 1).appendTo(tr);
                                $("<td/>").html(data[i].name).appendTo(tr);
                                $("<td/>").html(data[i].number).appendTo(tr);
                                $("<td/>").html(data[i].college).appendTo(tr);
                                $("<td/>").html(data[i].status).appendTo(tr);
                                $('#tbody').append(tr); 
                            }
                        }     
                        }
                    })
                }, 500);
            });
            function logout() {

            }
        </script>
    </body>

</html>
