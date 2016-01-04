package com.changhong.app.web.controller.common;

import com.changhong.app.exception.CHSecurityException;
import com.changhong.app.service.ClientService;
import com.changhong.app.utils.SecurityUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * User: Jack Wang
 * Date: 16-1-4
 * Time: 上午9:48
 */
public class CommonAppHistoryController extends AbstractController {

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String currentRole = SecurityUtils.currentAuthenticationRole();
        if (!StringUtils.hasText(currentRole) || "ROLE_ANONYMOUS".equals(currentRole)) {
            throw new CHSecurityException("can't access the app history page, don't has coreponse role");
        }

        Map<String, String> model = new HashMap<String, String>();
        if (SecurityUtils.isAdminRole()) {
            model.put("PAGE_KEY", "MANAGE_KEY");
        } else {
            model.put("PAGE_KEY", "CLIENT");
        }

        return new ModelAndView("common/apphistory", model);
    }
}
