<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="ch" uri="http://www.chanhong.com" %>
<%--<%@ taglib prefix="ch" uri="/WEB-INF/tld/tag.tld" %>--%>

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

<div class="content">
    <div class="container">
        <div class="index-header">
        </div>
    </div>

    <div class="container">
        <form id="client_app_search" action="${pageContext.request.contextPath}/chapp/marketapplistoverview.html" method="post" >
            <div class="input-group" style="margin: 0px auto;" >
                <input name="appName" type="text" placeholder="应用名称" value="${paging.appName}" class="input-sm form-control" style="border:1px solid #778899"/>
                <span class="input-group-btn" style="border:1px dotted #778899">
                    <button type="button" class="btn btn-sm" onclick="searchClientApp();">
                        <i class="search-icon"></i>
                    </button>
                </span>
            </div>
        </form>

        <jsp:include page="/WEB-INF/jsp/common/applist.jsp"/>

        <div class="pagcontrol" style="text-align:center;">
            <ul class="pagination">
                <ch:numberpaging urlMapping="${pageContext.request.contextPath}/chapp/marketapplistoverview.html" paging="${paging}" maxPageNumber="10"/>
            </ul>
        </div>
    </div>
</div>

<%--结尾菜单部分***********************************************************--%>

<jsp:include page="/WEB-INF/decorators/footer.jsp"/>

<%--Javascript部分***********************************************************--%>
<jsp:include page="/WEB-INF/decorators/jsheader.jsp"/>
<script src="${pageContext.request.contextPath}/javascript/popup/modal.popup.js" type="text/javascript"></script>
<script type="text/javascript">

    function searchClientApp() {
        jQuery("#client_app_search").submit();
    }
jQuery(function() {
		settings = {
			align : 'center',									//Valid values, left, right, center
			top : 50, 											//Use an integer (in pixels)
			width : 500, 										//Use an integer (in pixels)
			padding : 10,										//Use an integer (in pixels)
	        backgroundColor : 'white', 						    //Use any hex code
	        source : '', 				    					//Refer to any page on your server, external pages are not valid e.g. http://www.google.co.uk
	        borderColor : '#333333', 							//Use any hex code
	        borderWeight : 2,									//Use an integer (in pixels)
	        borderRadius : 5, 									//Use an integer (in pixels)
	        fadeOutTime : 1000, 									//Use any integer, 0 : no fade
	        disableColor : '#666666', 							//Use any hex code
	        disableOpacity : 60, 								//Valid range 0-100
	        loadingImage : '${pageContext.request.contextPath}/javascript/popup/loading.gif'
		};
		jQuery(document).keyup(function(event) {
			if (event.keyCode == 27) {
				closePopup(settings.fadeOutTime);
			}
		});

	});
function openDetailDialog(id) {
		settings.source = '${pageContext.request.contextPath}/common/appDetail.html?appId=' + id;
		openModalPopup(settings);
	}
function openModalPopup(obj) {
		modalPopup(obj.align, obj.top, obj.width, obj.padding, obj.disableColor, obj.disableOpacity, obj.backgroundColor, obj.borderColor, obj.borderWeight, obj.borderRadius, obj.fadeOutTime, obj.source, obj.loadingImage);
	}

</script>
</body>
</html>
