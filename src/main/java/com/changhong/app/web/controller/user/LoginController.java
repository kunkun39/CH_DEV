package com.changhong.app.web.controller.user;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * User:wangxiufeng
 * Date:2016/1/4
 * Time:10:01
 */
public class LoginController extends AbstractController {

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.getSession().removeAttribute("SPRING_SECURITY_LAST_EXCEPTION");

        return new ModelAndView("chapp/login");//返回chapp目录下的login.jsp页面
    }
}
