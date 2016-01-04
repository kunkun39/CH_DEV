<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring-form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html class="activity-no">
<head>
    <title>开发者应用接入平台注册</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/backstage.css">
</head>

<body>
<%--开头菜单部分***********************************************************--%>
<jsp:include page="/WEB-INF/decorators/header.jsp"/>

<div class="container reg-content">
    <div class="panel panel-default">
        <div class="panel-heading">
            注册
        </div>
        <form class="form-horizontal" role="form">
            <div class="form-body">
                <div class="form-group">
                    <label for=" " class="col-sm-2 control-label">邮箱</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" id=" " placeholder="请输入邮箱">
                        <span class="help-block color3">作为登录帐号，填写未被平台注册的邮箱</span>
                    </div>
                </div>
                <div class="form-group">
                    <label for=" " class="col-sm-2 control-label">联系人</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputName" placeholder="请输入邮箱">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 control-label">密码</label>

                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="inputPassword" placeholder="请输入密码">
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 control-label">确认密码</label>

                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="inputPasswordSure" placeholder="请输入密码">
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 control-label">验证码</label>

                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="inputPassCode" placeholder="请输入密码">
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">&nbsp;</label>

                    <div class="col-sm-10">
                        <img src="images/check-image.jpg" width="130" height="53"/>
                        <a class="color4" href="javascript:void(0)">换一张</a>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">&nbsp;</label>
                    <label class="col-sm-10">
                        <input type="checkbox">我已接受<a href="#" class="color4">广电协议</a>
                    </label>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">&nbsp;</label>

                    <div class="col-sm-10">
                        <input type="button" class="btn-blue btn-disabled" value="确认修改"/>
                        <input type="button" class="btn-blue color1" value="确认修改"/>
                    </div>
                </div>

            </div>
        </form>

    </div>
</div>

<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<%--Javascript部分***********************************************************--%>
<script src="${pageContext.request.contextPath}/javascript/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/passwordstrong.js"></script>
<script type="text/javascript">
    function imageChange() {
        var img = document.getElementById("imageCode");
        img.src = "${pageContext.request.contextPath}/user/registercode.html?" + Math.random();
    }
</script>

</body>
</html>
