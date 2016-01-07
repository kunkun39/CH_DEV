<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring-form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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

<%--内容部分***********************************************************--%>

<div class="back-con">

    <jsp:include page="/WEB-INF/jsp/client/clientmenu.jsp"/>

    <div class="back-con-r fl">
        <div class="leftTab-content active">
            <h4 class="font16 ">账户资料</h4>

            <spring-form:form id="clientSelfInfoForm" commandName="clientSelfInfo" class="form-horizontal server-form "
                              role="form ">
                <div class="form-body">
                    <div class="form-group">
                        <label style="width:80px;" for=" " class="col-sm-3 control-label">联系人</label>

                        <div class="col-sm-9">
                            <spring-form:input id="name" path="name" class="form-control" required="required"
                                               maxlength="20"/>
                            <span id="name_error_show" class="help-block color5" style="display: none;"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label style="width:90px; " for=" " class="col-sm-3 control-label">联系电话</label>

                        <div class="col-sm-9" style="margin-left:-10px;">
                            <spring-form:input id="contactWay" path="contactWay"
                                               class="form-control"
                                               required="required"
                                               maxlength="11" onblur="validatePhoneNumber()"/>
                            <span class="help-block color6"><i class="ico-prompt"></i>请输入11位有效号码</span>
                            <span id="contactway_error_show" class="help-block color5" style="display: none;"></span>
                        </div>
                    </div>

                    <div class="form-group ">
                        <label class="fl ">&nbsp;</label>

                        <div class="fl ">
                            <input type="button" class="btn-blue color1 text-center" value="确认修改 "
                                   onclick="submitClientInfo(this.form)"/>
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

<script type="text/javascript">
    function submitClientInfo(form) {
        form.submit();
    }

    function validatePhoneNumber() {
        //验证电话号码
        var phoneName = jQuery("#contactWay").val();
        if ((phoneName == null) || (phoneName == '') || (phoneName.length < 11)) {
            jQuery("#contactway_error_show").html("请输入正确的手机号码");
            jQuery("#contactway_error_show").css("display", "block");
        } else {
            jQuery("#contactway_error_show").css("display", "none");
        }
    }
</script>

</body>
</html>
