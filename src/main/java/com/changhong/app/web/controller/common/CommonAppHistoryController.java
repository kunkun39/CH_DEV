package com.changhong.app.web.controller.common;

import com.changhong.app.exception.CHSecurityException;
import com.changhong.app.service.ClientService;
import com.changhong.app.utils.SecurityUtils;
import com.changhong.app.web.facade.dto.MarketAppDTO;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.ServletRequestUtils;
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

    private ClientService clientService;

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String currentRole = SecurityUtils.currentAuthenticationRole();
        if (!StringUtils.hasText(currentRole) || "ROLE_ANONYMOUS".equals(currentRole)) {
            throw new CHSecurityException("can't access the app history page, don't has coreponse role");
        }

        int appId = ServletRequestUtils.getIntParameter(request, "appId", -1);
        Map<String, Object> model = new HashMap<String, Object>();
        if (SecurityUtils.isAdminRole()) {
            model.put("PAGE_KEY", "ADMIN");
        } else {
            MarketAppDTO appDTO = clientService.obtainMarketApp(appId);
            int currentUserId = SecurityUtils.currectAuthenticationId();
            if (currentUserId != appDTO.getOwnerId()) {
                throw new CHSecurityException("can't access the app history page, don't has coreponse role");
            }
            model.put("PAGE_KEY", "CLIENT");
        }

        int current = ServletRequestUtils.getIntParameter(request, "current", 1);
        String appName = ServletRequestUtils.getStringParameter(request, "appName", "");
        String appStatus = ServletRequestUtils.getStringParameter(request, "appStatus", "ALL");

        model.put("appId", appId);
        model.put("current", current);
        model.put("appName", appName);
        model.put("appStatus", appStatus);
        return new ModelAndView("common/apphistory", model);
    }

    public void setClientService(ClientService clientService) {
        this.clientService = clientService;
    }
}
