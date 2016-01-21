<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<c:if test="${!APPLICATION_LIVE}">
    <script type="text/javascript" src="${RESOURCE_PATH}/javascript/jquery.js"></script>
    <script src="${RESOURCE_PATH}/javascript/vendor/bootstrap.js"></script>
    <script src="${RESOURCE_PATH}/javascript/passwordstrong.js"></script>
    <!--[if lt IE 9]>
    <script src="${RESOURCE_PATH}/javascript/vendor/html5.min.js"></script>
    <script src="${RESOURCE_PATH}/javascript/vendor/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript"
            src="${RESOURCE_PATH}/javascript/round/jquery.roundabout.js"></script>
    <script src="${RESOURCE_PATH}/javascript/vendor/tab.js"></script>
    <script type='text/javascript'
            src='${RESOURCE_PATH}/javascript/jquery-loadmask/jquery.loadmask.min.js'></script>
    <link rel='stylesheet' type='text/css'
          href='${RESOURCE_PATH}/javascript/jquery-loadmask/jquery.loadmask.css'/>
    <script type="text/javascript" src="${RESOURCE_PATH}/javascript/popup.js"></script>
    <script src="${RESOURCE_PATH}/javascript/browserdiff.js"></script>
</c:if>

<c:if test="${APPLICATION_LIVE}">
    <script type="text/javascript" src="${RESOURCE_PATH}/application/compress.min.js"></script>
</c:if>





