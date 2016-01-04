<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 15-12-25
  Time: 下午1:16
  To change this template use File | Settings | File Templates.
--%>
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

<div class="back-con">
    <jsp:include page="/WEB-INF/jsp/admin/adminmenu.jsp"/>
    <div class="back-con-r fl">
        <div class="leftTab-content active" id="bs-tabcon1">
            <h4 class="font16">我的应用</h4>
            <ul class="nav nav-tabs">
                <li <c:if test="${paging.appStatus == ''}">class="active"</c:if>><a href="javascript:void(0);" onclick="searchAppsByStatus('');">全部</a></li>
                <li <c:if test="${paging.appStatus == 'CREATED'}">class="active"</c:if>><a href="javascript:void(0);" onclick="searchAppsByStatus('CREATED');">新创建</a></li>
                <li <c:if test="${paging.appStatus == 'WAITING'}">class="active"</c:if>><a href="javascript:void(0);" onclick="searchAppsByStatus('WAITING');">待审核</a></li>
                <li <c:if test="${paging.appStatus == 'REJECTED'}">class="active"</c:if>><a href="javascript:void(0);" onclick="searchAppsByStatus('REJECTED');">拒绝通过</a></li>
                <li <c:if test="${paging.appStatus == 'PASSED'}">class="active"</c:if>><a href="javascript:void(0);" onclick="searchAppsByStatus('PASSED');">待上架</a></li>
                <li <c:if test="${paging.appStatus == 'SHELVES'}">class="active"</c:if>><a href="javascript:void(0);" onclick="searchAppsByStatus('SHELVES');">已上架</a></li>
                <li <c:if test="${paging.appStatus == 'OFFSHELVES'}">class="active"</c:if>><a href="javascript:void(0);" onclick="searchAppsByStatus('OFFSHELVES');">已下架</a></li>
            </ul>
            <div class="tab-content">
                <div id="tab1">
                    <form id="searchAppsForm" action="${pageContext.request.contextPath}/security/adminappmanage.html" method="post">
                        <div class="input-group">
                            <input id="appStatus" name="appStatus" type="hidden" value="${paging.appStatus}"/>
                            <input type="text" name="appName" placeholder="应用名称" class="input-sm form-control">
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
                                <th style="padding-left: 20px;width: 25%">应用图标/名称</th>
                                <th style="width: 40%">类别/介绍</th>
                                <th style="width: 15%">状态</th>
                                <th style="width: 20%">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${apps}" var = "app">
                                <tr>
                                    <td style="padding: 20px;">
                                        <img src="${fileRequestHost}upload/${app.appKey}/${app.iconActualFileName}" width="96" height="96" class="fl" />
                                        <div class="fl" style="margin-left: 13px;margin-top: 10px;">
                                            <h4>${app.appName}</h4>
                                            <p class="font12 color9">版本${app.appVersion}</p>
                                        </div>
                                    </td>
                                    <td>
                                        <h5>${app.appName}</h5>
                                        <p class="font12">${app.appDescription}</p>
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
                                        <a class="btn-blue color1" href="${pageContext.request.contextPath}/security/adminappoperate.html?appId=${app.id}">查看</a>
                                        <a class="btn-blue color1" href="${pageContext.request.contextPath}/security/apphistory.html?appId=${app.id}">历史</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <ul class="pagination">
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">6</a></li>
                        <li><a href="#">7</a></li>
                        <li><a href="#">8</a></li>
                        <li><a href="#">...</a></li>
                        <li><a href="#">18</a></li>
                        <li><a href="#">下一页</a></li>
                        <li>
                            <label>跳转到</label>
                            <input type="text" class="input-page" />
                        </li>
                        <li><a href="#">Go</a></li>
                    </ul>
                </div>
                <div id="tab2"></div>
                <div id="tab3"></div>
                <div id="tab4"></div>
                <div id="tab5"></div>
                <div id="tab6"></div>
                <div id="tab7"></div>
            </div>
        </div>
    </div>
</div>
<%--结尾菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<script src="${pageContext.request.contextPath}/javascript/jquery.js"></script>
<script type="text/javascript">
    function searchAppsByStatus(searchStatus) {
        jQuery("#appStatus").val(searchStatus);
        jQuery("#searchAppsForm").submit();
    }

    function searchApps() {
        jQuery("#searchAppsForm").submit();
    }
</script>
</body>
</html>