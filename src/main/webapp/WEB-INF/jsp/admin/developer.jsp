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
            <h4 class="font16">开发者管理</h4>
            <form id="searchDeveloperForm" action="${pageContext.request.contextPath}/security/admindeveloper.html" method="post">
                <div class="input-group">
                    <input id="name" type="text" name="name" placeholder="用户名" class="input-sm form-control" value="${paging.name}">
                    <span class="input-group-btn">
                        <button type="button" class="btn btn-sm" onclick="searchDevelpoerUser();">
                        <i class="search-icon"></i>
                        </button>
                    </span>
                </div>
            </form>
            <table class="table table-condensed table-bordered table-hover table-view-1">
                <thead>
                    <tr>
                        <th style="text-align: center;width:15%">用户名</th>
                        <th style="text-align: center;width:35%">联系方式</th>
                        <th style="text-align: center;width:15%">状态</th>
                        <th style="text-align: center;width:15%">激活</th>
                        <th style="text-align: center;width:20%">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${users}" var="user">
                        <tr>
                            <td style="text-align: center;width:15%">${user.username}</td>
                            <td style="text-align: center;width:35%">${user.contactWay}</td>
                            <td id="user_status_${user.id}" style="text-align: center;width:15%">
                                <c:if test="${user.enabled}"><span class="color10">在用</span></c:if>
                                <c:if test="${!user.enabled}"><span class="color7">停止使用</span></c:if>
                            </td>
                            <td style="text-align: center;width:15%">
                                <c:if test="${user.active}"><span class="color10">已激活</span></c:if>
                                <c:if test="${!user.active}"><span class="color7">未激活</span></c:if>
                            </td>
                            <td id="user_option_${user.id}" style="text-align: center;width:20%">
                                <c:if test="${user.enabled && user.active}">
                                    <input type="button" class="btn-blue-sm color1" value="停止使用" onclick="changeDeveloperStatus(${user.id}, false);"/>
                                </c:if>
                                <c:if test="${!user.enabled && user.active}">
                                    <input type="button" class="btn-blue-sm color1" value="重新使用" onclick="changeDeveloperStatus(${user.id}, true);"/>
                                </c:if>
                                <c:if test="${!user.active}">
                                    <input type="button" class="btn-disabled-sm" value="等待激活" />
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <ul class="pagination">
                <ch:numberpaging urlMapping="${pageContext.request.contextPath}/security/admindeveloper.html" paging="${paging}"/>
            </ul>
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
<script src="${pageContext.request.contextPath}/dwr/engine.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/dwr/util.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/dwr/interface/SystemDWRHandler.js" type="text/javascript"></script>
<script type="text/javascript">
    function searchDevelpoerUser() {
        jQuery("#searchDeveloperForm").submit();
    }

    function changeDeveloperStatus(developerId,currentStatus) {
        SystemDWRHandler.updateDeveloperStatus(developerId, currentStatus, function() {
            var userStatusAction = jQuery("#user_status_" + developerId);
            var userOptionAction = jQuery("#user_option_" + developerId);
            if (currentStatus) {
                userStatusAction.html("<span class=\"color10\">在用</span>");
                userOptionAction.html("<input type=\"button\" class=\"btn-blue-sm color1\" value=\"停止使用\" onclick=\"changeDeveloperStatus(" + developerId + ", false);\"/>");
            }
            else {
                userStatusAction.html("<span class=\"color7\">停止使用</span>");
                userOptionAction.html("<input type=\"button\" class=\"btn-blue-sm color1\" value=\"重新使用\" onclick=\"changeDeveloperStatus(" + developerId + ", true);\"/>");
            }
        });
    }
</script>
</body>
</html>