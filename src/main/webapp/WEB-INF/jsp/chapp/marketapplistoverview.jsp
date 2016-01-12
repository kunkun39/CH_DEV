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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/backstage.css">
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
        <form id="client_app_search" action="${pageContext.request.contextPath}/chapp/marketapplistoverview.html" method="post" >
            <div class="input-group" style="margin: 0px auto;" >
                <input id="appName" name="appName" type="text" placeholder="应用名称" value="${paging.appName}" class="input-sm form-control" style="border:1px solid #778899"/>
                <span class="input-group-btn" style="border:1px dotted #778899">
                    <button type="button" class="btn btn-sm" onclick="searchClientApp();">
                        <i class="search-icon"></i>
                    </button>
                </span>
            </div>
        </form>
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

<%--Javascript部分***********************************************************--%>
<script src="${pageContext.request.contextPath}/javascript/jquery.js"></script>
<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/javascript/vendor/html5.min.js"></script>
<script src="${pageContext.request.contextPath}/javascript/vendor/respond.min.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/javascript/vendor/tab.js"></script>

<script type="text/javascript">

    function searchClientApp() {
        jQuery("#client_app_search").submit();
    }

</script>
</body>
</html>
