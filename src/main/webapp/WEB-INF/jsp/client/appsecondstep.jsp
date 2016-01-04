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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nav.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/backstage.css">
</head>

<body>

<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/header.jsp"/>

<%--内容部分***********************************************************--%>

<div class="container">
    <%--有权限访问***********************************************************--%>
    <c:if test="${allowSee}">
        <div class="panel panel-default">
            <div class="panel-heading">
                应用信息上传
            </div>

            <%--步骤的头***********************************************************--%>

            <jsp:include page="/WEB-INF/jsp/common/appsteptitle.jsp"/>

            <form class="form-horizontal">
                <div class="form-body">

                <jsp:include page="/WEB-INF/jsp/common/appinfo.jsp"/>

                <div class="form-group">
                    <label class="col-sm-3 control-label">&nbsp;</label>
                    <div class="col-sm-9">
                        <a href="${pageContext.request.contextPath}/security/clientappoverview.html"><input type="button" class="btn-blue color1" value="返  回" /></a>
                        <c:choose>
                            <c:when test="${marketApp.appStatus == 'WAITING'}">
                                <a href="${pageContext.request.contextPath}/security/appfirststep.html?appId=${marketApp.id}"><input type="button" class="btn-blue color1" value="修 改" /></a>
                            </c:when>
                            <c:when test="${marketApp.appStatus == 'SHELVES'}">
                                <a href="${pageContext.request.contextPath}/security/appfirststep.html?appId=${marketApp.id}"><input type="button" class="btn-blue color1" value="更 新" /></a>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </form>

            <h5 class="moreApply text-center" style="margin-bottom: 40px;">
				<a href="uploadApply.html" charset="moreApply-a" id="appHis-a">查看应用历史
					<span class="moreico"></span>
				</a>
			</h5>
			<!--加载开始-->
			<div class="load-more text-center">
				<div class="loading" ></div>
				<div class="load-nomore" style="display: none;" >没有更多了</div>
			</div>
			<!--加载结束-->

			<table class="table table-condensed table-bordered table-hover table-view-1" id="appHis-table" style="display: none;">
				<thead>
					<tr>
						<th style="padding-left: 20px;">时间</th>
						<th>操作</th>
						<th>细节</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="padding-left: 20px;">
							欧阳,休克
						</td>
						<td>
							<a href="javascript:;" class=" ">激活</a>
						</td>
						<td><span class="color10">在用</span></td>
					</tr>
					<tr>
						<td style="padding-left: 20px;">
							欧阳,休克
						</td>
						<td>
							<a href="javascript:;" class=" ">激活</a>
						</td>
						<td><span class="color7">停止使用</span></td>
					</tr>
				</tbody>
			</table>
        </div>
    </c:if>

    <c:if test="${!allowSee}">
        <div class="panel panel-default">
            <div class="panel-heading">
                页面禁止访问
            </div>
            <div class="panel-con-email row">
                <div class="col-sm-4 text-right">
                    <span class="reg-icon wrong-icon"></span>
                </div>
                <div class="col-sm-8">
                    <p class="font16" style="margin: 10px 0 0;">感谢使用开发者应用接入平台，你没有权限访问该页面</p>
                    <p style="margin:0 0 28px;color: #999;">可能你的会话已经超时或者你还未登陆系统</p>
                    <a href="${pageContext.request.contextPath}/chapp/index.html"><input type="button" class="btn-blue color1" value="返  回" /></a>
                </div>
            </div>
        </div>
    </c:if>
</div>

<%--开头菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<%--Javascript部分***********************************************************--%>
<script src="${pageContext.request.contextPath}/javascript/jquery.min.js"></script>
<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/javascript/vendor/html5.min.js"></script>
<script src="${pageContext.request.contextPath}/javascript/vendor/respond.min.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/javascript/vendor/tab.js"></script>

</body>
</html>
