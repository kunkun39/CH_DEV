package com.changhong.app.web.controller.client;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * User: pan dangwei
 * Date: 15-12-22
 * Time: 下午2:35
 */
public class AboutUsController extends AbstractController {

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();

        model.put("PAGE_KEY", "ABOUTUS");

        return new ModelAndView("chapp/aboutus", model);
    }
}
