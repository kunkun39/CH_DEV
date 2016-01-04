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
	<title>广电应用接入平台</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/backstage.css">
</head>

<body>

<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/header.jsp"/>

<%--内容部分***********************************************************--%>

<div class="back-con">

    <jsp:include page="/WEB-INF/jsp/client/clientmenu.jsp"/>

    <div class="back-con-r fl">
        <div class="leftTab-content active">
            <h4 class="font16">我的应用</h4>
            <ul class="nav nav-tabs">
                <li <c:if test="${paging.appStatus == 'ALL'}">class="active"</c:if>><a href="javascript:void(0);" onclick="resetStatus('ALL')">全部</a></li>
                <li <c:if test="${paging.appStatus == 'WAITING'}">class="active"</c:if>><a href="javascript:void(0);" onclick="resetStatus('WAITING')">待审核</a></li>
                <li <c:if test="${paging.appStatus == 'REJECTED'}">class="active"</c:if>><a href="javascript:void(0);" onclick="resetStatus('REJECTED')">拒绝通过</a></li>
                <li <c:if test="${paging.appStatus == 'PASSED'}">class="active"</c:if>><a href="javascript:void(0);" onclick="resetStatus('PASSED')">待上架</a></li>
                <li <c:if test="${paging.appStatus == 'SHELVES'}">class="active"</c:if>><a href="javascript:void(0);" onclick="resetStatus('SHELVES')">已上架</a></li>
                <li <c:if test="${paging.appStatus == 'OFFSHELVES'}">class="active"</c:if>><a href="javascript:void(0);" onclick="resetStatus('OFFSHELVES')">已下架</a></li>
            </ul>
            <div class="tab-content">
                <div id="tab1">
                    <br/><a href="${pageContext.request.contextPath}/security/appfirststep.html">
                        <input type="button" class="btn-blue color1" value="添加应用"/>
                    </a>
                    <form id="client_app_search" action="${pageContext.request.contextPath}/security/clientappoverview.html" method="post">
                        <div class="input-group">
                            <input id="appStatus" name="appStatus" type="hidden" value="${paging.appStatus}"/>
                            <input id="appName" name="appName" type="text" placeholder="应用名称" class="input-sm form-control"/>
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-sm" onclick="searchClientApp();">
                                    <i class="search-icon"></i>
                                </button>
                            </span>
                        </div>
                    </form>
                    <table class="table table-condensed table-bordered table-hover">
                        <thead>
                            <tr>
                                <th style="padding-left: 20px;width: 25%">应用图标/名称</th>
                                <th style="width: 40%">类别/介绍</th>
                                <th style="width: 15%">状态</th>
                                <th style="width: 20%">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${apps}" var="app">
                            <tr>
                                <td style="padding: 20px;">
                                    <img width="70" height="70" alt="" class="fl" src="${fileRequestHost}upload/${app.appKey}/${app.iconActualFileName}"/>
                                    <div class="fl" style="margin-left: 13px;margin-top: 10px;">
                                        <h5>${app.appName}</h5>
                                        <p class="font12 color9">版本${app.appVersion}</p>
                                    </div>
                                </td>
                                <td>
                                    <h5>${app.fullCategoryName}</h5>
                                    <p class="font12 color9">${app.appDescription}</p>
                                </td>
                                <td>${app.appStatusName}</td>
                                <td>
                                    <c:if test="${app.appStatus == 'REJECTED'}">
                                        <a class="btn-blue color4" href="${pageContext.request.contextPath}/security/appfirststep.html?appId=${app.id}">查看</a>
                                    </c:if>
                                    <c:if test="${app.appStatus != 'REJECTED'}">
                                        <a class="btn-blue color4" href="${pageContext.request.contextPath}/security/appsecondstep.html?appId=${app.id}">查看</a>
                                    </c:if>
                                    <a class="btn-blue color10" href="${pageContext.request.contextPath}/security/apphistory.html?appId=${app.id}">历史</a>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <ul class="pagination">
                        <ch:paging urlMapping="${pageContext.request.contextPath}/security/clientappoverview.html" paging="${paging}"/>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<%--Javascript部分***********************************************************--%>
<script src="${pageContext.request.contextPath}/javascript/jquery.js"></script>
<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/javascript/vendor/html5.min.js"></script>
<script src="${pageContext.request.contextPath}/javascript/vendor/respond.min.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/javascript/vendor/tab.js"></script>

<script type="text/javascript">
    function resetStatus(appStatus) {
        jQuery("#appStatus").val(appStatus);
        searchClientApp()
    }

    function searchClientApp() {
        jQuery("#client_app_search").submit();
    }

</script>

</body>
</html>
