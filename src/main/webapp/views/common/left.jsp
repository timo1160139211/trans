<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div id="sidebar-nav" class="sidebar">
	<div class="sidebar-scroll">
		<nav>
			<c:if test="${currentUser.number != 'admin'}">
				<!-- 用户 -->
				<ul class="nav">
				    <!-- 用户: 主页 -->
					<li><a href="${ctx}/user/home" class=""><i class="lnr lnr-file-empty"></i>
							<span>主页</span></a></li>
					<!-- 用户: 查找 操作 -->
					<li><a href="${ctx}/user/search" target="_blank" class=""><i
							class="fa fa-search"></i> <span>查找</span></a></li>
					<!-- 用户: 修改个人 操作 -->
					<li><a href="${ctx}/user/user-update" class=""><i
							class="lnr lnr-pencil"></i> <span>修改密码</span></a></li>
					<!-- 用户: 认领 操作 -->
					<li><a href="${ctx}/user/awards-list" class=""><i class="lnr lnr-file-empty"></i>
							<span>认领</span></a></li>
				</ul>
			</c:if>

			<c:if test="${currentUser.number == 'admin'}">
				<!-- admin -->
				<ul class="nav">
				    <!-- 用户: 主页 -->
					<li><a href="${ctx}/admin/home" class=""><i class="lnr lnr-file-empty"></i>
							<span>主页</span></a></li>
							
					<!-- admin: 统计 操作 -->
					<li><a href="${ctx}/admin/claim-statistic" class=""><i
							class="fa fa-search"></i> <span>查看进度</span></a></li>
					
					<!-- admin: 查看数据 操作 -->
					<li><a href="${ctx}/admin/notClaimed-list" class=""><i
							class="fa fa-search"></i> <span>未认领数据</span></a></li>
							
					<!-- admin: 上传 操作 -->
					<li><a href="${ctx}/admin/upload" class=""><i class="fa fa-upload"></i> <span>上传数据</span></a>
					</li>
					
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
								<li><a href="${ctx}/admin/download/patent_model" class="">专利－模版</a></li>
								<li><a href="${ctx}/admin/download/chPeriodicalThesis_model"
									class="">中文论文－模版</a></li>
								<li><a href="${ctx}/admin/download/enPeriodicalThesis_model"
									class="">英文论文－模版</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</c:if>
		</nav>
	</div>
</div>