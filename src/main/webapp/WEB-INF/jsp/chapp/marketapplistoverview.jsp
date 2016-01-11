<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="ch" uri="http://www.chanhong.com" %>
<%--<%@ taglib prefix="ch" uri="/WEB-INF/tld/tag.tld" %>--%>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css">
</head>

<body>
<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/header.jsp"/>

<%--内容部分***********************************************************--%>

<div class="content">
    <main class="container">
        <div class="index-header">
        </div>
    </main>

    <main class="container">
        <ul class="row rank_list_content text-center">
            <c:forEach items="${apps}" var="app">
               <li class="col-md-3 col-sm-5">
                <a href="javascript:void(0)" title="" class="apply-ul-a">
                    <img src="${fileRequestHost}/${app.appKey}/${app.iconActualFileName}" alt="${app.appName}" width="70" height="70" />
                    <h4>${app.appName}</h4>
                    <p><ch:substring value="${app.appDescription}" length="20"/></p>
                </a>
                </li>
            </c:forEach>
        </ul>

        <div class="pagcontrol" style="text-align:center;">
            <ul class="pagination">
                <ch:numberpaging urlMapping="${pageContext.request.contextPath}/chapp/marketapplistoverview.html" paging="${paging}" maxPageNumber="10"/>
            </ul>
        </div>
    </main>
</div>

<%--结尾菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

</body>
</html>
