package com.changhong.app.web.controller.user;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * User:wangxiufeng
 * Date:2016/1/4
 * Time:10:01
 */
public class UserLoginController extends AbstractController {

    private final static String LAST_LOGIN_FAILED = "LAST_LOGIN_FAILED";

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();

        Object lastException = request.getSession().getAttribute("SPRING_SECURITY_LAST_EXCEPTION");
        if (lastException != null) {
            model.put(LAST_LOGIN_FAILED, LAST_LOGIN_FAILED);
            request.getSession().removeAttribute("SPRING_SECURITY_LAST_EXCEPTION");
        }

        return new ModelAndView("chapp/userlogin", model);
    }
}
