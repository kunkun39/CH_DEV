package com.changhong.app.domain;

import org.springframework.util.StringUtils;

/**
 * User: Jack Wang
 * Date: 15-7-30
 * Time: 下午2:34
 */
public enum AppStatus {
    WAITING("待审核"),
    PASSED("审核通过"),
    REJECTED("已拒绝"),
    SHELVES("已上架"),
    OFFSHELVES("已下架"),
    INVALID("无效");

    private String description;

    AppStatus(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public static boolean isAppStatus(String appStatus) {
        if (StringUtils.hasText(appStatus) &&
            (appStatus.equals("WAITING") || appStatus.equals("PASSED") ||
             appStatus.equals("REJECTED") || appStatus.equals("SHELVES") ||
             appStatus.equals("OFFSHELVES"))) {
            return true;
        }
        return false;
    }

    public static int getAppStatusInt(String appStatus) {
        if (AppStatus.isAppStatus(appStatus)) {
            return AppStatus.valueOf(appStatus).ordinal();
        }
        return AppStatus.INVALID.ordinal();
    }
}
