<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/header.jsp" />

<%--正文部分**************************************************************--%>
<div class="back-con">
    <jsp:include page="/WEB-INF/jsp/admin/adminmenu.jsp"/>
    <div class="back-con-r fl">
        <div class="leftTab-content active" id="bs-tabcon1">
            <c:choose>
                <c:when test="${message == 0}">
                    <h4 class="font16">个人信息<span style="font-size: 80%;color:red;">&nbsp;&nbsp;(修改失败!)</span></h4>
                </c:when>
                <c:when test="${message == 1}">
                    <h4 class="font16">个人信息<span style="font-size: 80%;color:red;">&nbsp;&nbsp;(修改成功!)</span></h4>
                </c:when>
                <c:otherwise>
                    <h4 class="font16">个人信息</h4>
                </c:otherwise>
            </c:choose>
        </div>
        <form class="form-horizontal">
            <div class="form-body">
                <div class="form-group">
                    <label for=" " class="col-sm-3 control-label">权限</label>
                    <div class="col-sm-9">
                        <input class="form-control" value="系统管理员" readonly="true"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="" class="col-sm-3 control-label">用户名</label>
                    <div class="col-sm-9">
                        <input value="${user.username}" class="form-control" readonly="true"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="" class="col-sm-3 control-label">联系方式</label>
                    <div class="col-sm-9">
                        <input value="${user.contactWay}" class="form-control" readonly="true"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">&nbsp;</label>
                    <div class="col-sm-9">
                        <input type="button" class="btn-blue color1" value="修改个人信息" onclick="window.location.href = '${pageContext.request.contextPath}/security/adminuserinfochange.html'"/>
                        <input type="button" class="btn-blue color1" value="修改个人密码" onclick="window.location.href = '${pageContext.request.contextPath}/security/adminuserpwdchange.html'"/>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</div>
</body>
</html>