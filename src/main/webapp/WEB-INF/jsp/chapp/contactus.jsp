<%--
  Created by IntelliJ IDEA.
  User: OscarChang
  Date: 15-12-28
  Time: 下午7:51
  To change this template use File | Settings | File Templates.
--%>
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
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/introduce.css">
</head>
<body>

<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/header.jsp"/>


<%--内容部分***********************************************************--%>

<!--banner开始-->
<!--banner结束-->

<%--<div id="main-slide" class="carousel slide" data-ride="carousel">--%>
<%--<div class="carousel-inner">--%>
<%--<div class="item active">--%>
<%--<img width="100%" height="350px" src="${pageContext.request.contextPath}/images/aboutus-banner.jpg" alt="slider">--%>
<%--</div>--%>

<%--<div class="col-md-12 text-center " style="margin-top: -320px">--%>
<%--<div class="item-log">--%>
<%--<img class="img-logo" src="${pageContext.request.contextPath}/images/aboutus-logo.png">--%>
<%--</div>--%>

<%--&lt;%&ndash;<h1 class="color3 font-h1" style="font-size: 45px">联系我们</h2>&ndash;%&gt;--%>
<%--<div style="margin-top:35px ">--%>
<%--<h1 style="font-size:45px" class="color3 font-h1">联系我们</h1>--%>
<%--</div>--%>

<%--<div style="margin-top: 44px">--%>
<%--<h3>--%>
<%--<p style="font-size: 14px;" class=" color3 h4">四川省成都市高新区天府大道111号--%>
<%--&nbsp;--%>
<%--&nbsp;--%>
<%--sjdfsdfjk@kjcrrf.com--%>
<%--&nbsp;--%>
<%--&nbsp;--%>
<%--1800-1231-234--%>
<%--&nbsp;--%>
<%--&nbsp;--%>
<%--1322-1238-795 </p>--%>
<%--</h3>--%>
<%--</div>--%>
<%--</div>--%>


<div class="content banner">
    <img width="100%" height="350px" src="${pageContext.request.contextPath}/images/aboutus-banner.jpg"
         class="banner-img"/>

    <div class="text-center introduce">
        <!--<div class="contact-logo">
        </div>-->
        <img src="${pageContext.request.contextPath}/images/aboutus-logo.png"/>

        <p>&nbsp;</p>

        <h1 style="margin-top: 15px" class="color3 font-h1">联系我们</h1>

        <p>&nbsp;</p>

        <p class="color3" style="font-size: 14px;text-indent: 2em;text-align: left;">
            四川省成都市高新区天府大道111号
            &nbsp;
            sjdfsdfjk@kjcrrf.com
            &nbsp;
            1800-1231-234
            &nbsp;
            1322-1238-795
        </p>
    </div>
</div>


<%--<div id="container-map" style="text-align: center;margin-top: 38px">--%>
<%--<img class="img-map"--%>
<%--src="${pageContext.request.contextPath}/images/map.jpg"/>--%>
<%--</div>--%>


<div class="container text-center introduceStep" style="margin-top: 38px">
    <img class="img-map"
         src="${pageContext.request.contextPath}/images/map.jpg"/>
</div>

<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

</body>
</html>


