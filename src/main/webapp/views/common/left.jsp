<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="${ctx}/home" class=""><i class="lnr lnr-home"></i> <span>Home</span></a></li>
						<li><a href="${ctx}/admin/upload" class=""><i class="fa fa-upload"></i> <span>Upload</span></a></li>
						<li><a href="${ctx}/admin/search" class=""><i class="fa fa-search"></i> <span>Upload</span></a></li>
						<li><a href="${ctx}/user/user-update" class=""><i class="lnr lnr-pencil"></i> <span>Modify</span></a></li>
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