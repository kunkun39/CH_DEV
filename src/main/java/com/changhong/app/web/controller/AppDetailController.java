package com.changhong.app.web.controller;

import com.changhong.app.service.SystemService;
import com.changhong.app.web.facade.dto.MarketAppDTO;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * User: dangwei.pan
 * Date: 16-1-26
 * Time: 下午2:33
 */
public class AppDetailController extends AbstractController {
     private SystemService systemService;


    private String fileRequestHost;

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        Thread.sleep(600);

        int appId = ServletRequestUtils.getIntParameter(httpServletRequest, "appId", -1);

        Map<String, Object> model = new HashMap<String, Object>();

        MarketAppDTO dto = systemService.obtainMarketApp(appId, true);
        if (StringUtils.hasText(dto.getAppDescription())) {
            dto.setAppDescription(dto.getAppDescription().replace("\r\n", "<br/>"));
        }

        model.put("app", dto);
        model.put("fileRequestHost", fileRequestHost);
        return new ModelAndView("common/appdetail", model);
    }

    /**
     * ************************getter/setter方法***************************************
     */

    public void setSystemService(SystemService systemService) {
        this.systemService = systemService;
    }

    public void setFileRequestHost(String fileRequestHost) {
        this.fileRequestHost = fileRequestHost;
    }
}
