package com.changhong.app.web.controller;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * User: Jack Wang
 * Date: 15-10-14
 * Time: 下午1:40
 */
public class IndexController extends AbstractController {

    private String projectVersion;

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();

        model.put("projectVersion", projectVersion);
        model.put("PAGE_KEY", "INDEX");

        return new ModelAndView("chapp/index", model);
    }

    public void setProjectVersion(String projectVersion) {
        this.projectVersion = projectVersion;
    }
}
