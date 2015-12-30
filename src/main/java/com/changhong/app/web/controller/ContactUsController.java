package com.changhong.app.web.controller;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: OscarChang
 * Date: 15-12-28
 * Time: 下午1:27
 * To change this template use File | Settings | File Templates.
 */
public class ContactUsController extends AbstractController {

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();

        model.put("PAGE_KEY", "CONTACTUS");

        return new ModelAndView("chapp/contactus", model);
    }
}
