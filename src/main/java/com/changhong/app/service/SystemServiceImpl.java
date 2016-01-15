package com.changhong.app.service;

import com.changhong.app.domain.*;
import com.changhong.app.repository.SystemDao;
import com.changhong.app.repository.UserDao;
import com.changhong.app.web.security.SecuritySessionManager;
import com.changhong.app.web.event.AppStatusChangeAction;
import com.changhong.app.web.facade.assember.AdminUserWebAssember;
import com.changhong.app.web.facade.assember.ClientUserWebAssember;
import com.changhong.app.web.facade.assember.MarketAppWebAssember;
import com.changhong.app.web.facade.dto.AdminUserDTO;
import com.changhong.app.web.facade.dto.ClientUserDTO;
import com.changhong.app.web.facade.dto.MarketAppDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * User: pengjie
 * Date: 15-12-25
 * Time: 上午10:27
 */
@Service("systemService")
public class SystemServiceImpl implements SystemService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private SystemDao systemDao;

    /* admin user */

    public List<AdminUserDTO> obtainAdminUsers(String keyWords, int startPosition, int pageSize) {
        List<AdminUser> adminUserList = userDao.loadAdminUsersByNameOrContactway(keyWords, startPosition, pageSize);

        return AdminUserWebAssember.toAdminUserDTO(adminUserList);
    }

    public int obtainAdminUserSize(String keyWords) {
        return userDao.loadAdminUserSizeByNameOrContactway(keyWords);
    }

    public int insertAdminUser(AdminUserDTO dto) {
        AdminUser adminUser = AdminUserWebAssember.toAdminUserDomain(dto);
        if (adminUser != null) {
            userDao.saveOrUpdate(adminUser);
            return adminUser.getId();
        }
        else {
            return 0;
        }
    }

    public boolean hasSameAdminUser(String username) {
        List<AdminUser> userList = userDao.loadAdminUserByName(username);
        if (userList == null || userList.isEmpty()) {
            return false;
        }
        return true;
    }

    public AdminUserDTO obtainAdminUserById(int userId) {
        AdminUser adminUser = (AdminUser) userDao.findById(userId, AdminUser.class);

        return AdminUserWebAssember.toAdminUserDTO(adminUser);
    }

    public boolean validateAdminUserPassword(int userId, String password) {
        AdminUser adminUser = (AdminUser) userDao.findById(userId, AdminUser.class);
        if (adminUser != null && adminUser.getPassword().equals(password)) {
            return true;
        }
        return false;
    }

    public void updateAdminUserInfo(int userId, String contextway, String name, String password) {
        AdminUser adminUser = (AdminUser) userDao.findById(userId, AdminUser.class);

        if (adminUser != null) {
            if (StringUtils.hasText(contextway) || StringUtils.hasText(name)) {
                if (StringUtils.hasText(contextway)) {
                    adminUser.setContactWay(contextway);
                }
                if (StringUtils.hasText(name)) {
                    adminUser.setName(name);
                }
            } else if (StringUtils.hasText(password)) {
                adminUser.setPassword(password);
            }
        }
    }

    /* client user */

    public List<ClientUserDTO> obtainClientUsers(String name, int startPosition, int pageSize) {
        List<ClientUser> clientUserList = userDao.loadAdminDevelopers(name, startPosition, pageSize);
        return ClientUserWebAssember.DomainToDto(clientUserList);
    }

    public int ObtainClientUserSize(String name) {
        return userDao.loadAdminDeveloperSize(name);
    }

    public void updateDeloperStatus(int developerId, boolean enabled) {
        ClientUser clientUser = (ClientUser) userDao.findById(developerId, ClientUser.class);

        if(clientUser != null) {
            clientUser.setEnabled(enabled);
        }

        if (!enabled) {
            SecuritySessionManager.removeSessionsByUserName(clientUser.getUsername());
        }
    }

    /* market app */

    public List<MarketAppDTO> obtainMarketApps(String appName, String appStatus, int startPosition, int pageSize) {
        List<MarketApp> marketAppList = systemDao.loadMarketApps(appName, appStatus, startPosition, pageSize);
        return MarketAppWebAssember.toMarketAppDTOList(marketAppList);
    }

    public int obtainMarketAppSize(String appName, String appStatus) {
        return systemDao.loadMarketAppSize(appName, appStatus);
    }

    public MarketAppDTO obtainMarketApp(int appId) {
        MarketApp marketApp = (MarketApp) systemDao.findById(appId, MarketApp.class);
        return MarketAppWebAssember.toMarketAppDetailsDTO(marketApp);
    }

    public void updateMarketAppStatus(int appId, String appStatus, String rejectReason) {
        if (AppStatus.isAppStatus(appStatus)) {
            MarketApp marketApp = (MarketApp) systemDao.findById(appId, MarketApp.class);

            if (marketApp != null) {
                AppStatusChangeAction action = new AppStatusChangeAction(true, appId, marketApp.getAppStatus(), AppStatus.valueOf(appStatus), rejectReason);
                systemDao.saveOrUpdate(AppHistory.generateAppStatusChangeHistory(action));
                marketApp.setAppStatus(AppStatus.valueOf(appStatus));
            }
        }
    }

    public List<AdminUser> obtailAdminUserByUserName(String username) {
        return userDao.loadAdminUserByName(username);
    }

    public String obtainMarketAppStatus(int appId) {
        MarketApp marketApp = (MarketApp) systemDao.findById(appId, MarketApp.class);
        if (marketApp != null) {
            return marketApp.getAppStatus().name();
        }
        return null;
    }
}
