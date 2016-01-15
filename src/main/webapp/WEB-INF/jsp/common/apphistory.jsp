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
        <tbody id="rank_list_content">
            <%--<tr>--%>
                <%--<td style="padding-left: 20px;" colspan="2">--%>
                    <%--欧阳,休克--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td style="padding-left: 20px; font-size:11px;" colspan="2">--%>
                    <%--没有更多了m, 没有更多了没有更多了没有更多了没有更多了没有更多了没有更多了没有更多了没有更多了--%>
                <%--</td>--%>
            <%--</tr>--%>
        </tbody>
    </table>

    <!--加载开始-->
    <div id="add_more_info" class="load-more text-center" style="display: none;">
        <div class="load-nomore">没有更多了</div>
    </div>

    <h5 id="show_more_info" class="moreApply text-center" style="margin-bottom: 40px;">
        <a href="javascript:void(0);" onclick="addMoreContent()" charset="moreApply-a" id="appHis-a">
            查看更多
            <span class="moreico"></span>
        </a>
    </h5>

    <div style="text-align: center;">
        <c:choose>
            <c:when test="${PAGE_KEY == 'ADMIN'}">
                <form id="adminBackForm" action="${pageContext.request.contextPath}/security/adminappoverview.html" method="post">
                    <input id="current" name="current" type="hidden" value="${current}"/>
                    <input id="appStatus" name="appStatus" type="hidden" value="${appStatus}"/>
                    <input id="appName" name="appName" type="hidden" value="${appName}"/>
                    <input type="button" class="btn-blue color1" value="返  回" onclick="adminBackSubmit();"/>
                </form>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/security/clientappoverview.html?current=${current}&appName=${appName}&appStatus=${appStatus}"><input type="button" class="btn-blue color1" value="返  回" /></a>
            </c:otherwise>
        </c:choose>
    </div>
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
    var appId = '${appId}';

    jQuery(document).ready(function(){
        addMoreContent();
    });

    function addMoreContent() {
        jQuery('#commit_form_mask').mask("正在加载数据，请耐心等待!");
        var contentContainer = jQuery("#rank_list_content");
        SystemDWRHandler.obtainAppHistoryByPage(startNumber, appId, function(result) {
            var statisticData = JSON.parse(result);

            if(statisticData.length <= 0) {
                jQuery("#add_more_info").css("display", "block");
            }

            if(statisticData.length < 20) {
                jQuery("#show_more_info").css("display", "none");
                jQuery("#add_more_info").css("display", "block");
            }

            for(var i=0; i<statisticData.length; i++) {
                var historyValues = statisticData[i];
                var newContent = "<tr><td style=\"padding-left: 20px;background-color: #EBEFF0;\" colspan=\"2\"> " + (i+1) + "、 [" + historyValues.time + "]" + historyValues.title + "</td></tr>" +
                        "<tr><td style=\"padding-left: 20px; font-size:11px;\" colspan=\"2\">" + historyValues.desc + "</td></tr>";

                contentContainer.html(contentContainer.html() + newContent);
            }

            if(statisticData.length > 0) {
                contentContainer.html(contentContainer.html() + "</br></br>");
            }

            startNumber = startNumber + 20;
            jQuery('#commit_form_mask').unmask();
            window.location.hash = "#add_more_button";
        });
    }

    function closeMoreInfo() {
        jQuery("#add_more_info").css("display", "none");
    }

    function adminBackSubmit() {
        jQuery("#adminBackForm").submit();
    }
</script>

</body>
</html>
