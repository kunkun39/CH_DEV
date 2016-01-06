<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html class="activity-no">
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nav.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/backstage.css">
    <title>开发者应用接入平台后台管理</title>
</head>
<body>
<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/header.jsp" />

<%--正文部分**************************************************************--%>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            应用审核
        </div>

        <%--引用appsteptitle***********************************************************--%>
        <jsp:include page="/WEB-INF/jsp/common/appsteptitle.jsp"/>
        <form id="appForm" class="form-horizontal" action="${pageContext.request.contextPath}/security/adminappoverview.html" method="get">
            <div class="form-body">
                <input id="current" name="current" type="hidden" value="${current}"/>
                <input id="appStatus" name="appStatus" type="hidden" value="${appStatus}"/>
                <input id="appName" name="appName" type="hidden" value="${appName}"/>
                <jsp:include page="/WEB-INF/jsp/common/appinfo.jsp"/>

                <div class="form-group">
                    <label class="col-sm-3 control-label">&nbsp;</label>
                    <div class="col-sm-9">
                        <input type="button" class="btn-blue color1" value="返  回" onclick="backSubmit();" />
                        <c:choose>
                            <c:when test="${marketApp.appStatus == 'WAITING'}">
                                <input type="button" class="btn-blue color1" value="拒绝通过" onclick="adminAppStatusChange(${marketApp.id}, 'REJECTED', '${marketApp.appName}');"/>
                                <input type="button" class="btn-blue color1" value="审核通过" onclick="adminAppStatusChange(${marketApp.id}, 'PASSED', '${marketApp.appName}');"/>
                            </c:when>
                            <c:when test="${marketApp.appStatus == 'PASSED'}">
                                <input type="button" class="btn-blue color1" value="上  架" onclick="adminAppStatusChange(${marketApp.id}, 'SHELVES', '${marketApp.appName}');"/>
                            </c:when>
                            <c:when test="${marketApp.appStatus == 'SHELVES'}">
                                <input type="button" class="btn-blue color1" value="下  架" onclick="adminAppStatusChange(${marketApp.id}, 'OFFSHELVES', '${marketApp.appName}');"/>
                            </c:when>
                            <c:when test="${marketApp.appStatus == 'OFFSHELVES'}">
                                <input type="button" class="btn-blue color1" value="重新上架" onclick="adminAppStatusChange(${marketApp.id}, 'SHELVES', '${marketApp.appName}');"/>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<%--结尾菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<%--弹出框部分***********************************************************--%>
<div class="modal fade" id="infoPopup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <form id="confirmForm" class="form-horizontal" action="${pageContext.request.contextPath}/security/adminappstatuschange.html" method="post">
            <input id="appId" name="appId" type="hidden" value=""/>
            <input name="current" type="hidden" value="${current}"/>
            <input name="appStatus" type="hidden" value="${appStatus}"/>
            <input name="appName" type="hidden" value="${appName}"/>
            <input id="appChangeStatus" name="appChangeStatus" type="hidden" value=""/>
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">开发者应用接入平台</h4>
                </div>
                <div id="message" class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" onclick="confirmSubmit();">确定</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="${pageContext.request.contextPath}/javascript/jquery.js"></script>
<script src="${pageContext.request.contextPath}/javascript/vendor/bootstrap.js"></script>
<script type="text/javascript">
    var g_appID = 0;
    var g_appChangeStatus = '';
    var rejectReasonValidate = false;
    var checkRejectReason = false;
    function adminAppStatusChange(appId, appStatus, appName) {
        g_appID = appId;
        g_appChangeStatus = appStatus;
        var comfirmMessage;
        if (appStatus == 'REJECTED') {
            comfirmMessage =
                    "<h5>请输入拒绝理由:</h5>" +
                    "<textarea id=\"rejectReason\" name=\"rejectReason\"required=\"required\" rows=\"3\" cols=\"78\" onblur=\"validateRejectReason()\"></textarea>" +
                    "<span class=\"help-block color6\">最多填写200个字</span>" +
                    "<span id=\"reason_error_show\" class=\"help-block color5\" style=\"display: none;\"></span>";
            checkRejectReason = true;
        } else if (appStatus == 'PASSED') {
            comfirmMessage = "确认审核通过应用\"" + appName + "\"?";
        } else if (appStatus == 'SHELVES') {
            comfirmMessage = "确认上架应用\"" + appName + "\"?";
        } else if (appStatus == 'OFFSHELVES') {
            comfirmMessage = "确认下架应用\"" + appName + "\"?";
        } else if (appStatus == 'SHELVES') {
            comfirmMessage = "确认重新上架应用\"" + appName + "\"?";
        }  else {

        }
        jQuery("#message").html(comfirmMessage);
        jQuery("#infoPopup").modal();
    }

    function validateRejectReason() {
        var rejectReason = jQuery("#rejectReason").val();
        if (rejectReason == null || rejectReason == '') {
            jQuery("#reason_error_show").html("拒绝理由不能为空!");
            jQuery("#reason_error_show").css("display", "block");
        } else {
            jQuery("#reason_error_show").css("display", "none");
            rejectReasonValidate = true;
        }
    }
    function confirmSubmit() {
        if (checkRejectReason) {
            validateRejectReason();
        } else {
            rejectReasonValidate = true;
        }
        if (rejectReasonValidate) {
            jQuery("#appId").val(g_appID);
            jQuery("#appChangeStatus").val(g_appChangeStatus);
            jQuery("#confirmForm").submit();
        }
        /*jQuery.post('${pageContext.request.contextPath}/security/adminappstatuschange.html',
                {
                    appId:g_appID,
                    appStatus: g_appChangeStatus
                },
                function(){window.location.reload()});*/
    }

    function backSubmit() {
        jQuery("#appForm").submit();
    }
</script>
</body>
</html>