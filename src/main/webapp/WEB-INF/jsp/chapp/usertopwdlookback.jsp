<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html class="activity-no">
<head>
    <title>开发者应用接入平台密码找回</title>
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
            密码找回
        </div>
        <form class="form-horizontal" id="contactForm" action="" method="post">
            <div class="form-body">
                <div class="form-group">
                    <label for="username" class="col-sm-2 control-label">邮箱</label>

                    <div class="col-sm-10">
                        <input type="text" id="username" name="username" class="form-control" required="required" placeholder="请输入邮箱" onblur="checkUserName()">
                        <span id="error_info_username" class="help-block color5 " style="display: none;"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">&nbsp;</label>

                    <div class="col-sm-10">
                        <input type="button" class="btn-blue color1" value="发送邮件" onclick="doSubmit(this.from)"/>
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
    var usernameState = 1;//1为空；2格式不对；3账号存在；0账号不存在还未注册

    /**
     * 检测表单输入信息
     **/
    function doSubmit(form) {
        var cansubmit = true;
        //用户邮箱检查
        if (usernameState == 3) {
            jQuery("#error_info_username").css("display", "none");
        } else {
            cansubmit = false;
            jQuery("#error_info_username").css("display", "block");
            if (usernameState == 1) {
                jQuery("#error_info_username").html("<i class=\"ico-error\"></i>用户邮箱不能为空!");
            } else if (usernameState == 2) {
                jQuery("#error_info_username").html("<i class=\"ico-error\"></i>用户邮箱格式不正确!");
            } else if (usernameState == 0) {
                jQuery("#error_info_username").html("<i class=\"ico-error\"></i>该邮箱还未注册!");
            }
        }

        if (cansubmit) {
            window.location.href = "${pageContext.request.contextPath}/chapp/userMailSend.html?usernamenormal=" + jQuery("#username").val() + "&mailtype=1";
        }
    }
    /**
     *校验用户名，
     * @param username
     * @returns {boolean} true:校验通过，false；有问题，不通过
     */
    function checkUserName() {
        var username = jQuery("#username").val();//邮箱
        if (username == null || username == "") {
            jQuery("#error_info_username").css("display", "block");
            jQuery("#error_info_username").html("<i class=\"ico-error\"></i>用户邮箱不能为空!");
            usernameState = 1;
            return;
        }
        //校验用户邮箱格式
        SystemDWRHandler.checkUserNameRight(username, function (result) {
            usernameState = result;
            if (result == 2) {//返回2格式不对
                jQuery("#error_info_username").html("<i class=\"ico-error\"></i>用户邮箱格式不正确!");
                jQuery("#error_info_username").css("display", "block");
            } else if (result == 3) {//返回3用户名已存在
                jQuery("#error_info_username").css("display", "none");
            } else {//返回0账号不存在
                jQuery("#error_info_username").html("<i class=\"ico-error\"></i>该邮箱还未注册!");
                jQuery("#error_info_username").css("display", "block");
            }
        });
    }

</script>
</body>

</html>