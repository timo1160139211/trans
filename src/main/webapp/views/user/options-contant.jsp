<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div class="modal fade" id="myModal${awards.id}" tabindex="-1"
	role="dialog" data-backdrop="true" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form:form commandName="awards" class="form-inline"
				action="${ctx}/user/claim" method="post">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">任务认领</h4>
				</div>

				<input type="hidden" name="id" value="${awards.id}">
				<input type="hidden" name="name" value="${awards.name}">
				<input type="hidden" name="awardsType" value="${awardsType}">

				<div class="modal-body">
					<h3>名称:</h3>
					<p>${awards.name}</p>
					<br>
					<h4>所有作者:</h4>
					<p>${awards.allAutherName}</p>
					<br>
					<c:if test="${awardsType == 'chPeriodicalThesis'}">
						<h4>作者单位:</h4>
						<p>${awards.mechanism == '' ? '':awards.mechanism}</p>
						<br>
					</c:if>
					<c:if test="${autherNum >= 1}">
						<div class="form-group ">
							<label>第一作者：</label> <input id="no1AutherName" type="text"
								name="no1AutherName" value="${awards.no1AutherName}"
								class="form-control"> <label>工号：</label> <input
								id="no1AutherNumber" type="text" name="no1AutherNumber"
								value="${awards.no1AutherNumber}" class="form-control">
						</div>
					</c:if>
					<c:if test="${autherNum >= 2}">
						<div class="form-group ">
							<label>第二作者：</label> <input id="no2AutherName" type="text"
								name="no2AutherName" value="${awards.no2AutherName}"
								class="form-control"> <label>工号：</label> <input
								id="no2AutherNumber" type="text" name="no2AutherNumber"
								value="${awards.no2AutherNumber}" class="form-control">
						</div>
					</c:if>
					<c:if test="${autherNum >= 3}">
						<div class="form-group ">
							<label>第三作者：</label> <input id="no3AutherName" type="text"
								name="no3AutherName" value="${awards.no3AutherName}"
								class="form-control"> <label>工号：</label> <input
								id="no3AutherNumber" type="text" name="no3AutherNumber"
								value="${awards.no3AutherNumber}" class="form-control">
						</div>
					</c:if>
					<c:if test="${autherNum >= 4}">
						<div class="form-group ">
							<label>第四作者：</label> <input id="no4AutherName" type="text"
								name="no4AutherName" value="${awards.no4AutherName}"
								class="form-control"> <label>工号：</label> <input
								id="no4AutherNumber" type="text" name="no4AutherNumber"
								value="${awards.no4AutherNumber}" class="form-control">
						</div>
					</c:if>
					<c:if test="${autherNum >= 5}">
						<div class="form-group ">
							<label>第五作者：</label> <input id="no5AutherName" type="text"
								name="no5AutherName" value="${awards.no5AutherName}"
								class="form-control"> <label>工号：</label> <input
								id="no5AutherNumber" type="text" name="no5AutherNumber"
								value="${awards.no5AutherNumber}" class="form-control">
						</div>
					</c:if>
					<c:if test="${autherNum >= 6}">
						<div class="form-group ">
							<label>第六作者：</label> <input id="no6AutherName" type="text"
								name="no6AutherName" value="${awards.no6AutherName}"
								class="form-control"> <label>工号：</label> <input
								id="no6AutherNumber" type="text" name="no6AutherNumber"
								value="${awards.no6AutherNumber}" class="form-control">
						</div>
					</c:if>
					<c:if test="${autherNum >= 7}">
						<div class="form-group ">
							<label>第七作者：</label> <input id="no7AutherName" type="text"
								name="no7AutherName" value="${awards.no7AutherName}"
								class="form-control"> <label>工号：</label> <input
								id="no7AutherNumber" type="text" name="no7AutherNumber"
								value="${awards.no7AutherNumber}" class="form-control">
						</div>
					</c:if>
					<c:if test="${autherNum >= 8}">
						<div class="form-group ">
							<label>第八作者：</label> <input id="no8AutherName" type="text"
								name="no8AutherName" value="${awards.no8AutherName}"
								class="form-control"> <label>工号：</label> <input
								id="no8AutherNumber" type="text" name="no8AutherNumber"
								value="${awards.no8AutherNumber}" class="form-control">
						</div>
					</c:if>
					<c:if test="${autherNum >= 9}">
						<div class="form-group ">
							<label>第九作者：</label> <input id="no9AutherName" type="text"
								name="no9AutherName" value="${awards.no9AutherName}"
								class="form-control"> <label>工号：</label> <input
								id="no9AutherNumber" type="text" name="no9AutherNumber"
								value="${awards.no9AutherNumber}" class="form-control">
						</div>
					</c:if>
					<c:if test="${autherNum >= 10}">
						<div class="form-group ">
							<label>超出第9将不计入</label>
						</div>
					</c:if>
					<div class="form-group">
						<label>成果归属学院:</label> <select name="no10AutherName" 
							class="form-control">
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
							<option value="国防教育学院">国防教育学院</option>
							<option value="鲁泰纺织服装学院">鲁泰纺织服装学院</option>
							<option value="创新创业学院">创新创业学院</option>
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<label>姓名为中文,工号请只保留'数字''学生'或'校外人员'.</label>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary"
						id="Claim${awards.id}">确定认领</button>
				</div>
			</form:form>
		</div>
	</div>
</div>