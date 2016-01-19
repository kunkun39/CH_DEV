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
    <title>开发者应用接入平台后台管理</title>
    <jsp:include page="/WEB-INF/decorators/cssheader.jsp" />

</head>
<body>
<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/header.jsp" />

<%--正文部分**************************************************************--%>

<div class="back-con">
    <jsp:include page="/WEB-INF/jsp/admin/adminmenu.jsp"/>
    <div class="back-con-r fl">
        <div class="leftTab-content active" id="bs-tabcon1">
            <h4 class="font16">开发者管理</h4>
            <form id="searchDeveloperForm" action="${pageContext.request.contextPath}/security/admindeveloper.html" method="post">
                <div class="input-group">
                    <input id="name" type="text" name="name" placeholder="用户名" class="input-sm form-control" value="${paging.name}">
                    <span class="input-group-btn">
                        <button type="button" class="btn btn-sm" onclick="searchDevelpoerUser();">
                        <i class="search-icon"></i>
                        </button>
                    </span>
                </div>
            </form>
            <table class="table table-condensed table-bordered table-hover table-view-1">
                <thead>
                    <tr>
                        <th style="padding-left: 20px;width:35%">用户名</th>
                        <th style="width:15%">联系方式</th>
                        <th style="text-align: center;width:15%">状态</th>
                        <th style="text-align: center;width:15%">激活</th>
                        <th style="text-align: center;width:20%">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${users}" var="user">
                        <tr>
                            <td style="padding-left: 20px;width:35%">${user.username}</td>
                            <td style="width:15%">${user.contactWay}</td>
                            <td id="user_status_${user.id}" style="text-align: center;width:15%">
                                <c:if test="${user.enabled}"><span class="color10">在用</span></c:if>
                                <c:if test="${!user.enabled}"><span class="color7">停止使用</span></c:if>
                            </td>
                            <td style="text-align: center;width:15%">
                                <c:if test="${user.active}"><span class="color10">已激活</span></c:if>
                                <c:if test="${!user.active}"><span class="color7">未激活</span></c:if>
                            </td>
                            <td id="user_option_${user.id}" style="text-align: center;width:20%">
                                <c:if test="${user.enabled && user.active}">
                                    <input type="button" class="btn-blue-sm color1" value="停止使用" onclick="confirmSubmit(${user.id}, '${user.username}', false);"/>
                                </c:if>
                                <c:if test="${!user.enabled && user.active}">
                                    <input type="button" class="btn-blue-sm color1" value="重新使用" onclick="confirmSubmit(${user.id}, '${user.username}', true);"/>
                                </c:if>
                                <c:if test="${!user.active}">
                                    <input type="button" class="btn-disabled-sm" value="等待激活" />
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <ul class="pagination">
                <ch:numberpaging urlMapping="${pageContext.request.contextPath}/security/admindeveloper.html" paging="${paging}"/>
            </ul>
        </div>
    </div>
</div>
<%--结尾菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<%--弹出框部分***********************************************************--%>
<div class="modal fade" id="infoPopup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">开发者应用接入平台</h4>
            </div>
            <div id="message" class="modal-body">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" onclick="changeDeveloperStatus();">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<%--Javascript部分***********************************************************--%>
<jsp:include page="/WEB-INF/decorators/jsheader.jsp"/>
<script src="${pageContext.request.contextPath}/dwr/engine.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/dwr/util.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/dwr/interface/SystemDWRHandler.js" type="text/javascript"></script>
<script type="text/javascript">
    var g_developerId;
    var g_developerName;
    var g_currentStatus;
    function searchDevelpoerUser() {
        jQuery("#searchDeveloperForm").submit();
    }

    function confirmSubmit(developerId, developerName, currentStatus) {
        g_developerId = developerId;
        g_developerName = developerName;
        g_currentStatus = currentStatus;
        var comfirmMessage;
        if (currentStatus) {
            comfirmMessage = "确认重新使用用户\"" + developerName + " \"";
        } else {
            comfirmMessage = "确认停止使用用户\"" + developerName + " \"";
        }
        jQuery("#message").html(comfirmMessage);
        jQuery("#infoPopup").modal();
    }

    function changeDeveloperStatus() {
        jQuery("#infoPopup").modal('hide');
        SystemDWRHandler.updateDeveloperStatus(g_developerId, g_currentStatus, function() {
            var userStatusAction = jQuery("#user_status_" + g_developerId);
            var userOptionAction = jQuery("#user_option_" + g_developerId);
            if (g_currentStatus) {
                userStatusAction.html("<span class=\"color10\">在用</span>");
                userOptionAction.html("<input type=\"button\" class=\"btn-blue-sm color1\" value=\"停止使用\" onclick=\"confirmSubmit(" + g_developerId + ",'" + g_developerName + "', false);\"/>");
            }
            else {
                userStatusAction.html("<span class=\"color7\">停止使用</span>");
                userOptionAction.html("<input type=\"button\" class=\"btn-blue-sm color1\" value=\"重新使用\" onclick=\"confirmSubmit(" + g_developerId + ",'" + g_developerName + "', true);\"/>");
            }
        });
    }
</script>
</body>
</html>