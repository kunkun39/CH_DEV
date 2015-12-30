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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css">
</head>
<body>

<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/header.jsp"/>


<%--内容部分***********************************************************--%>

<!--banner开始-->
<!--banner结束-->

<%--<div id="main-slide" class="carousel slide" data-ride="carousel">--%>
<%--<div class="carousel-inner">--%>
<div class="item active"><img class="img-responsive"
                              src="${pageContext.request.contextPath}/images/aboutus-banner.jpg" alt="slider">

</div>

<%--<div class="slider-content">--%>
<div class="col-md-12 text-center" style="margin-top: -359px">
    <div class="item-log"><img class="img-logo"
                               src="${pageContext.request.contextPath}/images/aboutus-logo.jpg"
            >
    </div>

    <h2 class="color1 font-h1" style="font-size: 45px">联系我们</h2>

    <div style="margin-top: 41px">
        <h3>
            <p class="color1 h4">四川省成都市高新区天府大道111号</p>

            <p class="color2 h4">sjdfsdfjk@kjcrrf.com</p>

            <p class="color2 h4">1800-1231-234</p>

            <p class="color1 h4" style="margin-top: -1px">1322-1238-795</p>
        </h3>
    </div>

</div>


<%--</div>--%>
<%--</div>--%>
<%--</div>--%>

<div id="container-map" style="text-align: center;margin-top: 38px">
    <img class="img-map"
         src="${pageContext.request.contextPath}/images/map.jpg"/>
</div>

<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<script src="${pageContext.request.contextPath}/javascript/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery.isotope.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/owl.carousel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/main.js"></script>
</body>
</html>


