<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="modal fade bs-example-modal-lg" id="thesisDetailModal${thesis.id}" tabindex="-1"
	role="dialog" data-backdrop="true" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">论文详细</h4>
				</div>

				<input type="hidden" name="id" value="${thesis.id}">

				<div class="modal-body">
					<table>
						<tbody>
							<tr>
								<td width="60%"><label for="name" class="form-control ">论文题目:</label>
									<input type="text" class="form-control " name="name"
									readonly="true" value="${thesis.name}" id="name" size="40"
									maxlength="512"></td>
							</tr>
							<tr>
								<td width="60%"><label class="form-control ">发表时间:</label>
									<input type="text" id="publishDate" readonly="true"
									class="form-control " name="publishDate" value="${thesis.publishDate}">
									<font style="color: #FF0000;"> *</font></td>
								<td width="40%"><label class="form-control ">发表刊物/论文集:</label>
									<input type="text" class="form-control "
									name="publishMagazineThesisSet" value="${thesis.publishMagazineThesisSet}"></td>
							</tr>
							<tr>
								<td width="60%"><label class="form-control ">论文类型:</label>
									<input type="text" class="form-control " name="type"
									value="${thesis.type}"></td>
								<td width="40%"><label class="form-control ">刊物类型:</label>

									<input type="text" id="magazineType" readonly="true"
									class="form-control " name="magazineType"
									value="${thesis.magazineType}"></td>
							</tr>

							<tr>
								<td width="60%"><label class="form-control ">归属单位:</label>
									<input type="text" class="form-control " name="workunit"
									value="${thesis.workunit}"></td>
								<td width="40%"></td>
							</tr>

							<tr>
								<td width="60%"><label class="form-control ">学科门类:</label>
									<input type="text" class="form-control "
									name="publishMagazineThesisSet" value="${thesis.subjectType}">
								</td>

								<td width="40%"><label class="form-control ">一级学科:</label>

									<input type="text" class="form-control " name="stairSubject"
									value="${thesis.stairSubject}"></td>
							</tr>


							<tr>
								<td width="60%"><label class="form-control ">论文集出版单位:</label>
									<input type="text" class="form-control "
									name="thesisSetPublisher" value="${thesis.thesisSetPublisher}">
								</td>
								<td width="40%"><label class="form-control ">发表范围:</label>
									<input type="text" class="form-control " name="publishRange"
									value="${thesis.publishRange}"></td>
							</tr>


							<tr>
								<td width="60%"><label class="form-control ">关键词:</label> <input
									type="text" class="form-control " name="keyWords"
									value="${thesis.keyWords}"></td>
								<td width="40%"></td>
							</tr>

							<tr>
								<td width="60%"><label class="form-control ">ISSN号:</label>
									<input type="text" class="form-control " name="issn"
									value="${thesis.issn}"></td>
								<td width="40%"><label class="form-control ">CN号:</label> <input
									type="text" class="form-control " name="cn"
									value="${thesis.cn}"></td>
							</tr>
							<tr>
								<td width="60%"><label class="form-control ">DOI:</label> <input
									type="text" class="form-control " name="doi"
									value="${thesis.doi}"></td>
								<td width="40%"></td>
							</tr>

							<tr>
								<td width="60%"><label class="form-control ">摘要:</label> <input
									type="text" class="form-control " name="theAbstract"
									value="${thesis.theAbstract}"></td>
								<td width="40%"><label class="form-control ">版面:</label> <input
									type="text" class="form-control " name="appearance"
									value="${thesis.appearance}"></td>
							</tr>


							<tr>
								<td width="60%"><label class="form-control ">项目来源:</label>

									<input type="text" class="form-control " name="projectSources"
									value="${thesis.projectSources}"></td>
								<td width="40%"><label class="form-control ">备注:</label> <input
									type="text" class="form-control " name="note"
									value="${thesis.note}"></td>
							</tr>


							<tr>
								<td width="60%"><label class="form-control ">会议地址:</label>
									<input type="text" class="form-control " name="conferenceSite"
									value="${thesis.conferenceSite}"></td>
								<td width="40%"><label class="form-control ">会议日期:</label>
									<input type="text" class="form-control " name="conferenceDate"
									value="${thesis.conferenceDate}"></td>
							</tr>


							<tr>
							
							<c:if test="${thesis.embodyNumber != ''}">
								<td width="60%"><label class="form-control ">论文收录号码:</label>
									<input type="text" class="form-control " name="embodyNumber"
									value="${thesis.embodyNumber}"></td>
							</c:if>
									
								<td width="40%"><label class="form-control ">会议名称:</label>
									<input type="text" class="form-control " name="conferenceName"
									value="${thesis.conferenceName}"></td>
							</tr>


						</tbody>
					</table>
						<div class="form-group ">
							<label>通讯作者：</label> <input id="communicateAutherName" type="text"
								name="communicateAutherName" value="${thesis.communicateAutherName}" readonly="true"
								class="form-control"> <label>工号：</label> <input
								id="no10AutherNumber" type="text" name="no10AutherNumber"
								value="${thesis.no10AutherNumber}" readonly="true" class="form-control">
						</div>
							<div class="form-group ">
								<label>第一作者：</label> <input id="no1AutherName" type="text"
									name="no1AutherName" value="${thesis.no1AutherName}" readonly="true"
									class="form-control"> <label>工号：</label> <input
									id="no1AutherNumber" type="text" name="no1AutherNumber"
									value="${thesis.no1AutherNumber}" readonly="true" class="form-control">
							</div>
					<c:if test="${thesis.no2AutherName != ''}">
						<div class="form-group ">
							<label>第二作者：</label> <input id="no2AutherName" type="text"
								name="no2AutherName" value="${thesis.no2AutherName}" readonly="true"
								class="form-control"> <label>工号：</label> <input
								id="no2AutherNumber" type="text" name="no2AutherNumber"
								value="${thesis.no2AutherNumber}" readonly="true" class="form-control">
						</div>
					</c:if>
					<c:if test="${thesis.no3AutherName != ''}">
						<div class="form-group ">
							<label>第三作者：</label> <input id="no3AutherName" type="text"
								name="no3AutherName" value="${thesis.no3AutherName}" readonly="true"
								class="form-control"> <label>工号：</label> <input
								id="no3AutherNumber" type="text" name="no3AutherNumber"
								value="${thesis.no3AutherNumber}" readonly="true" class="form-control">
						</div>
					</c:if>
					<c:if test="${thesis.no4AutherName != ''}">
						<div class="form-group ">
							<label>第四作者：</label> <input id="no4AutherName" type="text"
								name="no4AutherName" value="${thesis.no4AutherName}" readonly="true"
								class="form-control"> <label>工号：</label> <input
								id="no4AutherNumber" type="text" name="no4AutherNumber"
								value="${thesis.no4AutherNumber}" readonly="true" class="form-control">
						</div>
					</c:if>
					<c:if test="${thesis.no5AutherName != ''}">
						<div class="form-group ">
							<label>第五作者：</label> <input id="no5AutherName" type="text"
								name="no5AutherName" value="${thesis.no5AutherName}" readonly="true"
								class="form-control"> <label>工号：</label> <input
								id="no5AutherNumber" type="text" name="no5AutherNumber"
								value="${thesis.no5AutherNumber}" readonly="true" class="form-control">
						</div>
					</c:if>
					<c:if test="${thesis.no6AutherName != ''}">
						<div class="form-group ">
							<label>第六作者：</label> <input id="no6AutherName" type="text"
								name="no6AutherName" value="${thesis.no6AutherName}" readonly="true"
								class="form-control"> <label>工号：</label> <input
								id="no6AutherNumber" type="text" name="no6AutherNumber"
								value="${thesis.no6AutherNumber}" readonly="true" class="form-control">
						</div>
					</c:if>
					<c:if test="${thesis.no7AutherName != ''}">
						<div class="form-group ">
							<label>第七作者：</label> <input id="no7AutherName" type="text"
								name="no7AutherName" value="${thesis.no7AutherName}" readonly="true"
								class="form-control"> <label>工号：</label> <input
								id="no7AutherNumber" type="text" name="no7AutherNumber"
								value="${thesis.no7AutherNumber}" readonly="true" class="form-control">
						</div>
					</c:if>
					<c:if test="${thesis.no8AutherName != ''}">
					<div class="form-group ">
						<label>第八作者：</label> <input id="no8AutherName" type="text"
							name="no8AutherName" value="${thesis.no8AutherName}" readonly="true"
							class="form-control"> <label>工号：</label> <input
							id="no8AutherNumber" type="text" name="no8AutherNumber"
							value="${thesis.no8AutherNumber}" readonly="true" class="form-control">
					</div>
					</c:if>
					<c:if test="${thesis.no9AutherName != ''}">
					<div class="form-group ">
						<label>第九作者：</label> <input id="no9AutherName" type="text"
							name="no9AutherName" value="${thesis.no9AutherName}" readonly="true"
							class="form-control"> <label>工号：</label> <input
							id="no9AutherNumber" type="text" name="no9AutherNumber"
							value="${thesis.no9AutherNumber}" readonly="true" class="form-control">
					</div>
					</c:if>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
				</div>
		</div>
	</div>
</div>