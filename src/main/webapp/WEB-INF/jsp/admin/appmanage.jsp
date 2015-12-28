<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 15-12-25
  Time: 下午1:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html class="activity-no">
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nav.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/backstage.css">
    <title>开发者应用接入平台后台管理</title>
</head>
<body>
<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/header.jsp" />

<%--正文部分**************************************************************--%>

<div class="back-con">
    <jsp:include page="/WEB-INF/jsp/admin/adminmenu.jsp"/>
    <div class="back-con-r fl">
        <div class="leftTab-content active" id="bs-tabcon1">
            <h4 class="font16">我的应用</h4>
            <ul class="nav nav-tabs">
                <li><a href="#tab1">全部</a></li>
                <li><a href="#tab2">新创建</a></li>
                <li class="active"><a href="#tab3">待审核</a></li>
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
                    <table class="table table-condensed table-bordered table-hover table-view-1">
                        <thead>
                            <tr>
                                <th style="padding-left: 20px;">应用图标/名称</th>
                                <th>类型/介绍</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${apps}" var = "app">
                                <tr>
                                    <td style="padding: 20px;">
                                        <img src="${fileRequestHost}upload/${app.iconActualFileName}" width="96" height="96" class="fl" />
                                        <div class="fl" style="margin-left: 13px;margin-top: 10px;">
                                            <h4>${app.appName}</h4>
                                            <p class="font12 color9">${app.appVersionInt}</p>
                                        </div>
                                    </td>
                                    <td>
                                        <h5>${app.appName}</h5>
                                        <p class="font12">${app.appDescription}</p>
                                    </td>
                                    <td>
                                        <c:if test="${apps.appStatus == 'CREATED'}">新创建</c:if>
                                        <c:if test="${apps.appStatus == 'WAITING'}">待审核</c:if>
                                        <c:if test="${apps.appStatus == 'PASSED'}">审核通过</c:if>
                                        <c:if test="${apps.appStatus == 'REJECTED'}"><span class="color7">拒绝通过</span></c:if>
                                        <c:if test="${apps.appStatus == 'SHELVES'}">已上架</c:if>
                                        <c:if test="${apps.appStatus == 'OFFSHELVES'}">已下架</c:if>
                                    </td>
                                    <td>
                                        <ul class="pagination">
                                            <c:if test="${apps.appStatus == 'CREATED'}"><li><a href="#">查看应用</a></li></c:if>
                                            <c:if test="${apps.appStatus == 'WAITING'}">
                                                <li><a href="#">查看应用</a></li>
                                                <li><a href="#">通过审核</a></li>
                                            </c:if>
                                            <c:if test="${apps.appStatus == 'PASSED'}"><li><a href="#">查看应用</a></li></c:if>
                                            <c:if test="${apps.appStatus == 'REJECTED'}"><li><a href="#">查看应用</a></li></c:if>
                                            <c:if test="${apps.appStatus == 'SHELVES'}"><li><a href="#">查看应用</a></li></c:if>
                                            <c:if test="${apps.appStatus == 'OFFSHELVES'}"><li><a href="#">查看应用</a></li></c:if>
                                        </ul>
                                    </td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td style="padding: 20px;">
                                    <img src="${pageContext.request.contextPath}/images/longmen.png" width="96" height="96" class="fl" />
                                    <div class="fl" style="margin-left: 13px;margin-top: 10px;">
                                        <h4>影视娱乐</h4>
                                        <p class="font12 color9">版本4.0</p>
                                    </div>
                                </td>
                                <td>
                                    <h5>影视娱乐</h5>
                                    <p class="font12">完全自主开发新型日发送量可达1000万条</p>
                                </td>
                                <td>新创建</td>
                                <td>
                                    <a class="color4" href="javascript:;">设为待审核</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <ul class="pagination">
                        <li><a href="#">1</a></li>
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
<%--结尾菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>
</body>
</html>