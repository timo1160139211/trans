<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div id="sidebar-nav" class="sidebar">
	<div class="sidebar-scroll">
		<nav>
			<!-- 用户 -->
			<c:if
				test="${currentUser.name != 'admin' and currentUser.name != 'secretary'}">
				<ul class="nav">
					<!-- 用户: 主页 -->
					<li><a href="${ctx}/user/home" class=""><i
							class="glyphicon glyphicon-home"></i> <span>主页</span></a></li>
					<!-- 用户: 查找用户 操作 -->
					<li><a href="${ctx}/user/search" target="_blank" class=""><i
							class="fa fa-search"></i> <span>查找用户</span></a></li>
					<!-- 用户: 修改个人 操作 -->
					<li><a href="${ctx}/user/user-update" class=""><i
							class="glyphicon glyphicon-cog"></i> <span>修改密码</span></a></li>
					<!-- 用户: 认领 操作    -->
					<li><a href="${ctx}/user/awards-list" class=""><i
							class="lnr lnr-file-empty"></i> <span>认领</span></a></li>
					<!-- 用户: 补录数据 操作 -->
					<li><a href="${ctx}/user/awards-create" class=""><i
							class="lnr lnr-pencil"></i> <span>补录数据</span></a></li>
					<!-- 用户: 查看补录数据 操作 -->		
					<li><a href="${ctx}/user/thesis-additional-list" class=""><i
							class="fa fa-search"></i> <span>查看补录数据</span></a></li>
					
				</ul>
			</c:if>


			<!-- 秘书 -->
			<c:if test="${currentUser.name != 'admin' and currentUser.name == 'secretary'}">
				<ul class="nav">
					<!-- 秘书: 主页 -->
					<li><a href="${ctx}/secretary/home" class=""><i
							class="glyphicon glyphicon-home"></i> <span>主页</span></a></li>
					<!-- 秘书: 审核 操作 -->
					<li><a href="${ctx}/secretary/audit-list" class=""><i
							class="fa fa-search"></i> <span>审核</span></a></li>
					<!-- 秘书: 审核补录 操作 -->		
					<li><a href="${ctx}/secretary/audit-additional" class=""><i
							class="fa fa-search"></i> <span>审核补录</span></a></li>		
					<!-- 用户: 修改个人 操作 -->
					<li><a href="${ctx}/secretary/secretary-update" class=""><i
							class="glyphicon glyphicon-cog"></i> <span>修改密码</span></a></li>
				</ul>
			</c:if>

			<!-- 管理员 -->
			<c:if test="${currentUser.name == 'admin' and currentUser.name != 'secretary'}">
				<!-- admin -->
				<ul class="nav">
					<!-- 用户: 主页 -->
					<li><a href="${ctx}/admin/home" class=""><i
							class="glyphicon glyphicon-home"></i> <span>主页</span></a></li>

					<!-- admin: 统计 操作 -->
					<li><a href="${ctx}/admin/claim-statistic" class=""><i
							class="fa fa-search"></i> <span>查看进度</span></a></li>

					<!-- admin: 查看数据 操作 -->
					<li><a href="${ctx}/admin/notClaimed-list" class=""><i
							class="fa fa-search"></i> <span>未认领数据</span></a></li>
							
					<!-- admin: 管理用户 操作 -->
					<li><a href="${ctx}/admin/user-manage" class=""><i
							class="glyphicon glyphicon-th-list"></i> <span>管理用户</span></a></li>
							
					<!-- admin: 管理学院 -->
					<!--<li><a href="${ctx}/admin/college-manage" class=""><i
							class="glyphicon glyphicon-th-list"></i> <span>管理学院</span></a></li>
					-->

					<!-- admin: 上传 操作 -->
					<li><a href="${ctx}/admin/upload" class=""><i
							class="fa fa-upload"></i> <span>上传数据</span></a></li>

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
								<li><a href="${ctx}/admin/download/achievementAward" class="">成果奖励</a></li>
								<li><a href="${ctx}/admin/download/opusAward" class="">著作奖励</a></li>
							</ul>
						</div>
					</li>
						
					<!-- admin: 下载 操作 -->
					<li><a href="#subPagesDownloadTwo" data-toggle="collapse"
						class="collapsed"><i class="fa fa-download"></i> <span>下载补录数据</span>
							<i class="icon-submenu lnr lnr-chevron-left"></i></a>
						<div id="subPagesDownloadTwo" class="collapse ">
							<ul class="nav">
								<li><a href="${ctx}/admin/download/thesis" class="">补录-论文</a></li>
							</ul>
						</div>
					</li>
					
					<!-- admin: 下载 操作 -->
					<li><a href="#subPagesDownloadModel" data-toggle="collapse"
						class="collapsed"><i class="fa fa-download"></i> <span>下载数据模板</span>
							<i class="icon-submenu lnr lnr-chevron-left"></i></a>
						<div id="subPagesDownloadModel" class="collapse ">
							<ul class="nav">
								<li><a href="${ctx}/admin/download/patent-model" class="">专利－模版</a></li>
								<li><a
									href="${ctx}/admin/download/chPeriodicalThesis-model" class="">中文论文－模版</a></li>
								<li><a
									href="${ctx}/admin/download/enPeriodicalThesis-model" class="">英文论文－模版</a></li>
								<li><a href="${ctx}/admin/download/user-model"
									class="">用户信息－模板</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</c:if>
		</nav>
	</div>
</div>