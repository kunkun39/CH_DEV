package com.changhong.app.web.controller.admin;

import com.changhong.app.service.SystemService;
import com.changhong.app.web.facade.dto.MarketAppDTO;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * User: pengjie
 * Date: 15-12-30
 * Time: 下午3:41
 */
public class AdminAppOperateController extends AbstractController{

    private SystemService systemService;

    private String fileRequestHost;

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        Map<String, Object> model = new HashMap<String, Object>();

        int appId = ServletRequestUtils.getIntParameter(httpServletRequest, "appId", -1);

        MarketAppDTO dto = systemService.obtainMarketApp(appId);

        model.put("marketApp", dto);
        model.put("fileRequestHost", fileRequestHost);

        return new ModelAndView("admin/adminappoperate", model);
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
