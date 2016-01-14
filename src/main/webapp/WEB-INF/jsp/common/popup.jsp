<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--点击放大-->
<div id="overlay"></div>
<div class="lightbox" id="lightbox">
    <table id="outerContainer" cellspacing="0" style="table-layout:fixed;">
        <tbody>
            <tr>
                <td class="tl"></td>
                <td class="tc"></td>
                <td class="tr"></td>
            </tr>
            <tr>
                <td class="ml"></td>
                <td id="lightboxFrameBody">
                    <button type="button" class="close" id="closeLink">×</button>
                    <div class="details" style="overflow: hidden;height: auto;width: 505px;">
                        <div class="alert-form clearfix">
                            <label for="" class="fl control-label text-right">应用类别:</label>
                            <div id="categoryName" class="fl alert-con">
                            </div>
                        </div>
                        <div class="alert-form clearfix">
                            <label for="" class="fl control-label text-right">应用名称:</label>
                            <div id="appName" class="fl alert-con">
                            </div>
                        </div>
                        <div class="alert-form clearfix">
                            <label for="" class="fl control-label text-right">应用包名:</label>
                            <div id="appPackage" class="fl alert-con">
                                com_sohu
                            </div>
                        </div>
                        <div class="alert-form clearfix">
                            <label for="" class="fl control-label text-right">应用版本（数字）:</label>
                            <div id="versionInt" class="fl alert-con">
                                205
                            </div>
                        </div>
                        <div class="alert-form clearfix">
                            <label for="" class="fl control-label text-right">应用版本（字符）:</label>
                            <div id="version" class="fl alert-con">
                                4.7.5
                            </div>
                        </div>
                        <div class="alert-form clearfix">
                            <label for="" class="fl control-label text-right">应用大小（M）:</label>
                            <div id="sizeFormat" class="fl alert-con">
                                7.02
                            </div>
                        </div>
                        <div class="alert-form clearfix">
                            <label for="" class="fl control-label text-right">应用图标:</label>
                            <div class="fl alert-con">
                                <img id="iconPath" src="" width="96" height="96"/>
                            </div>
                        </div>
                        <div class="alert-form clearfix">
                            <label for="" class="fl control-label text-right">应用海报:</label>
                            <div class="fl alert-con">
                                <img id="posterPath" src="" width="320" height="180"/>
                            </div>
                        </div>
                        <div class="alert-form clearfix">
                            <label for="" class="fl control-label text-right">应用描述:</label>
                            <div id="description" class="fl alert-con">
                            </div>
                        </div>
                    </div>
                </td>
                <td class="mr"></td>
            </tr>
            <tr>
                <td class="bl"></td>
                <td class="bc"></td>
                <td class="br"></td>
            </tr>
        </tbody>
    </table>
</div>