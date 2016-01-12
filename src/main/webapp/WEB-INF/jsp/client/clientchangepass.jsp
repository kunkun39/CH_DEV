<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring-form" uri="http://www.springframework.org/tags/form" %>

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

<div class="back-con">

    <jsp:include page="/WEB-INF/jsp/client/clientmenu.jsp"/>

        <div class="back-con-r fl">
            <div class="leftTab-content active">
                <h4 class="font16 ">用户修改密码</h4>

                <c:if test="${change == 1}">
                    <div class="panel-con text-center">
                        <div class="reg-icon success-icon"></div>
                            <h3>密码修改成功!</h3>
                    </div>
                </c:if>

                    <spring-form:form commandName="userPassword" class="form-horizontal" name="basic_validate" id="basic_validate" novalidate="novalidate">
                        <div class="form-body">

                                <div class="form-group">
                                    <input type="hidden" name="userId" value="${userPassword.userId}"/>
                                </div>

                                <div class="form-group">
                                    <label for=" " class="col-sm-2 control-label">用户名</label>
                                    <div class="col-sm-10">
                                        <spring-form:input path="username" class="form-control" type="text" name="required" id="required" value="${userPassword.username}" readonly="true"
                                                   maxlength="20"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for=" " class="col-sm-2 control-label">旧密码</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="oldPassword" name="oldPassword" placeholder="必填" onblur="validateOldPassword();" />
                                        <span id="old_password_error_show" class="help-block color5" style="display: none;"></span>
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for=" " class="col-sm-2 control-label">新密码</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="必填" onblur="validateNewPassword();" />
                                        <span id="new_password_error_show" class="help-block color5" style="display: none;"></span>
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for=" " class="col-sm-2 control-label">确认新密码</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="newPasswordAgain" name="newPasswordAgain" placeholder="必填" onblur="validateNewPasswordAgain();" />
                                        <span id="confirm_password_error_show" class="help-block color5" style="display: none;"></span>
                                        <span class="help-block"></span>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">&nbsp;</label>

                                    <div class="ol-sm-9">
                                        <input type="button" class="btn-blue color1" value="保  存" onclick="changePassword(${userPassword.userId}, this.form);"/>
                                    </div>
                                </div>
                        </div>

                    </spring-form:form>

            </div>
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




<script type="text/javascript">
    var oldPasswordJSValidate = false;
    var oldPasswordDBValidate = false;
    var newPasswordValidate = false;
    var confirmPasswordValidate = false;

    function validateOldPassword() {
        var password = jQuery("#oldPassword").val();
        if (password == null || password == '') {
            jQuery("#old_password_error_show").html("<i class=\"ico-error\"></i>请输入原密码!");
            jQuery("#old_password_error_show").css("display", "block");
            oldPasswordJSValidate = false;
        } else {
            jQuery("#old_password_error_show").css("display", "none");
            oldPasswordJSValidate = true;

        }
    }

    function validateOldPasswordFromDb(userId) {
        var password = jQuery("#oldPassword").val();
        SystemDWRHandler.validateClientPassword(userId, password, function(result) {
            if (result) {
                jQuery("#old_password_error_show").css("display", "none");
                oldPasswordDBValidate = true;
            } else {
                jQuery("#old_password_error_show").html("<i class=\"ico-error\"></i>你输入的原密码不正确,请重新输入!");
                jQuery("#old_password_error_show").css("display", "block");
                oldPasswordDBValidate = false;
            }
        });
    }

    function validateNewPassword() {
        var oldPassword = jQuery("#oldPassword").val();
        var newPassword = jQuery("#newPassword").val();
        if (newPassword == null || newPassword == '') {
            jQuery("#new_password_error_show").html("<i class=\"ico-error\"></i>请输入新密码!");
            jQuery("#new_password_error_show").css("display", "block");
            newPasswordValidate = false;
        } else if (newPassword == oldPassword) {
            jQuery("#new_password_error_show").html("<i class=\"ico-error\"></i>新密码不能和原密码相同!");
            jQuery("#new_password_error_show").css("display", "block");
            newPasswordValidate = false;
        } else {
            jQuery("#new_password_error_show").css("display", "none");
            newPasswordValidate = true;
        }
    }

    function validateNewPasswordAgain() {
        var confirmPassword = jQuery("#newPasswordAgain").val();
        var newPassword = jQuery("#newPassword").val();
        if (confirmPassword == null || confirmPassword == '') {
            jQuery("#confirm_password_error_show").html("<i class=\"ico-error\"></i>请输入新密码!");
            jQuery("#confirm_password_error_show").css("display", "block");
            confirmPasswordValidate = false;
        }
        else if (newPassword != confirmPassword) {
            jQuery("#confirm_password_error_show").html("<i class=\"ico-error\"></i>两次输入密码不一致!");
            jQuery("#confirm_password_error_show").css("display", "block");
            confirmPasswordValidate = false;
        }
        else {
            jQuery("#confirm_password_error_show").css("display", "none");
            confirmPasswordValidate = true;
        }
    }

    function changePassword(userId,form) {
        validateOldPassword();
        if (oldPasswordJSValidate) {
            validateOldPasswordFromDb(userId);
        }
        validateNewPassword();
        validateNewPasswordAgain();

        if (oldPasswordJSValidate && oldPasswordDBValidate && newPasswordValidate && confirmPasswordValidate) {
            form.submit();
        }
    }
</script>

</body>
</html>
