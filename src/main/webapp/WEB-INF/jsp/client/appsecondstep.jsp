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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/backstage.css">
</head>

<body>

<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/header.jsp"/>

<%--内容部分***********************************************************--%>

<div class="container">
    <%--有权限访问***********************************************************--%>
    <c:if test="${allowSee}">
        <div class="panel panel-default">
            <div class="panel-heading">
                应用信息上传
            </div>

            <%--步骤的头***********************************************************--%>

            <jsp:include page="/WEB-INF/jsp/client/appsteptitle.jsp"/>

            <form class="form-horizontal">
                <div class="form-body">
                <div class="form-group">
                    <label for="" class="col-sm-3 control-label">应用类别</label>
                    <div class="col-sm-9">
                        <c:forEach items="${categories}" var="category">
                        <c:forEach items="${category.children}" var="child">
                            <c:if test="${child.id == marketApp.categoryId}">
                                <input class="form-control" value="${category.categoryName}-> ${child.categoryName}" readonly="true"/>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                    </div>
                </div>

                <div class="form-group">
                    <label for=" " class="col-sm-3 control-label">应用名称</label>
                    <div class="col-sm-9">
                        <input value="${marketApp.appName}" class="form-control" readonly="true"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for=" " class="col-sm-3 control-label">应用包名</label>
                    <div class="col-sm-9">
                        <input value="${marketApp.appPackage}" class="form-control" readonly="true"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for=" " class="col-sm-3 control-label">应用版本（数字）</label>
                    <div class="col-sm-9">
                        <input value="${marketApp.appVersionInt}" class="form-control" readonly="true"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for=" " class="col-sm-3 control-label">应用版本（字符）</label>
                    <div class="col-sm-9">
                        <input value="${marketApp.appVersion}" class="form-control" readonly="true"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for=" " class="col-sm-3 control-label">应用大小(M)</label>
                    <div class="col-sm-9">
                        <input value="${marketApp.appSizeFormat}" class="form-control" readonly="true"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="" class="col-sm-3 control-label">应用图标</label>
                    <div class="col-sm-9">
                        <img width="70" height="70" alt="" src="${fileRequestHost}upload/${marketApp.appKey}/${marketApp.iconActualFileName}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="" class="col-sm-3 control-label">应用海报</label>
                    <div class="col-sm-9">
                         <img width="500" height="260" alt="" src="${fileRequestHost}upload/${marketApp.appKey}/${marketApp.posterActualFileName}"/>
                    </div>
                </div>

                <%--<div class="form-group">--%>
                    <%--<label for="" class="col-sm-3 control-label">上传应用程序文件</label>--%>
                    <%--<div class="col-sm-9">--%>
                        <%--<input type="file" id="appApkUploadFile" name="appApkUploadFile" required="required" style="width: 320px" onchange="validateApkFile(this)"/>--%>
                        <%--<span class="help-block color6">请编辑应用APK文件</span>--%>
                        <%--<span id="apk_error_show" class="help-block color5" style="display: none;"></span>--%>
                    <%--</div>--%>
                <%--</div>--%>

                <div class="form-group">
                    <label for=" " class="col-sm-3 control-label">应用描述</label>
                    <div class="col-sm-9">
                        <textarea rows="8" cols="69" readonly="true">${marketApp.appDescription}</textarea>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">&nbsp;</label>
                    <div class="col-sm-9">
                        <a href="${pageContext.request.contextPath}/security/clientappoverview.html"><input type="button" class="btn-blue color1" value="返  回" /></a>
                        <c:choose>
                            <c:when test="${marketApp.appStatus == 'WAITING'}">
                                <a href="${pageContext.request.contextPath}/security/appfirststep.html?appId=${marketApp.id}"><input type="button" class="btn-blue color1" value="修 改" /></a>
                            </c:when>
                            <c:when test="${marketApp.appStatus == 'SHELVES'}">
                                <a href="${pageContext.request.contextPath}/security/appfirststep.html?appId=${marketApp.id}"><input type="button" class="btn-blue color1" value="更 新" /></a>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </form>
        </div>
    </c:if>

    <c:if test="${!allowSee}">
        <div class="panel panel-default">
            <div class="panel-heading">
                页面禁止访问
            </div>
            <div class="panel-con-email row">
                <div class="col-sm-4 text-right">
                    <span class="reg-icon wrong-icon"></span>
                </div>
                <div class="col-sm-8">
                    <p class="font16" style="margin: 10px 0 0;">感谢使用开发者应用接入平台，你没有权限访问该页面</p>
                    <p style="margin:0 0 28px;color: #999;">可能你的会话已经超时或者你还未登陆系统</p>
                    <a href="${pageContext.request.contextPath}/chapp/index.html"><input type="button" class="btn-blue color1" value="返  回" /></a>
                </div>
            </div>
        </div>
    </c:if>
</div>

<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<%--Javascript部分***********************************************************--%>
<script src="${pageContext.request.contextPath}/javascript/jquery.min.js"></script>
<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/javascript/vendor/html5.min.js"></script>
<script src="${pageContext.request.contextPath}/javascript/vendor/respond.min.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/javascript/vendor/tab.js"></script>

</body>
</html>
