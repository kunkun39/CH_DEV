<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<div class="cofirm-step ">
    <div class="col-sm-1"></div>
    <ul class="cofirm-step-ul text-center col-sm-11">
        <li class="cofirm-step-li">
            <h4 class="step-circular color1 <c:if test="${STEP_KEY=='FIRST'}">step-cur</c:if>">1</h4>
            <span class="color7 font12">提交应用信息</span>
        </li>
        <li>
            <h4 class="step-bar"></h4>
        </li>
        <li class="cofirm-step-li">
            <h4 class="step-circular color1 <c:if test="${STEP_KEY=='SECOND'}">step-cur</c:if>">2</h4>
            <span class="color7 font12">等待审核</span>
        </li>
        <li>
            <h4 class="step-bar"></h4>
        </li>
        <li class="cofirm-step-li">
            <h4 class="step-circular color1">3</h4>
            <span class="color7 font12">审核通过</span>
        </li>
        <li>
            <h4 class="step-bar"></h4>
        </li>
        <li class="cofirm-step-li">
            <h4 class="step-circular color1">4</h4>
            <span class="color7 font12">上架成功</span>
        </li>
    </ul>
</div>
