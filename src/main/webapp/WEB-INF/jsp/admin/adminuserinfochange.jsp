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

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            修改个人信息
        </div>
        <form id="changepersionalinfoForm" class="form-horizontal" action="${pageContext.request.contextPath}/security/adminuserinfosubmit.html" method="post">
            <div class="form-body">
                <input id="oldContactway" name="oldContactway" type="hidden" value="${user.contactWay}"/>
                <div class="form-group">
                    <label for=" " class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputName" value="${user.username}" readonly="true"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 control-label">联系方式</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputContactWay" name="contactway" value="${user.contactWay}" placeholder="请输入邮箱等其他联系方式" onblur="validateContactWay();" />
                        <span id="contactWay_error_show" class="help-block color5" style="display: none;"></span>
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">&nbsp;</label>
                    <div class="col-sm-10">
                        <a href="${pageContext.request.contextPath}/security/adminuserinfo.html">
                            <input type="button" class="btn-blue color1" value="返  回"/>
                        </a>
                        <input type="button" class="btn-blue color1" value="确认修改" onclick="changeUserInfo(this.form);" />
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<%--结尾菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>
<script src="${pageContext.request.contextPath}/javascript/jquery.js"></script>
<script type="text/javascript">
    var contactWayValidate = false;
    function validateContactWay() {
        var oldContactway = jQuery("#oldContactway").val();
        var contactWay = jQuery("#inputContactWay").val();
        if (contactWay == null || contactWay == '') {
            jQuery("#contactWay_error_show").html("<i class=\"ico-error\"></i>请输入联系方式！");
            jQuery("#contactWay_error_show").css("display", "block");
        } else if(oldContactway == contactWay) {
            jQuery("#contactWay_error_show").html("<i class=\"ico-error\"></i>请输入不同的联系方式！");
            jQuery("#contactWay_error_show").css("display", "block");
        } else {
            jQuery("#contactWay_error_show").css("display", "none");
            contactWayValidate = true;
        }
    }

    function changeUserInfo(form) {
        validateContactWay();
        if (contactWayValidate) {
            form.submit();
        }
    }
</script>
</body>
</html>