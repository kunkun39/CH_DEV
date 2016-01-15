package com.changhong.app.web.controller.admin;

import com.changhong.app.domain.AppStatus;
import com.changhong.app.exception.CHSecurityException;
import com.changhong.app.service.SystemService;
import com.changhong.app.utils.SecurityUtils;
import com.changhong.app.utils.StatusManageUtils;
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
 * Date: 15-12-31
 * Time: 上午11:52
 */
public class AdminAppStatusChangeController extends AbstractController {

    private SystemService systemService;

    private String serverContext;

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        if (!SecurityUtils.isAdminRole()) {
            throw new CHSecurityException("you do not have administrator privileges");
        }

        int appId = ServletRequestUtils.getIntParameter(httpServletRequest, "appId", -1);
        String appChangeStatus = ServletRequestUtils.getStringParameter(httpServletRequest, "appChangeStatus", "");
        String rejectReason = ServletRequestUtils.getStringParameter(httpServletRequest, "rejectReason", "");
        int currentPage = ServletRequestUtils.getIntParameter(httpServletRequest, "current", 1);
        String appName = StringUtils.trimWhitespace(ServletRequestUtils.getStringParameter(httpServletRequest, "appName", ""));
        String appStatus = ServletRequestUtils.getStringParameter(httpServletRequest, "appStatus", "");
        if (appId != -1) {
            if (StatusManageUtils.checkStatusValid(appId, appChangeStatus, true)) {
                systemService.updateMarketAppStatus(appId, appChangeStatus, rejectReason);
            }
        }
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("appId", appId);
        model.put("current", currentPage);
        model.put("appName", appName);
        model.put("appStatus", appStatus);
        if (appChangeStatus.equals("REJECTED")) {
            return new ModelAndView(new RedirectView("/" + serverContext + "/security/adminappoverview.html"), model);
        } else {
            return new ModelAndView(new RedirectView("/" + serverContext + "/security/adminappoperate.html"), model);
        }
    }

    public void setSystemService(SystemService systemService) {
        this.systemService = systemService;
    }

    public void setServerContext(String serverContext) {
        this.serverContext = serverContext;
    }
}
