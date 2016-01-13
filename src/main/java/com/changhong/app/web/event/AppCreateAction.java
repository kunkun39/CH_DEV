package com.changhong.app.web.event;

/**
 * User: Jack Wang
 * Date: 15-11-18
 * Time: 上午10:16
 */
public class AppCreateAction extends AbstractAppChangeAction {

    private String details;

    public AppCreateAction(int appId, String details) {
        super(appId);
        this.details = details;
    }

    public String getDetails() {
        return details;
    }
}
