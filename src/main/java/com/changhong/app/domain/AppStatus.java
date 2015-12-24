package com.changhong.app.domain;

/**
 * User: Jack Wang
 * Date: 15-7-30
 * Time: 下午2:34
 */
public enum AppStatus {
    CREATED("待提交"),
    WAITING("待审核"),
    PASSED("审核通过"),
    REJECTED("已拒绝"),
    SHELVES("已上架"),
    OFFSHELVES("已下架");

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
}
