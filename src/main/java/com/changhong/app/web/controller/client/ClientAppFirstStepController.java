package com.changhong.app.web.controller.client;

import com.changhong.app.service.ClientService;
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

    public final static String CLINET_UPLOAD_APP_INFO = "CLINET_UPLOAD_APP_INFO";

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

        return new MarketAppDTO();
    }

    @Override
    protected void onBindAndValidate(HttpServletRequest request, Object command, BindException errors) throws Exception {
        String appName = ServletRequestUtils.getStringParameter(request, "appFullName", "");
        if (!StringUtils.hasText(appName)) {
            errors.rejectValue("appFullName", "client.code.notright");
        }
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

        clientService.obtainMarketAppInformationFromFile(app, apkFile, iconFile, posterFile);
        request.getSession().setAttribute(CLINET_UPLOAD_APP_INFO, app);

        return new ModelAndView(new RedirectView("/" + serverContext + "/security/appsecondstep.html"));
    }

    public void setServerContext(String serverContext) {
        this.serverContext = serverContext;
    }

    public void setClientService(ClientService clientService) {
        this.clientService = clientService;
    }
}