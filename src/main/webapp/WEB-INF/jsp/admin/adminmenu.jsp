<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 15-12-24
  Time: 上午11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="back-con-l">
    <h5 class="color7"><i class="server-icon"></i>后台管理</h5>
    <ul class="back-con-l-ul">
        <li class="cur"><a href="${pageContext.request.contextPath}/security/adminappmanage.html">应用</a></li>
        <li><a href="${pageContext.request.contextPath}/security/adminusers.html">系统用户</a></li>
        <li><a href="${pageContext.request.contextPath}/security/admindeveloper.html">发布者</a></li>
    </ul>
</div>