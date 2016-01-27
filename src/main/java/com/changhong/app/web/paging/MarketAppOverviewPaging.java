package com.changhong.app.web.paging;

import com.changhong.app.domain.AppStatus;
import com.changhong.app.service.SystemService;
import com.changhong.app.web.facade.dto.MarketAppDTO;

import java.util.List;

/**
 * User: dangwei pan
 * Date: 14-4-9
 * Time: 上午10:34
 */
public class MarketAppOverviewPaging extends AbstractPaging<MarketAppDTO> {

    private SystemService systemService;

    private String appName;


    public MarketAppOverviewPaging(SystemService systemService) {
        this.systemService = systemService;
    }

    @Override
    public List<MarketAppDTO> getItems() {
        return systemService.obtainMarketApps(appName, AppStatus.SHELVES.name(), getStartPosition(), getPageSize(), true);
    }

    @Override
    public int getPageSize() {
        return 20;
    }

    //获得总条数
    public long getTotalItemSize() {
        if (totalItemSize < 0) {
            totalItemSize = systemService.obtainMarketAppSize(appName, AppStatus.SHELVES.name());
        }

        return totalItemSize;
    }

    public String getParameterValues() {
        return "&appName=" + getAppName();
    }

    public String getAppName() {
        return appName;
    }

    public void setAppName(String appName) {
        this.appName = appName;
    }

}

