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
                                <form:form id="user-modify" action="${ctx}/user/user-update" method="post">
                                    <div class="form-group">
                                        <label for="name">姓名</label>
                                        <input type="text" class="form-control" name="name" id="name">
                                    </div>
                                    <div class="form-group">
                                        <label for="password">密码</label>
                                        <input type="password" name="password" class="form-control" id="password" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <label for="college">学院</label>
                                        <input type="text" name="college" class="form-control" id="college">
                                    </div>
                                    <button type="submit" id="modify-submit" class="btn btn-default">Submit</button>
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
		<script type="text/javascript">
			$('#modify-submit').bind('click',function(){
				$.ajax({
					type: 'post',
			        url: '${ctx}/user/user-update',
			        data: $('#user-modify').serialize(),
			        beforeSend: function() {
			            if ($('#name').val() == '') {
			                $('#name').focus();
			                return false;
			            }
			        },
			        success:function(){
		        		$.confirm({
		        			theme: 'dark',
							animation: 'rotateX',
							closeAnimation: 'rotateX',
							title: false,
							content: '个人新已修改!',
							buttons: {
								confirm: {
									text: '确认',
									btnClass: 'waves-effect waves-button waves-light'
								}
							}
		        		})
			        }
				})
			});
			function logout(){

			}
		</script>
    </body>

</html>
