package com.changhong.app.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.changhong.app.domain.AppCategory;
import com.changhong.app.domain.AppHistory;
import com.changhong.app.domain.AppStatus;
import com.changhong.app.domain.MarketApp;
import com.changhong.app.repository.ClientDao;
import com.changhong.app.utils.JodaUtils;
import com.changhong.app.utils.SecurityUtils;
import com.changhong.app.web.event.AppCreateAction;
import com.changhong.app.web.event.AppStatusChangeAction;
import com.changhong.app.web.facade.assember.AppCategoryWebAssember;
import com.changhong.app.web.facade.assember.MarketAppWebAssember;
import com.changhong.app.web.facade.dto.AppCategoryDTO;
import com.changhong.app.web.facade.dto.MarketAppDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * User: Jack Wang
 * Date: 15-12-28
 * Time: 上午10:34
 */
@Service("clientService")
public class ClientServiceImpl implements ClientService {

    @Autowired
    private DocumentService documentService;

    @Autowired
    private ClientDao clientDao;

    /*App Flow Part*******************************************************************************/

   public List<AppCategoryDTO> obtainAllFirstLevelCategory(boolean includeChildren) {
        List<AppCategory> categories = clientDao.loadAllFirstLevelCategory();
        return AppCategoryWebAssember.toAppCategoryDTOList(categories, includeChildren);
    }

    public boolean obtainAppPackageNameDuplicate(int appId, String appPackage) {
        return clientDao.loadAppPackageDuplicate(appId, appPackage);
    }

    protected String getAPPChangeDetails(MarketAppDTO oldMarketAppDTO, MarketAppDTO newMarketAppDTO) {
        StringBuilder builder = new StringBuilder();
        if (!newMarketAppDTO.getFullCategoryName().equals(oldMarketAppDTO.getFullCategoryName())) {
            builder.append("<br/>● 应用类别：" + oldMarketAppDTO.getFullCategoryName() + "->" + newMarketAppDTO.getFullCategoryName());
        }
        if (!newMarketAppDTO.getAppName().equals(oldMarketAppDTO.getAppName())) {
            builder.append("<br/>● 应用名称：" + oldMarketAppDTO.getAppName() + "->" + newMarketAppDTO.getAppName());
        }
        if (oldMarketAppDTO.getAppVersionInt() != newMarketAppDTO.getAppVersionInt()) {
            builder.append("<br/>● 应用版本(数字)：" + oldMarketAppDTO.getAppVersionInt() + "->" + newMarketAppDTO.getAppVersionInt());
        }
        if (!newMarketAppDTO.getIconUploadFileName().equals(oldMarketAppDTO.getIconUploadFileName())) {
            builder.append("<br/>● 应用图标：" + oldMarketAppDTO.getIconUploadFileName() + "->" + newMarketAppDTO.getIconUploadFileName());
        }
        if (!newMarketAppDTO.getPosterUploadFileName().equals(oldMarketAppDTO.getPosterUploadFileName())) {
            builder.append("<br/>● 应用海报：" + oldMarketAppDTO.getPosterUploadFileName() + "->" + newMarketAppDTO.getPosterUploadFileName());
        }
        if (!newMarketAppDTO.getAppDescription().equals(oldMarketAppDTO.getAppDescription())) {
            builder.append("<br/>● 应用描述：发生更改。");
        }
        return builder.toString();
    }

    protected String getAPPCreateDetails(MarketAppDTO dto) {
        StringBuilder builder = new StringBuilder();
        builder.append("<br/>应用名称:" + dto.getAppName());
        builder.append("<br/>应用包名:" + dto.getAppPackage());
        builder.append("<br/>应用版本(数字):" + dto.getAppVersionInt());
        builder.append("<br/>应用图标:" + dto.getIconUploadFileName());
        builder.append("<br/>应用海报:" + dto.getPosterUploadFileName());
        return builder.toString();
    }
	
    public int obtainMarketAppInformationFromFile(MarketAppDTO oldMarketAppDTO, MarketAppDTO app, MultipartFile uploadApkFile, MultipartFile uploadIconFile, MultipartFile uploadPosterFile) {
        MarketAppDTO marketAppDTO = documentService.uploadAppApkData(app, uploadApkFile, uploadIconFile, uploadPosterFile);
        MarketApp marketApp = MarketAppWebAssember.toMarketAppDomain(marketAppDTO);

        //generate app change history
        boolean created = false;
        if (marketApp.getId() <= 0) {
            created = true;
        }

        documentService.deleteNotUsedFiles(app);

        //generate app change history
        if (created) {
            String details = getAPPCreateDetails(marketAppDTO);
            clientDao.saveOrUpdate(marketApp);
            AppCreateAction action = new AppCreateAction(marketApp.getId(), details);
            AppHistory history = AppHistory.generateAppCreateHistory(action);
            clientDao.saveOrUpdate(history);
        } else {
            String details = getAPPChangeDetails(oldMarketAppDTO, marketAppDTO);
            if (StringUtils.hasText(details)) {
                clientDao.saveOrUpdate(marketApp);
                AppStatus oldAppStatus = AppStatus.isAppStatus(app.getAppStatus()) ? AppStatus.valueOf(oldMarketAppDTO.getAppStatus()) : null;
                AppStatusChangeAction action = new AppStatusChangeAction(false, marketApp.getId(), oldAppStatus, AppStatus.WAITING, details);
                AppHistory history = AppHistory.generateAppStatusChangeHistory(action);
                clientDao.saveOrUpdate(history);
            }
        }

        return marketApp.getId();
    }

    public MarketAppDTO obtainMarketApp(int appId) {
        MarketApp app = (MarketApp) clientDao.findById(appId, MarketApp.class);
        return MarketAppWebAssember.toMarketAppDetailsDTO(app);
    }

    /*App Overview Part***************************************************************************/

    public List<MarketAppDTO> obtainMarketApps(String appName, String appStatus, int startPosition, int pageSize) {
        int currentClientId = SecurityUtils.currectAuthenticationId();
        List<MarketApp> apps = clientDao.loadMarketApps(currentClientId, appName, appStatus, startPosition, pageSize);
        return MarketAppWebAssember.toMarketAppDTOList(apps);
    }

    public int obtainMarketAppSize(String appName, String appStatus) {
        int currentClientId = SecurityUtils.currectAuthenticationId();
        return clientDao.loadMarketAppSize(currentClientId, appName, appStatus);
    }

    public JSONArray obtainAppHistoryByPage(int startNumber, int appId) {
        List<AppHistory> histories = clientDao.loadAppHistoryByPage(startNumber, appId);
        JSONArray array = new JSONArray();

        if (histories != null) {
            for (AppHistory history : histories) {
                JSONObject o = new JSONObject();
                o.put("time", JodaUtils.toFullString(history.getTimestamp()));
                o.put("title", history.getChangeTitle());
                o.put("desc", history.getChangeDescription());

                array.add(o);
            }
        }

        return array;
    }
}
