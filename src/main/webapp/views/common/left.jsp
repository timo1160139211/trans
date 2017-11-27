<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div id="sidebar-nav" class="sidebar">
	<div class="sidebar-scroll">
		<nav>
			<c:if test="${currentUser.name != 'admin'}">
				<!-- 用户 -->
				<ul class="nav">
					<li><a href="${ctx}/home" class=""><i class="lnr lnr-file-empty"></i>
							<span>认领</span></a></li>
					<!-- 用户: 查找 操作 -->
					<li><a href="${ctx}/user/search" class=""><i
							class="fa fa-search"></i> <span>查找</span></a></li>
					<!-- 用户: 修改个人 操作 -->
					<li><a href="${ctx}/user/user-update" class=""><i
							class="lnr lnr-pencil"></i> <span>修改个人信息</span></a></li>
					<!-- 用户: 认领 操作 -->
					<!-- <li><a href="#subPages" data-toggle="collapse"
						class="collapsed"><i class="lnr lnr-file-empty"></i> <span>认领</span>
							<i class="icon-submenu lnr lnr-chevron-left"></i></a>
						<div id="subPages" class="collapse ">
							<ul class="nav">
								<li><a href="page-profile.html" class="">专利</a></li>
								<li><a href="page-login.html" class="">中文期刊论文</a></li>
								<li><a href="page-lockscreen.html" class="">英文期刊论文</a></li>
							</ul>
						</div>
					</li> -->
				</ul>
			</c:if>

			<c:if test="${currentUser.name == 'admin'}">
				<!-- admin -->
				<ul class="nav">
					<!-- admin: 统计 操作 -->
					<li><a href="${ctx}/admin/claim-statistic" class=""><i
							class="fa fa-search"></i> <span>查看进度</span></a></li>
					<!-- admin: 上传 操作 -->
					<li><a href="#subPagesUpload" data-toggle="collapse"
						class="collapsed"><i class="fa fa-upload"></i> <span>上传数据</span>
							<i class="icon-submenu lnr lnr-chevron-left"></i></a>
						<div id="subPagesUpload" class="collapse ">
							<ul class="nav">
								<li><a href="${ctx}/admin/upload/patent" class="">专利</a></li>
								<li><a href="${ctx}/admin/upload/chPeriodicalThesis"
									class="">中文期刊论文</a></li>
								<li><a href="${ctx}/admin/upload/enPeriodicalThesis"
									class="">英文期刊论文</a></li>
							</ul>
						</div></li>
					<!-- admin: 下载 操作 -->
					<li><a href="#subPagesDownload" data-toggle="collapse"
						class="collapsed"><i class="fa fa-download"></i> <span>下载数据</span>
							<i class="icon-submenu lnr lnr-chevron-left"></i></a>
						<div id="subPagesDownload" class="collapse ">
							<ul class="nav">
								<li><a href="${ctx}/admin/download/patent" class="">专利</a></li>
								<li><a href="${ctx}/admin/download/chPeriodicalThesis"
									class="">中文期刊论文</a></li>
								<li><a href="${ctx}/admin/download/enPeriodicalThesis"
									class="">英文期刊论文</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</c:if>
		</nav>
	</div>
</div>