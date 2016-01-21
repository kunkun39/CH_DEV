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
    <link rel="stylesheet" href="${RESOURCE_PATH}/css/bootstrap/bootstrap.min.css">
    <jsp:include page="/WEB-INF/decorators/cssheader.jsp"/>

    <style type="text/css">
        .passwordhelp-block {
            display: block;
            margin-top: 18px;
            margin-bottom: 50px;
        }

        .float-left {
            float: left;
        }

        .float-left-space {
            float: left;
            margin-left: 15px;
        }

        .form-control-agreecondition {
            width: 320px;
            display: block;
            height: 34px;
            padding: 6px 0px;
            font-size: 14px;
            line-height: 1.42857143;
            float: left;
            color: #555;
            background-color: #fff;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s
        }
    </style>
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
                    <spring-form:input type="text" id="username" path="username" class="form-control float-left" required="required"
                                       placeholder="请输入邮箱" onBlur="checkUserName()"/>
                    <span id="error_info_username" class="help-block color5 float-left-space" style="display: none;"></span>
                </div>
                <label class="col-sm-2 control-label"></label>

                <div class="col-sm-10">
                    <span class="help-block color6"><i class="ico-prompt"></i>作为登录帐号，填写未被平台注册的邮箱</span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">联系人</label>

                <div class="col-sm-10">
                    <spring-form:input type="text" path="name" id="name" maxlength="10" class="form-control" placeholder="请输入联系人姓名（选填）"/>

                </div>
                <label class="col-sm-2 control-label"></label>

                <div class="col-sm-10">
                    <span class="help-block color6"><i class="ico-prompt"></i>作为用户姓名（选填，限制10个字内）</span>
                </div>
            </div>
            <div class="form-group" style="position:relative;">
                <label for="password" class="col-sm-2 control-label">密码</label>

                <div class="col-sm-10">
                    <spring-form:input id="password" type="password" path="password" class="form-control float-left"
                                       required="required" placeholder="请输入密码" onKeyUp="pwStrength(this.value)"
                                       onBlur="checkPassword()" maxlength="18"/>
                    <span id="error_info_password" class="help-block color5 float-left-space" style="display: none;"></span>

                    <p class="passwordhelp-block text-danger"></p>
                </div>
                <br/>
                <br/>
                <br/>

                <div class="pw-tips">
                    <span class="color6 fl">安全程度：</span>

                    <div class="fl pw-safe pw-weak" style="margin-bottom: 30px;">
                        <div class="pw-bar"></div>
                        <div class="pw-letter"><span id="strength_L">弱</span><span id="strength_M">中</span><span id="strength_H">强</span></div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="passwordagain" class="col-sm-2 control-label">确认密码</label>

                <div class="col-sm-10">
                    <spring-form:input id="passwordagain" type="password" path="passwordAgain" class="form-control float-left"
                                       required="required" placeholder="请输入密码" maxlength="18" onBlur="checkPasswordAgain()"/>
                    <span id="error_info_passwordagain" class="help-block color5 float-left-space" style="display: none;"></span>

                    <p class="help-block text-danger"></p>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">验证码</label>

                <div class="col-sm-10">
                    <spring-form:input type="text" id="registercode" path="registerCode" class="form-control float-left"
                                       required="required" maxlength="4" onBlur="checkRegisterCodeRight()"/>
                    <span id="error_info_registercode" class="help-block color5 float-left-space" style="display: none;"></span>
                </div>

                <label class="col-sm-2 control-label"></label>

                <div class="col-sm-10">
                    <div style="margin-top: 20px"></div>
                    <img id="imageCode" src="${pageContext.request.contextPath}/chapp/userregistercode.html"/></span>&nbsp;<a href="javascript:;" onclick="imageChange()">看不清，换一张</a>

                    <p class="help-block text-danger"></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">&nbsp;</label>

                <label class="col-sm-10">
                    <div class="form-control-agreecondition float-left">
                        <spring-form:checkbox id="agreecondition" path="agreeCondition" cssStyle="width: 30px; float: left" required="required" onblur="checkAgreeCondition()"/>
                        <label>我已阅读并接受</label>
                        <a target="_blank" href="${pageContext.request.contextPath}/chapp/agreecondition.html" class="color4 ">
                            <label>《广电用户协议》</label>
                        </a>
                    </div>
                    <span id="error_info_agreecondition" class="help-block color5 float-left-space" style="display: none;"></span>
                </label>


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
<jsp:include page="/WEB-INF/decorators/jsheader.jsp"/>
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
        if (usernameState == 3) {
            jQuery("#error_info_username").css("display", "none");
        } else {
            cansubmit = false;
            jQuery("#error_info_username").css("display", "block");
            if (usernameState == 1) {
                jQuery("#error_info_username").html("<i class=\"ico-error\"></i>用户账号不能为空!");
            } else if (usernameState == 2) {
                jQuery("#error_info_username").html("<i class=\"ico-error\"></i>用户账号格式不正确!");
            } else if (usernameState == 4 || usernameState == 0) {
                jQuery("#error_info_username").html("<i class=\"ico-error\"></i>账号已注册!");
            }
        }
        //密码检查
        if (passwordChecked) {
            jQuery("#error_info_password").css("display", "none");
        } else {
            cansubmit = false;
            jQuery("#error_info_password").html("<i class=\"ico-error\"></i>请输入6到18位密码!");
            jQuery("#error_info_password").css("display", "block");
        }
        //确认密码
        if (passwordagainChecked) {
            jQuery("#error_info_passwordagain").css("display", "none");
        } else {
            cansubmit = false;
            jQuery("#error_info_passwordagain").html("<i class=\"ico-error\"></i>确认密码填写有误!");
            jQuery("#error_info_passwordagain").css("display", "block");
        }
        //验证码
        if (registercodeChecked) {
            jQuery("#error_info_registercode").css("display", "none");
        } else {
            cansubmit = false;
            jQuery("#error_info_registercode").html("<i class=\"ico-error\"></i>验证码填写有误!");
            jQuery("#error_info_registercode").css("display", "block");
        }
        //协议
        if (agreeconditionChecked) {
            jQuery("#error_info_agreecondition").css("display", "none");//协议没同意
        } else {
            cansubmit = false;
            jQuery("#error_info_agreecondition").html("<span class=\"error-block color5\" ><i class=\"ico-error\"></i>请先阅读并同意协议!");
            jQuery("#error_info_agreecondition").css("display", "block");
        }
        if (cansubmit) {
            jQuery("#registerForm").submit();
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
            jQuery("#error_info_username").html("<i class=\"ico-error\"></i>用户账号不能为空!");
            usernameState = 1;
            return;
        }
        //校验用户邮箱格式
        SystemDWRHandler.checkUserNameRight(username, function (result) {
            usernameState = result;
            if (result == 2) {//返回2格式不对
                jQuery("#error_info_username").html("<i class=\"ico-error\"></i>账号格式不正确!");
                jQuery("#error_info_username").css("display", "block");
            } else if (result == 4 || result == 0) {//返回0或4用户名已存在
                jQuery("#error_info_username").html("<i class=\"ico-error\"></i>账号已注册!");
                jQuery("#error_info_username").css("display", "block");
            } else {//返回3 账号可以注册
                jQuery("#error_info_username").css("display", "none");
            }
        });
    }
    /**
     *校验密码
     * @returns {boolean} true:校验通过
     */
    function checkPassword() {
        var password = jQuery("#password").val();//密码
        if (password == null || password == "" || password.length < 6 || password.length > 18) {
            jQuery("#error_info_password").html("<span class=\"help-block color5\"><i class=\"ico-error\"></i>请输入6到18位密码!");
            jQuery("#error_info_password").css("display", "block");
            passwordChecked = false;
        } else {
            jQuery("#error_info_password").css("display", "none");
            passwordChecked = true;
        }
    }
    /**
     *校验确认密码
     * @returns {boolean} true：校验通过
     */
    function checkPasswordAgain() {
        var password = jQuery("#password").val();//密码
        var passwordagain = jQuery("#passwordagain").val();//确认密码
        if (passwordagain == null || passwordagain == "" || passwordagain.length < 6 || passwordagain.length > 18) {
            jQuery("#error_info_passwordagain").html("<i class=\"ico-error\"></i>请输入6到18位密码!");
            jQuery("#error_info_passwordagain").css("display", "block");
            passwordagainChecked = false;
            return;
        }
        if (password != passwordagain) {
            jQuery("#error_info_passwordagain").html("<i class=\"ico-error\"></i>确认密码和密码不一致!");
            jQuery("#error_info_passwordagain").css("display", "block");
            passwordagainChecked = false;
        } else {
            jQuery("#error_info_passwordagain").css("display", "none");
            passwordagainChecked = true;
        }
    }
    /**
     *检查验证码是否正常
     */
    function checkRegisterCodeRight() {
        var registercode = jQuery("#registercode").val();//验证码
        SystemDWRHandler.checkRegisterCodeRight(registercode, function (result) {
            if (result) {
                jQuery("#error_info_registercode").css("display", "none");
                registercodeChecked = true;
            } else {
                jQuery("#error_info_registercode").html("<i class=\"ico-error\"></i>验证码不正确!");
                jQuery("#error_info_registercode").css("display", "block");
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
            jQuery("#error_info_agreecondition").css("display", "none");
            agreeconditionChecked = true;
        } else {
            jQuery("#error_info_agreecondition").html("<i class=\"ico-error\"></i>请先阅读并同意协议!");
            jQuery("#error_info_agreecondition").css("display", "block");
            agreeconditionChecked = false;
        }
    }
</script>

</body>
</html>
