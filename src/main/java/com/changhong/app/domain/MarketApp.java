package com.changhong.app.domain;

import com.changhong.app.utils.SecurityUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.joda.time.DateTime;

/**
 * User: Jack Wang
 * Date: 15-7-30
 * Time: 下午2:27
 */
public class MarketApp extends EntityBase {

    private static final Log logger = LogFactory.getLog(MarketApp.class);

    private String appKey;

    private String appName;

    private String appDescription;

    private int appVersionInt;

    private String appVersion;

    private String appPackage;

    private String appSize;

    private DateTime createTime;

    private AppStatus appStatus;

    private AppIcon appIcon;

    private AppFile appFile;

    private AppPoster appPoster;

    private AppCategory appCategory;

    private ClientUser owner;

    public MarketApp() {
        this.appStatus = AppStatus.CREATED;
        this.createTime = new DateTime();

        ClientUser owner = new ClientUser();
        int currentClientId = SecurityUtils.currectAuthenticationId();
        owner.setId(currentClientId);
        this.owner = owner;
    }

    /********************************************GET/SET***********************************************/

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

    public DateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(DateTime createTime) {
        this.createTime = createTime;
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
    }

    public AppStatus getAppStatus() {
        return appStatus;
    }

    public void setAppStatus(AppStatus appStatus) {
        this.appStatus = appStatus;
    }

    public AppIcon getAppIcon() {
        return appIcon;
    }

    public void setAppIcon(AppIcon appIcon) {
        this.appIcon = appIcon;
    }

    public AppFile getAppFile() {
        return appFile;
    }

    public void setAppFile(AppFile appFile) {
        this.appFile = appFile;
    }

    public AppPoster getAppPoster() {
        return appPoster;
    }

    public void setAppPoster(AppPoster appPoster) {
        this.appPoster = appPoster;
    }

    public AppCategory getAppCategory() {
        return appCategory;
    }

    public void setAppCategory(AppCategory appCategory) {
        this.appCategory = appCategory;
    }

    public ClientUser getOwner() {
        return owner;
    }

    public void setOwner(ClientUser owner) {
        this.owner = owner;
    }
}
