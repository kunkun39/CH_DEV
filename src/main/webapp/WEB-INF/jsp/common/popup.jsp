<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="ch" uri="http://www.chanhong.com" %>

<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <div class="widget-box">

                <div id="details" style="overflow: hidden;height: auto;width: 500px;" >
                        <div class="alert-form clearfix">
                            <label class="fl control-label text-right"><img style="margin-left: -10px;" width="96" height="96" src="${fileRequestHost}/${app.appKey}/${app.iconActualFileName}"/></label>
                            <div style="margin-left: 140px;margin-top: 8px;font-size: 11px;">
                                <label>应用类别 :</label>
                                <label id="categoryName">${app.fullCategoryName}</label>
                            </div>
                            <div style="margin-left: 140px;font-size: 11px;">
                                <label>应用名称 :</label>
                                <label id="appName">${app.appName}</label>
                            </div>
                            <div style="margin-left: 140px;font-size: 11px;">
                                <label>应用版本:</label>
                                <label id="version">${app.appVersion}</label>
                            </div>
                            <div style="margin-left: 140px;font-size: 11px;">
                                <label>应用大小（M）:</label>
                                <label id="sizeFormat">${app.appSizeFormat}</label>
                            </div>
                        </div>
                        <div style="margin-left: 11px;">
                              <img width="420" height="180" src="${fileRequestHost}/${app.appKey}/${app.posterActualFileName}"/>
                        </div>
                        <div id="description" style="font-size:11px;margin-left: 10px;margin-top:10px;width: 420px">${app.appDescription}</div>

                 </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>