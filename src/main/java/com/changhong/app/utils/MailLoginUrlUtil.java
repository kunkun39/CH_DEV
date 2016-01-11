package com.changhong.app.utils;

/**
 * User:wangxiufeng
 * Date:2016/1/8
 * Time:16:34
 */
public class MailLoginUrlUtil {

    /**
     * 获取邮箱登陆地址；如果没有搜索带对应邮箱登陆地址，会默认使用163登陆地址
     * @param mailAddress
     * @return
     */
    public static String getMailLoginUrl(String mailAddress) {
        String mailLogin = "http://mail.163.com";
        if (mailAddress == null || mailAddress.equals("")) {
            return mailLogin;
        }

        if (mailAddress.endsWith("163.com")) {//163邮箱
            mailLogin = "http://mail.163.com";

        } else if (mailAddress.endsWith("qq.com")) {//qq邮箱
            mailLogin = "https://mail.qq.com";

        } else if (mailAddress.endsWith("139.com")) {//中国移动139邮箱
            mailLogin = "http://mail.10086.cn";

        } else if (mailAddress.endsWith("sohu.com")) {//搜狐邮箱
            mailLogin = "http://mail.sohu.com/";

        } else if (mailAddress.endsWith("189.cn")) {//189邮箱
            mailLogin = "http://mail.189.cn/";

        } else if (mailAddress.endsWith("126.com")) {//网易126邮箱
            mailLogin = "http://www.126.com/";

        } else if (mailAddress.endsWith("tom.com")) {//tom邮箱
            mailLogin = "http://web.mail.tom.com/webmail/login/index.action";

        } else if (mailAddress.endsWith("sina.com") || mailAddress.endsWith("sina.cn")) {//新浪邮箱
            mailLogin = "http://mail.sina.com.cn/";

        } else if (mailAddress.endsWith("2980.com")) {//2980邮箱
            mailLogin = "http://www.2980.com/login.aspx";

        } else if (mailAddress.endsWith("aliyun.com")) {//阿里云邮箱
            mailLogin = "https://mail.aliyun.com/alimail";

        } else if (mailAddress.endsWith("21cn.com")) {//21cn.com邮箱
            mailLogin = "http://mail.21cn.com/w2/";

        } else if (mailAddress.endsWith("188.com")) {//188财富邮箱
            mailLogin = "http://www.188.com/";

        } else if (mailAddress.endsWith("yeah.net")) {//网易免费邮
            mailLogin = "http://www.yeah.net/";

        } else if (mailAddress.endsWith("wo.cn")) {//联通邮箱
            mailLogin = "http://mail.wo.cn/mail/login.action";

        }

        return mailLogin;
    }
}
