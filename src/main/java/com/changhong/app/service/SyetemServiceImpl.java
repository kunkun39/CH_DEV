package com.changhong.app.service;

import com.changhong.app.domain.AdminUser;
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
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 15-12-25
 * Time: 上午10:27
 * To change this template use File | Settings | File Templates.
 */
@Service("systemService")
public class SyetemServiceImpl implements SystemService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private SystemDao systemDao;

    public List<AdminUserDTO> obtainAdminUsers(String keyWords, int startPosition, int pageSize) {
        List<AdminUser> adminUserList = userDao.loadAdminUsersByNameOrContactway(keyWords, startPosition, pageSize);

        return AdminUserWebAssember.DomainToDto(adminUserList);
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
        return MarketAppWebAssember.DomainToDto(marketAppList);
    }

    public int obtainMarketAppSize(String appName, String appStatus) {
        return systemDao.loadMarketAppSize(appName, appStatus);
    }
}
