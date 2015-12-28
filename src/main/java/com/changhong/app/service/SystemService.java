package com.changhong.app.service;

import com.changhong.app.web.facade.dto.AdminUserDto;
import com.changhong.app.web.facade.dto.MarketAppDto;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 15-12-24
 * Time: 下午5:55
 * To change this template use File | Settings | File Templates.
 */
public interface SystemService {
    List<AdminUserDto> obtainAdminUsers(String keyWords, int startPosition, int pageSize);

    int obtainAdminUserSize(String keyWords);

    List<MarketAppDto> obtainMarketApps(String appName, String appStatus, int startPosition, int pageSize);

    int obtainMarketAppSize(String appName, String appStatus);
}
