<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 15-12-24
  Time: 上午11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<div class="back-con-l">
    <h5 class="color7"><i class="server-icon"></i>后台管理</h5>
    <ul class="back-con-l-ul">
        <a href="${pageContext.request.contextPath}/security/adminappmanage.html">
            <li <c:if test="${MANAGE_KEY == 'APPS'}">class="cur"</c:if>>应用</li>
        </a>
        <a href="${pageContext.request.contextPath}/security/adminusers.html">
            <li <c:if test="${MANAGE_KEY == 'USERS'}">class="cur"</c:if>>系统用户</li>
        </a>
        <a href="${pageContext.request.contextPath}/security/admindeveloper.html">
            <li <c:if test="${MANAGE_KEY == 'DEVELOPER'}">class="cur"</c:if>>发布者</li>
        </a>
    </ul>
</div>