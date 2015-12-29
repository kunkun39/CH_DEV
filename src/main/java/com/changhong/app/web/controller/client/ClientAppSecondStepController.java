package com.changhong.app.web.controller.client;

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

    private SystemService systemService;

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();
        request.setAttribute("STEP_KEY", "SECOND");
        List<AppCategoryDTO> categories = clientService.obtainAllFirstLevelCategory(true);
        request.setAttribute("categories", categories);

        int appId = ServletRequestUtils.getIntParameter(request, "appId", -1);
        MarketAppDTO app = clientService.obtainMarketApp(appId);
        boolean allowSee = false;
        if (app.getOwnerId() == SecurityUtils.currectAuthenticationId()) {
            allowSee = true;
            model.put("marketApp", app);
        }

//        List<AppHistoryDTO> histories = systemService.obtainAppChangeHistory(appId);
//        request.setAttribute("histories", histories);

        model.put("allowSee", allowSee);
        model.put("fileRequestHost", fileRequestHost);
        return new ModelAndView("client/appsecondstep", model);
    }

    public void setSystemService(SystemService systemService) {
        this.systemService = systemService;
    }

    public void setClientService(ClientService clientService) {
        this.clientService = clientService;
    }

    public void setFileRequestHost(String fileRequestHost) {
        this.fileRequestHost = fileRequestHost;
    }
}
