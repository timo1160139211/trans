<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>   
<div class="modal fade" id="myModal${thesis.id}" tabindex="-1" role="dialog" data-backdrop="true" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form action="${ctx}/user/claim" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">任务认领</h4>
                </div>
                <div class="modal-body">
                    <h3>名称:${thesis.name}</h3><br>
                    <h3>认领人:${currentUser.name}</h3><br>
                    <input type="text" class="form-control" name="id" value="${thesis.id}" id="sdutNum" style="display: none;">
                    <label for="sdutNum">山理工职工人数</label>
                    <input type="text" class="form-control" name="sdutNumber" id="sdutNum" >
                    <label for="myNo">你是第几作者</label>
                    <input type="text" class="form-control" name="no" id="myNo" >
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" id="Claim${thesis.id}">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>
