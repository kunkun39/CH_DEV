<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<div class="back-con-l fl">
    <h5 class="color7"><i class="server-icon"></i>我的服务</h5>
    <ul class="back-con-l-ul">
        <a href="${pageContext.request.contextPath}/security/clientappoverview.html">
            <li <c:if test="${MENU_KEY == 'APPS'}">class="cur"</c:if>>我的应用</li>
        </a>
        <a href="${pageContext.request.contextPath}/security/clientselfinfo.html">
            <li <c:if test="${MENU_KEY == 'INFO'}">class="cur"</c:if>>账户资料</li>
        </a>
        <a href="${pageContext.request.contextPath}/security/clientchangepass.html">
            <li <c:if test="${MENU_KEY == 'PASS'}">class="cur"</c:if>>修改密码</li>
        </a>
    </ul>
</div>
