package com.changhong.app.web.dwr;

import com.changhong.app.service.ClientService;
import com.changhong.app.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("systemDWRHandler")
public class SystemDWRHandler {

    @Autowired
    private SystemService systemService;

    @Autowired
    private ClientService clientService;

    public boolean validatePackageNameDuplicate(int appId, String appPackage) {
        return clientService.obtainAppPackageNameDuplicate(appId, appPackage);
    }

    public boolean validateUserNameDuplicate(String userName) {
        return systemService.hasSameAdminUser(userName);
    }

    public void updateDeveloperStatus(int developerId, boolean enabled) {
        systemService.updateDeloperStatus(developerId, enabled);
    }
}
