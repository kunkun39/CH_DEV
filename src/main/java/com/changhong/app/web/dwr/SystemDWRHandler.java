package com.changhong.app.web.dwr;

import com.changhong.app.service.ClientService;
import com.changhong.app.service.SystemService;
import com.changhong.app.web.controller.user.UserRegisterCodeController;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

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

    public String obtainAppHistoryByPage(int startNumber, int appId) throws JSONException {
        return clientService.obtainAppHistoryByPage(startNumber, appId).toString();
    }

    public void updateDeveloperStatus(int developerId, boolean enabled) {
        systemService.updateDeloperStatus(developerId, enabled);
    }

    public boolean checkValidateCodeRight(String code, HttpServletRequest request) {
        return UserRegisterCodeController.validate(request, code);
    }

    public boolean validatePassword(int userId, String password) {
        return systemService.validateAdminUserPassword(userId, password);
    }
}
