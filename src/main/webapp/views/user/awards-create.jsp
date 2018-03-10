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
<title>追加论文</title>
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
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">论文追加:</h3>
					<h4 style="color: red;">英文论文请写英文:</h4>
					<div class="row">
						<div class="col-md-12">
							<div class="panel">
								<ul class="nav nav-tabs" id="myTab">
									<li><a id="to-patent-tab" href="#patent-tab"
										data-toggle="tab">专利</a></li>
									<li class="active"><a id="to-thesis-tab"
										href="#thesis-tab" data-toggle="tab">论文</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane" id="patent-tab">
										<div class="panel-body">
											<div class="form-group">
												<form:form class="form-inline"
													action="${ctx}/user/awards-create" method="post">

												</form:form>
											</div>
										</div>
									</div>
									<div class="tab-pane active" id="thesis-tab">
										<div class="panel-body">
											<div class="form-group">

												<form:form commandName="thesis" class="form-inline"
													action="${ctx}/user/awards-create" method="post">



													<table>
														<tbody>
															<tr>
																<td width="60%"><label for="name"
																	class="form-control ">论文题目:</label> <input type="text"
																	class="form-control " name="name" id="name" size="40"
																	value="" maxlength="512"><font
																	style="color: #FF0000;"> *</font></td>
															</tr>


															<tr>
																<td width="60%"><label class="form-control ">发表时间:</label>
																	<input type="text" class="form-control " name="publishDate"
																	value=""> <font style="color: #FF0000;">
																		*</font></td>
																<td width="40%"><label class="form-control ">发表刊物/论文集:</label>
																	<input type="text" class="form-control " name="publishMagazineThesisSet"
																	value=""> <font style="color: #FF0000;">
																		*</font></td>
															</tr>


															<tr>
																<td width="60%"><label class="form-control ">论文类型:</label>
																	<select name="type" class=" form-control">
																		<option value="">--请选择--</option>
																		<option value="SCI">SCI</option>
																		<option value="EI">EI</option>
																		<option value="SSCI">SSCI</option>
																		<option value="ISTP">ISTP</option>
																		<option value="CSSCI">CSSCI</option>
																		<option value="普通刊">普通刊</option>
																		<option value="CSCD">CSCD</option>
																		<option value="其他">其他</option>
																</select> <font style="color: #FF0000;"> *</font></td>
																<td width="40%"><label class="form-control ">刊物类型:</label>
																	<select name="magazineType" class="form-control ">
																		<option value="">--请选择--</option>
																		<option value="A">A</option>
																		<option value="B">B</option>
																		<option value="C">C</option>
																		<option value="D">D</option>
																		<option value="其他">其他</option>
																		<option value="国际学术会议论文集">国际学术会议论文集</option>
																		<option value="国内学术会议论文集">国内学术会议论文集</option>
																</select> <font style="color: #FF0000;"> *</font></td>
															</tr>

															<tr>
																<td width="60%"><label class="form-control ">归属单位:</label>
																	<select name="workunit" class="form-control ">
																		<option value="">--请选择--</option>
																		<option value="机械工程学院">机械工程学院</option>
																		<option value="交通与车辆工程学院">交通与车辆工程学院</option>
																		<option value="农业工程与食品科学学院">农业工程与食品科学学院</option>
																		<option value="电气与电子工程学院">电气与电子工程学院</option>
																		<option value="计算机科学与技术学院">计算机科学与技术学院</option>
																		<option value="化学化工学院">化学化工学院</option>
																		<option value="建筑工程学院">建筑工程学院</option>
																		<option value="资源与环境工程学院">资源与环境工程学院</option>
																		<option value="材料科学与工程学院">材料科学与工程学院</option>
																		<option value="生命科学学院">生命科学学院</option>
																		<option value="数学与统计学院">数学与统计学院</option>
																		<option value="物理与光电工程学院">物理与光电工程学院</option>
																		<option value="经济学院">经济学院</option>
																		<option value="管理学院">管理学院</option>
																		<option value="文学与新闻传播学院">文学与新闻传播学院</option>
																		<option value="外国语学院">外国语学院</option>
																		<option value="法学院">法学院</option>
																		<option value="马克思主义学院">马克思主义学院</option>
																		<option value="美术学院">美术学院</option>
																		<option value="音乐学院">音乐学院</option>
																		<option value="体育学院">体育学院</option>
																		<option value="鲁泰纺织服装学院">鲁泰纺织服装学院</option>
																		<option value="齐文化研究院">齐文化研究院</option>

																		<option value="图书馆">图书馆</option>
																		<option value="后勤管理处">后勤管理处</option>
																		<option value="学生工作处">学生工作处</option>
																		<option value="实验管理中心">实验管理中心</option>
																		<option value="校医院">校医院</option>
																</select> <font style="color: #FF0000;"> *</font></td>
																<td width="40%"><label class="form-control ">通讯作者:</label>
																	<input type="text" class="form-control "
																	name="communicateAutherName" value=""> <font
																	style="color: #FF0000;"> *</font></td>
															</tr>




															<tr>
																<td width="60%"><label class="form-control ">学科门类:</label>

																	<select class="form-control " name="subjectType"><option
																			value="">--请选择--</option>
																		<option value="科技类">科技类</option>
																		<option value="社科类">社科类</option>
																</select> <font style="color: #FF0000;"> *</font></td>
																
																<td width="40%"><label class="form-control ">一级学科:</label>
																	<select class="form-control " name="stairSubject"><option
																			value="">--请选择--</option>
																		<option value="110">数学</option>
																		<option value="120">信息科学与系统科学</option>
																		<option value="130">力学</option>
																		<option value="140">物理学</option>
																		<option value="150">化学</option>
																		<option value="160">天文学</option>
																		<option value="170">地球科学</option>
																		<option value="180">生物学</option>
																		<option value="190">心理学</option>
																		<option value="210">农学</option>
																		<option value="220">林学</option>
																		<option value="230">畜牧、兽医科学</option>
																		<option value="240">水产学</option>
																		<option value="310">基础医学</option>
																		<option value="320">临床医学</option>
																		<option value="330">预防医学与公共卫生学</option>
																		<option value="340">军事医学与特种医学</option>
																		<option value="350">药学</option>
																		<option value="360">中医学与中药学</option>
																		<option value="410">工程与技术科学基础学科</option>
																		<option value="413">信息与系统科学相关工程与技术</option>
																		<option value="416">自然科学相关工程与技术</option>
																		<option value="420">测绘科学技术</option>
																		<option value="430">材料科学</option>
																		<option value="440">矿山工程技术</option>
																		<option value="450">冶金工程技术</option>
																		<option value="460">机械工程</option>
																		<option value="470">动力与电气工程</option>
																		<option value="480">能源科学技术</option>
																		<option value="490">核科学技术</option>
																		<option value="510">电子与通信技术</option>
																		<option value="520">计算机科学技术</option>
																		<option value="530">化学工程</option>
																		<option value="535">产品应用相关工程与技术</option>
																		<option value="540">纺织科学技术</option>
																		<option value="550">食品科学技术</option>
																		<option value="560">土木建筑工程</option>
																		<option value="570">水利工程</option>
																		<option value="580">交通运输工程</option>
																		<option value="590">航空、航天科学技术</option>
																		<option value="610">环境科学技术及资源科学技术</option>
																		<option value="620">安全科学技术</option>
																		<option value="">----</option>
																		<option value="630">管理学</option>
																		<option value="710">马克思主义</option>
																		<option value="720">哲学</option>
																		<option value="730">宗教学</option>
																		<option value="740">语言学</option>
																		<option value="750">文学</option>
																		<option value="760">艺术学</option>
																		<option value="770">历史学</option>
																		<option value="780">考古学</option>
																		<option value="790">经济学</option>
																		<option value="810">政治学</option>
																		<option value="820">法学</option>
																		<option value="830">军事学</option>
																		<option value="840">社会学</option>
																		<option value="850">民族学与文化学</option>
																		<option value="860">新闻学与传播学</option>
																		<option value="870">图书馆、情报与文献学</option>
																		<option value="880">教育学</option>
																		<option value="890">体育科学</option>
																		<option value="910">统计学</option>
																</select> <font style="color: #FF0000;"> *</font></td>
															</tr>


															<tr>
																<td width="60%"><label class="form-control ">论文集出版单位:</label>
																	<input type="text" class="form-control "
																	name="thesisSetPublisher" value=""> <font
																	style="color: #FF0000;"> *</font></td>
																<td width="40%"><label class="form-control ">发表范围:</label>
																	<select name="publishRange" class="form-control ">
																		<option value="">--请选择--</option>
																		<option value="1">国外学术期刊</option>
																		<option value="2">国内外公开发行</option>
																		<option value="3">国内公开发行</option>
																		<option value="4">港澳台刊物</option>
																</select> <font style="color: #FF0000;"> *</font></td>
															</tr>



															<tr>
																<td width="60%"><label class="form-control ">关键词:</label>
																	<input type="text" class="form-control " name="name"
																	value=""></td>
																<td width="40%"></td>
															</tr>

															<tr>
																<td width="60%"><label class="form-control ">ISSN号:</label>
																	<input type="text" class="form-control " name="issn"
																	value=""></td>
																<td width="40%"><label class="form-control ">CN号:</label>
																	<input type="text" class="form-control " name="cn"
																	value=""></td>
															</tr>
															<tr>
																<td width="60%"><label class="form-control ">DOI:</label>
																	<input type="text" class="form-control " name="doi"
																	value=""></td>
																<td width="40%"></td>
															</tr>

															<tr>
																<td width="60%"><label class="form-control ">摘要:</label>
																	<input type="text" class="form-control "
																	name="theAbstract" value=""></td>
																<td width="40%"><label class="form-control ">版面:</label>
																	<select name="appearance" class="form-control">
																		<option value="">--请选择--</option>
																		<option value="正刊">正刊</option>
																		<option value="增刊">增刊</option>
																		<option value="年刊">年刊</option>
																		<option value="专刊">专刊</option>
																</select></td>
															</tr>




															<tr>
																<td width="60%"><label class="form-control ">项目来源:</label>
																	<select name="projectSources" class="form-control "><option
																			value="">--请选择--</option>
																		<option value="03">国家社科基金单列学科项目</option>
																		<option value="04">国家社科基金项目</option>
																		<option value="05">教育部人文社科研究项目</option>
																		<option value="051">全国教育科学规划（教育部）项目</option>
																		<option value="06">国家自然科学基金项目</option>
																		<option value="07">中央其他部门社科专门项目</option>
																		<option value="08">高校古籍整理研究项目</option>
																		<option value="09">省、市、自治区社科基金项目</option>
																		<option value="10">省教育厅社科项目</option>
																		<option value="11">地、市、厅、局等政府部门项目</option>
																		<option value="12">国际合作研究项目</option>
																		<option value="13">与港、澳、台合作研究项目</option>
																		<option value="14">企事业单位委托项目</option>
																		<option value="15">外资项目</option>
																		<option value="16">学校社科项目</option>
																		<option value="99">其他研究项目</option>
																		<option value="999">无依托项目研究成果</option>
																		<option value="">--请选择--</option>
																		<option value="21">“９７３”计划</option>
																		<option value="22">国家科技支撑计划</option>
																		<option value="23">“８６３”计划</option>
																		<option value="24">国家自然科学基金项目</option>
																		<option value="25">主管部门科技项目</option>
																		<option value="26">国家科技部</option>
																		<option value="27">国家发改委</option>
																		<option value="28">国务院其他部门</option>
																		<option value="29">省、市、自治区科技项目</option>
																		<option value="30">企事业单位委托科技项目</option>
																		<option value="31">国际合作项目</option>
																		<option value="32">自选课题</option>
																		<option value="33">其他课题</option>
																		<option value="34">科技部重大专项</option></select></td>
																<td width="40%"><label class="form-control ">备注:</label>
																	<input type="text" class="form-control " name="note"
																	value=""></td>
															</tr>







															<tr>
																<td width="60%"><label class="form-control ">会议地址:</label>
																	<input type="text" class="form-control "
																	name="conferenceSite" value=""></td>
																<td width="40%"><label class="form-control ">会议日期:</label>
																	<input type="text" class="form-control "
																	name="conferenceDate" value=""></td>
															</tr>



															<tr>
																<td width="60%"><label class="form-control ">论文收录号码:</label>
																	<input type="text" class="form-control "
																	name="embodyNumber" value=""></td>
																<td width="40%"></td>
															</tr>


														</tbody>
													</table>



													<hr>





													<div class="modal-body">


														<br>
														<div class="form-group ">
															<label>第一作者:</label> <input type="text"
																name="no1AutherName" value="${awards.no1AutherName}"
																class="form-control"> <label>工号:</label> <input
																type="text" name="no1AutherNumber"
																value="${awards.no1AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第二作者:</label> <input type="text"
																name="no2AutherName" value="${awards.no2AutherName}"
																class="form-control"> <label>工号:</label> <input
																type="text" name="no2AutherNumber"
																value="${awards.no2AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第三作者:</label> <input type="text"
																name="no3AutherName" value="${awards.no3AutherName}"
																class="form-control"> <label>工号:</label> <input
																type="text" name="no3AutherNumber"
																value="${awards.no3AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第四作者:</label> <input type="text"
																name="no4AutherName" value="${awards.no4AutherName}"
																class="form-control"> <label>工号:</label> <input
																type="text" name="no4AutherNumber"
																value="${awards.no4AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第五作者:</label> <input type="text"
																name="no5AutherName" value="${awards.no5AutherName}"
																class="form-control"> <label>工号:</label> <input
																type="text" name="no5AutherNumber"
																value="${awards.no5AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第六作者:</label> <input type="text"
																name="no6AutherName" value="${awards.no6AutherName}"
																class="form-control"> <label>工号:</label> <input
																type="text" name="no6AutherNumber"
																value="${awards.no6AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第七作者:</label> <input type="text"
																name="no7AutherName" value="${awards.no7AutherName}"
																class="form-control"> <label>工号:</label> <input
																type="text" name="no7AutherNumber"
																value="${awards.no7AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第八作者:</label> <input type="text"
																name="no8AutherName" value="${awards.no8AutherName}"
																class="form-control"> <label>工号:</label> <input
																type="text" name="no8AutherNumber"
																value="${awards.no8AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第九作者:</label> <input type="text"
																name="no9AutherName" value="${awards.no9AutherName}"
																class="form-control"> <label>工号:</label> <input
																type="text" name="no9AutherNumber"
																value="${awards.no9AutherNumber}" class="form-control">
														</div>
														<div class="form-group ">
															<label>第十作者:</label> <input type="text"
																name="no10AutherName" value="${awards.no10AutherName}"
																class="form-control"> <label>工号:</label> <input
																type="text" name="no10AutherNumber"
																value="${awards.no10AutherNumber}" class="form-control">
														</div>
													</div>





													<div align="center">

														<button type="buttton" class="btn btn-primary" id="submit">确定提交</button>
														<hr>

													</div>


												</form:form>
											</div>
										</div>
									</div>
								</div>
								<iframe id="id_iframe" name="nm_iframe" style="display: none;"></iframe>
							</div>
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
	<script type="text/javascript">
		
	</script>
</body>
</html>