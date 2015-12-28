<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
            <h4 class="font16">我的应用</h4>
            <ul class="nav nav-tabs">
                <li class="active"><a href="#tab1">全部</a></li>
                <li><a href="#tab2">新创建</a></li>
                <li><a href="#tab3">待审核</a></li>
                <li><a href="#tab4">拒绝通过</a></li>
                <li><a href="#tab5">待上架</a></li>
                <li><a href="#tab6">已上架</a></li>
                <li><a href="#tab7">已下架</a></li>
            </ul>
            <div class="tab-content">
                <div id="tab1">
                    <div class="input-group">
                        <input type="text" placeholder="应用名称" class="input-sm form-control">
                        <span class="input-group-btn">
                                <button type="button" class="btn btn-sm">
                                <i class="search-icon"></i>
                                </button>
                        </span>
                    </div>
                    <table class="table table-condensed table-bordered table-hover">
                        <thead>
                            <tr>
                                <th style="padding-left: 20px;">应用图标/名称</th>
                                <th>类型/介绍</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="padding: 20px;">
                                    <img src="${pageContext.request.contextPath}/images/longmen.png" width="70" height="70" class="fl" />
                                    <div class="fl" style="margin-left: 13px;margin-top: 10px;">
                                        <h5>影视娱乐</h5>
                                        <p class="font12 color9">版本4.0</p>
                                    </div>
                                </td>
                                <td>
                                    <h5>影视娱乐</h5>
                                    <p class="font12 color9">完全自主开发新型日发送量可达1000万条</p>
                                </td>
                                <td>新创建</td>
                                <td>
                                    <a class="color4" href="javascript:;">编辑应用</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <ul class="pagination">
                        <li class="cur"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">6</a></li>
                        <li><a href="#">7</a></li>
                        <li><a href="#">8</a></li>
                        <li><a href="#">...</a></li>
                        <li><a href="#">18</a></li>
                        <li><a href="#">下一页</a></li>
                        <li>
                            <label>跳转到</label>
                            <input type="text" class="input-page" />
                        </li>
                        <li><a href="#">Go</a></li>
                    </ul>
                </div>
                <div id="tab2"></div>
                <div id="tab3"></div>
                <div id="tab4"></div>
                <div id="tab5"></div>
                <div id="tab6"></div>
                <div id="tab7"></div>
            </div>
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

</body>
</html>