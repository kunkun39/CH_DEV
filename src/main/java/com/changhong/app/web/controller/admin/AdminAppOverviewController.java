package com.changhong.app.web.controller.admin;

import com.changhong.app.domain.AppStatus;
import com.changhong.app.exception.CHSecurityException;
import com.changhong.app.service.SystemService;
import com.changhong.app.utils.SecurityUtils;
import com.changhong.app.web.facade.dto.MarketAppDTO;
import com.changhong.app.web.paging.AdminMarketAppOverviewPaging;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * User: Jack Wang
 * Date: 15-12-25
 * Time: 下午1:36
 */
public class AdminAppOverviewController extends AbstractController{

    private SystemService systemService;

    private String fileRequestHost;

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        if (!SecurityUtils.isAdminRole()) {
            throw new CHSecurityException("you do not have administrator privileges");
        }

        Map<String, Object> model = new HashMap<String, Object>();

        int currentPage = ServletRequestUtils.getIntParameter(httpServletRequest, "current", 1);
        String appName = StringUtils.trimWhitespace(ServletRequestUtils.getStringParameter(httpServletRequest, "appName", ""));
        String appStatus = ServletRequestUtils.getStringParameter(httpServletRequest, "appStatus", AppStatus.WAITING.name());

        AdminMarketAppOverviewPaging paging = new AdminMarketAppOverviewPaging(systemService);
        constractPaging(paging, currentPage, appName, appStatus);
        List<MarketAppDTO> marketAppDtoList = paging.getItems();

        model.put("PAGE_KEY", "ADMIN");
        model.put("apps", marketAppDtoList);
        model.put("fileRequestHost", fileRequestHost);
        model.put("paging", paging);
        model.put("MANAGE_KEY","APPS");
        return new ModelAndView("admin/adminappoverview", model);
    }

    private void constractPaging(AdminMarketAppOverviewPaging paging, int currentPage, String appName, String appStarus) {
        paging.setCurrentPageNumber(currentPage);
        paging.setAppName(appName);
        paging.setAppStatus(appStarus);
    }

    public SystemService getSystemService() {
        return systemService;
    }

    public void setSystemService(SystemService systemService) {
        this.systemService = systemService;
    }

    public String getFileRequestHost() {
        return fileRequestHost;
    }

    public void setFileRequestHost(String fileRequestHost) {
        this.fileRequestHost = fileRequestHost;
    }
}
