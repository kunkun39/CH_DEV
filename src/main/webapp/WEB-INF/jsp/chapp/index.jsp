<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="ch" uri="http://www.chanhong.com" %>

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

<%--内容部分***********************************************************--%>

<!--banner开始-->
<div class="homepage-banner">
    <div style="width:728px;height:180px;margin-top:0px;">
    </div>
    <div style="width:728px;height:180px;margin:0px auto;">
        <ul class="round">
            <li><img style="width:90%" src="${RESOURCE_PATH}header1.jpg" alt="" /></li>
            <li><img style="width:90%" src="${RESOURCE_PATH}header2.jpg" alt="" /></li>
            <li><img style="width:90%" src="${RESOURCE_PATH}header3.jpg" alt="" /></li>
            <li><img style="width:90%" src="${RESOURCE_PATH}header4.jpg" alt="" /></li>
            <li><img style="width:90%" src="${RESOURCE_PATH}header5.jpg" alt="" /></li>
            <li><img style="width:90%" src="${RESOURCE_PATH}header6.jpg" alt="" /></li>
        </ul>
    </div>
</div>
<!--banner结束-->

<div class="content">
    <div class="container">
        <div class="index-header">
        </div>
    </div>

    <div class="container">
        <ul class="row apply-ul text-center">
            <c:forEach items="${apps}" var="app">
                <li id="${app.id}" class="col-md-3 col-sm-6"
                    onclick="appInfo.categoryName='${app.fullCategoryName}';appInfo.appName='${app.appName}';appInfo.appPackage='${app.appPackage}';appInfo.versionInt=${app.appVersionInt};appInfo.version='${app.appVersion}';appInfo.sizeFormat='${app.appSizeFormat}';appInfo.iconPath='${fileRequestHost}/${app.appKey}/${app.iconActualFileName}';appInfo.posterPath='${fileRequestHost}/${app.appKey}/${app.posterActualFileName}';appInfo.description='${app.appDescription}';showDetails(appInfo,'${app.id}');">
                    <a href="javascript:void(0)" title="" class="apply-ul-a">
                        <img src="${fileRequestHost}/${app.appKey}/${app.iconActualFileName}" alt="" width="72"
                             height="72"/>
                        <h5>${app.appName}</h5>

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

<%--点击放大***********************************************************--%>
<jsp:include page="/WEB-INF/jsp/common/popup.jsp"/>

<%--结尾菜单部分***********************************************************--%>
<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<%--Javascript部分***********************************************************--%>
<jsp:include page="/WEB-INF/decorators/jsheader.jsp"/>

<script type="text/javascript">
    window.onload = function() {
        $('.round').roundabout();
    };
</script>

</body>
</html>
