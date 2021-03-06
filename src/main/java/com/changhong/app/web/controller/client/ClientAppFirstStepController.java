package com.changhong.app.web.controller.client;

import com.changhong.app.domain.AppStatus;
import com.changhong.app.exception.CHSecurityException;
import com.changhong.app.service.ClientService;
import com.changhong.app.service.DocumentService;
import com.changhong.app.utils.CHFileUtils;
import com.changhong.app.utils.SecurityUtils;
import com.changhong.app.utils.StatusManageUtils;
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

    private DocumentService documentService;

    private MarketAppDTO oldMarketAppDTO = null;

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
        request.setAttribute("PAGE_KEY", "CLIENT");

        MarketAppDTO app = new MarketAppDTO();

        int appId = ServletRequestUtils.getIntParameter(request, "appId", -1);
        if (appId > 0) {
            app = clientService.obtainMarketApp(appId, false);
            if (app.getOwnerId() != SecurityUtils.currectAuthenticationId()) {
                throw new CHSecurityException("app first step with edit app is not your app");
            }
        }

        request.setAttribute("fileRequestHost", fileRequestHost);
        if (app != null) {
            oldMarketAppDTO = new MarketAppDTO(app);
        }
        return app;
    }

    @Override
    protected void onBindAndValidate(HttpServletRequest request, Object command, BindException errors) throws Exception {
        MarketAppDTO app = (MarketAppDTO) command;
        if (app.getId() > 0 &&!StatusManageUtils.checkStatusValid(app.getId(), AppStatus.WAITING.name(), false)) {
            errors.rejectValue("errorId", "", "<div class=\"form-group\"><label for=\"\" class=\"col-sm-3 control-label\">&nbsp;</label><div class=\"col-sm-9\"><i class=\"ico-error\"></i>应用状态发生变化,不能提交!请返回!</div></div>");
        }

        DefaultMultipartHttpServletRequest multipartRequest = (DefaultMultipartHttpServletRequest) request;
        MultipartFile apkFile = multipartRequest.getFile("appApkUploadFile");
        String uploadPackage = app.getAppPackage();

        app = documentService.uploadAppApkData(app, apkFile, null, null);
        String parsePackage = app.getAppPackage();
        if (!parsePackage.equals(uploadPackage)) {
            app.setAppPackage(uploadPackage);
            documentService.deleteAll(app);
            errors.rejectValue("appPackage", "", "<i class=\"ico-error\"></i>你输入的应用包名和APK的包名不一致! APK包名为:" + parsePackage);
        }
    }

    @Override
    protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command, BindException errors) throws Exception {
        MarketAppDTO app = (MarketAppDTO) command;

        int categoryId = ServletRequestUtils.getIntParameter(request, "selectCategoryId", -1);
        app.setCategoryId(categoryId);

        DefaultMultipartHttpServletRequest multipartRequest = (DefaultMultipartHttpServletRequest) request;
        MultipartFile iconFile = multipartRequest.getFile("appIconUploadFile");
        MultipartFile posterFile = multipartRequest.getFile("appPosterUploadFile");

        int appId = clientService.obtainMarketAppInformationFromFile(oldMarketAppDTO, app, null, iconFile, posterFile);

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

    public void setDocumentService(DocumentService documentService) {
        this.documentService = documentService;
    }
}
