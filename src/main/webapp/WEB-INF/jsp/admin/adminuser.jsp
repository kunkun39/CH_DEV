<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 15-12-24
  Time: 上午10:40
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
            <h4 class="font16">系统用户</h4>
            <div class="input-group">
                <input type="text" placeholder="联系人/邮箱" class="input-sm form-control">
                <span class="input-group-btn">
                    <button type="button" class="btn btn-sm">
                    <i class="search-icon"></i>
                    </button>
                </span>
            </div>
            <table class="table table-condensed table-bordered table-hover table-view-1">
                <thead>
                    <tr>
                        <th style="text-align: center;width:20%">用户</th>
                        <th style="text-align: center;width:20%">用户名</th>
                        <th style="text-align: center;width:40%">联系方式</th>
                        <th style="text-align: center;">状态</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${adminusers}" var="adminuser">
                        <tr>
                            <td style="text-align: center;width:20%">${adminuser.name}</td>
                            <td style="text-align: center;width:20%">${adminuser.username}</td>
                            <td style="text-align: center;width:40%">${adminuser.contactWay}</td>
                            <td style="text-align: center;">
                                <c:if test="${adminuser.enabled}">
                                    <span class="color10">在用</span>
                                </c:if>
                                <c:if test="${!adminuser.enabled}">
                                    <span class="color7">停止使用</span>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
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
    </div>
</div>

<%--结尾菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>
</body>
</html>