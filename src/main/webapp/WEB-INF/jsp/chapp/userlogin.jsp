<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html class="activity-no">
<head>
    <title>开发者应用接入平台登录</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/backstage.css">

    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/javascript/vendor/html5.min.js"></script>
    <script src="${pageContext.request.contextPath}/javascript/vendor/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<%--开头菜单部分***********************************************************--%>
<jsp:include page="/WEB-INF/decorators/header.jsp"/>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            登录
        </div>
        <form class="form-horizontal" id="contactForm" action="${pageContext.request.contextPath}/j_spring_security_check" method="post">
            <div class="form-body">
                <div class="form-group">
                    <label for="j_username" class="col-sm-2 control-label">邮箱</label>

                    <div class="col-sm-10">
                        <input type="text" id="j_username" name="j_username" class="form-control" required="required" placeholder="请输入邮箱">
                    </div>
                </div>
                <div class="form-group">
                    <label for="j_password" class="col-sm-2 control-label">密码</label>

                    <div class="col-sm-10">
                        <input type="password" id="j_password" name="j_password" class="form-control" required="required" placeholder="请输入密码">
                    </div>
                </div>
                <div class="form-group">
                    <label for="registerCode" class="col-sm-2 control-label">验证码</label>

                    <div class="col-sm-10">
                        <input type="text" name="registerCode" class="form-control" onkeyup="inputOnkeyDown(this.form)" required="required" id="registerCode" placeholder="请输入验证码" maxlength="4">
                        <br/>
                        <img id="imageCode" src="${pageContext.request.contextPath}/chapp/userregistercode.html"/></span>
                        &nbsp;<a href="javascript:void(0);" onclick="imageChange()">看不清，换一张</a>

                        <p class="help-block text-danger"></p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">&nbsp;</label>

                    <div class="col-sm-10">
                        <input type="button" class="btn-yellow color1" value="注册" onclick="registerClient();"/>
                        <input type="button" class="btn-blue color1" value="登录" onclick="loginClient(this.form);"/>
                        <br/>

                        <div class="login-help" id="error_info" style="display: none;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">&nbsp;</label>

                        <div class="col-sm-10">
                            <a href="${pageContext.request.contextPath}/chapp/usertopwdlookback.html" class="color4">忘记密码？</a>
                        </div>
                    </div>

                </div>
            </div>
        </form>

    </div>
</div>

<%--结尾菜单部分***********************************************************--%>
<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<%--Javascript部分***********************************************************--%>
<script src="${pageContext.request.contextPath}/javascript/jquery.js"></script>
<script src="${pageContext.request.contextPath}/dwr/engine.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/dwr/util.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/dwr/interface/SystemDWRHandler.js" type="text/javascript"></script>

<script type="text/javascript">
    function registerClient() {
        window.location.href = "${pageContext.request.contextPath}/chapp/userregister.html";
    }
    //验证码输入框按回车键响应登录
    function inputOnkeyDown(form) {
        var e = window.event || arguments.callee.caller.arguments[0];
        if (e && e.keyCode == 13) {
            loginClient(form);
        }
    }

    function loginClient(form) {
        var j_username = jQuery("#j_username").val();
        var j_password = jQuery("#j_password").val();
        var register_code = jQuery("#registerCode").val();
        if (j_username == null || j_username == '' || j_password == null || j_password == '' || register_code == null || register_code == '') {
            jQuery("#error_info").html("<span class=\"help-block color5\"><i class=\"ico-error\"></i>对不起，登录信息不完整!</span>");
            jQuery("#error_info").css("display", "block");
        } else {
            SystemDWRHandler.checkUserLogin(j_username, j_password, register_code, function (result) {
                if (result == 0) {
                    jQuery("#error_info").css("display", "none");
                    form.submit();
                } else {
                    var errortext = "";
                    if (result == 1) {
                        errortext = "对不起，验证码不正确!"
                    } else if (result == 2) {
                        errortext = "对不起，邮箱未验证!";
                    } else if (result == 3) {
                        errortext = "对不起，账号已被禁用!";
                    } else if (result == 4) {
                        errortext = "对不起，用户名或密码不正确!";
                    } else if (result == 5) {
                        errortext = "对不起，账号未注册!";
                    }
                    jQuery("#error_info").html("<span class=\"help-block color5\"><i class=\"ico-error\"></i>"+errortext+"</span>");
                    jQuery("#error_info").css("display", "block");
                }

            });
        }

    }

    function imageChange() {
        var img = document.getElementById("imageCode");
        img.src = "${pageContext.request.contextPath}/chapp/userregistercode.html?" + Math.random();
    }

    function checkPwdisRight() {
        var iserror =${LAST_LOGIN_FAILED != null};
        if (iserror) {
            jQuery("#error_info").html("<span class=\"help-block color5\"><i class=\"ico-error\"></i>对不起, 用户名或者密码不正确!</span>");
            jQuery("#error_info").css("display", "block");
        } else {
            jQuery("#error_info").css("display", "none");
        }
    }
    window.onload = checkPwdisRight
</script>
</body>

</html>