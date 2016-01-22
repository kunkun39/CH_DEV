<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="ch" uri="http://www.chanhong.com" %>
<div class="form-group">
    <label for="" class="col-sm-3 control-label">应用类别</label>
    <div class="col-sm-9">
        <input class="form-control" value="${marketApp.fullCategoryName}" readonly="true"/>
    </div>
</div>

<div class="form-group">
    <label for="" class="col-sm-3 control-label">应用名称</label>
    <div class="col-sm-9">
        <input value="${marketApp.appName}" id="" class="form-control" readonly="true"/>
    </div>
</div>

<div class="form-group">
    <label for="" class="col-sm-3 control-label">应用包名</label>
    <div class="col-sm-9">
        <input value="${marketApp.appPackage}" class="form-control" readonly="true"/>
    </div>
</div>

<div class="form-group">
    <label for="" class="col-sm-3 control-label">应用版本（数字）</label>
    <div class="col-sm-9">
        <input value="${marketApp.appVersionInt}" class="form-control" readonly="true"/>
    </div>
</div>

<div class="form-group">
    <label for="" class="col-sm-3 control-label">应用版本（字符）</label>
    <div class="col-sm-9">
        <input value="${marketApp.appVersion}" class="form-control" readonly="true"/>
    </div>
</div>

<div class="form-group">
    <label for="" class="col-sm-3 control-label">应用大小(M)</label>
    <div class="col-sm-9">
        <input value="${marketApp.appSizeFormat}" class="form-control" readonly="true"/>
    </div>
</div>

<div class="form-group">
    <label for="" class="col-sm-3 control-label">应用图标</label>
    <div class="col-sm-9">
        <img width="70" height="70" alt="" src="${fileRequestHost}/${marketApp.appKey}/${marketApp.iconActualFileName}"/>
    </div>
</div>

<div class="form-group">
    <label for="" class="col-sm-3 control-label">应用海报</label>
    <div class="col-sm-9">
         <img width="500" height="260" alt="" src="${fileRequestHost}/${marketApp.appKey}/${marketApp.posterActualFileName}"/>
    </div>
</div>

<%--<div class="form-group">--%>
    <%--<label for="" class="col-sm-3 control-label">上传应用程序文件</label>--%>
    <%--<div class="col-sm-9">--%>
        <%--<input type="file" id="appApkUploadFile" name="appApkUploadFile" required="required" style="width: 320px" onchange="validateApkFile(this)"/>--%>
        <%--<span class="help-block color6">请编辑应用APK文件</span>--%>
        <%--<span id="apk_error_show" class="help-block color5" style="display: none;"></span>--%>
    <%--</div>--%>
<%--</div>--%>

<div class="form-group">
    <label for="" class="col-sm-3 control-label">应用描述</label>
    <div class="col-sm-9">
        <textarea rows="8" cols="69" readonly="true"><ch:substring value="${marketApp.appDescription}" length="500" needUnEscapes="true"/></textarea>
    </div>
</div>

<div class="form-group">
    <label for="" class="col-sm-3 control-label">APK文件</label>
    <div class="col-sm-9">
        <a href="${fileRequestHost}/${marketApp.appKey}/${marketApp.apkActualFileName}">
            <p class="apply-detail-p"><i class="path-icon"></i><span class="color10">${marketApp.apkUploadFileName}</span></p>
        </a>
    </div>
</div>