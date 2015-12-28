package com.changhong.app.web.controller.client;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * User: Jack Wang
 * Date: 15-10-14
 * Time: 下午2:35
 */
public class ClientAppOverviewController extends AbstractController {


    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();

        model.put("PAGE_KEY", "CLIENT");
        model.put("MENU_KEY", "APPS");

        return new ModelAndView("client/clientappoverview", model);
    }
}
