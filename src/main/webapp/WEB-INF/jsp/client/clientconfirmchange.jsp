<%--
  Created by IntelliJ IDEA.
  User: OscarChang
  Date: 15-12-30
  Time: 下午1:47
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

<div>
    <p style="font-size: 50px;margin-top: 41px;text-align: center">
        信息更新成功
    </p>
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