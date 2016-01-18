package com.changhong.app.domain;

import org.springframework.util.StringUtils;

/**
 * 邮件验证信息验证枚举
 * User:wangxiufeng
 * Date:2016/1/18
 * Time:16:45
 */
public enum EnumRegisterConfirm {
    SUCCESS(1),//成功
    OUTTIME(2),//超时失败
    USED(3),//已被使用
    EXCEPTION(4);//异常

    private int describtion;

    EnumRegisterConfirm(int describtion) {
        this.describtion = describtion;
    }

    public int getDescribtion() {
        return describtion;
    }

    public void setDescribtion(int describtion) {
        this.describtion = describtion;
    }

    public static boolean isRegisterConfirm(String registerConfirm) {
        if (StringUtils.hasText(registerConfirm) &&
                (registerConfirm.equals("SUCCESS") || registerConfirm.equals("OUTTIME") ||
                        registerConfirm.equals("USED") || registerConfirm.equals("EXCEPTION"))) {
            return true;
        }
        return false;
    }
}
