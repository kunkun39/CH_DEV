package com.changhong.app.web.event;

/**
 * User: Jack Wang
 * Date: 15-11-18
 * Time: 上午10:02
 */
abstract public class AbstractAppChangeAction {

    private int appId;

    public AbstractAppChangeAction(int appId) {
        this.appId = appId;
    }

    public int getAppId() {
        return appId;
    }
}
