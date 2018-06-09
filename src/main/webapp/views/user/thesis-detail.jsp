<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="modal fade bs-example-modal-lg"
	id="thesisDetailModal${thesis.id}" tabindex="-1" role="dialog"
	data-backdrop="true" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">详细</h4>
			</div>

			<input type="hidden" name="id" value="${thesis.id}">
			<div class="modal-body">
			
			
			<c:if test="${awardsType == 'opusAward'}">
			
																<c:if test="${thesis.name != ''}">
																<div class="form-group "><label for="name"
																	class="form-control ">著作名称:<font
																	style="color: #FF0000;"> *</font></label><input type="text"
																	class="form-control " name="name" value="${thesis.name}"  readonly="true"> 
																	</div>
																</c:if>
															
																<c:if test="${thesis.no10AutherName != ''}">
																<div class="form-group "><label class="form-control ">归属单位: <font style="color: #FF0000;"> *</font></label>
																	<input type="text"
																	class="form-control " name="no10AutherName" value="${thesis.no10AutherName}"  readonly="true">
																</div></c:if>

															
																<c:if test="${thesis.publishDate != ''}">
																<div class="form-group "><label class="form-control ">出版时间:<font
																	style="color: #FF0000;"> *</font></label>
																	<input type="text"
																	class="form-control " name="publishDate" value="${thesis.publishDate}"  readonly="true">
																</div></c:if>
																<c:if test="${thesis.publishWorkunit != ''}">
																<div class="form-group "><label class="form-control ">出版单位:<font
																	style="color: #FF0000;"> *</font></label>
																	<input type="text"
																	class="form-control " name="publishWorkunit" value="${thesis.publishWorkunit}"  readonly="true">
																</div></c:if>
														


															
																<c:if test="${thesis.publishLocation != ''}">
																<div class="form-group "><label class="form-control ">出版地:<font style="color: #FF0000;"> *</font></label>
																	<input type="text"
																	class="form-control " name="publishLocation" value="${thesis.publishLocation}"  readonly="true">
																</div></c:if>
																<c:if test="${thesis.opusCategory != ''}">
																<div class="form-group "><label class="form-control ">著作类别:</label><input type="text"
																	class="form-control " name="opusCategory" value="${thesis.opusCategory}"  readonly="true">
																</div></c:if>
														
																<c:if test="${thesis.subjectType != ''}">
																<div class="form-group "><label class="form-control ">学科门类: <font style="color: #FF0000;"> *</font></label><input type="text"
																	class="form-control " name="subjectType" value="${thesis.subjectType}"  readonly="true">
																</div></c:if>

																<c:if test="${thesis.stairSubject != ''}">
																<div class="form-group "><label class="form-control ">一级学科:<font style="color: #FF0000;"> *</font></label><input type="text"
																	class="form-control " name="stairSubject" value="${thesis.stairSubject}"  readonly="true">
																</div></c:if>
														


															
																<c:if test="${thesis.schoolSign != ''}">
																<div class="form-group "><label class="form-control ">学校署名:<font style="color: #FF0000;"> *</font></label><input type="text"
																	class="form-control " name="schoolSign" value="${thesis.schoolSign}"  readonly="true">
															   </div></c:if>
																<c:if test="${thesis.translatedForeignOrNot != ''}">
																<div class="form-group "><label class="form-control ">是否翻译成外文:<font style="color: #FF0000;"> *</font></label><input type="text"
																	class="form-control " name="translatedForeignOrNot" value="${thesis.translatedForeignOrNot}"  readonly="true">
																	</div></c:if>
														
																
																<c:if test="${thesis.isbn != ''}">
																<div class="form-group "><label class="form-control ">ISBN:<font style="color: #FF0000;"> *</font></label>
																	<input type="text"
																	class="form-control " name="isbn" value="${thesis.isbn}"  readonly="true">
																</div></c:if>
																
																<c:if test="${thesis.wordsNumbers != ''}">
																<div class="form-group "><label class="form-control ">总字数(万字):
																<font style="color: #FF0000;"> *</font></label><input type="text"
																	class="form-control " name="wordsNumbers" value="${thesis.wordsNumbers}"  readonly="true">
																</div></c:if>

															
																<c:if test="${thesis.projectSources != ''}">
																<div class="form-group "><label class="form-control ">项目来源:</label><input type="text"
																	class="form-control " name="projectSources" value="${thesis.projectSources}"  readonly="true">
																</div></c:if>
			
			
			
			
			</c:if><!-- awardsType == 'opusAward' -->
			
			
			<c:if test="${awardsType == 'patent'}">
			
				
																<c:if test="${thesis.name != ''}">
																<div class="form-group "><label for="name"
																	class="form-control ">专利名称: <font
																	style="color: #FF0000;"> *</font></label>
																	<input type="text"
																	class="form-control " name="name" value="${thesis.name}"  readonly="true"></div></c:if>
															
															
															
															<c:if test="${thesis.no10AutherName != ''}">
																<div class="form-group "><label class="form-control ">归属单位:</label>
																  <font style="color: #FF0000;"> *</font><input type="text"
																	class="form-control " name="no10AutherName" value="${thesis.no10AutherName}"  readonly="true"></div></c:if>
															

															
																<c:if test="${thesis.type != ''}">
																<div class="form-group "><label class="form-control ">专利类型:
																		 <font style="color: #FF0000;"> *</font></label><input type="text"
																	class="form-control " name="type" value="${thesis.type}" readonly="true"></div></c:if>
																<c:if test="${thesis.inCountry != ''}">
																<div class="form-group "><label class="form-control ">专利范围:
																	<font style="color: #FF0000;"> *</font></label><input type="text"
																	class="form-control " name="inCountry" value="${thesis.inCountry}"  readonly="true"></div></c:if>
															


															
																<c:if test="${thesis.pctPatentApplicationNumber != ''}">
																<div class="form-group "><label class="form-control ">申请号:<font style="color: #FF0000;"> *</font></label>
																	<input type="text"
																	class="form-control " name=pctPatentApplicationNumber value="${thesis.pctPatentApplicationNumber}" id="awardName" readonly="true"></div></c:if>
																<c:if test="${thesis.pctPatentApplicationDate != ''}">
																<div class="form-group "><label class="form-control ">申请时间:<font	style="color: #FF0000;"> *</font></label>
																	<input type="text"
																	class="form-control " name="pctPatentApplicationDate" value="${thesis.pctPatentApplicationDate}"  readonly="true"></div></c:if>
															


															
																<c:if test="${thesis.authorizationNumber != ''}">
																<div class="form-group "><label class="form-control ">授权号:</label>
																	<input type="text"
																	class="form-control " name="authorizationNumber" value="${thesis.authorizationNumber}"  readonly="true"></div></c:if>
																<c:if test="${thesis.authorizationDate != ''}">
																<div class="form-group "><label class="form-control ">授权时间:</label>
																	<input type="text"
																	class="form-control " name="authorizationDate" value="${thesis.authorizationDate}"  readonly="true"></div></c:if>
															
															
			
			
			
			
			
			</c:if><!-- awardsType == 'patent' -->
			
			
				<c:if test="${awardsType == 'achievementAward'}">
																<c:if test="${thesis.awardName != ''}">
																<div class="form-group "><label for="awardName"
																	class="form-control ">奖励名称:<font style="color: #FF0000;"> *</font></label> <input type="text"
																	class="form-control " name="awardName" value="${thesis.awardName}" id="awardName" readonly="true"></div></c:if>
																	
																<c:if test="${thesis.achievementName != ''}">
																<div class="form-group "><label for="achievementName"
																	class="form-control ">成果名称:<font style="color: #FF0000;"> *</font></label> <input type="text"
																	class="form-control " name="achievementName" value="${thesis.achievementName}" id="achievementName" readonly="true"></div></c:if>

																<c:if test="${thesis.no10AutherName != ''}">
																<div class="form-group "><label class="form-control ">归属单位:<font style="color: #FF0000;"> *</font></label>
																	<input type="text"
																	class="form-control " name="no10AutherName" value="${thesis.no10AutherName}" readonly="true">
																	</div></c:if>
																<c:if test="${thesis.licenseIssuingAgencies != ''}">
																<div class="form-group "><label class="form-control ">发证机关:</label>
																	<input type="text" class="form-control " name="licenseIssuingAgencies"
																	value="${thesis.licenseIssuingAgencies}" readonly="true"></div></c:if>

																<c:if test="${thesis.awardDate != ''}">
																<div class="form-group "><label class="form-control ">获奖日期:<font style="color: #FF0000;"> *</font></label>
																	<input type="text" id="awardDate"  readonly="true"  class="form-control "
																	name="awardDate" value="${thesis.awardDate}"></div></c:if>
																<c:if test="${thesis.finishedWorkunit != ''}">
																<div class="form-group "><label class="form-control ">完成单位:</label>
																	<input type="text" class="form-control " readonly="true" 
																	name="finishedWorkunit" value="${thesis.finishedWorkunit}"></div></c:if>
															
																<c:if test="${thesis.awardRange != ''}">
																<div class="form-group "><label class="form-control ">获奖范围级别:<font style="color: #FF0000;"> *</font></label>
																<input type="text" class="form-control " readonly="true" 
																	name="awardRange" value="${thesis.awardRange}">
																		</div></c:if>
																<c:if test="${thesis.awardGrade != ''}">
																<div class="form-group "><label class="form-control ">获奖等级:</label>
																<input type="text" class="form-control " readonly="true" 
																	name="awardGrade" value="${thesis.awardGrade}">
																</div></c:if>

																<c:if test="${thesis.awardGrantNo != ''}">
																<div class="form-group "><label class="form-control ">奖励批准号:</label>
																<input type="text" class="form-control " readonly="true" 
																	name="awardGrantNo" value="${thesis.awardGrantNo}">
																	</div></c:if>

																<c:if test="${thesis.subjectCategory != ''}">
																<div class="form-group "><label class="form-control ">学科门类:</label>
																<input type="text" class="form-control " readonly="true" 
																	name="subjectCategory" value="${thesis.subjectCategory}">
																</div></c:if>
																<c:if test="${thesis.note != ''}">
																<div class="form-group "><label class="form-control ">一级学科:</label>
																<input type="text" class="form-control " readonly="true" 
																	name="note" value="${thesis.note}">
																		</div></c:if>


																<c:if test="${thesis.workunitNumber != ''}">
																<div class="form-group "><label class="form-control ">总参加单位数:</label>
																<input type="text" class="form-control " readonly="true" 
																	name="workunitNumber" value="${thesis.workunitNumber}">
																	 </div></c:if>
																<c:if test="${thesis.workunitRank != ''}">
																<div class="form-group "><label class="form-control ">单位排名:</label>
																<input type="text" class="form-control " readonly="true" 
																	name="workunitRank" value="${thesis.workunitRank}">
																</div></c:if>


																<c:if test="${thesis.awardType != ''}">
																<div class="form-group "><label class="form-control ">奖励类型(选填):</label>
																<input type="text" class="form-control " readonly="true" 
																	name="awardType" value="${thesis.awardType}">
																		</div></c:if>
																<c:if test="${thesis.awardForm != ''}">
																<div class="form-group "><label class="form-control ">成果形式:</label>
																<input type="text" class="form-control " readonly="true" 
																	name="awardForm" value="${thesis.awardForm}">
																	</div></c:if>
	

																<c:if test="${thesis.projectSources != ''}">
																<div class="form-group "><label class="form-control ">项目来源:</label>
																<input type="text" class="form-control " readonly="true" 
																	name="projectSources" value="${thesis.projectSources}">
																</div></c:if>
						
						
				</c:if><!-- awardsType == achievementAward -->
				<c:if test="${awardsType == 'thesis'}">
				
				<div class="form-group ">
					<label>论文题目:<font style="color: #FF0000;"> *</font></label> <input
						type="text" class="form-control " name="name" readonly="true"
						value="${thesis.name}" id="name" size="40" maxlength="512">
				</div>
				<div class="form-group ">
					<label>发表时间:<font style="color: #FF0000;"> *</font></label> <input type="text"
						id="publishDate" readonly="true" class="form-control "
						name="publishDate" value="${thesis.publishDate}">
				</div>
				<div class="form-group ">
					<label>发表刊物/论文集:<font style="color: #FF0000;"> *</font></label> <input type="text"
						class="form-control " name="publishMagazineThesisSet" readonly="true"
						value="${thesis.publishMagazineThesisSet}">
				</div>
				<div class="form-group ">
					<label>论文类型:<font style="color: #FF0000;"> *</font></label> <input type="text" readonly="true"
						class="form-control " name="type" value="${thesis.type}">
				</div>
				<div class="form-group ">
					<label>刊物类型:<font style="color: #FF0000;"> *</font></label> <input type="text"
						id="magazineType" readonly="true" class="form-control "
						name="magazineType" value="${thesis.magazineType}">
				</div>
				<div class="form-group ">
					<label>归属单位:<font style="color: #FF0000;"> *</font></label> <input type="text" readonly="true"
						class="form-control " name="workunit" value="${thesis.workunit}">

				</div>

				<div class="form-group ">
					<label>学科门类:<font style="color: #FF0000;"> *</font></label> <input type="text" readonly="true"
						class="form-control " name="publishMagazineThesisSet"
						value="${thesis.subjectType}">
				</div>
				<div class="form-group ">

					<label>一级学科:<font style="color: #FF0000;"> *</font></label> <input type="text" readonly="true"
						class="form-control " name="stairSubject"
						value="${thesis.stairSubject}">
				</div>
				<div class="form-group ">
					<label>论文集出版单位:<font style="color: #FF0000;"> *</font></label> <input type="text" readonly="true"
						class="form-control " name="thesisSetPublisher"
						value="${thesis.thesisSetPublisher}">
				</div>
				<div class="form-group ">

					<label>发表范围:<font style="color: #FF0000;"> *</font></label> <input type="text" readonly="true"
						class="form-control " name="publishRange"
						value="${thesis.publishRange}">
				</div>


				<c:if test="${thesis.keyWords != ''}">
					<div class="form-group ">
						<label>关键词:</label> <input type="text" readonly="true"
							class="form-control " name="keyWords" value="${thesis.keyWords}">
					</div>
				</c:if>


				<c:if test="${thesis.issn != ''}">
					<div class="form-group ">
						<label>ISSN号:</label> <input type="text" readonly="true"
							class="form-control " name="issn" value="${thesis.issn}">
					</div>
				</c:if>
				<c:if test="${thesis.cn != ''}">
					<div class="form-group ">
						<label>CN号:</label> <input type="text" readonly="true"
							class="form-control " name="cn" value="${thesis.cn}">
					</div>
				</c:if>
				<c:if test="${thesis.doi != ''}">
					<div class="form-group ">
						<label>DOI:</label> <input type="text" readonly="true"
							class="form-control " name="doi" value="${thesis.doi}">
					</div>
				</c:if>


				<c:if test="${thesis.theAbstract != ''}">
					<div class="form-group ">
						<label>摘要:</label> <input type="text" readonly="true"
							class="form-control " name="theAbstract"
							value="${thesis.theAbstract}">
					</div>
				</c:if>
				<c:if test="${thesis.appearance != ''}">
					<div class="form-group ">
						<label>版面:</label> <input type="text" readonly="true"
							class="form-control " name="appearance"
							value="${thesis.appearance}">
					</div>
				</c:if>


				<c:if test="${thesis.projectSources != ''}">
					<div class="form-group ">
						<label>项目来源:</label> <input type="text" readonly="true"
							class="form-control " name="projectSources"
							value="${thesis.projectSources}">
					</div>
				</c:if>

				<c:if test="${thesis.conferenceSite != ''}">
					<div class="form-group ">
						<label>会议地址:</label> <input type="text" readonly="true"
							class="form-control " name="conferenceSite"
							value="${thesis.conferenceSite}">
					</div>
				</c:if>
				<c:if test="${thesis.conferenceDate != ''}">
					<div class="form-group ">
						<label>会议日期:</label> <input type="text" readonly="true"
							class="form-control " name="conferenceDate"
							value="${thesis.conferenceDate}">
					</div>
				</c:if>


				<c:if test="${thesis.embodyNumber != ''}">
					<div class="form-group ">
						<label>论文收录号码:</label> <input type="text" readonly="true"
							class="form-control " name="embodyNumber"
							value="${thesis.embodyNumber}">
					</div>
				</c:if>
				<c:if test="${thesis.conferenceName != ''}">
					<div class="form-group ">
						<label>会议名称:</label> <input type="text" readonly="true"
							class="form-control " name="conferenceName"
							value="${thesis.conferenceName}">
					</div>
				</c:if>

				<div class="form-group ">
					<label>通讯作者：<font style="color: #FF0000;"> *</font></label> <input id="communicateAutherName" type="text"
						name="communicateAutherName"
						value="${thesis.communicateAutherName}" readonly="true"
						class="form-control"> <label>工号：<font style="color: #FF0000;"> *</font></label> <input
						id="no10AutherNumber" type="text" name="no10AutherNumber"
						value="${thesis.no10AutherNumber}" readonly="true"
						class="form-control">
				</div>

				
				
				</c:if><!-- awardsType == thesis -->
				
				
				
				
				
				<div class="form-group ">
					<label>第一作者：<font style="color: #FF0000;"> *</font></label> <input id="no1AutherName" type="text"
						name="no1AutherName" value="${thesis.no1AutherName}"
						readonly="true" class="form-control"> <label>工号：<font style="color: #FF0000;"> *</font></label> <input
						id="no1AutherNumber" type="text" name="no1AutherNumber"
						value="${thesis.no1AutherNumber}" readonly="true"
						class="form-control">
				</div>
				<c:if test="${thesis.no2AutherName != ''}">
					<div class="form-group ">
						<label>第二作者：<font style="color: #FF0000;"> *</font></label> <input id="no2AutherName" type="text"
							name="no2AutherName" value="${thesis.no2AutherName}"
							readonly="true" class="form-control"> <label>工号：<font style="color: #FF0000;"> *</font></label>
						<input id="no2AutherNumber" type="text" name="no2AutherNumber"
							value="${thesis.no2AutherNumber}" readonly="true"
							class="form-control">
					</div>
				</c:if>
				<c:if test="${thesis.no3AutherName != ''}">
					<div class="form-group ">
						<label>第三作者：<font style="color: #FF0000;"> *</font></label> <input id="no3AutherName" type="text"
							name="no3AutherName" value="${thesis.no3AutherName}"
							readonly="true" class="form-control"> <label>工号：<font style="color: #FF0000;"> *</font></label>
						<input id="no3AutherNumber" type="text" name="no3AutherNumber"
							value="${thesis.no3AutherNumber}" readonly="true"
							class="form-control">
					</div>
				</c:if>
				<c:if test="${thesis.no4AutherName != ''}">
					<div class="form-group ">
						<label>第四作者：<font style="color: #FF0000;"> *</font></label> <input id="no4AutherName" type="text"
							name="no4AutherName" value="${thesis.no4AutherName}"
							readonly="true" class="form-control"> <label>工号：<font style="color: #FF0000;"> *</font></label>
						<input id="no4AutherNumber" type="text" name="no4AutherNumber"
							value="${thesis.no4AutherNumber}" readonly="true"
							class="form-control">
					</div>
				</c:if>
				<c:if test="${thesis.no5AutherName != ''}">
					<div class="form-group ">
						<label>第五作者：<font style="color: #FF0000;"> *</font></label> <input id="no5AutherName" type="text"
							name="no5AutherName" value="${thesis.no5AutherName}"
							readonly="true" class="form-control"> <label>工号：<font style="color: #FF0000;"> *</font></label>
						<input id="no5AutherNumber" type="text" name="no5AutherNumber"
							value="${thesis.no5AutherNumber}" readonly="true"
							class="form-control">
					</div>
				</c:if>
				<c:if test="${thesis.no6AutherName != ''}">
					<div class="form-group ">
						<label>第六作者：<font style="color: #FF0000;"> *</font></label> <input id="no6AutherName" type="text"
							name="no6AutherName" value="${thesis.no6AutherName}"
							readonly="true" class="form-control"> <label>工号：<font style="color: #FF0000;"> *</font></label>
						<input id="no6AutherNumber" type="text" name="no6AutherNumber"
							value="${thesis.no6AutherNumber}" readonly="true"
							class="form-control">
					</div>
				</c:if>
				<c:if test="${thesis.no7AutherName != ''}">
					<div class="form-group ">
						<label>第七作者：<font style="color: #FF0000;"> *</font></label> <input id="no7AutherName" type="text"
							name="no7AutherName" value="${thesis.no7AutherName}"
							readonly="true" class="form-control"> <label>工号：<font style="color: #FF0000;"> *</font></label>
						<input id="no7AutherNumber" type="text" name="no7AutherNumber"
							value="${thesis.no7AutherNumber}" readonly="true"
							class="form-control">
					</div>
				</c:if>
				<c:if test="${thesis.no8AutherName != ''}">
					<div class="form-group ">
						<label>第八作者：<font style="color: #FF0000;"> *</font></label> <input id="no8AutherName" type="text"
							name="no8AutherName" value="${thesis.no8AutherName}"
							readonly="true" class="form-control"> <label>工号：<font style="color: #FF0000;"> *</font></label>
						<input id="no8AutherNumber" type="text" name="no8AutherNumber"
							value="${thesis.no8AutherNumber}" readonly="true"
							class="form-control">
					</div>
				</c:if>
				<c:if test="${thesis.no9AutherName != ''}">
					<div class="form-group ">
						<label>通讯作者2：<font style="color: #FF0000;"> *</font></label> <input id="no9AutherName" type="text"
							name="no9AutherName" value="${thesis.no9AutherName}"
							readonly="true" class="form-control"> <label>工号：<font style="color: #FF0000;"> *</font></label>
						<input id="no9AutherNumber" type="text" name="no9AutherNumber"
							value="${thesis.no9AutherNumber}" readonly="true"
							class="form-control">
					</div>
				</c:if>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
			</div>
		</div>
	</div>
</div>