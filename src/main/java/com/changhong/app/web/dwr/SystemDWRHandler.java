package com.changhong.app.web.dwr;

import com.changhong.app.domain.AdminUser;
import com.changhong.app.domain.ClientUser;
import com.changhong.app.domain.EnumUserLogin;
import com.changhong.app.service.ClientService;
import com.changhong.app.service.SystemService;
import com.changhong.app.service.UserService;
import com.changhong.app.utils.ValidatorUtils;
import com.changhong.app.web.controller.user.UserRegisterCodeController;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

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
     * @return 0 正常用户；1：用户名为空；2：用户名格式不正确，3：用户未成功注册；4：用户被禁用
     */
    public int checkUserNameRight(String username) {
        if (username == null || username.equals("")) {
            return 1;//为空，（不会走到这一步，在js中就判断了）
        }
        if (!ValidatorUtils.isValidEmail(username)) {
            return 2;//邮箱格式不对
        }
        ClientUser clientUser = userService.obtainClientUserByUserName(username);
        if (clientUser == null || (clientUser != null && !clientUser.isActive())) {
            return 3;//用户未成功注册
        }

        if (clientUser != null && !clientUser.isEnabled()) {
            return 4;//用户被禁用
        }
        return 0;
    }

    /**
     * 注册检查
     *
     * @param username
     * @param password
     * @param validateCode
     * @param request
     * @return 0：通过；1：验证码不正确；2：用户邮箱未验证通过；3：用户被禁用；4：密码不正确；5：账号不存在
     */
    public int checkUserLogin(String username, String password, String validateCode, HttpServletRequest request) {
        boolean validateCodeRight = checkValidateCodeRight(validateCode, request);
        if (!validateCodeRight) {
            return EnumUserLogin.VALIDATECODEWRONG.getDescription();//验证码不正确
        }

        ClientUser clientUser = userService.obtainClientUserByUserName(username);
        if (clientUser != null && clientUser.isActive() && clientUser.isEnabled() && password.equals(clientUser.getPassword())) {
            return EnumUserLogin.CANLOGIN.getDescription();//完美通过用户匹配，可以减少一次查询系统管理员
        }
        if (clientUser != null) {
            if (!clientUser.isActive()) {
                return EnumUserLogin.NOTACTIVE.getDescription();//用户邮箱未验证通过
            }
            if (!clientUser.isEnabled()) {
                return EnumUserLogin.NOTENABLE.getDescription();//用户被禁用
            }
            if (!password.equals(clientUser.getPassword())) {
                return EnumUserLogin.PWDWRONG.getDescription();//用户名密码不正确
            }
        }
        //判断管理员账号
        List<AdminUser> adminUsers = systemService.obtailAdminUserByUserName(username);
        if ((adminUsers == null || adminUsers.size() == 0) && clientUser == null) {
            return EnumUserLogin.NOTEXISTS.getDescription();//账号不存在
        }
        if (adminUsers != null && adminUsers.size() > 0) {
            AdminUser adminUser = adminUsers.get(0);
            if (adminUser != null && !adminUser.isEnabled()) {
                return EnumUserLogin.NOTENABLE.getDescription();
            }
            if (adminUser != null && !password.equals(adminUser.getPassword())) {
                return EnumUserLogin.PWDWRONG.getDescription();
            }
        }
        return EnumUserLogin.CANLOGIN.getDescription();//可以执行登录
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
