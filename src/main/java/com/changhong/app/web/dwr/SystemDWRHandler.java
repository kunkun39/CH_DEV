package com.changhong.app.web.dwr;

import com.changhong.app.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("systemDWRHandler")
public class SystemDWRHandler {

    @Autowired
    private ClientService clientService;

    public boolean validatePackageNameDuplicate(int appId, String appPackage) {
        return clientService.obtainAppPackageNameDuplicate(appId, appPackage);
    }
}
