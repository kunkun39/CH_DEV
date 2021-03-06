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
    <title>开发者应用接入平台后台管理</title>
    <jsp:include page="/WEB-INF/decorators/cssheader.jsp" />
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
        <form id="appForm" class="form-horizontal" action="${pageContext.request.contextPath}/security/adminappoverview.html" method="post">
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
                                <input type="button" class="btn-blue color1" value="拒绝通过" onclick="adminAppStatusChange(${marketApp.id}, 'REJECTED', '${marketApp.appNameJS}');"/>
                                <input type="button" class="btn-blue color1" value="审核通过" onclick="adminAppStatusChange(${marketApp.id}, 'PASSED', '${marketApp.appNameJS}');"/>
                            </c:when>
                            <c:when test="${marketApp.appStatus == 'PASSED'}">
                                <input type="button" class="btn-blue color1" value="上  架" onclick="adminAppStatusChange(${marketApp.id}, 'SHELVES', '${marketApp.appNameJS}');"/>
                            </c:when>
                            <c:when test="${marketApp.appStatus == 'SHELVES'}">
                                <input type="button" class="btn-blue color1" value="下  架" onclick="adminAppStatusChange(${marketApp.id}, 'OFFSHELVES', '${marketApp.appNameJS}');"/>
                            </c:when>
                            <c:when test="${marketApp.appStatus == 'OFFSHELVES'}">
                                <input type="button" class="btn-blue color1" value="重新上架" onclick="adminAppStatusChange(${marketApp.id}, 'SHELVES', '${marketApp.appNameJS}');"/>
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
                <input type="button" id="test" class="emptybutton"/>
                <div class="modal-footer">
                    <button id="submitButton" type="button" class="btn btn-default" onclick="confirmSubmit();">确定</button>
                    <button id="cancelButton" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </form>
    </div>
</div>

<%--Javascript部分***********************************************************--%>
<jsp:include page="/WEB-INF/decorators/jsheader.jsp"/>
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
                    "<textarea id=\"rejectReason\" name=\"rejectReason\"required=\"required\" rows=\"5\" maxlength=\"200\" style=\"width:100%;overflow:auto;word-break:break-all;\" onblur=\"onblueValidateRejectReason(event);\"></textarea>" +
                    "<span class=\"help-block color6\"><i class=\"ico-prompt\"></i>最多填写200个字</span>" +
                    "<span id=\"reason_error_show\" class=\"help-block color5\" style=\"display: none;\"></span>" ;
            checkRejectReason = true;
        } else if (appStatus == 'PASSED') {
            comfirmMessage = "请确认让\"" + appName + "\"审核通过?";
        } else if (appStatus == 'SHELVES') {
            comfirmMessage = "请确认让\"" + appName + "\"上架?";
        } else if (appStatus == 'OFFSHELVES') {
            comfirmMessage = "请确认让\"" + appName + "\"下架?";
        } else if (appStatus == 'SHELVES') {
            comfirmMessage = "请确认让\"" + appName + "\"重新上架?";
        }  else {

        }
        jQuery("#message").html(comfirmMessage);
        jQuery("#infoPopup").modal();
    }

    function onblueValidateRejectReason(e) {
        var triggerId = getEventTriggerId(e);

        if (triggerId == 'submitButton') {
            confirmSubmit();
        } else if (triggerId == 'cancelButton') {
            return;
        } else {
            validateRejectReason();
        }
    }

    function validateRejectReason() {
        var rejectReason = jQuery("#rejectReason").val();
        if (rejectReason == null || rejectReason == '') {
            jQuery("#reason_error_show").html("<i class=\"ico-error\"></i>拒绝理由不能为空!");
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