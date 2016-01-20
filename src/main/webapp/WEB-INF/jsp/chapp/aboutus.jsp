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
	<title>广电应用接入平台</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <jsp:include page="/WEB-INF/decorators/cssheader.jsp"/>
</head>

<body>

    <%--开头菜单部分***********************************************************--%>
    <jsp:include page="/WEB-INF/decorators/header.jsp"/>

    <%--主题菜单部分************************************************************--%>
    <%--banner(广告)层--%>
    <div class="content banner">
        <img width="100%" height="350px" src="${pageContext.request.contextPath}/images/introduce-banner.jpg" class="banner-img" />
        <div class="text-center introduce" >
            <!--<div class="contact-logo">
            </div>-->
            <img src="${pageContext.request.contextPath}/images/introduce-logo.png" />
            <h1 class="color3 font-h1">平台介绍</h1>
            <p>&nbsp;</p>
            <p class="color3" style="font-size: 14px;text-indent: 2em;text-align: left;">广电开发者应用接入平台是一个公众的、开放性的系统平台,它允许开发者经注册后登录到系统平台,根据需要自由上传自己的应用,等待广电运维人员审核通过后,开发者上传的应用会发布到广电专有市场内,
                终端机顶盒会浏览到应用信息。对于开发者和广电运维人员来讲,上传应用、管理应用及管理个人信息变得更为方便。</p>
        </div>
    </div>

    <%--container层--%>
    <div class="container">
        <div class="procedure-header">
        </div>
    </div>

    <div class="container text-center introduceStep">
        <div class="col-md-4">
            <div class="step-logo step-logo1"></div>
            <h2>1.登录平台</h2>
            <p style="text-align: left;">如果您希望自己的应用发布到广电专有应用市场内，首先您必须成为我们的用户，如果您还不是，请点击"<a href="${pageContext.request.contextPath}/chapp/userregister.html" style="font-weight:bold;text-decoration:underline;">注册</a>"进行注册。
                如果您已经成为我们的用户，请点击"<a href="${pageContext.request.contextPath}/chapp/login.html" style="font-weight:bold;text-decoration:underline;">登录</a>"直接进行登录。</p>
        </div>
        <div class="col-md-4">
            <div class="step-logo step-logo1"></div>
            <h2>2.提交审核</h2>
            <p style="text-align: left;">登陆后进入"我的服务"，依次点击"我的应用"和"添加应用"，完成相关应用信息的填写，应用进入待审核状态，该状态下，您还可以对应用信息进行更新和修改;同时你也可点击"账户资料"和"账户密码"对自己的相关信息进行管理。</p>
        </div>
        <div class="col-md-4">
            <div class="step-logo step-logo1"></div>
            <h2>3.发布到市场</h2>
            <p style="text-align: left;">若您的应用通过审核，该应用会发布到广电专有应用市场上，若不通过，需要您对自己的应用重新更新后再次提交等待审核;同时,您也可以方便的查看自己上传的应用目前所处的状态。</p>
        </div>
    </div>


    <%--结尾菜单部分********************************************************************--%>
    <jsp:include page="/WEB-INF/decorators/footer.jsp"/>


</body>

</html>