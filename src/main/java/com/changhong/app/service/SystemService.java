package com.changhong.app.service;

import com.changhong.app.web.facade.dto.AdminUserDTO;
import com.changhong.app.web.facade.dto.MarketAppDTO;
import com.changhong.app.web.facade.dto.ClientUserDTO;

import java.util.List;

/**
 * User: Jack Wang
 * Date: 15-12-24
 * Time: 下午5:55
 */
public interface SystemService {

    List<AdminUserDTO> obtainAdminUsers(String keyWords, int startPosition, int pageSize);

    int obtainAdminUserSize(String keyWords);

    List<ClientUserDTO> obtainClientUsers(String name, int startPosition, int pageSize);

    int ObtainClientUserSize(String name);

    List<MarketAppDTO> obtainMarketApps(String appName, String appStatus, int startPosition, int pageSize);

    int obtainMarketAppSize(String appName, String appStatus);

    int insertAdminUser(AdminUserDTO dto);

    boolean hasSameAdminUser(String username);

    MarketAppDTO obtainMarketApp(int appId);

    void updateMarketAppStatus(int appId, String appStatus);

    void updateDeloperStatus(int developerId, boolean enabled);
}
