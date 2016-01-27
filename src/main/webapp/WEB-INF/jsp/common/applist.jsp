<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="ch" uri="http://www.chanhong.com" %>

    <ul class="row apply-ul text-center">
        <c:forEach items="${apps}" var="app">
            <li id="${app.id}" class="col-md-3 col-sm-6" onclick="openCategoryDialog('${app.id}');">
                <a href="javascript:void(0)" title="" class="apply-ul-a">
                    <img src="${fileRequestHost}/${app.appKey}/${app.iconActualFileName}" alt="" width="72"
                         height="72"/>
                    <h5>${app.appName}</h5>

                    <p style="text-decoration: none;">
                        <ch:substring value="${app.appDescription}" length="30" showTitle="false" needUnEscapes="true"/>
                    </p>
                </a>
           </li>
        </c:forEach>
    </ul>
