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
        <title>修改信息</title>
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
                        <h3 class="page-title">修改个人信息</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <form:form id="admin-upload" action="${ctx}/admin/upload" enctype="multipart/form-data" method="post">
                                    <div class="form-group">
                                        <label for="upload">File input</label>
                                        <input type="file" id="upload" name="filename">
                                        <p class="help-block"></p>
                                    </div>
                                    <button type="submit" id="modify-submit" class="btn btn-default">Upload</button>
                                </form:form>
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
    </body>
</html>
