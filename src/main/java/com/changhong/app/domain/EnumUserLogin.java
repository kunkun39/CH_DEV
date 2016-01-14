package com.changhong.app.domain;

import org.springframework.util.StringUtils;

/**
 * User:wangxiufeng
 * Date:2016/1/14
 * Time:17:13
 */
public enum  EnumUserLogin {
    CANLOGIN(0),//�˺Ŵ��ڣ�������ȷ
    VALIDATECODEWRONG(1),//��֤�����
    NOTACTIVE(2),//û�н���������֤
    NOTENABLE(3),//������
    PWDWRONG(4),//�������
    NOTEXISTS(5);//������

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
