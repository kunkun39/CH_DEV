package com.changhong.app.web.paging;

import com.changhong.app.service.ClientService;
import com.changhong.app.web.facade.dto.MarketAppDTO;

import java.util.List;

/**
 * User: Jack Wang
 * Date: 15-12-29
 * Time: 下午12:01
 */
public class ClientAppOverviewPaging extends AbstractPaging<MarketAppDTO> {

    private ClientService clientService;

    private String appName;

    private String appStatus;

    public ClientAppOverviewPaging(ClientService clientService) {
        this.clientService = clientService;
    }

    public List<MarketAppDTO> getItems() {
        return clientService.obtainMarketApps(appName, appStatus, getStartPosition(), getPageSize());
    }

    public long getTotalItemSize() {
        if (totalItemSize >= 0) {
            return totalItemSize;
        }
        totalItemSize = clientService.obtainMarketAppSize(appName, appStatus);
        return totalItemSize;
    }

    public String getParameterValues() {
        return "&appName=" + getAppName() + "&appStatus=" + getAppStatus();
    }

    public String getAppName() {
        return appName;
    }

    public void setAppName(String appName) {
        this.appName = appName;
    }

    public String getAppStatus() {
        return appStatus;
    }

    public void setAppStatus(String appStatus) {
        this.appStatus = appStatus;
    }
}
