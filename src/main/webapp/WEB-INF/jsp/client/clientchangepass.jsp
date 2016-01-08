<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring-form" uri="http://www.springframework.org/tags/form" %>

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
                <h4 class="font16 ">用户修改密码</h4>

                <c:if test="${change == 1}">
                    <div class="panel-con text-center">
                        <div class="reg-icon success-icon"></div>
                            <h3>密码修改成功!</h3>
                    </div>
                </c:if>
                <c:if test="${change == 0}">
                    <spring-form:form commandName="userPassword" class="form-horizontal" name="basic_validate" id="basic_validate" novalidate="novalidate">
                        <div class="form-body">

                                <div class="form-group">
                                    <input type="hidden" name="userId" value="${userPassword.userId}"/>
                                </div>

                                <div class="form-group">
                                    <label style="width:140px;" for=" " class="col-sm-3 control-label">用户名</label>
                                    <div class="ol-sm-9">
                                        <spring-form:input path="username" class="form-control" type="text" name="required" id="required" value="${userPassword.username}" readonly="true"
                                                   maxlength="20"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label style="width:140px;" for=" " class="col-sm-3 control-label">旧密码</label>
                                    <div class="ol-sm-9">
                                        <spring-form:input path="oldPassword" class="form-control" type="password" name="oldPassword" id="oldPassword" value=""
                                                   maxlength="20" placeholder="必填"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label style="width:140px;" for=" " class="col-sm-3 control-label">新密码</label>
                                    <div class="ol-sm-9">
                                        <spring-form:input path="newPassword" class="form-control" type="password" name="newPassword" id="newPassword" value=""
                                                   maxlength="20" placeholder="必填"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label style="width:140px;" for=" " class="col-sm-3 control-label">再次输入新密码</label>
                                    <div class="ol-sm-9">
                                         <spring-form:input path="newPasswordAgain" class="form-control" type="password" name="newPasswordAgain" id="newPasswordAgain" value=""
                                                   maxlength="20" placeholder="必填"/>
                                    </div>
                                     <label class="col-sm-3 control-label">&nbsp;</label>
                                     <div class="ol-sm-9">
                                        <spring-form:errors path="newPasswordAgain" class="help-block color5"/>
                                      </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">&nbsp;</label>

                                    <div class="ol-sm-9">
                                        <input type="button" class="btn-blue color1" value="返  回" onclick="window.location.href='${pageContext.request.contextPath}/client/clientmenu.jsp'"/>
                                        <input type="submit" class="btn-blue color1" value="保  存" />
                                    </div>
                                </div>
                        </div>

                    </spring-form:form>
                </c:if>
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

</body>
</html>
