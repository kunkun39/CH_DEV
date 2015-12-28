package com.changhong.app.service;

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

    MarketAppDTO obtainMarketAppInformationFromFile(MarketAppDTO app, MultipartFile uploadApkFile, MultipartFile uploadIconFile, MultipartFile uploadPosterFile);

}