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
            <nav class="navbar navbar-default navbar-fixed-top">
                <div class="brand">
                    <a href="{ctx}/home"><img src="${ctx}/views/assets/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"></a>
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
                            <li><a href="${ctx}/home" class=""><i class="lnr lnr-home"></i> <span>Home</span></a></li>
                            <li><a href="elements.html" class=""><i class="fa fa-search"></i> <span>Search</span></a></li>
                            <li><a href="#" class=""><i class="lnr lnr-pencil"></i> <span>Modify</span></a></li>
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
			        /*error:function(XMLHttpRequest, textStatus, errorThrown){
			        	$.confirm({
			        		theme: 'dark',
							animation: 'rotateX',
							closeAnimation: 'rotateX',
							title: false,
							content: textStatus,
							buttons: {
								confirm: {
									text: '确认',
									btnClass: 'waves-effect waves-button waves-light'
								}
							}
			        	})
			        }*/
				})
			});
			function logout(){

			}
		</script>
    </body>

</html>
