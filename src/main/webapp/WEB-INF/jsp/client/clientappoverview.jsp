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
    <jsp:include page="/WEB-INF/decorators/cssheader.jsp" />

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
                    <form id="client_app_search" action="${pageContext.request.contextPath}/security/clientappoverview.html" method="post">
                        <div class="input-group">
                            <input type="button" onclick="window.location.href='${pageContext.request.contextPath}/security/appfirststep.html'" class="btn-blue color1 fl" value="添加应用"/>
                            <input id="appStatus" name="appStatus" type="hidden" value="${paging.appStatus}"/>
                            <input style="margin-left: 5px;" id="appName" name="appName" type="text" placeholder="应用名称" value="${paging.appName}" class="input-sm form-control"/>
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
                                <th style="padding-left: 20px;width: 30%">应用图标/名称</th>
                                <th style="width: 35%">类别/介绍</th>
                                <th style="width: 15%">状态</th>
                                <th style="width: 20%">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${apps}" var="app">
                            <tr>
                                <td style="padding: 20px;">
                                    <img width="70" height="70" alt="" class="fl" src="${fileRequestHost}/${app.appKey}/${app.iconActualFileName}"/>
                                    <div class="fl" style="margin-left: 13px;margin-top: 3px;">
                                        <h5>
                                            <ch:substring value="${app.appName}" length="6" needUnEscapes="true"/>
                                        </h5>
                                        <p class="font12 color9">
                                            <ch:substring value="版本${app.appVersion}" length="12"/>
                                        </p>
                                    </div>
                                </td>
                                <td>
                                    <h5>${app.fullCategoryName}</h5>
                                    <p class="font12 color9">
                                        <ch:substring value="${app.appDescription}" length="60" needUnEscapes="true"/>
                                    </p>
                                </td>
                                <%--<td>${app.appStatusName}</td>--%>
                                <td>
                                        <c:if test="${app.appStatus == 'CREATED'}">新创建</c:if>
                                        <c:if test="${app.appStatus == 'WAITING'}">待审核</c:if>
                                        <c:if test="${app.appStatus == 'PASSED'}">审核通过</c:if>
                                        <c:if test="${app.appStatus == 'REJECTED'}"><span class="color7">拒绝通过</span></c:if>
                                        <c:if test="${app.appStatus == 'SHELVES'}">已上架</c:if>
                                        <c:if test="${app.appStatus == 'OFFSHELVES'}">已下架</c:if>
                                </td>
                                <td>
                                    <c:if test="${app.appStatus == 'REJECTED'}">
                                        <a class="btn-blue color1" onclick="window.location.href='${pageContext.request.contextPath}/security/appfirststep.html?appId=${app.id}&current=${paging.currentPageNumber}&appName=${paging.appName}&appStatus=${paging.appStatus}'">查看</a>
                                    </c:if>
                                    <c:if test="${app.appStatus != 'REJECTED'}">
                                        <a class="btn-blue color1" onclick="window.location.href='${pageContext.request.contextPath}/security/appsecondstep.html?appId=${app.id}&current=${paging.currentPageNumber}&appName=${paging.appName}&appStatus=${paging.appStatus}'">查看</a>
                                    </c:if>
                                    <a class="btn-blue color1"  onclick="window.location.href='${pageContext.request.contextPath}/security/apphistory.html?appId=${app.id}&current=${paging.currentPageNumber}&appName=${paging.appName}&appStatus=${paging.appStatus}'">历史</a>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <div class="pagcontrol" style="text-align:center;">
                        <ul class="pagination">
                            <ch:numberpaging urlMapping="${pageContext.request.contextPath}/security/clientappoverview.html" paging="${paging}" maxPageNumber="7"/>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<%--Javascript部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/jsheader.jsp"/>

<script type="text/javascript">

    function addNewApp() {
        window.location.href = "${pageContext.request.contextPath}/security/appfirststep.html";
    }

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
