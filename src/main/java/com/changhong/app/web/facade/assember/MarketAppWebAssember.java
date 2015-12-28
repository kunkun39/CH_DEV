package com.changhong.app.web.facade.assember;

import com.changhong.app.domain.*;
import com.changhong.app.repository.EntityLoadHolder;
import com.changhong.app.web.facade.dto.MarketAppDto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 15-12-25
 * Time: 下午3:28
 * To change this template use File | Settings | File Templates.
 */
public class MarketAppWebAssember {
    public static MarketApp DtoToDomain(MarketAppDto dto) {
        MarketApp marketApp = null;
        // 有问题
        if (dto != null) {
            boolean newClassFlg = true;
            if (dto.getId() > 0) {
                marketApp = (MarketApp) EntityLoadHolder.getUserDao().findById(dto.getId(), MarketApp.class);
                if (marketApp != null) {
                    newClassFlg = false;
                }

                if (newClassFlg) {
                    marketApp = new MarketApp();
                }

                marketApp.setAppKey(dto.getAppKey());
                marketApp.setAppName(dto.getAppName());
                marketApp.setAppDescription(dto.getAppDescription());
                marketApp.setAppVersionInt(dto.getAppVersionInt());
                marketApp.setAppVersion(dto.getAppVersion());
                marketApp.setAppPackage(dto.getAppPackage());
                marketApp.setAppSize(dto.getAppSize());

                AppIcon appIcon = marketApp.getAppIcon();
                if (null == appIcon) {
                    appIcon = new AppIcon();
                    marketApp.setAppIcon(appIcon);
                }
                appIcon.setId(dto.getAppIconId());
                appIcon.setActualFileName(dto.getIconActualFileName());
                appIcon.setUploadFileName(dto.getIconUploadFileName());

                AppFile appFile = marketApp.getAppFile();
                if (null == appFile) {
                    appFile = new AppFile();
                    marketApp.setAppFile(appFile);
                }
                appFile.setId(dto.getAppId());
                appFile.setActualFileName(dto.getAppActualFileName());
                appFile.setUploadFileName(dto.getAppUploadFileName());

                AppPoster appPoster = marketApp.getAppPoster();
                if (null == appPoster) {
                    appPoster = new AppPoster();
                    marketApp.setAppPoster(appPoster);
                }
                appPoster.setId(dto.getAppPosterId());
                appPoster.setActualFileName(dto.getPosterActualFileName());
                appPoster.setUploadFileName(dto.getPosterUploadFileName());

                AppCategory appCategory = marketApp.getAppCategory();
                if (null == appCategory) {
                    appCategory = new AppCategory();
                    marketApp.setAppCategory(appCategory);
                }
                appCategory.setId(dto.getCategoryId());

                ClientUser owner = marketApp.getOwner();
                if (null == owner) {
                    owner = new ClientUser();
                    marketApp.setOwner(owner);
                }
                owner.setId(dto.getOwnerId());
            }
        }

        return marketApp;
    }

    public static MarketAppDto DomainToDto(MarketApp marketApp) {
        MarketAppDto dto = null;

        if (marketApp != null) {
            dto = new MarketAppDto();

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
                dto.setAppId(appFile.getId());
                dto.setAppActualFileName(appFile.getActualFileName());
                dto.setAppUploadFileName(appFile.getUploadFileName());
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

    public static List<MarketAppDto> DomainToDto(List<MarketApp> marketAppList) {
        List<MarketAppDto> dtoList = new ArrayList<MarketAppDto>();

        for(MarketApp marketApp : marketAppList) {
            dtoList.add(DomainToDto(marketApp));
        }

        return dtoList;
    }
}
