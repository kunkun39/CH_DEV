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
    <jsp:include page="/WEB-INF/decorators/cssheader.jsp" />

</head>

<body>

<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/header.jsp"/>

<%--内容部分***********************************************************--%>

<div class="back-con">

    <jsp:include page="/WEB-INF/jsp/client/clientmenu.jsp"/>

    <div class="back-con-r fl">
        <div class="leftTab-content active">

            <div style="float:left;width:48%;">
                <c:choose>

                    <c:when test="${message == 1}">
                        <h4 class="font16">账户资料&nbsp;&nbsp;<i class="ico-success"></i><span
                                style="font-size: 80%;color:green;">(修改成功!)</span></h4>
                    </c:when>

                    <c:otherwise>
                        <h4 class="font16">账户资料</h4>
                    </c:otherwise>
                </c:choose>
            </div>

            <spring-form:form id="clientSelfInfoForm" commandName="clientSelfInfo" class="form-horizontal"
                              role="form ">


                <div class="form-body">
                    <div class="form-group">
                        <label for=" " class="col-sm-2 control-label">联系人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>

                        <div class="col-sm-10">
                            <spring-form:input id="name" path="name" class="form-control" required="required"
                                               maxlength="20" onblur="onblueValidatePersonName(event, this.form)"/>
                            <span class="help-block color6"><i class="ico-prompt"></i>请输入联系人姓名</span>
                            <span id="name_error_show" class="help-block color5" style="display: none;"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for=" " class="col-sm-2 control-label">联系方式&nbsp;&nbsp;<span style="color:#bfbfbf;">+86</span></label>

                        <div class="col-sm-10">
                            <spring-form:input id="contactWay" path="contactWay"
                                               class="form-control"
                                               required="required"
                                               maxlength="11" onblur="onblueValidatePhoneNumber(event, this.form)"/>
                            <span class="help-block color6"><i class="ico-prompt"></i>请输入11位有效号码</span>
                            <span id="contactway_error_show" class="help-block color5"
                                  style="display: none;"></span>
                        </div>
                    </div>
                    <input type="button" id="test" class="emptybutton"/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">&nbsp;</label>

                        <div class="ol-sm-9">
                            <input type="button" id="submitButton" class="btn-blue color1 text-center" value="确认修改 "
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

<jsp:include page="/WEB-INF/decorators/jsheader.jsp"/>
<script src="${pageContext.request.contextPath}/dwr/engine.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/dwr/util.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/dwr/interface/SystemDWRHandler.js" type="text/javascript"></script>


<script type="text/javascript">

    var phoneNumberIsOk = true;
    var personNameIsOk = true;

    function checkPhoneNumberBlankSpace(str) {
        var arr = str.split(" ");
        if (arr.length != 1) {
            return false;
        } else {
            return true;
        }
    }

    function onblueValidatePersonName(e, form) {
        var triggerId = getEventTriggerId(e);

        if (triggerId == 'submitButton') {
            submitClientInfo(form);
        } else {
            validatePersonName();
        }
    }

    function validatePersonName() {
        var personName = jQuery("#name").val();
        if ((personName == null) || (personName == '')) {
            jQuery("#name_error_show").html("<i class=\"ico-error\"></i>请输入姓名");
            jQuery("#name_error_show").css("display", "block");
            personNameIsOk = false;
        } else {
            jQuery("#name_error_show").css("display", "none");
            personNameIsOk = true;
        }
    }

    function onblueValidatePhoneNumber(e, form) {
        var triggerId = getEventTriggerId(e);

        if (triggerId == 'submitButton') {
            submitClientInfo(form);
        } else {
            validatePhoneNumber();
        }
    }

    function validatePhoneNumber() {
        var phoneNumber = jQuery("#contactWay").val();
        if ((phoneNumber == null) || (phoneNumber.length != 11) || isNaN(phoneNumber) || (!(checkPhoneNumberBlankSpace(phoneNumber)))) {
            jQuery("#contactway_error_show").html("<i class=\"ico-error\"></i>请输入正确号码");
            jQuery("#contactway_error_show").css("display", "block");
            phoneNumberIsOk = false;
        } else {
            jQuery("#contactway_error_show").css("display", "none");
            phoneNumberIsOk = true;
        }
    }

    function submitClientInfo(form) {
        validatePersonName();
        validatePhoneNumber();
        if (personNameIsOk && phoneNumberIsOk) {
            form.submit();
        }
    }

</script>

</body>
</html>
