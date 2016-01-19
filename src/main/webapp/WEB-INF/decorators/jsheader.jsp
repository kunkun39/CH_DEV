<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<c:if test="${!APPLICATION_LIVE}">
    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/javascript/vendor/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/javascript/passwordstrong.js"></script>
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/javascript/vendor/html5.min.js"></script>
    <script src="${pageContext.request.contextPath}/javascript/vendor/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/javascript/round/jquery.roundabout.js"></script>
    <script src="${pageContext.request.contextPath}/javascript/vendor/tab.js"></script>
    <script type='text/javascript'
            src='${pageContext.request.contextPath}/javascript/jquery-loadmask/jquery.loadmask.min.js'></script>
    <link rel='stylesheet' type='text/css'
          href='${pageContext.request.contextPath}/javascript/jquery-loadmask/jquery.loadmask.css'/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/popup.js"></script>
</c:if>

<c:if test="${APPLICATION_LIVE}">
    <script type="text/javascript" src="${pageContext.request.contextPath}/application/compress.min.js"></script>
</c:if>





