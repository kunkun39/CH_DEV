package com.changhong.app.web.facade.assember;

import com.changhong.app.domain.*;
import com.changhong.app.repository.EntityLoadHolder;
import com.changhong.app.web.facade.dto.MarketAppDTO;

import java.util.ArrayList;
import java.util.List;

/**
 * User: Jack Wang
 * Date: 15-12-25
 * Time: 下午3:28
 */
public class MarketAppWebAssember {

    public static MarketApp toMarketAppDomain(MarketAppDTO dto) {
        MarketApp app = null;
        int appId = dto.getId();
        if (appId > 0) {
            app = (MarketApp) EntityLoadHolder.getUserDao().findById(appId, MarketApp.class);
            app.setAppStatus(AppStatus.CREATED);
        } else {
            app = new MarketApp();
        }

        app.setAppKey(dto.getAppKey());
        app.setAppName(dto.getAppName());
        app.setAppDescription(dto.getAppDescription());
        app.setAppVersionInt(Integer.valueOf(dto.getAppVersionInt()));
        app.setAppVersion(dto.getAppVersion());
        app.setAppPackage(dto.getAppPackage());
        app.setAppSize(dto.getAppSize());

        AppIcon appIcon = app.getAppIcon();
        if (appIcon == null) {
            appIcon = new AppIcon();
            app.setAppIcon(appIcon);
        }
        appIcon.setUploadFileName(dto.getIconUploadFileName());
        appIcon.setActualFileName(dto.getIconActualFileName());

        AppPoster appPoster = app.getAppPoster();
        if (appPoster == null) {
            appPoster = new AppPoster();
            app.setAppPoster(appPoster);
        }
        appPoster.setActualFileName(dto.getPosterActualFileName());
        appPoster.setUploadFileName(dto.getPosterUploadFileName());

        AppFile appFile = app.getAppFile();
        if (appFile == null) {
            appFile = new AppFile();
            app.setAppFile(appFile);
        }
        appFile.setActualFileName(dto.getApkActualFileName());
        appFile.setUploadFileName(dto.getApkUploadFileName());

        if (app.getAppCategory() == null || app.getAppCategory().getId() != dto.getCategoryId()) {
            AppCategory category = new AppCategory();
            category.setId(dto.getCategoryId());
            app.setAppCategory(category);
        }

        return app;
    }

    public static MarketAppDTO toMarketAppDTO(MarketApp marketApp) {
        MarketAppDTO dto = null;

        if (marketApp != null) {
            dto = new MarketAppDTO();

            dto.setId(marketApp.getId());
            dto.setAppKey(marketApp.getAppKey());
            dto.setAppName(marketApp.getAppName());
            dto.setAppDescription(marketApp.getAppDescription());
            dto.setAppVersionInt(marketApp.getAppVersionInt());
            dto.setAppVersion(marketApp.getAppVersion());
            dto.setAppPackage(marketApp.getAppPackage());
            dto.setAppSize(marketApp.getAppSize());
            dto.setAppStatus(marketApp.getAppStatus().name());

            AppCategory appCategory = marketApp.getAppCategory();
            if (appCategory != null) {
                dto.setCategoryId(appCategory.getId());
                dto.setCategoryName(appCategory.getCategoryName());
                dto.setFullCategoryName(appCategory.getFullCategoryPath());
            }

            AppIcon appIcon = marketApp.getAppIcon();
            if (appIcon != null) {
                dto.setAppIconId(appIcon.getId());
                dto.setIconActualFileName(appIcon.getActualFileName());
                dto.setIconUploadFileName(appIcon.getUploadFileName());
            }

            AppFile appFile = marketApp.getAppFile();
            if (appFile != null) {
                dto.setApkFileId(appFile.getId());
                dto.setApkActualFileName(appFile.getActualFileName());
                dto.setApkUploadFileName(appFile.getUploadFileName());
            }

            AppPoster appPoster = marketApp.getAppPoster();
            if (appPoster != null) {
                dto.setAppPosterId(appPoster.getId());
                dto.setPosterActualFileName(appPoster.getActualFileName());
                dto.setPosterUploadFileName(appPoster.getUploadFileName());
            }

            ClientUser owner = marketApp.getOwner();
            if (owner != null) {
                dto.setOwnerId(owner.getId());
            }
        }

        return dto;
    }

    public static List<MarketAppDTO> DomainToDto(List<MarketApp> marketAppList) {
        List<MarketAppDTO> dtoList = new ArrayList<MarketAppDTO>();

        for(MarketApp marketApp : marketAppList) {
            dtoList.add(toMarketAppDTO(marketApp));
        }

        return dtoList;
    }
}
