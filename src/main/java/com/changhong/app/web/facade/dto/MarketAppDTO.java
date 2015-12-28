package com.changhong.app.web.facade.dto;

import com.changhong.app.domain.Document;

import java.io.Serializable;

/**
 * User: Jack Wang
 * Date: 15-12-25
 * Time: 下午3:29
 */
public class MarketAppDTO implements Serializable{

    private int id;

    private String appKey;

    private String appName;

    private String appDescription;

    private int appVersionInt;

    private String appVersion;

    private String appPackage;

    private String appSize;

    private String appSizeFormat;

    private String appStatus;

    private String appStatusName;

    private int categoryId;

    private String categoryName;

    private String fullCategoryName;

    private int appIconId;

    private String iconActualFileName;

    private String iconUploadFileName;

    private int appPosterId;

    private String posterActualFileName;

    private String posterUploadFileName;

    private int apkFileId;

    private String apkActualFileName;

    private String apkFakeFileName;

    private int ownerId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAppKey() {
        return appKey;
    }

    public void setAppKey(String appKey) {
        this.appKey = appKey;
    }

    public String getAppName() {
        return appName;
    }

    public void setAppName(String appName) {
        this.appName = appName;
    }

    public String getAppDescription() {
        return appDescription;
    }

    public void setAppDescription(String appDescription) {
        this.appDescription = appDescription;
    }

    public int getAppVersionInt() {
        return appVersionInt;
    }

    public void setAppVersionInt(int appVersionInt) {
        this.appVersionInt = appVersionInt;
    }

    public String getAppVersion() {
        return appVersion;
    }

    public void setAppVersion(String appVersion) {
        this.appVersion = appVersion;
    }

    public String getAppPackage() {
        return appPackage;
    }

    public void setAppPackage(String appPackage) {
        this.appPackage = appPackage;
    }

    public String getAppSize() {
        return appSize;
    }

    public void setAppSize(String appSize) {
        this.appSize = appSize;
        try {
            setAppSizeFormat(Document.getFileSize(appSize));
        } catch (Exception e) {
            e.printStackTrace();
            setAppSizeFormat("未知大小");
        }
    }

    public String getAppSizeFormat() {
        return appSizeFormat;
    }

    public void setAppSizeFormat(String appSizeFormat) {
        this.appSizeFormat = appSizeFormat;
    }

    public String getAppStatus() {
        return appStatus;
    }

    public void setAppStatus(String appStatus) {
        this.appStatus = appStatus;
    }

    public String getAppStatusName() {
        return appStatusName;
    }

    public void setAppStatusName(String appStatusName) {
        this.appStatusName = appStatusName;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getFullCategoryName() {
        return fullCategoryName;
    }

    public void setFullCategoryName(String fullCategoryName) {
        this.fullCategoryName = fullCategoryName;
    }

    public int getAppIconId() {
        return appIconId;
    }

    public void setAppIconId(int appIconId) {
        this.appIconId = appIconId;
    }

    public String getIconActualFileName() {
        return iconActualFileName;
    }

    public void setIconActualFileName(String iconActualFileName) {
        this.iconActualFileName = iconActualFileName;
    }

    public String getIconUploadFileName() {
        return iconUploadFileName;
    }

    public void setIconUploadFileName(String iconUploadFileName) {
        this.iconUploadFileName = iconUploadFileName;
    }

    public int getApkFileId() {
        return apkFileId;
    }

    public void setApkFileId(int apkFileId) {
        this.apkFileId = apkFileId;
    }

    public String getApkActualFileName() {
        return apkActualFileName;
    }

    public void setApkActualFileName(String apkActualFileName) {
        this.apkActualFileName = apkActualFileName;
    }

    public String getApkFakeFileName() {
        return apkFakeFileName;
    }

    public void setApkFakeFileName(String apkFakeFileName) {
        this.apkFakeFileName = apkFakeFileName;
    }

    public int getAppPosterId() {
        return appPosterId;
    }

    public void setAppPosterId(int appPosterId) {
        this.appPosterId = appPosterId;
    }

    public String getPosterActualFileName() {
        return posterActualFileName;
    }

    public void setPosterActualFileName(String posterActualFileName) {
        this.posterActualFileName = posterActualFileName;
    }

    public String getPosterUploadFileName() {
        return posterUploadFileName;
    }

    public void setPosterUploadFileName(String posterUploadFileName) {
        this.posterUploadFileName = posterUploadFileName;
    }

    public int getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(int ownerId) {
        this.ownerId = ownerId;
    }
}
