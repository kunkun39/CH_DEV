package com.changhong.app.web.controller.client;

import com.changhong.app.service.ClientService;
import com.changhong.app.utils.CHFileUtils;
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

    private final static int MAX_ICON_IMAGE_SIZE = 1024 * 20;

    private final static int MAX_POSTER_IMAGE_SIZE = 1024 * 200;

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
        return new MarketAppDTO();
    }

    @Override
    protected void onBindAndValidate(HttpServletRequest request, Object command, BindException errors) throws Exception {
        String appName = ServletRequestUtils.getStringParameter(request, "appName", "");
        if (!StringUtils.hasText(appName)) {
            errors.rejectValue("appName", "app.name.empty");
        }
        String appPackage = ServletRequestUtils.getStringParameter(request, "appPackage", "");
        if (!StringUtils.hasText(appPackage)) {
            errors.rejectValue("appPackage", "app.package.empty");
        } else {
            boolean duplicate = clientService.obtainAppPackageNameDuplicate(-1, appPackage);
            if (duplicate) {
                errors.rejectValue("appPackage", "app.package.duplicate");
            }
        }

        //check file is empty
        DefaultMultipartHttpServletRequest multipartRequest = (DefaultMultipartHttpServletRequest) request;
        MultipartFile appIconUploadFile = multipartRequest.getFile("appIconUploadFile");
        MultipartFile appPosterUploadFile = multipartRequest.getFile("appPosterUploadFile");
        MultipartFile appApkUploadFile = multipartRequest.getFile("appApkUploadFile");

        if (appIconUploadFile == null || appIconUploadFile.getSize() <= 0) {
            errors.rejectValue("appIconId", "app.icon.empty");
        }
        if (appPosterUploadFile == null || appPosterUploadFile.getSize() <= 0) {
            errors.rejectValue("appPosterId", "app.poster.empty");
        }
        if (appApkUploadFile == null || appApkUploadFile.getSize() <= 0) {
            errors.rejectValue("apkFileId", "app.apk.empty");
        }

        //check file format is right
        if (appIconUploadFile != null && appIconUploadFile.getSize() > 0) {
            if (!CHFileUtils.isImageFile(appIconUploadFile.getOriginalFilename()) && !errors.hasFieldErrors("appIconId")) {
                errors.rejectValue("appIconId", "app.image.format");
            } else {
                if (appIconUploadFile.getSize() > MAX_ICON_IMAGE_SIZE) {
                    errors.rejectValue("appIconId", "app.image.bigger");
                }
            }
        }
        if (appPosterUploadFile != null && appPosterUploadFile.getSize() > 0) {
            if (!CHFileUtils.isImageFile(appPosterUploadFile.getOriginalFilename()) && !errors.hasFieldErrors("appPosterId")) {
                errors.rejectValue("appPosterId", "app.image.format");
            } else {
                if (appIconUploadFile.getSize() > MAX_POSTER_IMAGE_SIZE) {
                    errors.rejectValue("appPosterId", "app.image.bigger");
                }
            }
        }
        if (appApkUploadFile != null && appApkUploadFile.getSize() > 0) {
            if (!CHFileUtils.isAndroidAppFile(appApkUploadFile.getOriginalFilename()) && !errors.hasFieldErrors("appFileId")) {
                errors.rejectValue("apkFileId", "app.not.apk");
            }
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
