package com.changhong.app.service;

import com.changhong.app.domain.AdminUser;
import com.changhong.app.domain.AppStatus;
import com.changhong.app.domain.ClientUser;
import com.changhong.app.domain.MarketApp;
import com.changhong.app.repository.SystemDao;
import com.changhong.app.repository.UserDao;
import com.changhong.app.web.facade.assember.AdminUserWebAssember;
import com.changhong.app.web.facade.assember.ClientUserWebAssember;
import com.changhong.app.web.facade.assember.MarketAppWebAssember;
import com.changhong.app.web.facade.dto.AdminUserDTO;
import com.changhong.app.web.facade.dto.ClientUserDTO;
import com.changhong.app.web.facade.dto.MarketAppDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    public List<AdminUserDTO> obtainAdminUsers(String keyWords, int startPosition, int pageSize) {
        List<AdminUser> adminUserList = userDao.loadAdminUsersByNameOrContactway(keyWords, startPosition, pageSize);

        return AdminUserWebAssember.toAdminUserDTO(adminUserList);
    }

    public int obtainAdminUserSize(String keyWords) {
        return userDao.loadAdminUserSizeByNameOrContactway(keyWords);
    }

    public List<ClientUserDTO> obtainClientUsers(String name, int startPosition, int pageSize) {
        List<ClientUser> clientUserList = userDao.loadAdminDevelopers(name, startPosition, pageSize);
        return ClientUserWebAssember.DomainToDto(clientUserList);
    }

    public int ObtainClientUserSize(String name) {
        return userDao.loadAdminDeveloperSize(name);
    }

    public List<MarketAppDTO> obtainMarketApps(String appName, String appStatus, int startPosition, int pageSize) {
        List<MarketApp> marketAppList = systemDao.loadMarketApps(appName, appStatus, startPosition, pageSize);
        return MarketAppWebAssember.toMarketAppDTOList(marketAppList);
    }

    public int obtainMarketAppSize(String appName, String appStatus) {
        return systemDao.loadMarketAppSize(appName, appStatus);
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

    public MarketAppDTO obtainMarketApp(int appId) {
        MarketApp marketApp = (MarketApp) systemDao.findById(appId, MarketApp.class);
        return MarketAppWebAssember.toMarketAppDetailsDTO(marketApp);
    }

    public void updateMarketAppStatus(int appId, String appStatus) {
        if (AppStatus.isAppStatus(appStatus)) {
            MarketApp marketApp = (MarketApp) systemDao.findById(appId, MarketApp.class);

            if (marketApp != null) {
                marketApp.setAppStatus(AppStatus.valueOf(appStatus));
            }
        }
    }
}
