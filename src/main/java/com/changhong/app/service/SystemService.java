package com.changhong.app.service;

import com.changhong.app.domain.AdminUser;
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

    /* admin user */

    List<AdminUserDTO> obtainAdminUsers(String keyWords, int startPosition, int pageSize);

    int obtainAdminUserSize(String keyWords);

    int insertAdminUser(AdminUserDTO dto);

    boolean hasSameAdminUser(String username);

    AdminUserDTO obtainAdminUserById(int userId);

    boolean validateAdminUserPassword(int userId, String password);

    void updateAdminUserInfo(int userId, String contextway, String password);

    /* client user */

    List<ClientUserDTO> obtainClientUsers(String name, int startPosition, int pageSize);

    int ObtainClientUserSize(String name);

    void updateDeloperStatus(int developerId, boolean enabled);

    /* market app */

    List<MarketAppDTO> obtainMarketApps(String appName, String appStatus, int startPosition, int pageSize);

    int obtainMarketAppSize(String appName, String appStatus);

    MarketAppDTO obtainMarketApp(int appId);

    void updateMarketAppStatus(int appId, String appStatus, String rejectReason);

    List<AdminUser> obtailAdminUserByUserName(String username);
}
