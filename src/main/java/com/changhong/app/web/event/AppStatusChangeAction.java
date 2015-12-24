package com.changhong.app.web.event;

import com.changhong.app.domain.AppStatus;

/**
 * User: Jack Wang
 * Date: 15-11-18
 * Time: 上午10:17
 */
public class AppStatusChangeAction extends AbstractAppChangeAction {

    private boolean admin;

    private AppStatus oldStatus;

    private AppStatus newStatus;

    private String rejectReason;

    public AppStatusChangeAction(boolean admin, int appId, AppStatus oldStatus, AppStatus newStatus, String rejectReason) {
        super(appId);
        this.admin = admin;
        this.oldStatus = oldStatus;
        this.newStatus = newStatus;
        this.rejectReason = rejectReason;
    }

    public AppStatus getOldStatus() {
        return oldStatus;
    }

    public AppStatus getNewStatus() {
        return newStatus;
    }

    public boolean isAdmin() {
        return admin;
    }

    public String getRejectReason() {
        return rejectReason;
    }
}
