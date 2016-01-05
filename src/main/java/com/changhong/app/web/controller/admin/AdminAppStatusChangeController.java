package com.changhong.app.web.controller.admin;

import com.changhong.app.exception.CHSecurityException;
import com.changhong.app.service.SystemService;
import com.changhong.app.utils.SecurityUtils;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * User: pengjie
 * Date: 15-12-31
 * Time: 上午11:52
 */
public class AdminAppStatusChangeController extends AbstractController{

    private SystemService systemService;

    private String serverContext;

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        if (!SecurityUtils.isAdminRole()) {
            throw new CHSecurityException("you do not have administrator privileges");
        }

        int appId = ServletRequestUtils.getIntParameter(httpServletRequest, "appId", -1);
        String appStatus = ServletRequestUtils.getStringParameter(httpServletRequest, "appStatus", "");
        if (appId != -1) {
            systemService.updateMarketAppStatus(appId, appStatus);
        }
        return new ModelAndView(new RedirectView("/" + serverContext + "/security/adminappoperate.html?appId=" + appId));
    }

    public SystemService getSystemService() {
        return systemService;
    }

    public void setSystemService(SystemService systemService) {
        this.systemService = systemService;
    }

    public String getServerContext() {
        return serverContext;
    }

    public void setServerContext(String serverContext) {
        this.serverContext = serverContext;
    }
}
