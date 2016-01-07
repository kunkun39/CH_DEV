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
                    <spring-form:input type="text" id="username" path="username" class="form-control" required="required"
                                       placeholder="请输入邮箱" onBlur="checkUserName()"/>
                    <span class="help-block color3">作为登录帐号，填写未被平台注册的邮箱</span>

                    <div class="login-help" id="error_info_username" style="display: none;"></div>

                    <p class="help-block text-danger"></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">联系人</label>

                <div class="col-sm-10">
                    <spring-form:input type="text" path="name" id="name" class="form-control" placeholder="请输入联系人姓名"/>

                    <p class="help-block text-danger"></p>
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">密码</label>

                <div class="col-sm-10">
                    <spring-form:input id="password" type="password" path="password" class="form-control"
                                       required="required" placeholder="请输入密码" onKeyUp="pwStrength(this.value)"
                                       onBlur="checkPassword()"/>
                    <table width="150px" border="0" cellspacing="0" cellpadding="0" bordercolor="#cccccc" height="23"
                           style='display:inline; padding-top: 5px;'>
                        <tr align="center" bgcolor="#eeeeee">
                            <td width="50px" id="strength_L">弱</td>
                            <td width="50px" id="strength_M">中</td>
                            <td width="50px" id="strength_H">强</td>
                        </tr>
                    </table>
                    <div class="login-help" id="error_info_password" style="display: none;"></div>
                    <p class="help-block text-danger"></p>
                </div>
            </div>
            <div class="form-group">
                <label for="passwordagain" class="col-sm-2 control-label">确认密码</label>

                <div class="col-sm-10">
                    <spring-form:input id="passwordagain" type="password" path="passwordAgain" class="form-control"
                                       required="required" placeholder="请输入密码" onBlur="checkPasswordAgain()"/>
                    <div class="login-help" id="error_info_passwordagain" style="display: none;"></div>
                        <%--<spring-form:errors path="passwordAgain" cssClass="help-block text-danger"/>--%>

                    <p class="help-block text-danger"></p>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">验证码</label>

                <div class="col-sm-10">
                    <spring-form:input type="text" id="registercode" path="registerCode" class="form-control" cssStyle="width: 100px;"
                                       required="required" maxlength="4" onBlur="checkRegisterCodeRight()"/>
                    <img id="imageCode" src="${pageContext.request.contextPath}/chapp/userregistercode.html"/></span>
                    &nbsp;<a href="javascript:;" onclick="imageChange()">看不清，换一张</a>

                    <div class="login-help" id="error_info_registercode" style="display: none;"></div>
                    <p class="help-block text-danger"></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">&nbsp;</label>

                <label class="col-sm-10">
                    <spring-form:checkbox id="agreecondition" path="agreeCondition" cssStyle="width: 30px;" required="required" onblur="checkAgreeCondition()"/>
                    我已阅读并接受 <a target="_blank" href="${pageContext.request.contextPath}/chapp/agreecondition.html"
                               class="color4"><label>《广电用户协议》</label></a>
                </label>


                <div class="login-help" id="error_info_agreecondition" cssStyle="width: 30px;" style="display: none;"></div>
                <p class="help-block text-danger"></p>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">&nbsp;</label>

                <div class="col-sm-10">
                    <div id="success"></div>
                    <button type="button" class="btn-blue color1" onclick="checkFormInput(this.form)">注 册</button>
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
<script src="${pageContext.request.contextPath}/javascript/passwordstrong.js"></script>
<script src="${pageContext.request.contextPath}/dwr/engine.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/dwr/util.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/dwr/interface/SystemDWRHandler.js" type="text/javascript"></script>

<script type="text/javascript">
    var usernameState = 1;
    var passwordChecked = false;
    var passwordagainChecked = false;
    var registercodeChecked = false;
    var agreeconditionChecked = false;

    //切换验证码图片
    function imageChange() {
        var img = document.getElementById("imageCode");
        img.src = "${pageContext.request.contextPath}/chapp/userregistercode.html?" + Math.random();
    }
    /**
     * 检测表单输入信息
     **/
    function checkFormInput(form) {
        var cansubmit = true;
        //用户邮箱检查
        if (usernameState == 0) {
            $("#error_info_username").css("display", "none");
        } else {
            cansubmit = false;
            $("#error_info_username").css("display", "block");
            if (usernameState == 1) {
                $("#error_info_username").html("<span class=\"help-block color5\"><i class=\"ico-error\"></i>用户账号不能为空!</span>");
            } else if (usernameState == 2) {
                $("#error_info_username").html("<span class=\"help-block color5\"><i class=\"ico-error\"></i>用户账号格式不正确!</span>");
            } else if (usernameState == 3) {
                $("#error_info_username").html("<span class=\"help-block color5\"><i class=\"ico-error\"></i>用户已存在!</span>");
            }
        }
        //密码检查
        if (passwordChecked) {
            $("#error_info_password").css("display", "none");
        } else {
            cansubmit = false;
            $("#error_info_password").html("<span class=\"help-block color5\"><i class=\"ico-error\"></i>请输入6到18位密码!</span>");
            $("#error_info_password").css("display", "block");
        }
        //确认密码
        if (passwordagainChecked) {
            $("#error_info_passwordagain").css("display", "none");
        } else {
            cansubmit = false;
            $("#error_info_passwordagain").html("<span class=\"help-block color5\"><i class=\"ico-error\"></i>确认密码填写有误!</span>");
            $("#error_info_passwordagain").css("display", "block");
        }
        //验证码
        if (registercodeChecked) {
            $("#error_info_registercode").css("display", "none");
        } else {
            cansubmit = false;
            $("#error_info_registercode").html("<span class=\"help-block color5\"><i class=\"ico-error\"></i>验证码填写有误!</span>");
            $("#error_info_registercode").css("display", "block");
        }
        if (agreeconditionChecked) {
            $("#error_info_agreecondition").css("display", "none");//协议没同意
        } else {
            cansubmit = false;
            $("#error_info_agreecondition").html("<span class=\"help-block color5\" ><i class=\"ico-error\"></i>请先阅读并同意协议!</span>");
            $("#error_info_agreecondition").css("display", "block");
        }
        if (cansubmit) {
            form.submit();
        }
    }
    /**
     *校验用户名，
     * @param username
     * @returns {boolean} true:校验通过，false；有问题，不通过
     */
    function checkUserName() {
        var username = $("#username").val();//邮箱
        if (username == null || username == "") {
            $("#error_info_username").html("<span class=\"help-block color5\"><i class=\"ico-error\"></i>用户账号不能为空!</span>");
            $("#error_info_username").css("display", "block");
            usernameState = 1;
            return;
        }
        //校验用户邮箱格式
        SystemDWRHandler.checkUserNameRight(username, function (result) {
            usernameState = result;
            if (result == 2) {//返回1格式不对
                $("#error_info_username").html("<span class=\"help-block color5\"><i class=\"ico-error\"></i>账号格式不正确!</span>");
                $("#error_info_username").css("display", "block");
            } else if (result == 3) {//返回2用户名已存在
                $("#error_info_username").html("<span class=\"help-block color5\"><i class=\"ico-error\"></i>账号已存在!</span>");
                $("#error_info_username").css("display", "block");
            } else {//返回0 正常通过
                $("#error_info_username").css("display", "none");
            }
        });
    }
    /**
     *校验密码
     * @returns {boolean} true:校验通过
     */
    function checkPassword() {
        var password = $("#password").val();//密码
        if (password == null || password == "" || password.length < 6 || password.length > 18) {
            $("#error_info_password").html("<span class=\"help-block color5\"><i class=\"ico-error\"></i>请输入6到18位密码!</span>");
            $("#error_info_password").css("display", "block");
            passwordChecked = false;
        } else {
            $("#error_info_password").css("display", "none");
            passwordChecked = true;
        }
    }
    /**
     *校验确认密码
     * @returns {boolean} true：校验通过
     */
    function checkPasswordAgain() {
        var password = $("#password").val();//密码
        var passwordagain = $("#passwordagain").val();//确认密码
        if (passwordagain == null || passwordagain == "" || passwordagain.length < 6 || passwordagain.length > 18) {
            $("#error_info_passwordagain").html("<span class=\"help-block color5\"><i class=\"ico-error\"></i>请输入6到18位密码!</span>");
            $("#error_info_passwordagain").css("display", "block");
            passwordagainChecked = false;
            return;
        }
        if (password != passwordagain) {
            $("#error_info_passwordagain").html("<span class=\"help-block color5\"><i class=\"ico-error\"></i>确认密码和密码不一致!</span>");
            $("#error_info_passwordagain").css("display", "block");
            passwordagainChecked = false;
        } else {
            $("#error_info_passwordagain").css("display", "none");
            passwordagainChecked = true;
        }
    }
    /**
     *检查验证码是否正常
     */
    function checkRegisterCodeRight() {
        var registercode = $("#registercode").val();//验证码
        SystemDWRHandler.checkRegisterCodeRight(registercode, function (result) {
            if (result) {
                $("#error_info_registercode").css("display", "none");
                registercodeChecked = true;
            } else {
                $("#error_info_registercode").html("<span class=\"help-block color5\"><i class=\"ico-error\"></i>验证码不正确!</span>");
                $("#error_info_registercode").css("display", "block");
                registercodeChecked = false;
            }
        });
    }
    /*
     *协议同意框是否选中
     */
    function checkAgreeCondition() {
        var checkbox = document.getElementById("agreecondition");
        if (checkbox.checked == true) {
            $("#error_info_agreecondition").css("display", "none");
            agreeconditionChecked = true;
        } else {
            $("#error_info_agreecondition").html("<span class=\"help-block color5\" ><i class=\"ico-error\"></i>请先阅读并同意协议!</span>");
            $("#error_info_agreecondition").css("display", "block");
            agreeconditionChecked = false;
        }
    }
</script>

</body>
</html>
