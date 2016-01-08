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
            <h4 class="font16">系统用户管理</h4>
            <form id="searchAdminUserForm" action="${pageContext.request.contextPath}/security/adminusers.html" method="post">
                <div class="input-group">
                    <input type="button" class="btn-blue color1 fl" value="添加系统用户" onclick="window.location.href = '${pageContext.request.contextPath}/security/adminuseradd.html'" />
                    <input type="text" name="keywords" placeholder="联系人/邮箱" class="input-sm form-control" value="${paging.keyWords}">
                    <span class="input-group-btn">
                        <button type="button" class="btn btn-sm" onclick="searchAdminUser();">
                        <i class="search-icon"></i>
                        </button>
                    </span>
                </div>
            </form>
            <table class="table table-condensed table-bordered table-hover table-view-1">
                <thead>
                    <tr>
                        <th style="padding-left: 20px;width:30%;">用户名</th>
						<th style="width:55%;">联系方式</th>
						<th>状态</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${adminusers}" var="adminuser">
                        <tr>
                            <td style="padding-left: 20px;width:30%;">${adminuser.username}</td>
                            <td>${adminuser.contactWay}</td>
                            <td>
                                <c:if test="${adminuser.enabled}">
                                    <span class="color10">在用</span>
                                </c:if>
                                <c:if test="${!adminuser.enabled}">
                                    <span class="color7">停止使用</span>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <ul class="pagination">
                <ch:numberpaging urlMapping="${pageContext.request.contextPath}/security/adminusers.html" paging="${paging}"/>
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
<script type="text/javascript">
    function searchAdminUser() {
        jQuery("#searchAdminUserForm").submit();
    }
</script>
</body>
</html>