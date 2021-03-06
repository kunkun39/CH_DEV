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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta content="长虹开发者应用接入平台" name="keywords">
    <meta content="长虹开发者应用接入平台" name="description">
    <title>开发者应用接入平台注册</title>
    <jsp:include page="/WEB-INF/decorators/cssheader.jsp" />

</head>
<body>
<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/header.jsp" />

<%--正文部分**************************************************************--%>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            修改个人信息
        </div>
        <form id="changepersionalinfoForm" class="form-horizontal" action="${pageContext.request.contextPath}/security/adminuserinfosubmit.html" method="post">
            <div class="form-body">
                <input id="oldName" name="oldName" type="hidden" value="${user.name}"/>
                <input id="oldContactway" name="oldContactway" type="hidden" value="${user.contactWay}"/>
                <div class="form-group">
                    <label for=" " class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputUserName" value="${user.username}" readonly="true"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 control-label">姓名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="intputName" name="name" value="${user.name}" placeholder="请输入姓名" onblur="onblurValidateName(event,this.form);" />
                        <span id="name_error_show" class="help-block color5" style="display: none;"></span>
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 control-label">联系方式</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputContactWay" name="contactway" value="${user.contactWay}" placeholder="请输入邮箱等其他联系方式" onblur="onblurValidateContactWay(event,this.form);" />
                        <span id="contactWay_error_show" class="help-block color5" style="display: none;"></span>
                        <span class="help-block"></span>
                    </div>
                </div>
                <input type="button" id="test" class="emptybutton"/>
                <div class="form-group">
                    <label class="col-sm-2 control-label">&nbsp;</label>
                    <div class="col-sm-10">
                        <input type="button" id="cancelButton" class="btn-blue color1" value="返  回" onclick="window.location.href = '${pageContext.request.contextPath}/security/adminuserinfo.html'"/>
                        <input type="button" id="submitButton" class="btn-blue color1" value="确认修改" onclick="changeUserInfo(this.form);" />
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<%--结尾菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<%--Javascript部分***********************************************************--%>
<jsp:include page="/WEB-INF/decorators/jsheader.jsp"/>
<script type="text/javascript">
    var contactWayValidate = false;
    var nameValidate = false;

    function onblurValidateContactWay(e, form) {
        var triggerId = getEventTriggerId(e);
        if (triggerId == 'submitButton') {
            changeUserInfo(form);
        } else if (triggerId == 'cancelButton') {
            return;
        } else {
            validateContactWay();
        }
    }

    function validateContactWay() {
        var oldContactway = jQuery("#oldContactway").val();
        var contactWay = jQuery("#inputContactWay").val();
        if (contactWay == null || contactWay == '') {
            jQuery("#contactWay_error_show").html("<i class=\"ico-error\"></i>请输入联系方式！");
            jQuery("#contactWay_error_show").css("display", "block");
        } else {
            jQuery("#contactWay_error_show").css("display", "none");
            contactWayValidate = true;
        }
    }

    function onblurValidateName(e, form) {
        var triggerId = getEventTriggerId(e);

        if (triggerId == 'submitButton') {
            changeUserInfo(form);
        } else if (triggerId == 'cancelButton') {
            return;
        } else {
            validateName();
        }
    }

    function validateName() {
        var oldName = jQuery("#oldName").val();
        var name = jQuery("#intputName").val();
        if (name == null || name == '') {
            jQuery("#name_error_show").html("<i class=\"ico-error\"></i>请输入姓名！");
            jQuery("#name_error_show").css("display", "block");
        } else {
            jQuery("#name_error_show").css("display", "none");
            nameValidate = true;
        }
    }

    function changeUserInfo(form) {
        validateContactWay();
        validateName();
        if (contactWayValidate && nameValidate) {
            var oldContactway = jQuery("#oldContactway").val();
            var contactWay = jQuery("#inputContactWay").val();
            var oldName = jQuery("#oldName").val();
            var name = jQuery("#intputName").val();
            if (oldContactway == contactWay && oldName == name) {
                jQuery("#contactWay_error_show").html("<i class=\"ico-error\"></i>姓名和联系方式至少需要修改一个！");
                jQuery("#contactWay_error_show").css("display", "block");
            } else {
                form.submit();
            }
        }
    }
</script>
</body>
</html>