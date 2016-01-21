package com.changhong.app.service;

import com.alibaba.fastjson.JSONArray;
import com.changhong.app.web.facade.dto.AppCategoryDTO;
import com.changhong.app.web.facade.dto.MarketAppDTO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * User: Jack Wang
 * Date: 15-12-28
 * Time: 上午10:34
 */
public interface ClientService {

    /*App Flow Part*******************************************************************************/

    List<AppCategoryDTO> obtainAllFirstLevelCategory(boolean includeChildren);

    boolean obtainAppPackageNameDuplicate(int appId, String appPackage);

    int obtainMarketAppInformationFromFile(MarketAppDTO oldMarketAppDTO, MarketAppDTO app, MultipartFile uploadApkFile, MultipartFile uploadIconFile, MultipartFile uploadPosterFile);

    MarketAppDTO obtainMarketApp(int appId, boolean isEscapes);

    /*App Overview Part***************************************************************************/

    List<MarketAppDTO> obtainMarketApps(String appName, String appStatus, int startPosition, int pageSize, boolean isEscapes);

    int obtainMarketAppSize(String appName, String appStatus);

    JSONArray obtainAppHistoryByPage(int startNumber, int appId);

}
