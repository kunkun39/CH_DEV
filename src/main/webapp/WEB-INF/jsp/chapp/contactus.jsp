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
    <jsp:include page="/WEB-INF/decorators/cssheader.jsp"/>
</head>
<body>

<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/header.jsp"/>


<div class="content banner">
    <img width="100%" height="350px" src="${RESOURCE_PATH}images/aboutus-banner.jpg"
         class="banner-img"/>

    <div class="text-center introduce">
        <!--<div class="contact-logo">
        </div>-->
        <img src="${RESOURCE_PATH}images/aboutus-logo.png"/>

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


<div class="container text-center introduceStep" style="margin-top: 38px">
    <img class="img-map"
         src="${RESOURCE_PATH}/images/map.jpg"/>
</div>

<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

</body>
</html>


