<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring-form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html class="activity-no">
<head>
    <title>开发者应用接入平台密码找回</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
   <jsp:include page="/WEB-INF/decorators/cssheader.jsp"/>
    <!--[if lt IE 9]>
    <script src="${RESOURCE_PATH}/javascript/vendor/html5.min.js"></script>
    <script src="${RESOURCE_PATH}/javascript/vendor/respond.min.js"></script>
    <![endif]-->

    <style type="text/css">
        .passwordhelp-block {
            display: block;
            margin-top: 25px;
            margin-bottom: 0px;
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
            密码找回
        </div>
        <spring-form:form id="registerForm" commandName="user" method="post" class="form-horizontal" role="form">
        <div class="form-body">

            <div class="form-group" style="position:relative;">
                <label for="password" class="col-sm-2 control-label">密码</label>

                <div class="col-sm-10">
                    <spring-form:input id="password" type="password" path="password" class="form-control " maxlength="18"
                                       required="required" placeholder="请输入密码" onKeyUp="pwStrength(this.value)"
                                       onBlur="checkPassword()"/>
                    <span id="error_info_password" class="passwordhelp-block color5 " style="display: none;"></span>

                </div>
                <br/>
                <br/>
                <br/>

                <div class="pw-tips">
                    <span class="color3 fl">安全程度：</span>

                    <div class="fl pw-safe pw-weak" style="margin-bottom: 30px;">
                        <div class="pw-bar"></div>
                        <div class="pw-letter"><span id="strength_L">弱</span><span id="strength_M">中</span><span id="strength_H">强</span></div>
                    </div>

                </div>
            </div>
            <div class="form-group">
                <label for="passwordagain" class="col-sm-2 control-label">确认密码</label>

                <div class="col-sm-10">
                    <spring-form:input id="passwordagain" type="password" path="passwordAgain" class="form-control" maxlength="18"
                                       required="required" placeholder="请输入密码" onBlur="checkPasswordAgain()"/>
                    <span id="error_info_passwordagain" class="help-block color5 " style="display: none;"></span>

                    <p class="help-block text-danger"></p>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">&nbsp;</label>

                <div class="col-sm-10">
                    <div id="success"></div>
                    <button type="button" class="btn-blue color1" onclick="checkFormInput(this.form)">确 认</button>
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
<script src="${RESOURCE_PATH}/javascript/passwordstrong.js"></script>
<script src="${pageContext.request.contextPath}/dwr/engine.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/dwr/util.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/dwr/interface/SystemDWRHandler.js" type="text/javascript"></script>

<script type="text/javascript">
    var passwordChecked = false;
    var passwordagainChecked = false;

    /**
     * 检测表单输入信息
     **/
    function checkFormInput(form) {
        var cansubmit = true;
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

        if (cansubmit) {
            jQuery("#registerForm").submit();
        }
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

</script>

</body>
</html>
