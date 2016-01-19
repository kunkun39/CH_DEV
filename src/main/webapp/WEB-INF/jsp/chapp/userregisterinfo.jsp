<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring-form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html class="activity-no">
<head>
    <title>开发者应用接入平台注册</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <jsp:include page="/WEB-INF/decorators/cssheader.jsp"/>
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/javascript/vendor/html5.min.js"></script>
    <script src="${pageContext.request.contextPath}/javascript/vendor/respond.min.js"></script>
    <![endif]-->

    <style type="text/css">
        .panel-registerinfo {
            width: 400px;
            margin: 0 auto;
            padding: 170px 0;
        }
    </style>
</head>

<body>
<%--开头菜单部分***********************************************************--%>
<jsp:include page="/WEB-INF/decorators/header.jsp"/>

<%--中间内容部分***********************************************************--%>
<div class="container reg-content">
    <div class="panel panel-default">
        <div class="panel-heading">
           提示
        </div>
        <c:choose>
            <c:when test="${INFO_KEY == 'EXCEPTION_REGISTER'}">
                <div class="panel-con-email row">
                    <div class="col-sm-4 text-right">
                        <span class="reg-icon wrong-icon"></span>
                    </div>
                    <div class="col-sm-8">
                        <p class="font16" style="margin: 10px 0 0;">该邮件激活已失效！</p>

                        <p style="margin:0 0 28px;color: #999;">请重新操作！</p>
                        <button class="btn-blue color1 text-center" onclick="toResendRegisterMail()">重新发送</button>
                    </div>
                </div>
            </c:when>
            <c:when test="${INFO_KEY == 'OK'}">
                <div class="panel-con-email row">
                    <div class="col-sm-4 text-right">
                        <span class="reg-icon success-icon"></span>
                    </div>
                    <div class="col-sm-8">
                        <p class="font16" style="margin: 10px 0 0;">账号验证成功!</p>

                        <p style="margin:0 0 28px;color: #999;">恭喜您的账号已验证成功！</p>
                        <button class="btn-blue color1 text-center" onclick="toLoginPage()">去登录</button>
                    </div>
                </div>
            </c:when>
            <c:when test="${INFO_KEY == 'OUTTIME_REGISTER'}">
                <div class="panel-con-email row">
                    <div class="col-sm-4 text-right">
                        <span class="reg-icon wrong-icon"></span>
                    </div>
                    <div class="col-sm-8">
                        <p class="font16" style="margin: 10px 0 0;">该邮件激活已超时失效！</p>

                        <p style="margin:0 0 28px;color: #999;">请重新操作！</p>
                        <button class="btn-blue color1 text-center" onclick="toResendRegisterMail()">重新发送</button>
                    </div>
                </div>
            </c:when>
            <c:when test="${INFO_KEY == 'USED_REGISTER'}">
                <div class="panel-con-email row">
                    <div class="col-sm-4 text-right">
                        <span class="reg-icon wrong-icon"></span>
                    </div>
                    <div class="col-sm-8">
                        <p class="font16" style="margin: 10px 0 0;">该邮件激活已被使用！</p>

                        <p style="margin:0 0 28px;color: #999;">请检查是否已注册成功或尝试重新注册！</p>
                        <button class="btn-blue color1 text-center" onclick="toLoginPage()">去登录</button>
                    </div>
                </div>
            </c:when>
            <c:when test="${INFO_KEY == 'EXCEPTION_PWD_BACK'}">
                <div class="panel-con-email row">
                    <div class="col-sm-4 text-right">
                        <span class="reg-icon wrong-icon"></span>
                    </div>
                    <div class="col-sm-8">
                        <p class="font16" style="margin: 10px 0 0;">该邮件激活已失效！</p>

                        <p style="margin:0 0 28px;color: #999;">请重新操作！</p>
                        <button class="btn-blue color1 text-center" onclick="toResendPwdBackMail()">重新发送</button>
                    </div>
                </div>
            </c:when>
            <c:when test="${INFO_KEY == 'OUTTIME_PWD_BACK'}">
                <div class="panel-con-email row">
                    <div class="col-sm-4 text-right">
                        <span class="reg-icon wrong-icon"></span>
                    </div>
                    <div class="col-sm-8">
                        <p class="font16" style="margin: 10px 0 0;">该邮件激活已超时失效！</p>

                        <p style="margin:0 0 28px;color: #999;">请重新操作！</p>
                        <button class="btn-blue color1 text-center" onclick="toResendPwdBackMail()">重新发送</button>
                    </div>
                </div>
            </c:when>
            <c:when test="${INFO_KEY == 'USED_PWD_BACK'}">
                <div class="panel-con-email row">
                    <div class="col-sm-4 text-right">
                        <span class="reg-icon wrong-icon"></span>
                    </div>
                    <div class="col-sm-8">
                        <p class="font16" style="margin: 10px 0 0;">该邮件激活已被使用！</p>

                        <p style="margin:0 0 28px;color: #999;">请检查是否已成功找回密码或尝试重新找回！</p>
                        <button class="btn-blue color1 text-center" onclick="toLoginPage()">去登录</button>
                    </div>
                </div>
            </c:when>

            <c:when test="${INFO_KEY == 'OK_PWD_BACK'}">
                <div class="panel-con-email row">
                    <div class="col-sm-4 text-right">
                        <span class="reg-icon success-icon"></span>
                    </div>
                    <div class="col-sm-8">
                        <p class="font16" style="margin: 10px 0 0;">密码修改成功!</p>

                        <p style="margin:0 0 28px;color: #999;">恭喜您的密码已修改成功！</p>
                        <button class="btn-blue color1 text-center" onclick="toLoginPage()">去登录</button>
                    </div>
                </div>
            </c:when>
        </c:choose>


    </div>
</div>

<%--结尾菜单部分***********************************************************--%>
<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<%--Javascript部分***********************************************************--%>
<jsp:include page="/WEB-INF/decorators/jsheader.jsp"/>
<script type="text/javascript">
    function toLoginPage() {
        window.location.href = "${pageContext.request.contextPath}/chapp/login.html";
    }
    function toRegisterPage() {
        window.location.href = "${pageContext.request.contextPath}/chapp/userregister.html";
    }
    function toResendRegisterMail() {
        window.location.href = "${pageContext.request.contextPath}/chapp/usermailsend.html?username=${username}&mailtype=0&isresend=true";
    }
    function toResendPwdBackMail() {
        window.location.href = "${pageContext.request.contextPath}/chapp/usermailsend.html?username=${username}&mailtype=1&isresend=true";
    }
    function toPwdLookBack() {
        window.location.href = "${pageContext.request.contextPath}/chapp/usertopwdlookback.html";
    }
</script>
</body>

</html>