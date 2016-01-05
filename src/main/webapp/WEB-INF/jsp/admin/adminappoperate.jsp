<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html class="activity-no">
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nav.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/backstage.css">
    <title>开发者应用接入平台后台管理</title>
</head>
<body>
<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/header.jsp" />

<%--正文部分**************************************************************--%>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            应用审核
        </div>

        <%--引用appsteptitle***********************************************************--%>
        <jsp:include page="/WEB-INF/jsp/common/appsteptitle.jsp"/>
        <form id="appForm" class="form-horizontal" action="${pageContext.request.contextPath}/security/adminappoverview.html" method="get">
            <div class="form-body">
                <input id="appStatus" name="current" type="hidden" value="${paging.appStatus}"/>
                <input id="appStatus" name="appStatus" type="hidden" value="${paging.appStatus}"/>
                <input id="appStatus" name="appName" type="hidden" value="${paging.appStatus}"/>
                <jsp:include page="/WEB-INF/jsp/common/appinfo.jsp"/>

                <div class="form-group">
                    <label class="col-sm-3 control-label">&nbsp;</label>
                    <div class="col-sm-9">
                        <a href="${pageContext.request.contextPath}/security/adminappoverview.html">
                            <input type="button" class="btn-blue color1" value="返  回" />
                        </a>
                        <c:choose>
                            <c:when test="${marketApp.appStatus == 'WAITING'}">
                                <input type="button" class="btn-blue color1" value="拒绝通过" onclick="adminAppStatusChange(${marketApp.id}, 'REJECTED');"/>
                                <input type="button" class="btn-blue color1" value="审核通过" onclick="adminAppStatusChange(${marketApp.id}, 'PASSED');"/>
                            </c:when>
                            <c:when test="${marketApp.appStatus == 'PASSED'}">
                                <input type="button" class="btn-blue color1" value="上  架" onclick="adminAppStatusChange(${marketApp.id}, 'SHELVES');"/>
                            </c:when>
                            <c:when test="${marketApp.appStatus == 'SHELVES'}">
                                <input type="button" class="btn-blue color1" value="下  架" onclick="adminAppStatusChange(${marketApp.id}, 'OFFSHELVES');"/>
                            </c:when>
                            <c:when test="${marketApp.appStatus == 'OFFSHELVES'}">
                                <input type="button" class="btn-blue color1" value="重新上架" onclick="adminAppStatusChange(${marketApp.id}, 'SHELVES');"/>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<%--结尾菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<script src="${pageContext.request.contextPath}/javascript/jquery.js"></script>
<script type="text/javascript">
    function adminAppStatusChange(appId, appStatus) {
        window.location.href='${pageContext.request.contextPath}/security/adminappstatuschange.html?appId=' + appId + '&appStatus=' + appStatus;
    }
</script>
</body>
</html>