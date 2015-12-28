package com.changhong.app.service;

import com.changhong.app.domain.AppCategory;
import com.changhong.app.repository.ClientDao;
import com.changhong.app.web.facade.assember.AppCategoryWebAssember;
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

    public MarketAppDTO obtainMarketAppInformationFromFile(MarketAppDTO app, MultipartFile uploadApkFile, MultipartFile uploadIconFile, MultipartFile uploadPosterFile) {
        return documentService.uploadAppApkData(app, uploadApkFile, uploadIconFile, uploadPosterFile);
    }
}
