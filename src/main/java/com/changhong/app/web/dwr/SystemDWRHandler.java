package com.changhong.app.web.dwr;

import com.changhong.app.service.ClientService;
import com.changhong.app.service.SystemService;
import com.changhong.app.service.UserService;
import com.changhong.app.utils.ValidatorUtils;
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

    @Autowired
    private UserService userService;

    public boolean validatePackageNameDuplicate(int appId, String appPackage) {
        return clientService.obtainAppPackageNameDuplicate(appId, appPackage);
    }

    public boolean validateClientPassword(int userId, String password) {
        return userService.obtainOldPasswordRight(userId, password);
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

    /**
     * 校验用户名
     *
     * @param username
     * @return 0正常通过，1：为空；2：用户名格式不正确，3：用户名已存在并且已验证，不能再注册；4：已存在的用户未进行邮箱认证
     */
    public int checkUserNameRight(String username) {
        if (username == null || username.equals("")) {
            return 1;//为空，（不会走到这一步，在js中就判断了）
        }
        if (!ValidatorUtils.isValidEmail(username)) {
            return 2;//邮箱格式不对
        }
        int userState = checkUserCouldRegister(username);
        if (userState > 0) {
            return 3;//用户已存在并且已验证，不能再注册
        }
        return 0;
    }

    /**
     * 用户名是否已存在
     *
     * @param username
     * @return true已经存在
     */
    public boolean checkUserEnable(String username) {
        return userService.obtainUserEnable(username);
    }

    /**
     * 用户是否ENABLE
     *
     * @param username
     * @return true已经存在
     */
    public boolean checkUserNameExist(String username) {
        return userService.obtainClientUserExist(username);
    }

    /**
     * 检查用户是否可以注册
     *
     * @param username 用户注册邮箱
     * @return -1 用户不存在；0 用户没有执行邮箱认证；大于0 用户的id
     */
    public int checkUserCouldRegister(String username) {
        return userService.obtailUserCouldRegister(username);
    }

    /**
     * 效验用户输入的验证码
     *
     * @param inputcode 验证码
     * @param request
     * @return true：验证码输入正确
     */
    public boolean checkRegisterCodeRight(String inputcode, HttpServletRequest request) {
        return UserRegisterCodeController.validate(request, inputcode);
    }
}
