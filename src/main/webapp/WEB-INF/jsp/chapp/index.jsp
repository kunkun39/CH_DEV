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

<!--banner开始-->
<div class="homepage-banner">
<div style="width:728px;height:180px;margin-top:0px;">
</div>
<div style="width:728px;height:180px;margin:0px auto;">
		<ul class="round">
			<li><img style="width:90%" src="${pageContext.request.contextPath}/images/roundabout/header1.jpg" alt="" /></li>
			<li><img style="width:90%" src="${pageContext.request.contextPath}/images/roundabout/header2.jpg" alt="" /></li>
			<li><img style="width:90%" src="${pageContext.request.contextPath}/images/roundabout/header3.jpg" alt="" /></li>
			<li><img style="width:90%" src="${pageContext.request.contextPath}/images/roundabout/header4.jpg" alt="" /></li>
			<li><img style="width:90%" src="${pageContext.request.contextPath}/images/roundabout/header5.jpg" alt="" /></li>
			<li><img style="width:90%" src="${pageContext.request.contextPath}/images/roundabout/header6.jpg" alt="" /></li>
		</ul>
</div>
</div>
<!--banner结束-->

<div class="content">
    <main class="container">
        <div class="index-header">
        </div>
    </main>

    <div class="container">
        <ul class="row apply-ul text-center">
            <c:forEach items="${apps}" var="app">
               <li class="col-md-3 col-sm-6">
                    <a href="javascript:void(0)" title="" class="apply-ul-a">
                        <img src="${fileRequestHost}/${app.appKey}/${app.iconActualFileName}" alt="" width="96" height="96"/>
                        <h4>${app.appName}</h4>
                        <p>
                            <ch:substring value="${app.appDescription}" length="30" showTitle="false"/>
                        </p>
                    </a>
                </li>
            </c:forEach>
        </ul>
    </div>


    <div class="container">
        <h5 class="moreApply text-center">
            <a href="${pageContext.request.contextPath}/chapp/marketapplistoverview.html" charset="moreApply-a">查看更多应用
            <span class="moreico"></span>
            </a>
        </h5>
    </div>
</div>

<%--结尾菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<%--Javascript部分***********************************************************--%>
<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/javascript/vendor/html5.min.js"></script>
<script src="${pageContext.request.contextPath}/javascript/vendor/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/round/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/round/jquery.roundabout.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/popup.js"></script>
<script type="text/javascript">
    window.onload = function() {$('.round').roundabout();};
</script>

</body>
</html>
