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
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/backstage.css">
</head>

<body>

<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/header.jsp"/>

<%--内容部分***********************************************************--%>

<div class="back-con" id="commit_form_mask">

    <h5 class="moreApply text-center" style="margin-bottom: 40px;">
        <a href="javascript:void(0);" charset="moreApply-a">
            查看应用历史
            <span class="moreico"></span>
        </a>
    </h5>

    <!--加载结束-->
    <table class="table table-condensed table-bordered table-hover table-view-1" id="appHis-table">
        <thead>
            <tr>
                <th style="padding-left: 20px; width: 20%">时间</th>
                <th>细节</th>
            </tr>
        </thead>
        <tbody id="rank_list_content">
            <%--<tr>--%>
                <%--<td style="padding-left: 20px;">--%>
                    <%--欧阳,休克--%>
                <%--</td>--%>
                <%--<td><span class="color10">在用</span></td>--%>
            <%--</tr>--%>
        </tbody>
    </table>

    <!--加载开始-->
    <div id="add_more_info" class="load-more text-center" style="display: none;">
        <div class="load-nomore" style="display: none;" >没有更多了</div>
    </div>

    <h5 class="moreApply text-center" style="margin-bottom: 40px;">
        <a href="javascript:void(0);" onclick="addMoreContent()" charset="moreApply-a" id="appHis-a">
            查看更多
            <span class="moreico"></span>
        </a>
    </h5>
</div>

<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<%--Javascript部分***********************************************************--%>
<script src="${pageContext.request.contextPath}/javascript/jquery.js"></script>
<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/javascript/vendor/html5.min.js"></script>
<script src="${pageContext.request.contextPath}/javascript/vendor/respond.min.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/javascript/vendor/tab.js"></script>
<script src="${pageContext.request.contextPath}/dwr/engine.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/dwr/util.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/dwr/interface/SystemDWRHandler.js" type="text/javascript"></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/javascript/jquery-loadmask/jquery.loadmask.min.js'></script>
<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/javascript/jquery-loadmask/jquery.loadmask.css'/>

<script type="text/javascript">
    var startNumber = 0;

    jQuery(document).ready(function(){
        addMoreContent();
    });

    function addMoreContent() {
        jQuery('#commit_form_mask').mask("正在加载数据，请耐心等待!");
//        var contentContainer = jQuery("#rank_list_content");
//        SystemDWRHandler.obtainPageAppsByStartNumber(startNumber, function(result) {
//            var statisticData = JSON.parse(result);
//
//            if(statisticData.length > 0) {
//                contentContainer.html(contentContainer.html() + "</div><h1>排名" + (startNumber + 1) + " - " + (startNumber + 20) + "</h1></div>");
//            } else {
//                jQuery("#add_more_info").css("display", "block");
//            }
//
//            for(var i=0; i<statisticData.length; i++) {
//                var appValues = statisticData[i];
//                var newContent = "<li><div class=\"left peity_bar_good\">" +
//                        "<img style=\"width:40px;height:40px\" src=\"" + fileRequestHost + appValues.appKey + "/" + appValues.iconActualFileName + "\"/></div>" +
//                        "<div style='text-overflow:ellipsis;white-space:nowrap;' class=\"right\"><strong>" + appValues.downloadTimes + "</strong>" + appValues.appFullName + " [" + appValues.appVersion + "]</div></li>";
//
//                contentContainer.html(contentContainer.html() + newContent);
//            }
//
//            if(statisticData.length > 0) {
//                contentContainer.html(contentContainer.html() + "</br></br>");
//            }
//
//            startNumber = startNumber + 20;
//            jQuery('#commit_form_mask').unmask();
//            window.location.hash = "#add_more_button";
//        });
    }

    function closeMoreInfo() {
        jQuery("#add_more_info").css("display", "none");
    }

</script>

</body>
</html>
