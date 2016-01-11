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
public class UserLoginController extends AbstractController {

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView("chapp/userlogin");//返回chapp目录下的userlogin.jsp页面
    }
}