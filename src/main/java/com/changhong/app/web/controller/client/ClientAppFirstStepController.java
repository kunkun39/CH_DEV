package com.changhong.app.web.controller.client;

import com.changhong.app.service.ClientService;
import com.changhong.app.utils.CHFileUtils;
import com.changhong.app.utils.SecurityUtils;
import com.changhong.app.web.facade.dto.AppCategoryDTO;
import com.changhong.app.web.facade.dto.MarketAppDTO;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindException;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * User: Jack Wang
 * Date: 15-12-28
 * Time: 上午10:27
 */
public class ClientAppFirstStepController extends SimpleFormController {

    private String fileRequestHost;

    private String serverContext;

    private ClientService clientService;

    public ClientAppFirstStepController() {
        setCommandClass(MarketAppDTO.class);
        setCommandName("marketApp");
        setFormView("client/appfirststep");
    }

    @Override
    protected Object formBackingObject(HttpServletRequest request) throws Exception {
        List<AppCategoryDTO> categories = clientService.obtainAllFirstLevelCategory(true);
        request.setAttribute("categories", categories);
        request.setAttribute("STEP_KEY", "FIRST");

        boolean allowSee = true;
        MarketAppDTO app = new MarketAppDTO();

        int appId = ServletRequestUtils.getIntParameter(request, "appId", -1);
        if (appId > 0) {
            app = clientService.obtainMarketApp(appId);
            if (app.getOwnerId() != SecurityUtils.currectAuthenticationId()) {
                allowSee = false;
            }
        }

        request.setAttribute("allowSee", allowSee);
        request.setAttribute("fileRequestHost", fileRequestHost);
        return app;
    }

    @Override
    protected void onBindAndValidate(HttpServletRequest request, Object command, BindException errors) throws Exception {
    }

    @Override
    protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
        MarketAppDTO app = (MarketAppDTO) command;

        int categoryId = ServletRequestUtils.getIntParameter(request, "selectCategoryId", -1);
        app.setCategoryId(categoryId);

        DefaultMultipartHttpServletRequest multipartRequest = (DefaultMultipartHttpServletRequest) request;
        MultipartFile apkFile = multipartRequest.getFile("appApkUploadFile");
        MultipartFile iconFile = multipartRequest.getFile("appIconUploadFile");
        MultipartFile posterFile = multipartRequest.getFile("appPosterUploadFile");

        int appId = clientService.obtainMarketAppInformationFromFile(app, apkFile, iconFile, posterFile);

        return new ModelAndView(new RedirectView("/" + serverContext + "/security/appsecondstep.html?appId=" + appId));
    }

    public void setFileRequestHost(String fileRequestHost) {
        this.fileRequestHost = fileRequestHost;
    }

    public void setServerContext(String serverContext) {
        this.serverContext = serverContext;
    }

    public void setClientService(ClientService clientService) {
        this.clientService = clientService;
    }
}
