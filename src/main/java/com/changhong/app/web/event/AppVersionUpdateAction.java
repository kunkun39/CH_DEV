package com.changhong.app.web.event;

/**
 * User: Jack Wang
 * Date: 15-11-18
 * Time: 上午10:18
 */
public class AppVersionUpdateAction extends AbstractAppChangeAction {

    private String oldVersion;

    private String newVersion;

    public AppVersionUpdateAction(int appId, String oldVersion, String newVersion) {
        super(appId);
        this.oldVersion = oldVersion;
        this.newVersion = newVersion;
    }

    public String getOldVersion() {
        return oldVersion;
    }

    public String getNewVersion() {
        return newVersion;
    }
}
