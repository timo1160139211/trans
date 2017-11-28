<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>   
<div class="modal fade" id="myModal${thesis.id}" tabindex="-1" role="dialog" data-backdrop="true" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form class="form-inline" action="${ctx}/user/claim" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">任务认领</h4>
                </div>
                <div class="modal-body">
                    <h4>名称:${thesis.name}</h4><br>
                    <h4>所有作者:${thesis.allAutherName}</h4><br>
                    <div class="form-group ">
                        <label>第一作者：</label>    
                        <input type="text" name="no1AutherName" class="form-control">
                        <label>工号：</label>
                        <input type="text" name="no1AutherNumber" class="form-control">
                    </div>
                    <div class="form-group ">
                        <label>第二作者：</label>    
                        <input type="text" name="no2AutherName" class="form-control">
                        <label>工号：</label>
                        <input type="text" name="no2AutherNumber" class="form-control">
                    </div>
                    <div class="form-group ">
                        <label>第三作者：</label>    
                        <input type="text" name="no3AutherName" class="form-control">
                        <label>工号：</label>
                        <input type="text" name="no3AutherNumber" class="form-control">
                    </div>
                    <div class="form-group ">
                        <label>第四作者：</label>    
                        <input type="text" name="no4AutherName" class="form-control">
                        <label>工号：</label>
                        <input type="text" name="no4AutherNumber" class="form-control">
                    </div>
                    <div class="form-group ">
                        <label>第五作者：</label>    
                        <input type="text" name="no5AutherName" class="form-control">
                        <label>工号：</label>
                        <input type="text" name="no5AutherNumber" class="form-control">
                    </div>
                    <div class="form-group ">
                        <label>第六作者：</label>    
                        <input type="text" name="no6AutherName" class="form-control">
                        <label>工号：</label>
                        <input type="text" name="no6AutherNumber" class="form-control">
                    </div>
                    <div class="form-group ">
                        <label>第七作者：</label>    
                        <input type="text" name="no7AutherName" class="form-control">
                        <label>工号：</label>
                        <input type="text" name="no7AutherNumber" class="form-control">
                    </div>
                    <div class="form-group ">
                        <label>第八作者：</label>    
                        <input type="text" name="no8AutherName" class="form-control">
                        <label>工号：</label>
                        <input type="text" name="no8AutherNumber" class="form-control">
                    </div>
                    <div class="form-group ">
                        <label>第九作者：</label>    
                        <input type="text" name="no9AutherName" class="form-control">
                        <label>工号：</label>
                        <input type="text" name="no9AutherNumber" class="form-control">
                    </div>
                    <div class="form-group ">
                        <label>第十作者：</label>    
                        <input type="text" name="no10AutherName" class="form-control">
                        <label>工号：</label>
                        <input type="text" name="no10AutherNumber" class="form-control">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" id="Claim${thesis.id}">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>
