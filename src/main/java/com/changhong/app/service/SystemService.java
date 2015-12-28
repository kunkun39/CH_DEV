package com.changhong.app.service;

import com.changhong.app.web.facade.dto.AdminUserDTO;
import com.changhong.app.web.facade.dto.ClientUserDTO;
import com.changhong.app.web.facade.dto.MarketAppDTO;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 15-12-24
 * Time: 下午5:55
 * To change this template use File | Settings | File Templates.
 */
public interface SystemService {
    List<AdminUserDTO> obtainAdminUsers(String keyWords, int startPosition, int pageSize);

    int obtainAdminUserSize(String keyWords);

    List<ClientUserDTO> obtainClientUsers(String name, int startPosition, int pageSize);

    int ObtainClientUserSize(String name);

    List<MarketAppDTO> obtainMarketApps(String appName, String appStatus, int startPosition, int pageSize);

    int obtainMarketAppSize(String appName, String appStatus);
}
