package com.changhong.app.domain;

import org.springframework.util.StringUtils;

/**
 * User:wangxiufeng
 * Date:2016/1/14
 * Time:17:13
 */
public enum EnumUserLogin {
    CANLOGIN(0),//可以登录
    VALIDATECODEWRONG(1),//验证码错误
    NOTACTIVE(2),//账号邮箱未验证֤
    NOTENABLE(3),//账户被禁用
    PWDWRONG(4),//密码错误
    NOTEXISTS(5);//账号不存在

    private int description;

    EnumUserLogin(int description) {
        this.description = description;
    }

    public int getDescription() {
        return description;
    }

    public void setDescription(int description) {
        this.description = description;
    }

    public static boolean isAppStatus(String appStatus) {
        if (StringUtils.hasText(appStatus) &&
                (appStatus.equals("CANLOGIN") || appStatus.equals("VALIDATECODEWRONG") ||
                        appStatus.equals("NOTACTIVE") || appStatus.equals("NOTENABLE") ||
                        appStatus.equals("NOTEXISTS"))) {
            return true;
        }
        return false;
    }
}
