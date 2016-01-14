package com.changhong.app.web.controller;

import com.changhong.app.service.SystemService;
import com.changhong.app.web.facade.dto.MarketAppDTO;
import com.changhong.app.web.paging.MarketAppOverviewPaging;
import org.springframework.util.StringUtils;
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
        model.put("PAGE_KEY", "INDEX");
        model.put("fileRequestHost", fileRequestHost);
        model.put("projectVersion", projectVersion);

        MarketAppOverviewPaging paging = new MarketAppOverviewPaging(systemService);
        List<MarketAppDTO> apps = paging.getItems();
        for (MarketAppDTO dto : apps) {
            if (StringUtils.hasText(dto.getAppDescription())) {
                dto.setAppDescription(dto.getAppDescription().replace("\r\n","<br/>"));
            }
        }

        model.put("apps", apps);
        return new ModelAndView("chapp/index", model);
    }

    /**
     * ************************getter/setter方法***************************************
     */

    public void setSystemService(SystemService systemService) {
        this.systemService = systemService;
    }

    public void setProjectVersion(String projectVersion) {
        this.projectVersion = projectVersion;
    }

    public void setFileRequestHost(String fileRequestHost) {
        this.fileRequestHost = fileRequestHost;
    }
}
