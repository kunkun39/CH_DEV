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
<%--中间内容部分***********************************************************--%>
<div class="container reg-content">
    <div class="panel panel-default">
        <div class="panel-heading">
            注册
        </div>
        <spring-form:form id="registerForm" commandName="user" method="post" class="form-horizontal" role="form">
        <div class="form-body">
            <div class="form-group">
                <label class="col-sm-2 control-label">邮箱</label>

                <div class="col-sm-10">
                    <spring-form:input type="text" path="username" class="form-control" required="required"
                                       placeholder="请输入邮箱"/>
                    <span class="help-block color3">作为登录帐号，填写未被平台注册的邮箱</span>
                    <spring-form:errors path="username" cssClass="help-block text-danger"/>

                    <p class="help-block text-danger"></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">联系人</label>

                <div class="col-sm-10">
                    <spring-form:input type="text" path="name" class="form-control" required="required" id="inputName"
                                       placeholder="请输入联系人姓名"/>

                    <p class="help-block text-danger"></p>
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword" class="col-sm-2 control-label">密码</label>

                <div class="col-sm-10">
                    <spring-form:input id="inputPassword" type="password" path="password" class="form-control"
                                       required="required" placeholder="请输入密码" onKeyUp="pwStrength(this.value)"
                                       onBlur="pwStrength(this.value)"/>
                    <table width="150px" border="0" cellspacing="0" cellpadding="0" bordercolor="#cccccc" height="23"
                           style='display:inline; padding-top: 5px;'>
                        <tr align="center" bgcolor="#eeeeee">
                            <td width="50px" id="strength_L">弱</td>
                            <td width="50px" id="strength_M">中</td>
                            <td width="50px" id="strength_H">强</td>
                        </tr>
                    </table>

                    <p class="help-block text-danger"></p>
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword" class="col-sm-2 control-label">确认密码</label>

                <div class="col-sm-10">
                    <spring-form:input id="inputPassword" type="password" path="passwordAgain" class="form-control"
                                       required="required" placeholder="请输入密码"/>
                    <spring-form:errors path="passwordAgain" cssClass="help-block text-danger"/>

                    <p class="help-block text-danger"></p>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">验证码</label>

                <div class="col-sm-10">
                    <spring-form:input type="text" path="registerCode" class="form-control" cssStyle="width: 100px;"
                                       required="required" maxlength="4"/>
                    <img id="imageCode" src="${pageContext.request.contextPath}/chapp/userregistercode.html"/></span>
                    &nbsp;<a href="javascript:;" onclick="imageChange()">看不清，换一张</a>
                    <spring-form:errors path="registerCode" cssClass="help-block text-danger"/>

                    <p class="help-block text-danger"></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">&nbsp;</label>
                <label class="col-sm-10">
                    <spring-form:checkbox path="agreeCondition" cssStyle="width: 30px;" required="required"/>
                    我已阅读并接受 <a target="_blank" href="${pageContext.request.contextPath}/chapp/agreecondition.html"
                               class="color4"><label>《广电用户协议》</label></a>
                </label>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">&nbsp;</label>

                <div class="col-sm-10">
                    <div id="success"></div>
                    <button type="submit" class="btn-blue color1">注 册</button>

                </div>
            </div>
        </div>
    </div>

    </spring-form:form>
</div>
</div>
</div>

<%--结尾菜单部分***********************************************************--%>
<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<%--Javascript部分***********************************************************--%>
<script src="${pageContext.request.contextPath}/javascript/jquery.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/passwordstrong.js"></script>
<script type="text/javascript">
    function imageChange() {
        var img = document.getElementById("imageCode");
        img.src = "${pageContext.request.contextPath}/chapp/userregistercode.html?" + Math.random();
    }
</script>

</body>
</html>
