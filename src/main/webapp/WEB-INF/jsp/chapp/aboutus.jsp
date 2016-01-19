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
            <p class="color3" style="font-size: 14px;text-indent: 2em;text-align: left;">公众号第三方平台的开放，让公众号运营者在面向垂直行业需求时，可以通过一键登录授权给第三方开发者，来完成相关能力。公众号第三方平台的开放，让公众号运营者在面向垂直行业需求时，可以通过一键登录授权给第三方开发者，来完成相关能力。</p>
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
            <p style="text-align: left;">如果你希望自己的应用发布到广电专有应用市场内，首先你必须成为我们的用户，如果您还不是，请点击"我的服务"进行注册。如果你已经成为我们的用户，请点击"我的服务"直接进行登录。</p>
        </div>
        <div class="col-md-4">
            <div class="step-logo step-logo1"></div>
            <h2>2.提交审核</h2>
            <p style="text-align: left;">进入我的服务，点击应用图标，点击上传应用，然后完成相关应用信息的填写，应用处理等待审核状态，该状态下，你还可以对应用信息进行更新和修改。</p>
        </div>
        <div class="col-md-4">
            <div class="step-logo step-logo1"></div>
            <h2>3.发布到市场</h2>
            <p style="text-align: left;">应用处于审核状态下，用户不能对应用进行编辑。审核通过后，该应用会发布到广电应用市场上，若不通过，需要用户对应用重新更新后再提交审核。</p>
        </div>
    </div>


    <%--结尾菜单部分********************************************************************--%>
    <jsp:include page="/WEB-INF/decorators/footer.jsp"/>


</body>

</html>