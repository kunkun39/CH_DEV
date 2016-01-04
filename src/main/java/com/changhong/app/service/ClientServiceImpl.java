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

    public int obtainMarketAppInformationFromFile(MarketAppDTO app, MultipartFile uploadApkFile, MultipartFile uploadIconFile, MultipartFile uploadPosterFile) {
        MarketAppDTO marketAppDTO = documentService.uploadAppApkData(app, uploadApkFile, uploadIconFile, uploadPosterFile);
        MarketApp marketApp = MarketAppWebAssember.toMarketAppDomain(marketAppDTO);

        //generate app change history
        boolean created = false;
        if (marketApp.getId() <= 0) {
            created = true;
        }

        clientDao.saveOrUpdate(marketApp);
        documentService.deleteNotUsedFiles(app);

        //generate app change history
        if (created) {
            AppCreateAction action = new AppCreateAction(marketApp.getId());
            AppHistory history = AppHistory.generateAppCreateHistory(action);
            clientDao.saveOrUpdate(history);
        } else {
            AppStatusChangeAction action = new AppStatusChangeAction(false, marketApp.getId(), AppStatus.WAITING, AppStatus.WAITING, "");
            AppHistory history = AppHistory.generateAppStatusChangeHistory(action);
            clientDao.saveOrUpdate(history);
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
