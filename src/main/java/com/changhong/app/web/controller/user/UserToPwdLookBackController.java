package com.changhong.app.web.controller.user;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 跳转到找回密码页面
 * User:wangxiufeng
 * Date:2016/1/8
 * Time:16:20
 */
public class UserToPwdLookBackController extends AbstractController {
    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {

        return new ModelAndView("chapp/usertopwdlookback");
    }
}
