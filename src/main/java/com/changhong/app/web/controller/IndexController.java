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
 * User: Jack Wang
 * Date: 15-10-14
 * Time: 下午1:40
 */
public class IndexController extends AbstractController {

     private SystemService systemService;

     private String projectVersion;

     private String fileRequestHost;

     @Override
     protected ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();

        MarketAppOverviewPaging paging = new MarketAppOverviewPaging(systemService);
        List<MarketAppDTO> apps = paging.getItems();

        model.put("apps",apps);
        model.put("fileRequestHost", fileRequestHost);
        model.put("PAGE_KEY", "INDEX");
        model.put("projectVersion", projectVersion);
        return new ModelAndView("chapp/index", model);
    }

    /***************************getter/setter方法****************************************/
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
