<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring-form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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

<div class="container">
    <%--有权限访问***********************************************************--%>
    <div class="panel panel-default">
        <div class="panel-heading">
            应用信息上传
        </div>

        <%--步骤的头***********************************************************--%>

        <jsp:include page="/WEB-INF/jsp/common/appsteptitle.jsp"/>

        <form class="form-horizontal">
            <div class="form-body">

            <jsp:include page="/WEB-INF/jsp/common/appinfo.jsp"/>

            <div class="form-group">
                <label class="col-sm-3 control-label">&nbsp;</label>
                <div class="col-sm-9">
                    <input type="button" class="btn-blue color1" value="返  回" onclick="window.location.href = '${pageContext.request.contextPath}/security/clientappoverview.html?current=${current}&appName=${appName}&appStatus=${appStatus}'" />
                    <c:choose>
                        <c:when test="${marketApp.appStatus == 'WAITING'}">
                            <input type="button" class="btn-blue color1" value="修 改" onclick="window.location.href = '${pageContext.request.contextPath}/security/appfirststep.html?appId=${marketApp.id}'" />
                        </c:when>
                        <c:when test="${marketApp.appStatus == 'SHELVES'}">
                            <input type="button" class="btn-blue color1" value="更 新" onclick="window.location.href = '${pageContext.request.contextPath}/security/appfirststep.html?appId=${marketApp.id}'" />
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </form>
    </div>
</div>

<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

</body>
</html>
