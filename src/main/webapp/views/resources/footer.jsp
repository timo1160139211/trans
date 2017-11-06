	<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script type="text/javascript"> var BASE_PATH = '${ctx}';</script>

<!-- Javascript -->
<script src="${ctx}/views/assets/vendor/jquery/jquery.min.js"></script>
<script src="${ctx}/views/assets/vendor/bootstrap/js/bootstrap.js"></script>
<script src="${ctx}/views/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${ctx}/views/assets/vendor/jquery-confirm/jquery-confirm.min.js"></script>
<script src="${ctx}/views/assets/scripts/klorofil-common.js"></script>