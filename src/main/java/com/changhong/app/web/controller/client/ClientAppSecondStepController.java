package com.changhong.app.web.controller.client;

import com.changhong.app.exception.CHSecurityException;
import com.changhong.app.service.ClientService;
import com.changhong.app.service.SystemService;
import com.changhong.app.utils.SecurityUtils;
import com.changhong.app.web.facade.dto.AppCategoryDTO;
import com.changhong.app.web.facade.dto.MarketAppDTO;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * User: Jack Wang
 * Date: 15-10-23
 * Time: 下午1:19
 */
public class ClientAppSecondStepController extends AbstractController {

    private String fileRequestHost;

    private ClientService clientService;

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("PAGE_KEY", "CLIENT");

        List<AppCategoryDTO> categories = clientService.obtainAllFirstLevelCategory(true);
        request.setAttribute("categories", categories);

        int appId = ServletRequestUtils.getIntParameter(request, "appId", -1);
        MarketAppDTO app = clientService.obtainMarketApp(appId);
        if (app.getOwnerId() != SecurityUtils.currectAuthenticationId()) {
            throw new CHSecurityException("app first step with edit app is not your app");
        }
        model.put("fileRequestHost", fileRequestHost);
        model.put("marketApp", app);
        model.put("STEP_KEY", app.decideWhichStepNow());

        int current = ServletRequestUtils.getIntParameter(request, "current", 1);
        String appName = ServletRequestUtils.getStringParameter(request, "appName", "");
        String appStatus = ServletRequestUtils.getStringParameter(request, "appStatus", "ALL");
        model.put("current", current);
        model.put("appName", appName);
        model.put("appStatus", appStatus);
        return new ModelAndView("client/appsecondstep", model);
    }

    public void setClientService(ClientService clientService) {
        this.clientService = clientService;
    }

    public void setFileRequestHost(String fileRequestHost) {
        this.fileRequestHost = fileRequestHost;
    }
}
