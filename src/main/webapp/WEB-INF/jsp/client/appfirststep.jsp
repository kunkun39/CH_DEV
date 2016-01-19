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
    <%--添加头文件进度条显示不出来--%>
    <%--<jsp:include page="/WEB-INF/decorators/cssheader.jsp"/>--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/backstage.css">

    <style type="text/css">

        .progress {
            height: 20px;
            margin-bottom: 20px;
            overflow: hidden;
            background-color: #f5f5f5;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, .1);
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, .1)
        }

    </style>
</head>

<body>

<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/header.jsp"/>

<%--内容部分***********************************************************--%>

<div class="container">

    <div class="panel panel-default">
        <div class="panel-heading">
            提交应用信息
        </div>

        <%--步骤的头***********************************************************--%>

        <jsp:include page="/WEB-INF/jsp/common/appsteptitle.jsp"/>

        <spring-form:form id="marketAppForm" commandName="marketApp" cssClass="form-horizontal" method="post"
                          enctype="multipart/form-data">
            <input type="hidden" name="method" value="save"/>
                <spring-form:errors path="errorId" class="help-block color5" htmlEscape="false"></spring-form:errors>
            <div class="form-body">
                <div class="form-group">
                    <label for="" class="col-sm-3 control-label">应用类别</label>

                    <div class="col-sm-9">
                        <select name="selectCategoryId" class="input-sm selet-syle" style="width: 320px">
                            <c:forEach items="${categories}" var="category">
                                <c:forEach items="${category.children}" var="child">
                                    <option value="${child.id}">
                                            ${category.categoryName}-> ${child.categoryName}
                                    </option>
                                </c:forEach>
                            </c:forEach>
                        </select>
                        <span class="help-block color6">请选择应用类别</span>
                    </div>
                </div>

                <div class="form-group">
                    <label for=" " class="col-sm-3 control-label">应用名称</label>

                    <div class="col-sm-9">
                        <spring-form:input id="appName" path="appName" class="form-control" required="required"
                                           maxlength="20" onblur="validateAppName()"/>
                        <span class="help-block color6"><i class="ico-prompt"></i>请编辑应用名称，20字以内</span>
                        <span id="name_error_show" class="help-block color5" style="display: none;"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for=" " class="col-sm-3 control-label">应用包名</label>

                    <div class="col-sm-9">
                        <c:if test="${marketApp.id == 0}">
                            <spring-form:input path="appPackage" class="form-control" required="required" maxlength="80"
                                           onblur="validateAppPackage()"/>
                            <span class="help-block color6"><i class="ico-prompt"></i>请编辑应用包名</span>
                        </c:if>
                        <span id="package_error_show" class="help-block color5" style="display: none;"></span>

                        <c:if test="${marketApp.id > 0}">
                            <spring-form:input path="appPackage" class="form-control" required="required" maxlength="80"
                                        readonly="true"/>
                        </c:if>

                    </div>
                </div>

                <div class="form-group">
                    <label for="" class="col-sm-3 control-label">上传应用图标</label>

                    <div class="col-sm-9">
                        <input type="file" id="appIconUploadFile" name="appIconUploadFile" required="required"
                               style="width: 320px" onchange="validateIconImage(this)"/>
                        <span class="help-block color6"><i class="ico-prompt"></i>请编辑应用图标: 像素:150*150，大小<20K</span>
                        <span id="icon_error_show" class="help-block color5" style="display: none;"></span>
                        <c:if test="${marketApp.id > 0}">
                            <img width="70" height="70" alt=""
                                 src="${fileRequestHost}/${marketApp.appKey}/${marketApp.iconActualFileName}"/>
                        </c:if>
                    </div>
                </div>

                <div class="form-group">
                    <label for="" class="col-sm-3 control-label">上传应用海报</label>

                    <div class="col-sm-9">
                        <input type="file" id="appPosterUploadFile" name="appPosterUploadFile" required="required"
                               style="width: 320px" onchange="validatePosterImage(this)"/>
                        <span class="help-block color6"><i class="ico-prompt"></i>请编辑应用图标: 像素:800*450，大小<200K</span>
                        <span id="poster_error_show" class="help-block color5" style="display: none;"></span>
                        <c:if test="${marketApp.id > 0}">
                            <img width="200" height="112" alt=""
                                 src="${fileRequestHost}/${marketApp.appKey}/${marketApp.posterActualFileName}" style="margin-bottom: 18px"/>
                        </c:if>
                </div>

                <div class="form-group">
                    <label for="" class="col-sm-3 control-label">上传应用程序文件</label>
                    <div class="col-sm-9">
                        <input type="file" id="appApkUploadFile" name="appApkUploadFile" required="required"
                               style="width: 320px;margin-left: 8px" onchange="validateApkFile(this)"/>
                        <span class="help-block color6" style="margin-left: 2px">&nbsp;&nbsp;<i class="ico-prompt"></i>请编辑应用APK文件</span>
                        <span id="apk_error_show" class="help-block color5" style="display: none;margin-left: 9px"></span>
                        <c:if test="${marketApp.id > 0}">
                            <span class="help-block color10">已上传应用APK文件:${marketApp.apkUploadFileName}</span>
                        </c:if>

                    </div>

                    <label id="processBarTextControl" class="col-sm-3 control-label" style="display: none">文件上传进度</label>
                    <div id="processBarValControl" class="col-sm-9" style="display: none" >
                        <div class="progress progress-success progress-striped" style="width:50%">
                            <div id='proBar' class="bar" style="width:5%"><span id="proVal"></span></div>
                        </div>
                    </div>

                </div>

                <div class="form-group">
                    <label for=" " class="col-sm-3 control-label">应用描述</label>

                    <div class="col-sm-9">
                        <spring-form:textarea id="appDescription" path="appDescription" required="required" rows="8"
                                              cols="80" onblur="validateAppDesc()" maxlength="200" placeholder="请输入应用描述..."/>
                        <span class="help-block"><i class="ico-prompt"></i>最多填写200个字</span>
                        <span id="desc_error_show" class="help-block color5" style="display: none;"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">&nbsp;</label>

                    <div class="col-sm-9">

                        <input type="button" class="btn-blue color1" value="返  回" onclick="window.location.href = '${pageContext.request.contextPath}/security/clientappoverview.html'" />
                        <input type="button" class="btn-blue color1" value="提  交" onclick="submitAppInfo(this.form)"/>
                    </div>
                </div>

                <img id="view_image_1" src="" style="visibility: hidden;"/>
                <img id="view_image_2" src="" style="visibility: hidden;"/>
            </div>
        </spring-form:form>
    </div>

</div>

<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<%--弹出框部分***********************************************************--%>
<div class="modal fade" id="infoPopup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">开发者应用接入平台</h4>
            </div>
            <div class="modal-body">
                请确认是否要提交该应用信息到管理员审核？
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" onclick="confirmSubmitForm();">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<%--Javascript部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/jsheader.jsp"/>
<script src="${pageContext.request.contextPath}/dwr/engine.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/dwr/util.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/dwr/interface/SystemDWRHandler.js" type="text/javascript"></script>

<script type="text/javascript">
    var appNameValidate = false;
    var appPackageValidate = false;
    var appDescValidate = false;
    var iconImageValidate = false;
    var posterImageValidate = false;
    var apkFileValidate = false;

    var appId = '${marketApp.id}';
    if (appId > 0) {
        appNameValidate = true;
        appPackageValidate = true;
        appDescValidate = true;
        iconImageValidate = true;
        posterImageValidate = true;
        apkFileValidate = true;
    }

    function validateAppName() {
        //验证应用名称
        var appName = jQuery("#appName").val();
        if (appName == null || appName == '') {
            jQuery("#name_error_show").html("<i class=\"ico-error\"></i>应用名称不能为空");
            jQuery("#name_error_show").css("display", "block");
            appNameValidate = false;
        } else {
            jQuery("#name_error_show").css("display", "none");
            appNameValidate = true;
        }
    }

    function validateAppPackage() {
        var appPackage = jQuery("#appPackage").val();
        if (appPackage == null || appPackage == '') {
            jQuery("#package_error_show").html("<i class=\"ico-error\"></i>应用包名不能为空");
            jQuery("#package_error_show").css("display", "block");
            appPackageValidate = false;
        } else {
            SystemDWRHandler.validatePackageNameDuplicate(-1, appPackage, function(result) {
                if (result) {
                    jQuery("#package_error_show").html("<i class=\"ico-error\"></i>应用包名有重复");
                    jQuery("#package_error_show").css("display", "block");
                    appPackageValidate = false;
                } else {
                    jQuery("#package_error_show").css("display", "none");
                    appPackageValidate = true;
                }
            });
        }
    }

    function validateIconImage(obj) {
        var url, width, height, size;
        if ($.support.msie) {
            url = obj.value;
        } else {
            url = window.URL.createObjectURL(obj.files[0]);
        }

        var iconFile = jQuery("#appIconUploadFile");
        var iconFileName = iconFile.val();

        if (!/.(jpg|jpeg|png|JPG|JPEG|PNG)$/.test(iconFileName)) {
            jQuery("#icon_error_show").html("<i class=\"ico-error\"></i>图片格式必须为jpg,jepg,png，请重新选择图片");
            jQuery("#icon_error_show").css("display", "block");
            iconImageValidate = false;
        } else {
            jQuery("#view_image_1").attr("src", url).load(function() {
                width = this.width;
                height = this.height;
                size = obj.files[0].size;
                if (width != 150 || height != 150 || size > 20 * 1024) {
                    jQuery("#icon_error_show").html("<i class=\"ico-error\"></i>应用图标大小必须为150*150, 大小小于20K");
                    jQuery("#icon_error_show").css("display", "block");
                    iconImageValidate = false;
                } else {
                    jQuery("#icon_error_show").css("display", "none");
                    iconImageValidate = true;
                }
            });
        }
    }

    function validatePosterImage(obj) {
        var url, width, height, size;
        if ($.support.msie) {
            url = obj.value;
        } else {
            url = window.URL.createObjectURL(obj.files[0]);
        }

        var posterFile = jQuery("#appPosterUploadFile");
        var posterFileName = posterFile.val();

        if (!/.(jpg|jpeg|png|JPG|JPEG|PNG)$/.test(posterFileName)) {
            jQuery("#poster_error_show").html("<i class=\"ico-error\"></i>图片格式必须为jpg,jepg,png，请重新选择图片");
            jQuery("#poster_error_show").css("display", "block");
            posterImageValidate = false;
        } else {
            jQuery("#view_image_2").attr("src", url).load(function() {
                width = this.width;
                height = this.height;
                size = obj.files[0].size;
                if (width != 800 || height != 450 || size > 200 * 1024) {
                    jQuery("#poster_error_show").html("<i class=\"ico-error\"></i>应用海报大小必须为800*450, 大小小于200K");
                    jQuery("#poster_error_show").css("display", "block");
                    posterImageValidate = false;
                } else {
                    jQuery("#poster_error_show").css("display", "none");
                    posterImageValidate = true;
                }
            });
        }
    }

    function validateApkFile() {
        //验证APK文件
        var appApkUploadFile = jQuery("#appApkUploadFile").val();
        if (!/.(apk|APK)$/.test(appApkUploadFile)) {
            jQuery("#apk_error_show").html("<i class=\"ico-error\"></i>文件格式必须为apk");
            jQuery("#apk_error_show").css("display", "block");
            apkFileValidate = false;
        } else {
            jQuery("#apk_error_show").css("display", "none");
            apkFileValidate = true;
        }
    }

    function validateAppDesc() {
        //验证描述
        var appDescription = jQuery("#appDescription").val();
        if (appDescription == null || appDescription == '') {
            jQuery("#desc_error_show").html("<i class=\"ico-error\"></i>描述不能为空");
            jQuery("#desc_error_show").css("display", "block");
            appDescValidate = false;
        } else {
            jQuery("#desc_error_show").css("display", "none");
            appDescValidate = true;
        }
    }

    function submitAppInfo() {
        //var iconImageValidate = true;
        //var posterImageValidate = true;
        var canSubmit = true;
        if (!appNameValidate) {
            jQuery("#name_error_show").html("<i class=\"ico-error\"></i>应用名称未通过验证");
            jQuery("#name_error_show").css("display", "block");
            canSubmit = false;
        } else {
            jQuery("#name_error_show").css("display", "none");
        }

        if (!appPackageValidate) {
            jQuery("#package_error_show").html("<i class=\"ico-error\"></i>应用包名未通过验证");
            jQuery("#package_error_show").css("display", "block");
            canSubmit = false;
        } else {
            jQuery("#package_error_show").css("display", "none");
        }

        if (!iconImageValidate) {
            jQuery("#icon_error_show").html("<i class=\"ico-error\"></i>应用图标未通过验证");
            jQuery("#icon_error_show").css("display", "block");
            canSubmit = false;
        } else {
            jQuery("#icon_error_show").css("display", "none");
        }

        if (!posterImageValidate) {
            jQuery("#poster_error_show").html("<i class=\"ico-error\"></i>应用海报未通过验证");
            jQuery("#poster_error_show").css("display", "block");
            canSubmit = false;
        } else {
            jQuery("#poster_error_show").css("display", "none");
        }

        if (!apkFileValidate) {
            jQuery("#apk_error_show").html("<i class=\"ico-error\"></i>应用文件未通过验证");
            jQuery("#apk_error_show").css("display", "block");
            canSubmit = false;
        } else {
            jQuery("#apkr_error_show").css("display", "none");
        }

        if (!appDescValidate) {
            jQuery("#desc_error_show").html("<i class=\"ico-error\"></i>应用描述未通过验证");
            jQuery("#desc_error_show").css("display", "block");
            canSubmit = false;
        } else {
            jQuery("#desc_error_show").css("display", "none");
        }

        if (canSubmit) {
            jQuery("#infoPopup").modal();
        }
    }

    function confirmSubmitForm() {
        jQuery("#marketAppForm").submit();
        beginUploadProcess();
    }

    <%--进度条控制JS--%>
 function beginUploadProcess() {
        jQuery("#processBarTextControl").css("display", "block");
        jQuery("#processBarValControl").css("display", "block");
        var intId = setInterval(getUploadMeter, 1000);

        function getUploadMeter() {
            jQuery.getJSON("${pageContext.request.contextPath}/security/apkuploadprocess.html", function(data) {
                <%--进度条显示--%>
                jQuery("#proBar").css("width", data.percentage + '%');
                <%--显示进度文本值--%>
                jQuery("#proVal").html(data.percentage + '%');

                if (data.percentage == 100) {
                    //stop requirement
                    window.clearInterval(intId);
                }
            });
        }
    }

</script>

</body>
</html>
