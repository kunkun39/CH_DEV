package com.changhong.app.domain;

import com.changhong.app.web.event.AppCreateAction;
import com.changhong.app.web.event.AppStatusChangeAction;
import com.changhong.app.web.event.AppVersionUpdateAction;
import org.springframework.util.StringUtils;

/**
 * User: Jack Wang
 * Date: 15-11-12
 * Time: 下午6:03
 */
public class AppHistory extends EntityBase {

    private String changeTitle;

    private String changeDescription;

    private MarketApp marketApp;

    public AppHistory() {
    }

    public AppHistory(String changeTitle, String changeDescription, MarketApp marketApp) {
        this.changeTitle = changeTitle;
        this.changeDescription = changeDescription;
        this.marketApp = marketApp;
    }

    public static AppHistory generateAppCreateHistory(AppCreateAction action) {
        String title = "创建新应用";
        String description = "用户创建新应用。" + action.getDetails();
        MarketApp app = new MarketApp();
        app.setId(action.getAppId());
        AppHistory history = new AppHistory(title, description, app);
        return history;
    }

    public static AppHistory generateAppStatusChangeHistory(AppStatusChangeAction action) {
        final int appId = action.getAppId();
        final boolean admin = action.isAdmin();
        final AppStatus oldStatus = action.getOldStatus();
        final AppStatus newStatus = action.getNewStatus();
        final String details = action.getDetails();

        String title = "";
        if (admin) {
            title = "应用信息管理员更新应用状态";
        } else {
            title = "用户更新应用状态";
        }

        String description = "";
        if (newStatus.equals(AppStatus.WAITING)) {
            if (AppStatus.SHELVES.equals(oldStatus)) {
                if (StringUtils.hasText(details)) {
                    description = "用户更新应用信息，等待管理员审核。<br/>修改信息如下：" + details;
                } else {
                    description = "用户更新应用信息，等待管理员审核。";
                }
            }
            else if (AppStatus.REJECTED.equals(oldStatus)) {
                description = "用户重新提交应用信息，等待管理员审核。<br/>修改信息如下：" + details;
            }
            else if (AppStatus.WAITING.equals(oldStatus)) {
                description = "用户修改应用信息，等待管理员审核。<br/>修改信息如下：" + details;
            }
            else {
                description = "用户更新应用信息，等待管理员审核。";
            }
        } else if (newStatus.equals(AppStatus.PASSED)) {
            description = "应用信息管理员审核通过应用，等待管理员执行上架操作。";
        } else if (newStatus.equals(AppStatus.SHELVES)) {
            description = "应用信息管理员上架该应用。";
        } else if (newStatus.equals(AppStatus.OFFSHELVES)) {
            description = "应用信息管理员下架该应用。";
        } else if (newStatus.equals(AppStatus.REJECTED)) {
            description = "应用信息管理员未审核通过应用。<br/>● 原因:" + details;
        }

        MarketApp app = new MarketApp();
        app.setId(appId);
        AppHistory history = new AppHistory(title, description, app);
        return history;
    }

    public static AppHistory generateAppVersionChangeHistory(AppVersionUpdateAction action) {
        final int appId = action.getAppId();
        final String oldVersion = action.getOldVersion();
        final String newVersion = action.getNewVersion();

        String title = "用户更新应用版本";
        String description = "应用版本信息从" + oldVersion + "更新到" + newVersion;

        MarketApp app = new MarketApp();
        app.setId(appId);
        AppHistory history = new AppHistory(title, description, app);
        return history;
    }

    public String getChangeTitle() {
        return changeTitle;
    }

    public void setChangeTitle(String changeTitle) {
        this.changeTitle = changeTitle;
    }

    public String getChangeDescription() {
        return changeDescription;
    }

    public void setChangeDescription(String changeDescription) {
        this.changeDescription = changeDescription;
    }

    public MarketApp getMarketApp() {
        return marketApp;
    }

    public void setMarketApp(MarketApp marketApp) {
        this.marketApp = marketApp;
    }
}
