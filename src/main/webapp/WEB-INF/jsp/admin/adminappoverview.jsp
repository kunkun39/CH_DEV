<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="ch" uri="http://www.chanhong.com" %>
<!DOCTYPE html>
<!--[if IE 8 ]>
<html class="ie8"> <![endif]-->
<!--[if IE 9 ]>
<html class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html class="activity-no">
<!--<![endif]-->
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

<div class="back-con">

    <jsp:include page="/WEB-INF/jsp/admin/adminmenu.jsp"/>

    <div class="back-con-r fl">
        <div class="leftTab-content active" id="bs-tabcon1">
            <h4 class="font16">开发者应用</h4>
            <ul class="nav nav-tabs">
                <li <c:if test="${paging.appStatus == ''}">class="active"</c:if>><a href="javascript:void(0);" onclick="searchAppsByStatus('');">全部</a></li>
                <li <c:if test="${paging.appStatus == 'WAITING'}">class="active"</c:if>><a href="javascript:void(0);" onclick="searchAppsByStatus('WAITING');">待审核</a></li>
                <li <c:if test="${paging.appStatus == 'REJECTED'}">class="active"</c:if>><a href="javascript:void(0);" onclick="searchAppsByStatus('REJECTED');">拒绝通过</a></li>
                <li <c:if test="${paging.appStatus == 'PASSED'}">class="active"</c:if>><a href="javascript:void(0);" onclick="searchAppsByStatus('PASSED');">待上架</a></li>
                <li <c:if test="${paging.appStatus == 'SHELVES'}">class="active"</c:if>><a href="javascript:void(0);" onclick="searchAppsByStatus('SHELVES');">已上架</a></li>
                <li <c:if test="${paging.appStatus == 'OFFSHELVES'}">class="active"</c:if>><a href="javascript:void(0);" onclick="searchAppsByStatus('OFFSHELVES');">已下架</a></li>
            </ul>
            <div class="tab-content">
                <div id="tab1">
                    <form id="searchAppsForm" action="${pageContext.request.contextPath}/security/adminappoverview.html" method="post">
                        <div class="input-group">
                            <input id="appStatus" name="appStatus" type="hidden" value="${paging.appStatus}"/>
                            <input type="text" name="appName" placeholder="应用名称" class="input-sm form-control" value="${paging.appName}">
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-sm" onclick="searchApps();">
                                <i class="search-icon"></i>
                                </button>
                            </span>
                        </div>
                    </form>
                    <table class="table table-condensed table-bordered table-hover table-view-1">
                        <thead>
                            <tr>
                                <th style="padding-left: 20px;width: 30%">应用图标/名称</th>
                                <th style="width: 35%">类别/介绍</th>
                                <th style="width: 15%">状态</th>
                                <th style="width: 20%">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${apps}" var = "app">
                                <tr>
                                    <td style="padding: 20px;">
                                        <img src="${fileRequestHost}/${app.appKey}/${app.iconActualFileName}" width="70" height="70" class="fl" />
                                        <div class="fl" style="margin-left: 13px;margin-top: 3px;">
                                            <h5>
                                                <ch:substring value="${app.appName}" length="6"/>
                                            </h5>
                                            <p class="font12 color9">
                                                <ch:substring value="版本${app.appVersion}" length="12"/>
                                            </p>
                                        </div>
                                    </td>
                                    <td>
                                        <h5>${app.fullCategoryName}</h5>
                                        <p class="font12 color9">
                                            <ch:substring value="${app.appDescription}" length="60"/>
                                        </p>
                                    </td>
                                    <td>
                                        <c:if test="${app.appStatus == 'CREATED'}">新创建</c:if>
                                        <c:if test="${app.appStatus == 'WAITING'}">待审核</c:if>
                                        <c:if test="${app.appStatus == 'PASSED'}">审核通过</c:if>
                                        <c:if test="${app.appStatus == 'REJECTED'}"><span class="color7">拒绝通过</span></c:if>
                                        <c:if test="${app.appStatus == 'SHELVES'}">已上架</c:if>
                                        <c:if test="${app.appStatus == 'OFFSHELVES'}">已下架</c:if>
                                    </td>
                                    <td>
                                        <a class="btn-blue color1" onclick="appDetails(${app.id});">查看</a>
                                        <a class="btn-blue color1" onclick="appHistory(${app.id});">历史</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <form id="appDetailsForm" action="${pageContext.request.contextPath}/security/adminappoperate.html" method="post">
                                <input id="detail_current" name="current" type="hidden" value="${paging.currentPageNumber}"/>
                                <input id="detail_AppStatus" name="appStatus" type="hidden" value="${paging.appStatus}"/>
                                <input id="detail_appName" name="appName" type="hidden" value="${paging.appName}"/>
                                <input id="detail_appId" name="appId" type="hidden" value=""/>
                            </form>
                            <form id="appHistoryForm" action="${pageContext.request.contextPath}/security/apphistory.html" method="post">
                                <input id="history_current" name="current" type="hidden" value="${paging.currentPageNumber}"/>
                                <input id="history_detailAppStatus" name="appStatus" type="hidden" value="${paging.appStatus}"/>
                                <input id="history_appName" name="appName" type="hidden" value="${paging.appName}"/>
                                <input id="history_appId" name="appId" type="hidden" value=""/>
                            </form>
                        </tbody>
                    </table>
                    <ul class="pagination">
                        <ch:numberpaging urlMapping="${pageContext.request.contextPath}/security/adminappoverview.html" paging="${paging}"/>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<%--结尾菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<script src="${pageContext.request.contextPath}/javascript/jquery.js"></script>
<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/javascript/vendor/html5.min.js"></script>
<script src="${pageContext.request.contextPath}/javascript/vendor/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
    function searchAppsByStatus(searchStatus) {
        jQuery("#appStatus").val(searchStatus);
        jQuery("#searchAppsForm").submit();
    }

    function searchApps() {
        jQuery("#searchAppsForm").submit();
    }

    function appDetails(appId) {
        jQuery("#detail_appId").val(appId);
        jQuery("#appDetailsForm").submit();
    }

    function appHistory(appId) {
        jQuery("#history_appId").val(appId);
        jQuery("#appHistoryForm").submit();
    }
</script>
</body>
</html>