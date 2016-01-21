<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<c:if test="${!APPLICATION_LIVE}">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${RESOURCE_PATH}/css/nav.css">
    <link rel="stylesheet" type="text/css" href="${RESOURCE_PATH}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${RESOURCE_PATH}/css/backstage.css">
    <link rel="stylesheet" type="text/css" href="${RESOURCE_PATH}/css/home.css">
    <link rel="stylesheet" type="text/css" href="${RESOURCE_PATH}/css/introduce.css">
</c:if>

<c:if test="${APPLICATION_LIVE}">
    <link rel="stylesheet" href="${RESOURCE_PATH}/application/compress.min.css">
</c:if>