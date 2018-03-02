<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!-- college更新/添加的modal -->
<!-- 包含 1 个 model{type:[create | update]} -->
<div class="modal fade" id="college-modal" tabindex="-1"
	role="dialog" data-backdrop="true" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form id="college-form" class="form-inline"
				action="${ctx}/admin/college-operate" method="post">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
							
				<div class="modal-body">
					<input type="hidden" name="id" value="${id}"/>
					<input type="hidden" name="type" value="${type}"/>
					
					<label for="name">请输入名称:</label>
					<input type="text" id="college-name" name="name">
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary"
						id="sure-to-add">确定添加</button>
				</div>
			</form>
		</div>
	</div>
</div>