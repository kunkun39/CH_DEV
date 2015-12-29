package com.changhong.app.web.controller.client;

import com.changhong.app.service.ClientService;
import com.changhong.app.utils.SecurityUtils;
import com.changhong.app.web.facade.dto.MarketAppDTO;
import com.changhong.app.web.paging.ClientAppOverviewPaging;
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
 * Date: 15-10-14
 * Time: 下午2:35
 */
public class ClientAppOverviewController extends AbstractController {

    private String fileRequestHost;

    private ClientService clientService;

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("fileRequestHost", fileRequestHost);
        model.put("PAGE_KEY", "CLIENT");
        model.put("MENU_KEY", "APPS");

        int current = ServletRequestUtils.getIntParameter(request, "current", 1);
        String appName = ServletRequestUtils.getStringParameter(request, "appName", "");
        String appStatus = ServletRequestUtils.getStringParameter(request, "appStatus", "ALL");
        ClientAppOverviewPaging paging = new ClientAppOverviewPaging(clientService);
        constructPaging(paging, current, appName, appStatus);


        List<MarketAppDTO> apps = paging.getItems();
        model.put("paging", paging);
        model.put("apps", apps);
        return new ModelAndView("client/clientappoverview", model);
    }

    private void constructPaging(ClientAppOverviewPaging paging, int current, String appName, String appStatus) {
        paging.setCurrentPageNumber(current);
        paging.setAppName(appName);
        paging.setAppStatus(appStatus);
    }

    public void setFileRequestHost(String fileRequestHost) {
        this.fileRequestHost = fileRequestHost;
    }

    public void setClientService(ClientService clientService) {
        this.clientService = clientService;
    }
}
