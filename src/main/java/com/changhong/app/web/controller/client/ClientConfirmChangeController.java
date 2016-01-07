package com.changhong.app.web.controller.client;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;
import java.util.HashMap;

/**
 * Created by IntelliJ IDEA.
 * User: OscarChang
 * Date: 15-12-31
 * Time: 下午2:53
 * To change this template use File | Settings | File Templates.
 */
public class ClientConfirmChangeController extends AbstractController {

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView("client/clientconfirmchange");
    }
}


