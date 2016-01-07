<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<div class="back-con-l">
    <h5 class="color7"><i class="server-icon"></i>后台管理</h5>
    <ul class="back-con-l-ul">
        <a href="${pageContext.request.contextPath}/security/adminappoverview.html">
            <li <c:if test="${MANAGE_KEY == 'APPS'}">class="cur"</c:if>>开发者应用</li>
        </a>

        <a href="${pageContext.request.contextPath}/security/admindeveloper.html">
            <li <c:if test="${MANAGE_KEY == 'DEVELOPER'}">class="cur"</c:if>>开发者管理</li>
        </a>

        <a href="${pageContext.request.contextPath}/security/adminusers.html">
            <li <c:if test="${MANAGE_KEY == 'USERS'}">class="cur"</c:if>>系统用户管理</li>
        </a>

        <a href="${pageContext.request.contextPath}/security/adminuserinfo.html">
            <li <c:if test="${MANAGE_KEY == 'USERINFO'}">class="cur"</c:if>>个人信息管理</li>
        </a>
    </ul>
</div>