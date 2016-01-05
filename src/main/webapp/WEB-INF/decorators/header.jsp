<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="ch" uri="http://www.chanhong.com" %>

<!--[if lt IE 8]>
<div class="browser-tips">你的浏览器版本过低，开发者业务平台暂不支持，推荐你升级到
<a href="http://windows.microsoft.com/zh-CN/internet-explorer/products/ie/home" target="_blank">IE8</a>以上或者使用
<a href="http://www.google.cn/chrome/intl/zh-CN/landing_chrome.html" target="_blank">谷歌浏览器</a>
</div>
<![endif]-->
<nav class="navbar navbar-default responsive" id="static-nav-bar" role="navigation">
    <div class="navbar-content">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse"
                    id="navbar-toggle">
                <span class="sr-only">展开导航菜单</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span> <span class="icon-bar"></span>
            </button>
            <h1>
                <a class="navbar-brand" id="nav-logo" target="_blank" href="/">开发者应用接入平台</a>
            </h1>
        </div>

        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav navbar-right nav-ul">
                <li <c:if test="${PAGE_KEY == 'INDEX'}">class="cur"</c:if>><a
                        href="${pageContext.request.contextPath}/chapp/index.html">首页</a></li>

                <li <c:if test="${PAGE_KEY == 'ABOUTUS'}">class="cur"</c:if>><a href="${pageContext.request.contextPath}/chapp/aboutus.html">关于我们</a></li>

                <li <c:if test="${PAGE_KEY == 'CONTACTUS'}">class="cur"</c:if>><a
                        href="${pageContext.request.contextPath}/chapp/contactus.html">联系我们</a></li>

                <security:authorize ifNotGranted="ROLE_ADMIN">
                    <li <c:if test="${PAGE_KEY == 'CLIENT'}">class="cur"</c:if>><a
                            href="${pageContext.request.contextPath}/security/clientappoverview.html">我的服务</a></li>
                </security:authorize>

                <security:authorize ifAnyGranted="ROLE_ADMIN">
                    <li <c:if test="${PAGE_KEY == 'ADMIN'}">class="cur"</c:if>><a
                        href="${pageContext.request.contextPath}/security/adminappoverview.html">后台管理</a></li>
                </security:authorize>

                <li class="no-border">
                    <ch:user context="${pageContext.request.contextPath}"/>
                </li>

            </ul>
        </div>
    </div>
</nav>
