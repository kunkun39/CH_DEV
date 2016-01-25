<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--点击放大-->
<div id="overlay"></div>
<div class="modal lightbox" id="lightbox">
    <table id="outerContainer" cellspacing="0">
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
                    <div id="details" style="overflow: hidden;height: auto;width: 505px;margin-left:30px " >
                        <div class="alert-form clearfix">
                            <label class="fl control-label text-right"><img id="iconPath" src="" width="96" height="96"/></label>
                            <div style="margin-left: 140px;font-size: 13px;margin-top: 5px">
                                <label>应用类别 :</label>
                                <label id="categoryName"></label>
                            </div>
                            <div style="margin-left: 140px;font-size: 13px;">
                                <label>应用名称 :</label>
                                <label id="appName"></label>
                            </div>
                            <div style="margin-left: 140px;font-size: 13px;">
                                <label>应用大小（M）:</label>
                                <label id="sizeFormat"></label>

                            </div>
                            <div style="margin-left: 140px;font-size: 13px;">
                                <label>应用版本:</label>
                                <label id="version"></label>
                            </div>
                        </div>

                        <div style="margin-left: 20px;">
                              <img id="posterPath" src="" width="420" height="180"/>
                        </div>
                        <div id="description" style="margin-left: 20px;margin-top:10px;width: 420px">
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