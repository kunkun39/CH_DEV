package com.changhong.app.web.paging;

import com.changhong.app.service.SystemService;
import com.changhong.app.web.facade.dto.MarketAppDTO;

import java.util.List;

/**
 * User: Administrator
 * Date: 15-12-26
 * Time: 下午10:27
 */
public class AdminMarketAppOverviewPaging extends AbstractPaging<MarketAppDTO> {

    private SystemService systemService;

    private String appName;

    private String appStatus;

    public AdminMarketAppOverviewPaging(SystemService systemService) {
        this.systemService = systemService;
    }

    @Override
    public int getPageSize() {
        return 5;
    }

    @Override
    public List<MarketAppDTO> getItems() {
        return systemService.obtainMarketApps(appName, appStatus, getStartPosition(), getPageSize());
    }

    @Override
    public long getTotalItemSize() {
        if (totalItemSize < 0) {
            totalItemSize = systemService.obtainMarketAppSize(appName, appStatus);
        }

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
