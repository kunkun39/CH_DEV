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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/backstage.css">

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
           邮箱验证
        </div>
        <c:choose>
            <c:when test="${INFO_KEY == 'EXCEPTION_REGISTER'}">
                <div class="panel-con text-center">
                    <div class=" panel-registerinfo text-center"></div>
                    <h3> 感谢你注册广电应用接入平台， 用户激活失败，请重新注册！</h3>
                    <button class="btn-blue color1 text-center" onclick="toRegisterPage()">去注册</button>
                </div>
            </c:when>
            <c:when test="${INFO_KEY == 'OK'}">
                <div class="panel-con text-center">
                    <div class="reg-icon success-icon"></div>
                    <h3>账号验证成功!</h3>
                    <button class="btn-blue color1 text-center" onclick="toLoginPage()">去登录</button>
                </div>
            </c:when>
            <c:when test="${INFO_KEY == 'OUTTIME_REGISTER'}">
                <div class="panel-registerinfo text-center">
                    <h3> 感谢你注册广电应用接入平台， 用户激活已超时失效，请重新发送激活邮件！</h3>
                    <button class="btn-blue color1 text-center" onclick="toResendRegisterMail()">重新发送</button>
                </div>
            </c:when>
            <c:when test="${INFO_KEY == 'USED_REGISTER'}">
                <div class="panel-registerinfo text-center">
                    <h3>该用户激活已使用，请检查是否已注册成功或尝试重新注册！</h3>
                    <button class="btn-blue color1 text-center" onclick="toLoginPage()">去登录</button>
                </div>
            </c:when>

            <c:when test="${INFO_KEY == 'EXCEPTION_PWD_BACK'}">
                <div class="panel-con text-center">
                    <div class="panel-registerinfo text-center"></div>
                    <h3> 感谢你使用广电应用接入平台找回密码， 邮件激活失败，请重新操作！</h3>
                    <button class="btn-blue color1 text-center" onclick="toPwdLookBack()">去找回密码</button>
                </div>
            </c:when>
            <c:when test="${INFO_KEY == 'OUTTIME_PWD_BACK'}">
                <div class="panel-registerinfo text-center">
                    <h3> 感谢你使用广电应用接入平台找回密码， 用户激活已超时失效，请重新发送激活邮件！</h3>
                    <button class="btn-blue color1 text-center" onclick="toResendPwdBackMail()">重新发送</button>
                </div>
            </c:when>
            <c:when test="${INFO_KEY == 'USED_PWD_BACK'}">
                <div class="panel-registerinfo text-center">
                    <h3>该用户激活已使用，请检查是否已找回密码成功或尝试重新找回密码！</h3>
                    <button class="btn-blue color1 text-center" onclick="toLoginPage()">去登录</button>
                </div>
            </c:when>

            <c:when test="${INFO_KEY == 'OK_PWD_BACK'}">
                <div class="panel-con text-center">
                    <div class="reg-icon success-icon"></div>
                    <h3>密码修改成功!</h3>
                    <button class="btn-blue color1 text-center" onclick="toLoginPage()">去登录</button>
                </div>
            </c:when>
        </c:choose>


    </div>
</div>

<%--结尾菜单部分***********************************************************--%>
<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<%--Javascript部分***********************************************************--%>
<script src="${pageContext.request.contextPath}/javascript/jquery.js"></script>
<script type="text/javascript">
    function toLoginPage() {
        window.location.href = "${pageContext.request.contextPath}/chapp/login.html";
    }
    function toRegisterPage() {
        window.location.href = "${pageContext.request.contextPath}/chapp/userregister.html";
    }
    function toResendRegisterMail() {
        window.location.href = "${pageContext.request.contextPath}/chapp/resendmail.html?username=${username}&mailtype=0&isresend=true";
    }
    function toResendPwdBackMail() {
        window.location.href = "${pageContext.request.contextPath}/chapp/resendmail.html?username=${username}&mailtype=1&isresend=true";
    }
    function toPwdLookBack() {
        window.location.href = "${pageContext.request.contextPath}/chapp/usertopwdlookback.html";
    }
</script>
</body>

</html>