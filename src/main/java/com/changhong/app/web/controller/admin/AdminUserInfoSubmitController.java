package com.changhong.app.web.controller.admin;

import com.changhong.app.domain.Auth;
import com.changhong.app.exception.CHSecurityException;
import com.changhong.app.service.SystemService;
import com.changhong.app.utils.SecurityUtils;
import com.changhong.app.web.facade.dto.AdminUserDTO;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * User: pengjie
 * Date: 16-1-7
 * Time: 下午4:54
 */
public class AdminUserInfoSubmitController extends AbstractController {

    private SystemService systemService;

    private String serverContext;

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        if (!SecurityUtils.isAdminRole()) {
            throw new CHSecurityException("you do not have administrator privileges");
        }

        String name = ServletRequestUtils.getStringParameter(httpServletRequest, "name", "");
        String contactway = ServletRequestUtils.getStringParameter(httpServletRequest, "contactway", "");
        String oldPassword = ServletRequestUtils.getStringParameter(httpServletRequest, "oldpwd", "");
        String newPassword = ServletRequestUtils.getStringParameter(httpServletRequest, "newpwd", "");
        String confirmPassword = ServletRequestUtils.getStringParameter(httpServletRequest, "confirmpwd", "");
        int userId = SecurityUtils.currectAuthenticationId();
        Map<String, Object> model = new HashMap<String, Object>();
        if (StringUtils.hasText(contactway) || StringUtils.hasText(name)) {
            systemService.updateAdminUserInfo(userId, contactway, name, "");
            if (StringUtils.hasText(name)) {
                Auth auth = SecurityUtils.currentAuthentication();
                auth.setName(name);
            }
            model.put("message", 1);
        } else {
            if (systemService.validateAdminUserPassword(userId, oldPassword) && !oldPassword.equals(newPassword)
                    && newPassword.equals(confirmPassword) && StringUtils.hasText(newPassword)) {
                systemService.updateAdminUserInfo(userId, "","", newPassword);
                model.put("message", 1);
            } else {
                model.put("message", 0);
            }
        }
        return new ModelAndView(new RedirectView("/" + serverContext + "/security/adminuserinfo.html"), model);
    }

    public void setSystemService(SystemService systemService) {
        this.systemService = systemService;
    }

    public void setServerContext(String serverContext) {
        this.serverContext = serverContext;
    }
}
