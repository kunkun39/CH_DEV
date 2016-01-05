<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html class="activity-no">
<head>
    <title>开发者应用接入平台登录</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!--<link type="image/x-icon" rel="shortcut icon" href="images/favicon.ico">-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/backstage.css">

    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/javascript/vendor/html5.min.js"></script>
    <script src="${pageContext.request.contextPath}/javascript/vendor/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<%--开头菜单部分***********************************************************--%>
<jsp:include page="/WEB-INF/decorators/header.jsp"/>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            登录
        </div>
        <form class="form-horizontal" id="contactForm" action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
            <div class="form-body">
                <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">邮箱</label>

                    <div class="col-sm-10">
                        <input type="text"  name="j_username" class="form-control" required="required" id="inputName" placeholder="请输入邮箱">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 control-label">密码</label>

                    <div class="col-sm-10">
                        <input type="password" name="j_password" class="form-control" required="required" id="inputPassword" placeholder="请输入密码">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">&nbsp;</label>

                    <div class="col-sm-10">
                        <input type="button" class="btn-yellow color1"  value="注册"  onclick="registerClient();"/>
                        <input type="submit" class="btn-blue color1" value="登录"/>
                        <br/>
                        <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
                            <label style="color: red; padding-left: 10px;">对不起, 用户名或者密码不正确!</label>
                        </c:if>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">&nbsp;</label>

                    <div class="col-sm-10">
                        <a href="#" class="color4">忘记密码？</a>
                    </div>
                </div>

            </div>
        </form>

    </div>
</div>

<%--结尾菜单部分***********************************************************--%>
<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<%--Javascript部分***********************************************************--%>

<script type="text/javascript">
    function registerClient() {
        window.location.href = "${pageContext.request.contextPath}/chapp/register.html";
    }
</script>
</body>

</html>