<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html class="activity-no">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta content="长虹开发者应用接入平台" name="keywords">
    <meta content="长虹开发者应用接入平台" name="description">
    <title>开发者应用接入平台注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/backstage.css">
</head>
<body>
<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/header.jsp" />

<%--正文部分**************************************************************--%>

<div class="container reg-content">
    <div class="panel panel-default">
        <div class="panel-heading">
            修改密码
        </div>
        <form id="changepersionalinfoForm" class="form-horizontal" action="${pageContext.request.contextPath}/security/adminuserinfosubmit.html" method="post">
            <div class="form-body">
                <div class="form-group">
                    <label for=" " class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputName" value="${user.username}" readonly="true"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 control-label">原密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="inputOldPassword" name="oldpwd" placeholder="请输入原密码" onblur="validateOldPassword(${user.id});" />
                        <span id="old_password_error_show" class="help-block color5" style="display: none;"></span>
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 control-label">新密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="inputNewPassword" name="newpwd" placeholder="请输入新密码" onblur="validateNewPassword();" />
                        <span id="new_password_error_show" class="help-block color5" style="display: none;"></span>
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 control-label">确认新密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="inputConfirmPassword" name="confirmpwd" placeholder="请再次输入新密码" onblur="validateConfrimPassword();">
                        <span id="confirm_password_error_show" class="help-block color5" style="display: none;"></span>
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">&nbsp;</label>
                    <div class="col-sm-10">
                        <a href="${pageContext.request.contextPath}/security/adminuserinfo.html">
                            <input type="button" class="btn-blue color1" value="返  回"/>
                        </a>
                        <input type="button" class="btn-blue color1" value="确认修改" onclick="changePassword(this.form);" />
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<%--结尾菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<script src="${pageContext.request.contextPath}/javascript/jquery.js"></script>
<script src="${pageContext.request.contextPath}/dwr/engine.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/dwr/util.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/dwr/interface/SystemDWRHandler.js" type="text/javascript"></script>
<script type="text/javascript">
    var oldPasswordJSValidate = false;
    var oldPasswordDBValidate = false;
    var newPasswordValidate = false;
    var confirmPasswordValidate = false;

    function validateOldPassword(userId) {
        var password = jQuery("#inputOldPassword").val();
        if (password == null || password == '') {
            jQuery("#old_password_error_show").html("<i class=\"ico-error\"></i>请输入原密码!");
            jQuery("#old_password_error_show").css("display", "block");
        } else {
            oldPasswordJSValidate = true;
            SystemDWRHandler.validatePassword(userId, password, function(result) {
                if (result) {
                    jQuery("#old_password_error_show").css("display", "none");
                    oldPasswordDBValidate = true;
                } else {
                    jQuery("#old_password_error_show").html("<i class=\"ico-error\"></i>你输入的原密码不正确,请重新输入!");
                    jQuery("#old_password_error_show").css("display", "block");
                }
            });
        }
    }

    function validateNewPassword() {
        var oldPassword = jQuery("#inputOldPassword").val();
        var newPassword = jQuery("#inputNewPassword").val();
        if (newPassword == null || newPassword == '') {
            jQuery("#new_password_error_show").html("<i class=\"ico-error\"></i>请输入新密码!");
            jQuery("#new_password_error_show").css("display", "block");
        } else if (newPassword != oldPassword) {
            jQuery("#new_password_error_show").html("<i class=\"ico-error\"></i>新密码不能和原密码相同!");
            jQuery("#new_password_error_show").css("display", "block");
        } else {
            jQuery("#new_password_error_show").css("display", "none");
            newPasswordValidate = true;
        }
    }

    function validateConfrimPassword() {
        var confirmPassword = jQuery("#inputConfirmPassword").val();
        var newPassword = jQuery("#inputNewPassword").val();
        if (confirmPassword == null || confirmPassword == '') {
            jQuery("#confirm_password_error_show").html("<i class=\"ico-error\"></i>请输入新密码!");
            jQuery("#confirm_password_error_show").css("display", "block");
        }
        else if (newPassword != confirmPassword) {
            jQuery("#confirm_password_error_show").html("<i class=\"ico-error\"></i>两次密码不一致!");
            jQuery("#confirm_password_error_show").css("display", "block");
        }
        else {
            jQuery("#confirm_password_error_show").css("display", "none");
            confirmPasswordValidate = true;
        }
    }

    function changePassword(form) {
        if (!oldPasswordJSValidate) {
            jQuery("#old_password_error_show").html("<i class=\"ico-error\"></i>请输入原密码!");
            jQuery("#old_password_error_show").css("display", "block");
        }
        else if (!oldPasswordDBValidate) {
            jQuery("#old_password_error_show").html("<i class=\"ico-error\"></i>你输入的原密码不正确,请重新输入!");
            jQuery("#old_password_error_show").css("display", "block");
        }
        else {
            jQuery("#old_password_error_show").css("display", "none");
        }

        validateNewPassword();
        validateConfrimPassword();

        if (oldPasswordJSValidate && oldPasswordDBValidate && newPasswordValidate && confirmPasswordValidate) {
            form.submit();
        }
    }
</script>
</body>
</html>