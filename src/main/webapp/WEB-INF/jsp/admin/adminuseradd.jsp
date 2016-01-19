<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring-form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <style type="text/css">
        .float-left {
            float: left;
        }

        .float-left-space {
            float: left;
            margin-left: 15px;
        }
    </style>
</head>
<body>
<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/header.jsp" />

<%--正文部分**************************************************************--%>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            添加系统用户
        </div>
        <spring-form:form id="adminUserForm" commandName="adminUser" cssClass="form-horizontal" method="post">
            <div class="form-body">
                <div class="form-group">
                    <label for=" " class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-10">
                        <spring-form:input type="text" class="form-control" id="inputUserName" path="username" placeholder="请输入用户名" onblur="onblurValidateUserName(event,this.form);"/>
                        <spring-form:errors path="username" class="help-block color5"/>
                        <span id="username_error_show" class="help-block color5" style="display: none;"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for=" " class="col-sm-2 control-label">姓名</label>
                    <div class="col-sm-10">
                        <spring-form:input type="text" class="form-control" id="inputName" path="name" placeholder="请输入姓名" onblur="onblurValidateName(event,this.form);"/>
                        <spring-form:errors path="name" class="help-block color5"/>
                        <span id="name_error_show" class="help-block color5" style="display: none;"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for=" " class="col-sm-2 control-label">联系方式</label>
                    <div class="col-sm-10">
                        <spring-form:input type="text" class="form-control float-left" id=" " path="contactWay" placeholder="请输入邮箱等其他联系方式"/>
                        <span class="help-block color3 float-left-space"><i class="ico-prompt"></i>(选填)</span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-10">
                        <spring-form:input type="password" class="form-control" id="inputPassword" path="password" placeholder="请输入密码" onblur="onblurValidatePassword(event,this.form);" />
                        <spring-form:errors path="password" class="help-block color5"/>
                        <span id="password_error_show" class="help-block color5" style="display: none;"></span>
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 control-label">确认密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="inputConfirmPassword" placeholder="请再次输入密码" onblur="onblurValidateConfrimPassword(event,this.form);">
                        <span id="confirm_password_error_show" class="help-block color5" style="display: none;"></span>
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">&nbsp;</label>
                    <div class="col-sm-10">
                        <input type="button" class="btn-blue color1" value="返  回" onclick="window.location.href = '${pageContext.request.contextPath}/security/adminusers.html'" />
                        <input type="button" id="submitButton" class="btn-blue color1" value="确认添加" onclick="userInfoSubmit(this.form);" />
                    </div>
                </div>
            </div>
        </spring-form:form>
    </div>
</div>

<%--结尾菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<%--Javascript部分***********************************************************--%>
<jsp:include page="/WEB-INF/decorators/jsheader.jsp"/>
<script src="${pageContext.request.contextPath}/dwr/engine.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/dwr/util.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/dwr/interface/SystemDWRHandler.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/javascript/browserdiff.js"></script>
<script type="text/javascript">
    var userNameValidate = false;
    var nameValidate = false;
    var passwordValidate = false;
    var confirmPasswordValidate = false;
    var userNameDuplicate = false;

    function onblurValidateUserName(e, form) {
        var triggerId = getEventTriggerId(e);

        if (triggerId == 'submitButton') {
            userInfoSubmit(form);
        } else {
            validateUserName();
        }
    }

    function validateUserName() {
        var userName = jQuery("#inputUserName").val();
        if (userName == null || userName == '') {
            jQuery("#username_error_show").html("<i class=\"ico-error\"></i>请输入用户名！");
            jQuery("#username_error_show").css("display", "block");
        }
        else {
            userNameValidate = true;
            SystemDWRHandler.validateUserNameDuplicate(userName, function(result) {
                if (result) {
                    jQuery("#username_error_show").html("<i class=\"ico-error\"></i>该用户名已存在,请重新输入！");
                    jQuery("#username_error_show").css("display", "block");
                }
                else {
                    jQuery("#username_error_show").css("display", "none");
                    userNameDuplicate = true;
                }
            });
        }
    }

    function onblurValidateName(e, form) {
        var triggerId = getEventTriggerId(e);

        if (triggerId == 'submitButton') {
            userInfoSubmit(form);
        } else {
            validateName();
        }
    }

    function validateName() {
        var name = jQuery("#inputName").val();
        if (name == null || name == '') {
            jQuery("#name_error_show").html("<i class=\"ico-error\"></i>请输入姓名！");
            jQuery("#name_error_show").css("display", "block");
        }
        else {
            jQuery("#name_error_show").css("display", "none");
            nameValidate = true;
        }
    }

    function onblurValidatePassword(e, form) {
        var triggerId = getEventTriggerId(e);

        if (triggerId == 'submitButton') {
            userInfoSubmit(form);
        } else {
            validatePassword();
        }
    }

    function validatePassword() {
        var password = jQuery("#inputPassword").val();
        if (password == null || password == '') {
            jQuery("#password_error_show").html("<i class=\"ico-error\"></i>请输入密码！");
            jQuery("#password_error_show").css("display", "block");
        }
        else {
            jQuery("#password_error_show").css("display", "none");
            passwordValidate = true;
        }
    }

    function onblurValidateConfrimPassword(e, form) {
        var triggerId = getEventTriggerId(e);

        if (triggerId == 'submitButton') {
            userInfoSubmit(form);
        } else {
            validateConfrimPassword();
        }
    }

    function validateConfrimPassword() {
        var confirmPassword = jQuery("#inputConfirmPassword").val();
        var password = jQuery("#inputPassword").val();
        if (confirmPassword == null || confirmPassword == '') {
            jQuery("#confirm_password_error_show").html("<i class=\"ico-error\"></i>请输入密码！");
            jQuery("#confirm_password_error_show").css("display", "block");
        }
        else if (password != confirmPassword) {
            jQuery("#confirm_password_error_show").html("<i class=\"ico-error\"></i>两次密码不一致！");
            jQuery("#confirm_password_error_show").css("display", "block");
        }
        else {
            jQuery("#confirm_password_error_show").css("display", "none");
            confirmPasswordValidate = true;
        }
    }

    function onblurValidateAuthCode(e, form) {
        var triggerId = getEventTriggerId(e);

        if (triggerId == 'submitButton') {
            userInfoSubmit(form);
        } else {
            validateAuthCode();
        }
    }

    function validateAuthCode() {
        var authCode = jQuery("#inputAuthCode").val();
        if (authCode == null || authCode == '') {
            jQuery("#auth_code_error_show").html("<i class=\"ico-error\"></i>请输入验证码！");
            jQuery("#confirm_password_error_show").css("display", "block");
        }
        else {
            jQuery("#confirm_password_error_show").css("display", "none");
            authCodeValidate = true;
        }
    }

    function userInfoSubmit(form) {
        if (!userNameValidate) {
            jQuery("#username_error_show").html("<i class=\"ico-error\"></i>请输入用户名！");
            jQuery("#username_error_show").css("display", "block");
        }
        else if (!userNameDuplicate) {
            jQuery("#username_error_show").html("<i class=\"ico-error\"></i>该用户名已存在,请重新输入！");
            jQuery("#username_error_show").css("display", "block");
        }
        else {
            jQuery("#username_error_show").css("display", "none");
        }
        validateName();
        validatePassword();
        validateConfrimPassword();

        if (userNameValidate && nameValidate && passwordValidate && confirmPasswordValidate && userNameDuplicate) {
            form.submit();
        }
    }
</script>
</body>
</html>