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
</head>

<body>
<%--开头菜单部分***********************************************************--%>
<jsp:include page="/WEB-INF/decorators/header.jsp"/>

<%--中间内容部分***********************************************************--%>
<div class="container reg-content">
    <div class="panel panel-default">
        <div class="panel-heading">
            注册
        </div>
        <div class="panel-con-email row">
            <div class="col-sm-3 text-right">
                <span class="reg-icon email-icon"></span>
            </div>
            <div class="col-sm-9">
                <p class="font16" style="margin: 10px 0 0;">感谢注册，确认邮件已发送至你的注册邮箱 :${username}</p>

                <p style="margin:0 0 28px;color: #999;">请进入邮箱查看邮件，并激活微信开放平台帐号。</p>
                <input type="button" class="btn-blue color1" value="登录邮箱"/>

                <p style="margin-top: 10px;margin-bottom: 20px;"><p class="color3" >没有收到邮件？</p></p>
                <ul>
                    <li>1. 请检查邮箱地址是否正确</li>
                    <li>2. 检查你的邮件垃圾箱</li>
                    <li>3. 若仍未收到确认，请尝试 <a class="color4" href="${pageContext.request.contextPath}/chapp/resendmail.html?username=${usernameenc}">重新发送</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<%--结尾菜单部分***********************************************************--%>
<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<%--Javascript部分***********************************************************--%>
<script src="${pageContext.request.contextPath}/javascript/jquery.js"></script>
</body>

</html>