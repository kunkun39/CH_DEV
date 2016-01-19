<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring-form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<!--[if IE 8 ]>
<html class="ie8"> <![endif]-->
<!--[if IE 9 ]>
<html class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html class="activity-no">
<!--<![endif]-->
<head>
	<title>广电应用接入平台</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
     <jsp:include page="/WEB-INF/decorators/cssheader.jsp"/>
</head>

<body>

<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/header.jsp"/>

<%--内容部分***********************************************************--%>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            页面禁止访问
        </div>
        <div class="panel-con-email row">
            <div class="col-sm-4 text-right">
                <span class="reg-icon wrong-icon"></span>
            </div>
            <div class="col-sm-8">
                <p class="font16" style="margin: 10px 0 0;">感谢使用开发者应用接入平台，你访问该页面出错</p>
                <p style="margin:0 0 28px;color: #999;">我们会对该问题进行分析</p>
                <a href="${pageContext.request.contextPath}/chapp/index.html"><input type="button" class="btn-blue color1" value="返  回" /></a>
            </div>
        </div>
    </div>
</div>

<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

</body>
</html>
