package com.changhong.app.web.controller;

import com.changhong.app.service.SystemService;
import com.changhong.app.web.facade.dto.MarketAppDTO;
import com.changhong.app.web.paging.MarketAppOverviewPaging;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * User: dangwei pan
 * Date: 15-12-31
 * Time: 下午4:52
 */
public class MarketAppListOverViewController extends AbstractController {
     private SystemService systemService;

     private String projectVersion;

     private String fileRequestHost;

     @Override
     protected ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();

         //如果页面中无名为"current"的参数存在,则返回默认值int default value
        int currentPage = ServletRequestUtils.getIntParameter(httpServletRequest, "current", 1);
        System.out.println(currentPage);

         //trim()去除字符串空格
        String appName = ServletRequestUtils.getStringParameter(httpServletRequest, "appName", "").trim();

        MarketAppOverviewPaging paging = new MarketAppOverviewPaging(systemService);
        constractPaging(paging, currentPage, appName);
//        model.put("paging", paging);
        List<MarketAppDTO> apps = paging.getItems();

        model.put("apps",apps);
        model.put("fileRequestHost", fileRequestHost);
        model.put("paging", paging);
        model.put("PAGE_KEY", "INDEX");
        model.put("projectVersion", projectVersion);
        return new ModelAndView("chapp/marketapplistoverview", model);
    }

    private void constractPaging(MarketAppOverviewPaging paging, int currentPage, String appName) {
        paging.setCurrentPageNumber(currentPage);
        paging.setAppName(appName);
    }

    public SystemService getSystemService() {
        return systemService;
    }

    public void setSystemService(SystemService systemService) {
        this.systemService = systemService;
    }

    public void setProjectVersion(String projectVersion) {
        this.projectVersion = projectVersion;
    }

    public String getFileRequestHost() {
        return fileRequestHost;
    }

    public void setFileRequestHost(String fileRequestHost) {
        this.fileRequestHost = fileRequestHost;
    }
}
